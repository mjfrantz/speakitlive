class InterestedUser < ApplicationRecord
  validates :email,
        :presence => true,
        :uniqueness => true,
        :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ ,
                     :message => 'Invalid e-mail! Please provide a valid e-mail address'},
        :on => :create
end
