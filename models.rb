class User < ActiveRecord::Base
  validates :email, :password, presence: true

end

class Post < ActiveRecord::Base
  validates :body, length: {maximum: 255}
  belongs_to :user
end