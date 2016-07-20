class MakeUserAndDeviceForced < ActiveRecord::Migration[5.0]
  def change
    change_column_null :status_bar_notifications, :user_id, false
    change_column_null :status_bar_notifications, :device_id, false
  end
end
