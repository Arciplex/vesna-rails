class LineItem
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :item_type, :model_number, :serial_number, :additional_information

  validates_presence_of :item_type, :model_number, :serial_number
end
