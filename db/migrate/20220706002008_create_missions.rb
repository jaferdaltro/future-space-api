class CreateMissions < ActiveRecord::Migration[7.0]
  def change
    create_table :missions do |t|
      t.integer :_id
      t.string :name
      t.references :launcher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
