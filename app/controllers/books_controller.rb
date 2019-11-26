class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :update]
  def index
    @users = User.all
  	@books = Book.all
  	@book = Book.new
    @user_profile = current_user
  end

  def show
    @books = Book.all
    @book_new = Book.new
  	@book = Book.find(params[:id])
    @user = @book.user
    @user_profile = current_user
  end

  def destroy
  	book = Book.find(params[:id])
    book.destroy
  	flash[:notice] = "Book was successfully destroyed."
  	redirect_to books_path
  end

  def new
  	@books = Book.new
  end

  def create
  	@book = Book.new(book_params)
    @book.user_id = current_user.id
  	if @book.save
  	flash[:notice] = "Book was successfully created."
  	redirect_to book_path(@book.id)
  	else
  		@books = Book.all
      @user = current_user
  		render :index
  	end
  end

  def edit
  	@book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @user_profile = current_user
  end

  def update
  	@book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else
  		@books = Book.all
  		render :edit
    end
  end


  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def correct_user
    book = Book.find(params[:id])
    if book.user_id != current_user.id
      redirect_to books_path
    end
  end
end
