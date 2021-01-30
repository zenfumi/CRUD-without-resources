class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    redirect_to action: :index
  end

  def edit
    ##編集ボタンそれぞれに@userの情報が入っているので、{user.id}により個別のユーザのidが取得できる。
    @user = User.find(params[:id])
  end

  def destroy
    ##ビューにデータを受け渡す必要がないので@つけない
    user = User.find(params[:id])
    user.destroy
    redirect_to action: :index
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to action: :index
  end

  private
  def user_params
    params.require(:user).permit(:name, :age)
  end
end
