class MessageBoardController < ApplicationController
  before_action :authenticate_user
  before_action :correct_user
  def index
    @group = Group.find_by(id: params[:id])
    @messages = MessageBoard.where(group_id:params[:id]).order(created_at: :desc)

  end
  
  def create
    @group_id = Group.find_by(id: params[:id])
    @message = MessageBoard.new(
      content: params[:content],
      user_id: session[:user_id],
      group_id: @group_id.id)
    if @message.save
      redirect_to("/message_board/#{@group_id.id}/index")
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
  
end
