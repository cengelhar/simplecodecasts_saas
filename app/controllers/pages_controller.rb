class PagesController < ApplicationController
    def home
            # defining variables to get used to determine which plan sign up/construct the user experiences. these are used in the home.html.erb sign up buttons.
        @basic_plan = Plan.find(1)
        @pro_plan = Plan.find(2)
    end
    
    def about
    end
end
