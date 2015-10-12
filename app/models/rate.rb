class Rate < ActiveRecord::Base
  has_many :ratings
  belongs_to :rateable, polymorphic: true
  has_many :topics, through: :ratings, source: :rateable, source_type: :Topic
  has_many :posts, through: :ratings, source: :rateable, source_type: :Post

  def self.update_rating(rating_string)
    new_rates = []
    unless rating_string.nil? || rating_string.empty?
      rating_string.split(",").each do |rate|
        rate_name = rate.strip
        new_rate = Rate.find_or_create_by(name: rate_name)
        new_rates << new_rate
      end
    end
    new_rates
  end
end
