class GroupUser < ApplicationRecord

  #アソシエーション 
  belongs_to :user
  belongs_to :group

  #validation
  validates :user_id, presence: true
  validates :group_id, presence: true

  #一意の組み合わせを検証
  validates_uniqueness_of :group_id , scope: :user_id

end
