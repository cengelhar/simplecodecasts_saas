class ProfilesController < ApplicationController
    def new
        # form where a user can fill out their own profile.
            # create variable that stores current_user's user_id
        @user = User.find( params[:user_id] )
            # create a variable that uses the @user value to create a profile
        @profile = @user.build_profile
        @variable = params[:hello]
    end
end



