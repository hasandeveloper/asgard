class User < ApplicationRecord
  has_many :tasks
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
         
end
