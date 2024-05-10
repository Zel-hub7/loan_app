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

    # app/controllers/loans_controller.rb
    def approve
      @loan = Loan.find(params[:loan_id])
      @loan.update(status: 'Approved')
      redirect_to loans_path, notice: 'Loan has been approved.'
    end

  
    private
  
    def loan_params
      params.require(:loan).permit(:amount, :name)
    end
  end
  