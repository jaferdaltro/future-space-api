# frozen_string_literal: true

class CreateConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :configurations do |t|
      t.integer :_id
      t.integer :launch_library_id
      t.string :url
      t.string :name
      t.string :family
      t.string :full_name
      t.string :variant
      t.references :rocket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
