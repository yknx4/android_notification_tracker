json.array!(@status_bar_notifications) do |status_bar_notification|
  json.extract! status_bar_notification, :id, :group_key, :id, :key, :override_group_key, :post_time_ms, :post_time, :tag, :android_user_id, :is_clearable, :is_group, :is_ongoing, :android_notification_id, :package_name, :location_id
  json.url status_bar_notification_url(status_bar_notification, format: :json)
end
