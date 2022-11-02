class SpectaclesController < ApplicationController
	def create
		spectacle = Spectacle.new(spectacle_params)

		if spectacle.save
		  render json: spectacle, status: 201
		else
			render json: spectacle.errors, status: 422
		end
	end

	def index
		spectacles = Spectacle.all

		render json: spectacles, status: 200
	end

	def destroy
		spectacle = Spectacle.find(params[:id])
		spectacle.destroy

		render status: 200
	end

	private

  def spectacle_params
    params.require(:spectacle).permit(:name, :start_date, :end_date)
   end
end