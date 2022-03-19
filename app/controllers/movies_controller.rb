class MoviesController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.all.limit(50)

        if params[:query].present?
          @movies = @movies.global_search(params[:query]).limit(16)
          respond_to do |format|
            format.html
            format.text { render partial: 'movies/list', locals: { movies: @movies, bookmark: @bookmark }, formats: [:html] }
          end
        else
          @movies = Movie.all.limit(50)
        end
  end
end
