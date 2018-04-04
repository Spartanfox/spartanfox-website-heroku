class Topic < ApplicationRecord
  belongs_to :category
  has_many :messages, dependent: :destroy
  validates_presence_of :title
  validates_length_of :title, :minimum => 4
  validates_length_of :title, :maximum => 50
  validates_presence_of :description
  validates_length_of :description, :minimum => 1
  validates_length_of :description, :maximum => 1000
end
