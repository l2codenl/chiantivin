class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.string  :firstname
      t.string  :surname
      t.string  :address
      t.string  :postalcode
      t.string  :email
      t.string  :accountnumber
      t.string  :accountowner
      t.integer :ordernumber

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
