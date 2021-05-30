class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
      flash[:success] = "新たなユーザ「#{@user.name}」が登録されました"
    else
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:success] = "ユーザ「#{@user.name}」の編集が完了しました"
    else
      render :edit
    end
  end
  def destroy
    @user.destroy
    redirect_to new_user_path
    flash[:danger] = "ユーザ「#{@user.name}」を削除しました"
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_digest,)
  end
end
