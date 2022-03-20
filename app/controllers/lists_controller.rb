class ListsController < ApplicationController
  def index
    @lists = List.paginate(page: params[:page], per_page: 21).order('lists.created_at DESC')
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list).paginate(page: params[:page], per_page: 15).order('bookmarks.created_at DESC')

    if params[:query].present?
      # raise
      @bookmarks = @bookmarks.global_search(params[:query]).paginate(page: params[:page], per_page: 15)
      respond_to do |format|
        format.html
        # format.text { render partial: 'movies/list', locals: { list: @list, bookmark: @bookmark }, formats: [:html] }
      end
    end
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
