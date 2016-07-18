class Device < ApplicationRecord
  belongs_to :user, inverse_of: :devices
  has_many :status_bar_notifications, inverse_of: :device
  has_many :notifications, through: :status_bar_notifications
  has_many :locations, through: :status_bar_notifications
  has_many :notification_extras, through: :notifications
end
