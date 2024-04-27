class BooksController < ApplicationController
before_action :authenticate_user!, except: [:top]

def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
       @users = User.all
       @user_books = Book.all
       @user = current_user
      flash.now[:alert] = "Posting failed."
      render :index
    end
end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def show
    @books = Book.find(params[:id])
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
    @users = User.all
  end

  def edit
     @book = Book.find(params[:id])
     @user = @book.user
  end

def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
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
    redirect_to books_path
end
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end