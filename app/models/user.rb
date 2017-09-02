class User < ApplicationRecord
  has_many :subscriptions
  has_many :channels, through: :subscriptions

  validates_presence_of :first_name, :last_name, :email, :hashed_password, :password
  validates_uniqueness_of :email

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
 #   @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(email, password)
    self.password == password && self.email == email
  end

   # validate :password_length

   # def password_length
   #   errors.add(:password, "must be at least six characters") unless @raw_password.length >= 6
   # end

end
