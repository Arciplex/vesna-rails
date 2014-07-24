require 'spec_helper'

describe ServiceRequest do

  let(:service_request) {
    build(:service_request, line_items: [build(:line_item)])
  }
  let(:service_request2) { build(:service_request_no_fields) }
  let(:api_url) { "#{Figaro.env.arciplex_url}/api/v1/service_requests" }

  before :each do
    allow(Figaro).to receive_message_chain(:env, :arciplex_url).
    and_return("http://foo.com")
  end

  context "with authorized request" do
    before do
      service_request

      allow(Figaro).to receive_message_chain(:env, :api_token).
      and_return("123")

      stub_request(:post, "#{api_url}?token=123").
      with(
        body: service_request.to_json,
        headers: {'Content-Type'=>'application/json'}
      ).
      to_return(
        status: 201,
        body: File.read("spec/fixtures/service_requests_success.json"),
        headers: {}
      )
    end

    describe "#save" do
      it "POSTs a new ServiceRequest to the backoffice" do
        service_request.save
        expect(service_request.id).to eql 1
        expect(service_request.errors).to be_empty
      end
    end
  end

  context "with unauthorized request" do
    before do
      service_request

      allow(Figaro).to receive_message_chain(:env, :api_token).
      and_return("abc123")

      stub_request(:post, "#{api_url}?token=abc123").
      with(
        body: service_request.to_json,
        headers: {'Content-Type'=>'application/json'}
      ).
      to_return(
        status: 401,
        body: File.read("spec/fixtures/401_error.json"),
        headers: {}
      )
    end

    describe "#save" do
      it "POSTs a new ServiceRequest with invalid api token" do

        service_request.save

        expect(service_request.id).to be_nil
        expect(service_request.errors).not_to be_empty
        expect(
          JSON.parse(service_request.errors.full_messages.first)
        ).to eq({"error" => "Unauthorized. Invalid token"})
      end
    end
  end

  context "with missing data" do
    before do
      allow(Figaro).to receive_message_chain(:env, :api_token).
      and_return("123")

      stub_request(:post, "#{api_url}?token=123").
      with(
        body: service_request2.to_json,
        headers: {'Content-Type'=>'application/json'}
      ).
      to_return(
        status: 500,
        body: "fields missing",
        headers: {}
      )
    end

    describe "#save" do
      it "POSTs a new ServiceRequest with missing fields" do
        service_request2.save

        expect(service_request2.id).to be_nil
        expect(service_request2.errors).not_to be_empty
        expect(
          service_request2.errors.full_messages.first
        ).to eq("fields missing")
      end
    end
  end

end
