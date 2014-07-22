class ServiceRequestsController < ApplicationController

  def new
    @service_request = ServiceRequest.new(line_items: [LineItem.new])
  end

  def create
    @service_request = ServiceRequest.new(service_request_params)

    if @service_request.valid? && @service_request.save
      redirect_to new_service_request_path, notice: "Service Request #{@service_request.id} Submitted"
    else
      redirect_to new_service_request_path, flash: {error: @service_request.errors.full_messages.to_sentence}
    end
  end

  private
    def service_request_params
      params.require(:service_request).permit(
        :first_name, :last_name, :prefix, :contact_email, :phone_number,
        :address, :address2, :city, :state, :zip_code, :country,
        :address_type, :troubleshooting_reference,
        line_items_attributes: [:item_type, :model_number, :serial_number, :additional_information]
      )
    end

end
