class GroupsController < ApplicationController
  before_action :authenticate_user
  

  def index
    @user_group = GroupUser.where(user_id: session[:user_id])
  end
  def show
    @group= Group.find_by(id: params[:id])
    @group_users = GroupUser.where(group_id: params[:id])
  end
  def create
    @group = Group.new(name:params[:name],user_id:session[:user_id])
    @group.save
    @group.id
    @create_group = GroupUser.new(group_id:@group.id,user_id:session[:user_id])
    @create_group.save
    redirect_to("/groups/index")
  end
  def create_user
    @user = User.find_by(email: params[:email])
    @create_user = GroupUser.new(
      group_id: params[:id],
      user_id:@user.id)
    if @create_user.save
      redirect_to("/groups/#{params[:id]}/show")
      else
      render("groups/#{params[:id]}/show")
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
    @group_user.destroy
    redirect_to("/groups/#{params[:group_id]}/show")
  end

  



end
