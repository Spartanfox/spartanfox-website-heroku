class Download < ApplicationRecord
  validates_presence_of :title
  validates_length_of :title, :minimum => 2
  validates_length_of :title, :maximum => 50
end
