class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :visitor_id
      t.integer :product_id

      t.timestamps null: false
    end
  end
end
