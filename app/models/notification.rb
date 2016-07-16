class Notification < ApplicationRecord
  include CalculatesValues
  has_one :status_bar_notification, inverse_of: :notification
  belongs_to :notification_extra, inverse_of: :notification, dependent: :destroy
  accepts_nested_attributes_for :status_bar_notification
  accepts_nested_attributes_for :notification_extra

  def calculate_values
    ms_field_to_datetime_field(:when_ms)
  end

end
