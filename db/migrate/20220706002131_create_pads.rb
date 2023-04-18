# frozen_string_literal: true

class CreatePads < ActiveRecord::Migration[7.0]
  def change
    create_table :pads do |t|
      t.integer :_id
      t.string :url
      t.string :agency_id
      t.string :name
      t.string :info_url
      t.string :wiki_url
      t.string :map_url
      t.string :latitude
      t.string :longitude
      t.string :map_image
      t.integer :total_launch_count
      t.references :launcher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
