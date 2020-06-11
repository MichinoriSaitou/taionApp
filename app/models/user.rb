class User < ApplicationRecord
    has_secure_password

    #アソシエーション 
    has_many :group_user
    has_many :groups, through: :group_user
    has_many :posts
   
    #emailのvalidationオプション
    before_save {self.email= email.downcase}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name,
       presence: true,
       uniqueness: true,
       length: {maximum: 16}
    
    validates :email,
       presence: true,
       length: {maximum: 120},
       format: {with:VALID_EMAIL_REGEX},
       uniqueness: true   

    validates  :password,
       presence: true,
       length: { minimum: 6}


       
end
