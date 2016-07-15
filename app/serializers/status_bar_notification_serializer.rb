class StatusBarNotificationSerializer < ActiveModel::Serializer
  attributes :id, :group_key, :id, :key, :override_group_key, :post_time_ms, :post_time, :tag, :android_user_id, :is_clearable, :is_group, :is_ongoing, :android_notification_id, :package_name
  has_one :location
end
