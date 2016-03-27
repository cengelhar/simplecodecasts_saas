    # ActionMailer::Base is a rails library. So we're creating an ContactMailer class and having it inherit the attributes of the ActionMailer::Base attributes
class ContactMailer < ActionMailer::Base
  default to: 'your@email_address.com'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
    mail(from: email, subject: 'Contact Form Message')
  end
end