class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_signup_invalid

    def create
        signup = Signup.create!(camper_id: params[:camper_id], activity_id: params[:activity_id], time: params[:time])
        render json: signup.activity, status: :created
    end

    private

    def render_signup_invalid
        render json: { errors: ["validation errors"]}, status: :unprocessable_entity
    end
end
