class CreateDevices < ActiveRecord::Migration[5.0]
  def change
    create_table :devices, id: :uuid do |t|
      t.string :name
      t.integer :android_version
      t.references :user, foreign: true, null: false
      t.timestamps
    end
    add_index :devices, [:id, :user_id], unique: true

    add_column :status_bar_notifications, :device_id, :uuid
    add_index :status_bar_notifications, :device_id

  end
end
