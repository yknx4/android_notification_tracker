class StatusBarNotification < ApplicationRecord
  has_one :notification, inverse_of: :status_bar_notification
  belongs_to :location, inverse_of: :status_bar_notifications
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :notification

end
