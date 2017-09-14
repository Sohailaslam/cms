class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_type
      t.string :name
      t.integer :user_id
      t.text :location
      t.integer :no_of_days

      t.timestamps null: false
    end
  end
end
