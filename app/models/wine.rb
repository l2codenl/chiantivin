class Wine < ActiveRecord::Base
  validates_presence_of :title, :wine_category_id
  belongs_to :wine_categories

  before_save :save_title_to_url

  def save_title_to_url
    self.url = self.title.downcase.gsub(/[^a-z0-9]+/i, '-')
  end
end
