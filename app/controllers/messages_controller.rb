class MessagesController < ApplicationController
    def create
      application = Application.find_by!(token: params[:application_token])
      chat = application.chats.find_by!(number: params[:chat_number])
      @message = chat.messages.new(message_params)
  
      if @message.save
        UpdateMessageCountJob.perform_later(chat.id)
        render json: { number: @message.number }, status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end
  
    def index
      application = Application.find_by!(token: params[:application_token])
      chat = application.chats.find_by!(number: params[:chat_number])
  
      @messages = chat.messages.order(:number)
      render json: @messages, status: :ok
    end
  
    def search
      application = Application.find_by!(token: params[:application_token])
      chat = application.chats.find_by!(number: params[:chat_number])
  
      results = Message.search({
        query: {
          bool: {
            must: [
              { match: { body: params[:query] } },
              { term: { chat_id: chat.id } }
            ]
          }
        }
      })
  
      render json: results.records.map(&:body)
    end
  
    private
  
    def message_params
      params.require(:message).permit(:body)
    end
  end
  