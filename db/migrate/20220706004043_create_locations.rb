# frozen_string_literal: true

class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.integer :_id
      t.string :url
      t.string :name
      t.string :country_code
      t.string :map_image
      t.integer :total_launch_count
      t.integer :total_landing_count
      t.references :pad, null: false, foreign_key: true

      t.timestamps
    end
  end
end
