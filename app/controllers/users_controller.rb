class UsersController < ApplicationController
  before_action :authenticate_user, { only: %i[index show] }
  before_action :forbid_login_user, { only: %i[new create login login_form] }
  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )

    if @user.save
      @house = Household.new(user_id: @user.id)
      @house.save
      session[:user_id] = @user.id
      flash[:notice] = '登録できました！！'
      redirect_to('/tasks/index')
    else
      render('/users/new')
    end
  end

  def login_form; end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'ログインしました。'
      redirect_to('/tasks/index')
    else
      @error_message = 'メールアドレスまたはパスワードが間違っています'
      @email = params[:email]
      @password = params[:password]
      render('users/login_form')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'ログアウトしました。'
    redirect_to('/login')
  end
end
