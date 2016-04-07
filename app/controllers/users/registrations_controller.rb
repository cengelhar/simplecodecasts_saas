class Users::RegistrationsController < Devise::RegistrationsController
    # this is used to run the code at the bottom of this file before anything other code is processed
  before_filter :select_plan, only: :new
  
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_payment
        else
          resource.save
        end
      end
    end
  end
  
    # if the plan variable is anything other than '1' or '2', throw an error message and redirect the user back to the home page
  private
    def select_plan
      unless params[:plan] && (params[:plan] == '1' || params[:plan] == '2')
        flash[:notice] = "Please select a membership plan to sign up."
        redirect_to root_url
      end
    end
  
end