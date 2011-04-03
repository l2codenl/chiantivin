class Cart < ActiveRecord::Base
  belongs_to :wine
  validates_presence_of :session_id, :wine_id

  def self.find_by_session_id_and_wine session_id, wine
    Cart.includes(:wine).find(:first, :conditions => ["session_id = ? AND wine_id = ?", session_id, wine.id])
  end
end
