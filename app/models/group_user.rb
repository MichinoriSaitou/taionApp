class GroupUser < ApplicationRecord

  #アソシエーション 
  belongs_to :user
  belongs_to :group

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :user_id, uniqueness: { scope: :group_id }

end
