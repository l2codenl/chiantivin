class ContactsController < ApplicationController
  def show
  end

  def create
    contact = params[:contact]
    if contact[:name].empty? || contact[:email].empty? || contact[:body].empty?

      flash[:warning] = t(:fail, :scope => :contact)

      redirect_to contact_path
    else
      Notifier.contact_form(params[:contact]).deliver

      flash[:notice] = t(:success, :scope => :contact)

      redirect_to root_path
    end
  end
end
