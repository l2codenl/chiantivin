class AddMenuToWineCategory < ActiveRecord::Migration
  def self.up
    add_column :wine_categories, :menu, :boolean
  end

  def self.down
    remove_column :wine_categories, :menu
  end
end
