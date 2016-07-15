class CreateNotificationExtras < ActiveRecord::Migration[5.0]
  def change
    create_table :notification_extras do |t|
      t.hstore :content
      t.attachment :background_image
      t.text :big_text
      t.string :conversation_title
      t.text :info_text
      t.attachment :large_icon
      t.attachment :large_icon_big
      t.string :people, array: true, default: []
      t.attachment :picture
      t.integer :progress
      t.boolean :progress_indeterminate
      t.integer :progress_max
      t.text :remote_input_history
      t.string :self_display_name
      t.attachment :small_icon
      t.text :sub_text
      t.text :summary_text
      t.text :text
      t.text :text_lines, array: true, default: []
      t.string :title
      t.string :title_big
      t.timestamps
      t.index :self_display_name
    end

    add_reference :notifications, :notification_extra, foreign_key: true

  end
end
