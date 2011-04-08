class WineCategory < ActiveRecord::Base
  has_attached_file :banner, :styles => { :banner => "600x100>" }
  has_attached_file :portrait, :styles => { :portrait => "169x290>" }
  validates_presence_of :title, :body
  validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png']
  validates_attachment_content_type :portrait, :content_type => ['image/jpeg', 'image/png']

  before_save :save_title_to_url

  def save_title_to_url
    self.url = self.title.downcase.gsub(/[^a-z0-9]+/i, '-')
  end

  has_many :wines
end
