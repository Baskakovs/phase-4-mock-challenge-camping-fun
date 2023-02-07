class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_activity_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_camper_invalid

    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find(params[:id])
        render json: camper, serializer: CamperCustomSerializer
    end

    def create
        camper = Camper.create!(name: params[:name], age: params[:age])
        render json: camper, status: :created
    end


    private 

    def render_activity_not_found
        render json: { error: "Camper not found"}, status: :not_found
    end

    def render_camper_invalid
        render json: { errors: ["validation errors"]}, status: :unprocessable_entity
    end
end
