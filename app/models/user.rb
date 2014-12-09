class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 6 }

  def self.authorize(name, password)
    user = User.find_by_name name

    if user && user.password == password
      return user
    else
      return false
    end
  end
end
