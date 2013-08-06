class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.integer :license_id
      t.string :license_name
      t.string :business_name
      t.string :city
      t.string :street
      t.string :state
      t.integer :zip_code
      t.integer :phone
      t.decimal :lat, precision: 9, scale: 6
      t.decimal :lng, precision: 9, scale: 6
      t.timestamps
    end
  end
end
