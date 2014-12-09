class ServiceRequest
  include ActiveModel::Model
  include ActiveModel::Validations
  include ActiveModel::Serialization
  extend ActiveModel::Naming

  attr_accessor :first_name, :last_name, :prefix, :contact_email, :phone_number,
                :address, :address2, :city, :state, :zip_code, :country,
                :address_type, :troubleshooting_reference, :line_items, :id,
                :api_response, :errors

  validates_presence_of :first_name, :last_name, :contact_email, :phone_number,
                        :address, :city, :state, :zip_code, :country, :address_type,
                        :troubleshooting_reference

  validate :check_line_items

  def initialize(attributes = {})
    attributes.each do |k, v|
      send("#{k}=", v)
    end
    @errors = ActiveModel::Errors.new(self)
  end

  def check_line_items
    @line_items.each do |item|
      errors.add(:base, "#{item.errors.full_messages.join}") unless item.valid?
    end
  end

  def customer_full_name
     "#{first_name} #{last_name}"
  end

  def line_items_attributes=(attributes)
    @line_items ||= []
    attributes.each do |i, params|
      @line_items.push(LineItem.new(params))
    end
  end

  def save
    conn = Faraday.new(url: "#{Figaro.env.arciplex_url}") do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter  Faraday.default_adapter
    end

    @api_response = conn.post do |req|
      req.url "/api/v1/service_requests?token=#{Figaro.env.api_token}"
      req.headers['Content-Type'] = 'application/json'
      req.body = self.to_json
    end

    validate!
  end

  def validate!
    # If successful creation, do nothing
    unless [200, 201].include?(@api_response.status)
      Rails.logger.debug(@api_response.inspect)
      errors.add(:base, @api_response.body)
      return false
    else
      Rails.logger.debug(JSON.parse(@api_response.body))
      @id = JSON.parse(@api_response.body)["service_request_id"]
      return true
    end
  end

end
