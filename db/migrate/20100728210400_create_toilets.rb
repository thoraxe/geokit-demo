class CreateToilets < ActiveRecord::Migration
  def self.up
    create_table :toilets do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :rating
      t.float :lat
      t.float :lng
      t.timestamps
    end
  end
  
  def self.down
    drop_table :toilets
  end
end
