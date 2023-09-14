class UsersController < ApplicationController
  before_action :is_matching_login_user, only:[:edit, :update]
  
  def index
    @user = User.all
  end 
  # 今回はユーザーの一覧も作成することになっているようなので、indexを追加。
  
  def show
    @user = User.find(params[:id])
    @book = @user.books
    # @bookに関しては、アソシエーションのために記述。@userに関連づけられた投稿全て(.books)を取得し個人が投稿したもの全てを表示可能となる。
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end 
  # userのshowにリダイレクト
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end 
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to book_path
    end 
  end 
end
