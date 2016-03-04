class ContactMailer < ApplicationMailer
  default :to => "gary.meliman@outlook.com"
  def contact_me(contact)
    @contact = contact
    mail from: @contact.email, subject: @contact.subject, body: @contact.content
  end
end
