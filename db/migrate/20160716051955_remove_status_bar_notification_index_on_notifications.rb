class RemoveStatusBarNotificationIndexOnNotifications < ActiveRecord::Migration[5.0]
  def change
    remove_reference :notifications, :status_bar_notification
  end
end
