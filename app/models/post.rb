class Post < ActiveRecord::Base
  include ActiveModel::Validations
  belongs_to :topic
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings

  default_scope { order('rank DESC') }
  scope :visible_to, ->(user) { user ? all : joins(:topic).where('topics.public' => true) }

  validates_length_of :title, minimum: 5
  validates_length_of :body, minimum: 20
  validates_presence_of :title, :body, :topic, :user

=begin
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minumum: 20 }, presence: true
  validates :topic, presence: true
=end

  def up_votes
    votes.where(value: 1).count
  end

  def down_votes
    votes.where(value: -1).count
  end

  def points
    votes.sum(:value)
  end

  def update_rank
    age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
    new_rank = points + age_in_days
    update_attribute(:rank, new_rank)
  end
end
