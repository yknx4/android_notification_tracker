class Notification < ApplicationRecord
  belongs_to :status_bar_notification, inverse_of: :notification
  belongs_to :notification_extra, inverse_of: :notification
  accepts_nested_attributes_for :status_bar_notification
  accepts_nested_attributes_for :notification_extra
end
