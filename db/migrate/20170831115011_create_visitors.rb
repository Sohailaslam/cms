class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.integer :user_id
      t.integer :event_id
      t.string :company
      t.string :designation
      t.string :contact_number
      t.string :email
      t.text :notes

      t.timestamps null: false
    end
  end
end
