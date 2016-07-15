class NotificationExtra < ApplicationRecord
  has_one :notification, inverse_of: :notification_extra
end
