class NotificationExtra < ApplicationRecord
  belongs_to :notification, inverse_of: :notification_extra
end
