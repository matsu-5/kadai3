class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:edit, :update]
  def index
    @users = User.all
    @user = current_user
    @book = Book.all
    @book = Book.new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @books = @user.books.all
    @book = Book.new
  end

  def new
    @user = User.new
  end

  def create

  end

  def edit
    @user = User.find(params[:id])
  end

  def user_params
  params.require(:user).permit(:profile_image, :introduction)
  end

  def update
    @user = User.find(params[:id])
    puts @user
    if @user.update(user_params)
    flash[:notice] = "Book was successfully"
    redirect_to user_path(@user.id)
  else
    @users = User.all
    render :edit
  end
end

private 
def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end

def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user)
    end
  end
end