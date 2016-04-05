class Users::RegistrationsController < Devise::RegistrationsController
    
    def create
            # import create action code from Devise Registration Controller
        super do |resource|
                # has the parameter 'plan' been submitted with the form?
            if params[:plan]
                    # store this plan id in the id column in the User database
                        # User.first.plan_id = 2
                resource.plan_id = params[:plan]
                if resource.plan_id == 2
                        # only run this method if registration is a pro account
                        # this method is defined in the user.rb model file
                    resource.save_with_plan
                else
                    resource.save
                end
            end
        end
    end
    
end