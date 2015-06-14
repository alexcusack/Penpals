class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.integer :user_id
      t.integer :street_address
      t.string :street_name
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :country

      t.timestamps
    end
  end
end



