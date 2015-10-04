class Post < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :topic
  has_many :comments, dependent: :destroy

  validates_length_of :title, minimum: 5
  validates_length_of :body, minimum: 20
  validates_presence_of :title, :body, :topic

=begin
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minumum: 20 }, presence: true
  validates :topic, presence: true
=end
end
