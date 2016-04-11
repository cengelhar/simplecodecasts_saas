class ProfilesController < ApplicationController
    
        # to generate initial form for creation
    def new
        # form where a user can fill out their own profile.
            # create variable that stores current_user's user_id
        @user = User.find( params[:user_id] )
            # create a variable that uses the @user value to create a profile
        @profile = @user.build_profile
    end
    
        # to save to database
    def create
       @user = User.find( params[:user_id] )
            # whitelisting new.html.erb form fields to be able to save values to the database from and external source.
       @profile = @user.build_profile(profile_params)
       
            # if the profile saves sucessfully, provide the user a success message then reidrect to their profile page (still needs to be created)
       if @profile.save
           flash[:success] = "Profile Updated!"
           redirect_to user_path( params[:user_id] )
        else
                # else render the new action (above)
            render action: :new
        end
    end
    
    
    
    private
        def profile_params
            params.require(profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)    
    end
end



