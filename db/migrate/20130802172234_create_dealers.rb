class CreateDealers < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.integer :licence_type
      t.string :licence_name
      t.string :business_name
      t.string :street
      t.string :state
      t.integer :zip_code
      t.decimal :lat
      t.decimal :long

      t.timestamps
    end
  end
end
