class User < ApplicationRecord
  has_many :dialings
  has_secure_password
  validates :email, presence: true, uniqueness: true

  def has_role?(role)
    self.role == role
  end
end
