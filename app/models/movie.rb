class Movie < ApplicationRecord
  RATINGS = %w[G PG PG-13 R].freeze

  def self.all_ratings
    RATINGS
  end

  def self.with_ratings(ratings_list)
    return all if ratings_list.blank?

    normalized_ratings = ratings_list.map(&:upcase)
    where("UPPER(rating) IN (?)", normalized_ratings)
  end
end
