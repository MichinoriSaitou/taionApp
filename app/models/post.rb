class Post < ApplicationRecord

    #アソシエーション 
    belongs_to :group
    belongs_to :user

    validates :content,
        presence: true



    
    
   
end

