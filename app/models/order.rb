class Order < ActiveRecord::Base
  before_create :add_ordernumber


  validates_presence_of :firstname, :surname, :email, :postalcode, :accountnumber, :accountowner

  attr_accessor :cart

  def add_ordernumber
    last_ordernumber = 0
    if last_order = Order.last
      last_ordernumber = last_order.ordernumber
    end
    self.ordernumber = last_ordernumber + 1
  end

end
