class AddAttachmentPortraitToWineCategory < ActiveRecord::Migration
  def self.up
    add_column :wine_categories, :portrait_file_name, :string
    add_column :wine_categories, :portrait_content_type, :string
    add_column :wine_categories, :portrait_file_size, :integer
    add_column :wine_categories, :portrait_updated_at, :datetime
  end

  def self.down
    remove_column :wine_categories, :portrait_file_name
    remove_column :wine_categories, :portrait_content_type
    remove_column :wine_categories, :portrait_file_size
    remove_column :wine_categories, :portrait_updated_at
  end
end
