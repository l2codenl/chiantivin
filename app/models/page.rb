class Page < ActiveRecord::Base
  has_attached_file :banner, :styles => { :banner => "500x100>" }
  validates_presence_of :title, :body
  validates_attachment_content_type :banner, :content_type => ['image/jpeg', 'image/png']
  
  
end
