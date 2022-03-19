class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @bookmark.list = @list
    @bookmark.save
    @movies = Movie.all.limit(200)
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:bookmark][:movie])
    @bookmark.list = @list
    @bookmark.movie = @movie
    if @bookmark.save
      respond_to do |format|
        format.html { redirect_to list_path(@list) }
        format.text { redirect_to root_path, formats: [:html] }
      end
    else
      raise
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id)
  end
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
