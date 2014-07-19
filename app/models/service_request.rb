class ServiceRequest
  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :prefix, :contact_email, :phone_number,
                :address, :address2, :city, :state, :zip_code, :country,
                :address_type, :troubleshooting_reference, :line_items
end
