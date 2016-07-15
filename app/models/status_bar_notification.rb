class StatusBarNotification < ApplicationRecord
  belongs_to :location, inverse_of: :status_bar_notifications
  accepts_nested_attributes_for :location
  
end
