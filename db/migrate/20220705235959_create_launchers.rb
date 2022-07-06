class CreateLaunchers < ActiveRecord::Migration[7.0]
  def change
    create_table :launchers do |t|
      t.string :_id
      t.string :url
      t.string :launch_library_id
      t.string :slug
      t.string :name
      t.string :net
      t.datetime :window_end
      t.datetime :window_start
      t.boolean :inhold
      t.boolean :tbdtime
      t.boolean :tbddate
      t.integer :probability
      t.string :holdreason
      t.string :failreason
      t.string :hashtag
      t.boolean :webcast_live
      t.string :image
      t.string :infographic
      t.string :program, array: true
      t.datetime :imported_t
      t.integer :status

      t.timestamps
    end
    add_index :launchers, [:url, :name, :program]
  end
end
