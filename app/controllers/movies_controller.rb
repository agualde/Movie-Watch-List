class MoviesController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movies = Movie.paginate(page: params[:page], per_page: 12)

        if params[:query].present?
          @movies = @movies.global_search(params[:query]).paginate(page: params[:page], per_page: 12)
          respond_to do |format|
            format.html
            format.text { render partial: 'movies/list', locals: { movies: @movies, bookmark: @bookmark }, formats: [:html] }
          end
        else
          @movies = Movie.paginate(page: params[:page], per_page: 12)
        end
  end
end
