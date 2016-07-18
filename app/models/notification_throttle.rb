class NotificationThrottle < ApplicationRecord
  validates_uniqueness_of :package_name
  default_scope -> { enabled }
  scope :blocked, -> { where(blocked: true) }
  scope :throttled, -> { where(throttled: true) }
  scope :for_package, ->(package_name) { where(package_name: package_name) }
  scope :enabled, -> { where(enabled: true) }
end
