class AttractionsController < ApplicationController
    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = current_attraction
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.create(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def edit
        @attraction = current_attraction
        @ride = @attraction.rides.build(user_id: current_user.id)
    end

    def update
        @attraction = current_attraction
        @attraction.update(attraction_params)
        redirect_to attraction_path(@attraction)
    end

    def destroy
        attraction = current_attraction
        attraction.delete
        redirect_to index
    end

    private
        def attraction_params
            params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
        end

        def current_attraction
            Attraction.find_by_id(params[:id])
        end
end
