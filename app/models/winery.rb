class Winery < ActiveRecord::Base
  has_attached_file :winery_banner, :styles => { :banner => "550x148>" }
  validates_attachment_content_type :winery_banner, :content_type => ['image/jpeg', 'image/png']

  validates_presence_of :title

  has_many :wines

  before_save :save_title_to_url

  def save_title_to_url
    self.url = self.title.downcase.gsub(/[^a-z0-9]+/i, '-')
  end


  def to_param
    url
  end
end
