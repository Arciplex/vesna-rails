module ApplicationHelper

  def address_type_options
    [
      ['Residential', 'Residential'],
      ['Business', 'Business']
    ]
  end

  def flash_class(key)
    {
      notice: "alert-info",
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-danger"
    }.fetch(key)
  end

end
