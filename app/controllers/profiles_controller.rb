class ProfilesController < ApplicationController
   
        # authetication to only allow a user to edit their own profile. if a user changes the url user id, it will redirect to the home page 
    before_action :authenticate_user!
        # the action at the bottom that checks is the user id in the url is == to the current_user's id
    before_action :only_current_user
    
    # to generate initial form for creation
    def new
        # form where a user can fill out their own profile.
            # create variable that stores current_user's user_id
        @user = User.find( params[:user_id] )
            # create a variable that uses the @user value to create a profile
        @profile = Profile.new
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

    # to edit user profile   
    def edit
        @user = User.find( params[:user_id] )
        @profile = @user.profile
    end
    
    # to update to database
    def update
        @user = User.find( params[:user_id] )
        @profile = @user.profile
            # if profile updates correctly, provide the user with a success message then redirect to their prfofile page
        if @profile.update_attributes(profile_params)
            flash[:success] = "Profile Updated!"
            redirect_to user_path( params[:user_id] )
        else
            render action: :edit
        end
    end
        
    # private whitelisting (used in above actions)
    private
        def profile_params
            params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
        end
            
            # checks if user id in url == current_user.id
        def only_current_user
            @user = User.find( params[:user_id] )
            redirect_to(root_url) unless @user == current_user
        end
end