class StatusBarNotification < ApplicationRecord
  include CalculatesValues
  belongs_to :notification, inverse_of: :status_bar_notification, dependent: :destroy
  has_one  :notification_extra, through: :notification
  belongs_to :location, inverse_of: :status_bar_notifications
  belongs_to :user, inverse_of: :status_bar_notifications
  belongs_to :device, inverse_of: :status_bar_notifications
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :notification

  scope :for_package, -> (package_name){ where(package_name: package_name) }
  scope :for_whatsapp, -> { for_package('com.whatsapp') }
  scope :for_facebook, -> { for_package('com.facebook.katana') }
  scope :for_facebook_messenger, -> { for_package('com.facebook.orca') }


  validate :is_not_blacklisted
  validate :is_throttled

  private
  def is_throttled
    throttle = NotificationThrottle.throttled.for_package(package_name).select(:throttle_time).last
    if throttle.present?
      time = throttle.throttle_time
      last_date = StatusBarNotification.last.try(:created_at)
      if last_date.present? and (last_date + time.minutes) >= DateTime.now
        errors.add(:package_name, "cannot be tracked more than once each #{time} minutes")
      end
    end
  end

  def is_not_blacklisted
    if NotificationThrottle.blocked.for_package(package_name).exists?
      errors.add(:package_name, "cannot be used")
    end
  end

  def calculate_values
    ms_field_to_datetime_field(:post_time_ms)
  end

end
