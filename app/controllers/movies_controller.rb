class MoviesController < ApplicationController
  def index
    
    @list = List.find(1)
    @bookmark = Bookmark.new
    @movies = Movie.all.limit(50)

        if params[:query].present?
          @movies = @movies.global_search(params[:query]).limit(15)
          respond_to do |format|
            format.html
            format.text { render partial: 'movies/list', locals: { movies: @movies, bookmark: @bookmark }, formats: [:html] }
          end
        else
          @movies = Movie.all.limit(50)
        end
  end

  def show
  end
end
