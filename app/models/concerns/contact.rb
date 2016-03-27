class Contact < ActiveRecord::Base
        # validator from ==> http://guides.rubyonrails.org/active_record_validations.html
        # check if name != '' and name != null
    validates :name, presence: true
        # check if email != '' and email != null
    validates :email, presence: true
end