class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :handle
      t.string :bio
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
