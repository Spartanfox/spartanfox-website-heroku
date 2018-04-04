class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_uniqueness_of :username
  validates_presence_of :username
  validates_length_of :username, minimum: 3
  validates_length_of :username, maximum: 16

end
