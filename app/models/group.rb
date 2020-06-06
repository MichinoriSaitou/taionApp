class Group < ApplicationRecord
   
    #アソシエーション 
    has_many :group_user
    has_many :users, through: :group_user
    accepts_nested_attributes_for :group_user

    has_many :posts

    validates :name,
       presence: true


end
