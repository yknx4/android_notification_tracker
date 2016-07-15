class FixIntegerLimits < ActiveRecord::Migration[5.0]
  def change
    change_column :status_bar_notifications, :post_time_ms, :integer, limit: 8
    change_column :status_bar_notifications, :android_notification_id, :integer, limit: 8
    change_column :notifications, :when_ms, :integer, limit: 8
    change_column :notifications, :number, :integer, limit: 8
  end
end
