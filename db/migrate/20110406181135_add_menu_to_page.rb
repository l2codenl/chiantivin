class AddMenuToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :menu, :boolean
  end

  def self.down
    remove_column :pages, :menu
  end
end
