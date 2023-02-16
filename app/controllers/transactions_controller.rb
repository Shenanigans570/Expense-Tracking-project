class TransactionsController < ApplicationController
    before_action :find_transactions, only: [:show, :destroy, :update]
 

    def index
        # all_transactions = Transaction.all
        render json: @user.transactions, status: :ok
    end

    def show
        render json:  @search_transactions, status: :ok
    end

    def create 
        params[:asset_id] = 1
        params[:user_id] = 1
        newTransaction = Transaction.create!(transaction_params)
        render json: newTransaction, status: :created
    end

    def update
        @search_transactions.update!(transaction_params)
        render json: @search_transactions
    end

    def destroy
        @search_transactions.destroy
        head :no_content, status: :ok
    end

    private 
    def find_transactions
        @search_transactions= Transaction.find(params[:id])
    end

    def transaction_params
        params.permit(:vendor_name, :amount_spent, :user_id, :asset_id)
    end

end
