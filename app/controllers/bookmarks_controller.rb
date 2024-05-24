class BookmarksController < ApplicationController

  def create
    @list = List.find(params[:list_id])

    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark.movie = @movie
    @bookmark.list = @list

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
