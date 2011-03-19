class Page < ActiveRecord::Base
  has_attached_file :banner, :styles => { :banner => "500x100>" }
  validates_presence_of :title, :body
  validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png']

  before_save :save_title_to_url
  
  def save_title_to_url
    self.url = self.title.downcase.gsub(/[^a-z0-9]+/i, '-')
  end
end
