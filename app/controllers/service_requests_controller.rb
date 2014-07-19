class ServiceRequestsController < ApplicationController

  def new

  end

  def create

  end

  private
    def service_requests_params
      params.require(:service_request).permit(
        :first_name, :last_name, :prefix, :contact_email, :phone_number,
        :address, :address2, :city, :state, :zip_code, :country,
        :address_type, :troubleshooting_reference, :line_items
      )
    end

end
