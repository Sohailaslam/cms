class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :event_type
      t.text :notes
      t.text :location
      t.integer :no_of_days
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
