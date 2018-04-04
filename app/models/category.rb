class Category < ApplicationRecord
  has_many :topics, dependent: :destroy
  validates_presence_of :name
  validates_length_of :name, :minimum => 4
  validates_length_of :name, :maximum => 50
  validates_presence_of :description
  validates_length_of :description, :minimum => 1
  validates_length_of :description, :maximum => 500
end
