class AddUserToStatusBarNotifications < ActiveRecord::Migration[5.0]
  def change
    add_reference :status_bar_notifications, :user, foreign: true
  end
end
