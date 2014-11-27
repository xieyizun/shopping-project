class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :mailaddress
      t.string :favors
      t.string :buy_records

      t.timestamps
    end
  end
  def self.down
    drop_table
  end
end
