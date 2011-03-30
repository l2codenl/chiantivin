class Wine < ActiveRecord::Base
  has_attached_file :image, :styles => { :image => "150x50>" }
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']
  validates_presence_of :title, :wine_category_id
  belongs_to :wine_categories

  before_save :save_title_to_url

  def save_title_to_url
    self.url = self.title.downcase.gsub(/[^a-z0-9]+/i, '-')
  end
end
