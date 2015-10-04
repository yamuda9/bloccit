class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates_length_of :name, minimum: 5
  validates_length_of :description, minimum: 15
  validates_presence_of :name, :description
end
