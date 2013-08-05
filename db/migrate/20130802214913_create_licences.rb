class CreateLicences < ActiveRecord::Migration
  def change
    create_table :licences do |t|
      t.text :usage

      t.timestamps
    end
  end
end
