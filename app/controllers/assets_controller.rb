class AssetsController < ApplicationController
    before_action :find_assets, only: [:show, :destroy]
   

    def index
        all_assets = Asset.all
        render json: all_assets
    end

    def show 
        render json: @search_assets
    end

    def create
        render json: Asset.create!(asset_params)
    end

    def destroy
        @search_assets.destroy
        head :no_content
    end

    private 
    def find_assets
        @search_assets = Asset.find(params[:id])
    end

    def asset_params
        params.permit(:investment_name, :investment_amount, :user_id)
    end

end
