class CreateLaunchServiceProviders < ActiveRecord::Migration[7.0]
  def change
    create_table :launch_service_providers do |t|
      t.string :url
      t.string :name
      t.string :type
      t.references :launcher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
