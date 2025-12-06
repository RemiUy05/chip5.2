class Movie < ApplicationRecord
  def self.all_ratings
    ['G','PG','PG-13','R']
  end

  def self.with_ratings(ratings_list)
    if ratings_list.nil?
      return Movie.all
    else
      return Movie.where(rating: ratings_list)
    end
  end

  def index
  @all_ratings = Movie.all_ratings
  if params[:ratings].nil?
    @ratings_to_show = @all_ratings
  else
    @ratings_to_show = params[:ratings].keys
  end

  @movies = Movie.with_ratings(@ratings_to_show)
end

end
