class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, :password, presence: true
  has_many :tasks
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
         
end
