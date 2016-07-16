class StatusBarNotification < ApplicationRecord
  include CalculatesValues
  belongs_to :notification, inverse_of: :status_bar_notification, dependent: :destroy
  belongs_to :location, inverse_of: :status_bar_notifications
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :notification


  BLACKLISTED_PACKAGE_NAMES = ['android', 'com.samsung.android.securitylogagent']
  THROTTLED_PACKAGE_NAMES = ['com.android.incallui']
  THROTTLE_TIME = 5.minutes

  validate :is_not_blacklisted
  validate :is_not_throttled

  private
  def is_not_throttled
    if THROTTLED_PACKAGE_NAMES.include?(package_name)
      last_date = StatusBarNotification.last.try(:created_at)
      if last_date.present? and (last_date + THROTTLE_TIME) >= DateTime.now
        errors.add(:package_name, "cannot be tracked more than once each #{THROTTLE_TIME} seconds")
      end
    end
  end

  def is_not_blacklisted
    if BLACKLISTED_PACKAGE_NAMES.include?(package_name)
      errors.add(:package_name, "cannot be used")
    end
  end

  def calculate_values
    ms_field_to_datetime_field(:post_time_ms)
  end

end
