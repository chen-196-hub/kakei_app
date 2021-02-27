class GroupsController < ApplicationController
  before_action :authenticate_user
  before_action :correct_user,{only: [:show]}
  before_action :correct_admin_user,{only:[:admin,:destroy]}
  before_action :group_users_delect_authority,{only:[:user_destroy]}
  def index
    @user_group = GroupUser.where(user_id: session[:user_id])
  end
  def show
    @group= Group.find_by(id: params[:id])
    @group_users = GroupUser.where(group_id: params[:id])
  end
  def create
      @group = Group.new(name:params[:name],user_id:session[:user_id])
      if @group.save 
        @create_group = GroupUser.new(group_id:@group.id,user_id:session[:user_id])
        @create_group.save
        redirect_to("/groups/index")
      else
        flash[:error] ="グループ名をつけてください"
        redirect_to("/groups/index")
      end
  end
  def create_user
    @user = User.find_by(email: params[:email])
    if @user == nil 
      flash[:error] = "該当するユーザーがありません"
      redirect_to("/groups/#{params[:id]}/show")
    else
      @create_user = GroupUser.new(
        group_id: params[:id],
        user_id:@user.id)
      if @create_user.save
        flash[:notice] = "メンバー追加しました！！"
        redirect_to("/groups/#{params[:id]}/show")
      end
    end
  end
  def admin 
    @group = Group.find_by(id:params[:id])
  end
  def update 
    @group = Group.find_by(id:params[:id])
    @group.name = params[:name]
    @group.save 
    flash[:notice] = "グループ名変更しました！"
    redirect_to("/groups/index")
  end

  def destroy
    @group = Group.find_by(id:params[:id])
    @group_user = GroupUser.where(group_id:params[:id])
    @message_board = MessageBoard.where(group_id:params[:id])
    @group.destroy
    @group_user.each {|i| i.destroy}
    @message_board.each {|m| m.destroy}
    redirect_to("/groups/index")
  end
  def user_destroy
    @group_users = GroupUser.where(group_id: params[:group_id])
    @group_user = @group_users.find_by(user_id: params[:id])
    if  @group_user == nil
      flash[:notice] = "エラー"
      redirect_to("/groups/index")
    else
      @group_user.destroy
      redirect_to("/groups/#{params[:group_id]}/show")
    end
  end


  def correct_user
    @group = Group.find_by(id: params[:id])
    @group_users = GroupUser.where(group_id: @group.id)
    if @group_users.find_by(user_id: @current_user.id.to_i) == nil 
      flash[:notice] = "権限はありません"
      redirect_to("/groups/index")
    end
  end

  def correct_admin_user
    @group = Group.find_by(id: params[:id])
    if session[:user_id].to_i != @group.user_id.to_i
      flash[:notice] = "権限はありません"
      redirect_to("/groups/index")
    end
  end

  def group_users_delect_authority
    @group = Group.find_by(id: params[:group_id])
    if session[:user_id].to_i != @group.user_id.to_i
      flash[:notice] = "権限はありません"
      redirect_to("/groups/index")
    end
  end
end
