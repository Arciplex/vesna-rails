FactoryGirl.define do

  sequence(:contact_email) do |n|
    "user#{n}@lvh.me"
  end


  factory :service_request do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    prefix "Mr"
    contact_email
    phone_number "111-111-1111"
    address "108 yep blvd"
    address2 ""
    city "Nashville"
    state "TN"
    zip_code "11111"
    country "USA"
    address_type "Business"
    troubleshooting_reference "Lorem Ipsum"
  end

  factory :service_request_no_fields, class: ServiceRequest do
    last_name Faker::Name.last_name
  end
end
