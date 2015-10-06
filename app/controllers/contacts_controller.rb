class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_mail(name, email, body).deliver
      flash[:success] = "Votre message a bien été envoyé. Merci !"
      redirect_to new_contact_path
    else
      flash[:danger] = "Désolé, une erreur a empêchée l'envoi de votre message."
      redirect_to new_contact_path
    end
  end

  def index
    @contacts = Contact.all
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end

end