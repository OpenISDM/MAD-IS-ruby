class CreatePosServers < ActiveRecord::Migration
  def change
    create_table :pos_servers do |t|
      t.string :server_id
      t.string :ip
      t.float :lat
      t.float :lon
      t.string :region

      t.timestamps
    end
  end
end
