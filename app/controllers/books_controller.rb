class BooksController < ApplicationController

def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
       @user_books = Book.all
      flash.now[:alert] = "Posting failed."
      render :index
    end
end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
     @book = Book.find(params[:id])
     @user = @book.user
  end

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
  else
    flash.now[:alert] = "Update failed."
    render :edit
  end
end

def destroy
 @book = Book.find(params[:id])
 @book.destroy
 flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path(@book.id)
end
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end