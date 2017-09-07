class User < ApplicationRecord
  has_many :guarantees

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
