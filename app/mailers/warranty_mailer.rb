class WarrantyMailer < ActionMailer::Base
  default from: "support@vesnalight.com"

  def submitted(service_request)
    @service_request = service_request
    mail(to: @service_request.contact_email, subject: "Service Request Submitted")
  end

end
