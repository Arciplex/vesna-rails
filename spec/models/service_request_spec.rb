require 'spec_helper'

describe ServiceRequest do

  let(:service_request) { build(:service_request, line_items: [build(:line_item)]) }

  context "#save" do
    it "POSTs a new ServiceRequest to the backoffice" do
      request = double
      expect(request).to receive(:url).with("#{Figaro.env.arciplex_url}/api/v1/service_requests?token=#{Figaro.env.api_token}")
      headers = double
      expect(headers).to receive(:[]=).with('Content-Type', 'application/json')
      expect(request).to receive(:headers).and_return(headers)
      expect(request).to receive(:body=).and_return(service_request.to_json)
      expect(Faraday).to receive(:post).and_yield(request)

      service_request.save
    end
  end

end
