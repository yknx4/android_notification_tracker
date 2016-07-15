class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore'
    create_table :locations do |t|
      t.float :accuracy
      t.float :altitude
      t.float :bearing
      t.float :elapsed_real_time_nanos
      t.hstore :extras
      t.float :latitude
      t.float :longitude
      t.string :provider
      t.float :speed
      t.float :time
      t.st_point :lonlat, geographic: true
      t.st_point :lonlatheight, geographic: true, has_z: true

      t.timestamps
    end

    add_index :locations, :provider



  end
end
