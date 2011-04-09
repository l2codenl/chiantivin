class AddAttachmentWineryBannerToWinery < ActiveRecord::Migration
  def self.up
    add_column :wineries, :winery_banner_file_name, :string
    add_column :wineries, :winery_banner_content_type, :string
    add_column :wineries, :winery_banner_file_size, :integer
    add_column :wineries, :winery_banner_updated_at, :datetime
  end

  def self.down
    remove_column :wineries, :winery_banner_file_name
    remove_column :wineries, :winery_banner_content_type
    remove_column :wineries, :winery_banner_file_size
    remove_column :wineries, :winery_banner_updated_at
  end
end
