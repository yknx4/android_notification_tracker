class CreateStatusBarNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :status_bar_notifications do |t|
      t.string :group_key
      t.string :key
      t.string :override_group_key
      t.integer :post_time_ms
      t.datetime :post_time
      t.string :tag
      t.integer :android_user_id
      t.boolean :is_clearable
      t.boolean :is_group
      t.boolean :is_ongoing
      t.integer :android_notification_id
      t.string :package_name
      t.references :location, foreign_key: true

      t.timestamps
    end

    add_index :status_bar_notifications, :group_key
    add_index :status_bar_notifications, :key
    add_index :status_bar_notifications, :post_time
    add_index :status_bar_notifications, :package_name

  end
end
