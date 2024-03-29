class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.contact_me(@contact).deliver_now
      redirect_to new_contact_path, notice: "Thankyou for your message."
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :subject, :content)
  end
end
