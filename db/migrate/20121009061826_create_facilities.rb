class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.string :fac_type
      t.string :addr
      t.string :tel
      t.float :lat
      t.float :lon

      t.timestamps
    end
  end
end
