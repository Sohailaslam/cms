class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :company
      t.string :designation
      t.string :contact_number
      t.string :email
      t.text :notes

      t.timestamps null: false
    end
  end
end
