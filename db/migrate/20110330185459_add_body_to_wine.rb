class AddBodyToWine < ActiveRecord::Migration
  def self.up
    add_column :wines, :body, :text
  end

  def self.down
    remove_column :wines, :body
  end
end
