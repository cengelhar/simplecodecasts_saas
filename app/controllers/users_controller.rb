class UsersController < ApplicationController
    def show
            # this is id not user_id. the id is getting pulled from the query string parameter for the current_user
            # @user is defined to simply store the current_user's id because the profile show route url structure has a syntax of users/id
        @user = User.find( params[:id] )
    end

end