class Notification < ApplicationRecord
  has_one :status_bar_notification, inverse_of: :notification
  has_one :notification_extra, inverse_of: :notification
  accepts_nested_attributes_for :status_bar_notification
  accepts_nested_attributes_for :notification_extra
end
