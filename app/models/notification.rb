class Notification < ApplicationRecord
  has_one :status_bar_notification, inverse_of: :notification
end
