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
    end
  end
end
