class ApplicationsController < ApplicationController
    def create
      @application = Application.new(application_params)
      if @application.save
        render json: @application, status: :created
      else
        render json: @application.errors, status: :unprocessable_entity
      end
    end
  
    def show
      @application = Application.find_by!(token: params[:token])
      render json: @application
    end
  
    private
  
    def application_params
      params.require(:application).permit(:name)
    end
  end
  