class Movie < ApplicationRecord
  def self.all_ratings
    ['G','PG','PG-13','R']
  end

  def self.with_ratings(ratings_list)
    if ratings_list.present?
      Movie.where("LOWER(rating) IN (?)", ratings_list.map(&:downcase))
    else
      Movie.all
    end
  end
end