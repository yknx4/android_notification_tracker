class CreateNotificationThrottles < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_throttles do |t|
      t.string :package_name, null: false
      t.boolean :blocked, default: false
      t.boolean :throttled, default: true
      t.integer :throttle_time, default: 5
      t.boolean :enabled, default: true
      t.boolean :exclude_paid, default: false

      t.timestamps
    end
    add_index :notification_throttles, :package_name, unique: :true
    add_index :notification_throttles, :enabled
    add_index :notification_throttles, :exclude_paid

    # DEFAULT THROTTLES
    NotificationThrottle.reset_column_information

    NotificationThrottle.create(package_name: 'android', blocked: true)
    NotificationThrottle.create(package_name: 'com.samsung.android.securitylogagent', blocked: true)

    NotificationThrottle.create(package_name: 'com.android.incallui', throttled: true)
    NotificationThrottle.create(package_name: 'com.android.vending', throttled: true)
    NotificationThrottle.create(package_name: 'com.google.android.googlequicksearchbox', throttled: true, throttle_time: 1)

  end
end
