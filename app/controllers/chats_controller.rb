class ChatsController < ApplicationController
    def create
      application = Application.find_by!(token: params[:application_token])
      @chat = application.chats.new
  
      if @chat.save
        # Enqueue background job to update the chats_count
        UpdateChatCountJob.perform_later(application.id)
        render json: { number: @chat.number }, status: :created
      else
        render json: @chat.errors, status: :unprocessable_entity
      end
    end
  
    def index
      application = Application.find_by!(token: params[:application_token])
      @chats = application.chats
      render json: @chats
    end
  end
  