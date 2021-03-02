class MessageBoardController < ApplicationController
  before_action :authenticate_user
  before_action :correct_user, { only: %i[index create] }
  before_action :message_edit_authority, { only: %i[edit update destroy] }

  def index
    @group = Group.find_by(id: params[:id])
    @messages = MessageBoard.where(group_id: params[:id]).order(created_at: :desc)
  end

  def create
    @group_id = Group.find_by(id: params[:id])
    @message = MessageBoard.new(
      content: params[:content],
      user_id: session[:user_id],
      group_id: @group_id.id
    )
    redirect_to("/message_board/#{@group_id.id}/index") if @message.save
  end

  def edit
    @message = MessageBoard.find_by(id: params[:id])
    @group_id = params[:group_id]
  end

  def update
    @message =  MessageBoard.find_by(id: params[:id])
    @group_id = params[:group_id]
    @message.content = params[:content]
    @message.save
    flash[:notice] = '編集完了'
    redirect_to("/message_board/#{@group_id}/index")
  end

  def destroy
    @message =  MessageBoard.find_by(id: params[:id])
    @group_id = params[:group_id]
    @message.destroy
    redirect_to("/message_board/#{@group_id}/index")
  end

  def correct_user
    @group = Group.find_by(id: params[:id])
    @group_users = GroupUser.where(group_id: @group.id)
    if @group_users.find_by(user_id: @current_user.id.to_i).nil?
      flash[:notice] = '権限はありません'
      redirect_to('/groups/index')
    end
  end

  def message_edit_authority
    @group = Group.find_by(id: params[:group_id])
    @group_users = GroupUser.where(group_id: @group.id)
    @message = MessageBoard.find_by(id: params[:id].to_s)
    if @group_users.find_by(user_id: @current_user.id.to_i).nil?
      flash[:notice] = '権限はありません'
      redirect_to('/groups/index')
    elsif @message.user_id != @current_user.id.to_s
      flash[:notice] = '権限はありません'
      redirect_to('/groups/index')
    end
  end
end
