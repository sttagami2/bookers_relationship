class BookCommentsController < ApplicationController
  def create
    # @book = Book.find(params[:book_id])
    # @book.book_comments.user_id = current_user
    # @book.book_comments.create(book_comment_params)
    # # binding.pry
    # redirect_to book_path(@book)

    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = @book.book_comments.find(params[:id])
    @comment.destroy
    redirect_to book_path(@book)
  end

  private
    def book_comment_params
      params.require(:book_comment).permit(:body)
    end
end
