class Post < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  has_many :ratings, as: :rateable
  has_many :rates, through: :ratings

  default_scope { order('created_at DESC') }

  validates_length_of :title, minimum: 5
  validates_length_of :body, minimum: 20
  validates_presence_of :title, :body, :topic, :user

=begin
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minumum: 20 }, presence: true
  validates :topic, presence: true
=end
end
