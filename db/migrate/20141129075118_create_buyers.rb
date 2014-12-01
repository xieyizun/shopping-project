class CreateBuyers < ActiveRecord::Migration
  def self.up
    create_table :buyers do |t|
      t.string :name
      t.integer :age
      t.integer :sex
      t.string :email
      t.string :favors
      t.string :password
      t.string :password_confirmation

      t.timestamps
    end
  end

  def self.down
    drop_table
  end
end
