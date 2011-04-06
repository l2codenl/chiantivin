class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  def confirm_order order
    @order = order
    mail(:to => "#{order.firstname} #{order.surname} <#{order.email}>", :from => "Chiantivin Import <shop@chiantivinimport.dk>", :subject => "New order") do |format|
      format.html
    end
  end

  def send_to_chianti order
    @order = order
    mail(:to => "Chiantivin Import <shop@chiantivinimport.dk>", :subject => "New order") do |format|
      format.html
    end
  end
end
