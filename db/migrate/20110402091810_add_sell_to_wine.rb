class AddSellToWine < ActiveRecord::Migration
  def self.up
    add_column :wines, :sell, :boolean
  end

  def self.down
    remove_column :wines, :sell
  end
end
