class PagesController < ApplicationController
    def home
            # defining variables to get used to determine which plan sign up/construct the user experiences
        @basic_plan = Plan.find(1)
        @pro_plan = Plan.find(2)
    end
    
    def about
    end
end
