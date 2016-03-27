class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
      # Define @contact variable that calls whatever parameters are defined in the private method below
    @contact = Contact.new(contact_params)
    
      # when the submit button is clicked, it automatically initiates a save method. This if statement determine where the user will get redirected after the click, and if what message will potentiall occur based on the successfullness of the submission
    if @contact.save
        #this hash syntax. attempt to submit the form without filling in the email then check the logs in the running rails server tab in IDE. in essence, contact is a hash with name, email, and comments properties. below, we're defining three instance variables to the different aray properties within the contact hash. So, params[:contact][:name] would reference the name property within the contact hash.
        #rails uses 'params' to create the context to use hash notation. so variable name = params[:hash_name][:nested_hash_property]
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      
      ContactMailer.contact_email(name, email, body).deliver
        # success and danger are special alert bootstrap class that will pre-format the messages. Flash contains a key, value pair
        #  http://getbootstrap.com/components/#alerts
      flash[:success] = "Message Sent."
      redirect_to new_contact_path
    else
      flash[:danger] = "Message failed to send."
      redirect_to new_contact_path
    end
  end
  
   # This code defines the different parameters that should be accepted in the create method defined above. Currently, only name, email, and comments)
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
  end
    
end
    