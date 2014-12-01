class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.text :content
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
  	drop_table
  end
end
