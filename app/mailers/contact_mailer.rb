    # ActionMailer::Base is a rails library. So we're creating an ContactMailer class and having it inherit the attributes of the ActionMailer::Base attributes
class ContactMailer < ActionMailer::Base
    default to: 'cengelha@gmail.com'
    
    def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        
        mail(from: email, subject: 'New Comment from contact form' )
    end
end