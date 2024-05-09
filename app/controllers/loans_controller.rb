# app/controllers/loans_controller.rb
class LoansController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @loan = Loan.new
    end
  
    def create
      @loan = current_user.loans.new(loan_params)
      if @loan.save
        redirect_to root_path, notice: "Loan requested successfully!"
      else
        render :new
      end
    end
  
    private
  
    def loan_params
      params.require(:loan).permit(:amount, :status)
    end
  end
  