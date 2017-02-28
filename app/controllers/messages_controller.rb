class MessagesController < ApplicationController
  before_action :get_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def show

  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Saved!"
      redirect_to new_message_path
    else
      render 'new'
    end
  end

private
  def get_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:to, :from, :body)
  end
end
