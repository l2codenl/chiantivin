class Order < ActiveRecord::Base
  before_create :add_ordernumber
  validates_presence_of :firstname, :surname, :email, :address, :postalcode, :accountnumber, :accountowner
  validates :email, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  attr_accessor :cart

  def add_ordernumber
    last_ordernumber = 0
    if last_order = Order.last
      last_ordernumber = last_order.ordernumber
    end
    self.ordernumber = last_ordernumber + 1
  end

end
