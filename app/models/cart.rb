class Cart < ActiveRecord::Base
  belongs_to :wine
  validates_presence_of :session_id, :wine_id
end
