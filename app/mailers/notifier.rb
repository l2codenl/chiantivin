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

  def contact_form contact
    @contact = contact
    mail(:from => "#{contact[:name]} <#{contact[:email]}>", :to => "Chiantivin Import <info@chiantivinimport.dk>",:subject => "Contact request by #{contact[:name]}") do |format|
      format.html
    end
  end
end
