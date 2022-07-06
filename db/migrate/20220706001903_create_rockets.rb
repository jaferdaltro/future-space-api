class CreateRockets < ActiveRecord::Migration[7.0]
  def change
    create_table :rockets do |t|
      t.references :launcher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
