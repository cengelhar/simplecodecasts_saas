class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
    #create relationship to plan class
  belongs_to :plan
  
  
    # this method is used in the registrations_controller
  def save_with_payment
      # if valid (ruby)
    if valid?
        # create a variable that stores all of the values from the form as well as a new stripe_card_token that will be returned from stripe
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
        # save all of this to the User database
          # needed to run a migration to add AddStripeCustomerTokenToUsers column to User database
      self.stripe_customer_token = customer_id
      save!
    end
  end
  
end
