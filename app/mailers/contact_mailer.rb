class ContactMailer < ActionMailer::Base
  default to: "tony.tiratay@gmail.com"
  def contact_mail(name, email, body)
    @name = name
    @email = email
    @body = body
    mail(from: email, subject: 'Demande de contact')
  end
end