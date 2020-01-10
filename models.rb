class User < ActiveRecord::Base
  validates :email, :password, presence: true
  validates :email,uniqueness: true
  validates :password, length: {minimum: 5, maximum: 8}

 
end

class Post < ActiveRecord::Base
  validates :body, length: {maximum: 255}
  belongs_to :user
end