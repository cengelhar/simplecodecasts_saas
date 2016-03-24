class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
      # Define @contact variable that calls whatever parameters are defined in the private method below
    @contact = Contact.new(contact_params)
    
      # when the submit button is clicked, it initiates a save method. This if statement determine where the user will get redirected after the click, and if what message will potentiall occur based on the successfullness of the submission
    if @contact.save
        # success and error are special alert bootstrap class that will pre-format the messages.
      flash[:success] = "Message Sent."
      redirect_to new_contact_path
    else
      flash[:error] = "Message failed to send."
      redirect_to new_contact_path, notice
    end
  end
  
   # This code defines the different parameters that should be accepted in the create method defined above. Currently, only name, email, and comments)
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
  end
    
end
    