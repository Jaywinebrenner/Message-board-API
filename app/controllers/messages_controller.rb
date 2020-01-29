class MessagesController < ApplicationController

  def index
    if
      author = params[:author]
      @messages = Message.author_search(author)
        json_response(@messages)
    elsif
      content = params[:content]
      @messages = Message.content_search(content)
      json_response(@messages)
    elsif
      created_at = params[:created_at]
      @messages = Message.specific_time_search(created_at)
      json_response(@messages)
    else
      @messages = Message.all
       json_response(@messages)
    end
  end

  def show
    @message = Message.find(params[:id])
    json_response(@message)
  end

  def create
    @message = Message.create(message_params)
    json_response(@message)
  end

  def update
    @message = Message.find(params[:id])
    @message.update(message_params)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def message_params
    params.permit(:author, :content, :created_at, :updated_at, :group_id)
  end
end
