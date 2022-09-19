class SpicesController < ApplicationController
    before_action :set_spice, only: %i[ update destroy ]

    def index
        render json: Spice.all
    end

    def create
        @spice = Spice.create!(spice_params)
        render json: @spice, status: :created
    end

    def update
        @spice.update!(spice_params)
        render json: @spice
    end

    def destroy
        @spice.destroy
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def set_spice
        @spice = Spice.find(params[:id])
    end
end
