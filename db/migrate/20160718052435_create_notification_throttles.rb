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
    add_index :notification_throttles, :package_name
    add_index :notification_throttles, :enabled
    add_index :notification_throttles, :exclude_paid
  end
end
