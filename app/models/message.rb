class Message < ApplicationRecord
  belongs_to :topic
  validates_presence_of :message
  validates_length_of :message, :minimum => 1
  validates_length_of :message, :maximum => 500
end
