class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :ticker_text
      t.integer :when_ms
      t.datetime :when
      t.integer :visibility
      t.integer :priority
      t.integer :number
      t.integer :icon_level
      t.integer :flags
      t.integer :defaults
      t.integer :color
      t.string :category
      t.attachment :icon
      t.attachment :large_icon
      t.timestamps
      t.references :status_bar_notification
      t.index :category
      t.index :when
    end

    add_reference :status_bar_notifications, :notification
    add_foreign_key :status_bar_notifications, :notifications
    add_foreign_key :notifications, :status_bar_notifications
  end
end
