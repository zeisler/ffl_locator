class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.text :usage

      t.timestamps
    end
  end
end
