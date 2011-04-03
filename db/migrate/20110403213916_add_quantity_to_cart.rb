class AddQuantityToCart < ActiveRecord::Migration
  def self.up
    add_column :carts, :quantity, :integer
  end

  def self.down
    remove_column :carts, :quantity
  end
end
