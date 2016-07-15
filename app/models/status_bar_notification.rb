class StatusBarNotification < ApplicationRecord
  belongs_to :location, inverse_of: :status_bar_notifications
end
