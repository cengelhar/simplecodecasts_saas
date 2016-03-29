class Plan < ActiveRecord::Base
    # created base and pro plan via the rails console
        # name: 'basic', price: 0
        # name: 'pro'. price: 10
        
        #create relationship to users class
    has_many :users
    
end