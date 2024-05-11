# app/controllers/loans_controller.rb
class LoansController < ApplicationController
    before_action :authenticate_user!
  
    def new
      @loan = Loan.new
    end
  
    def create
      if current_user.loan.present?
        redirect_to root_path, alert: "You have already requested a loan."
      else
        @loan = Loan.new(loan_params)
        @loan.user = current_user
      
        if @loan.save
          redirect_to root_path, notice: "Loan requested successfully!"
        else
          render :new
        end
      end
    end
    

    # app/controllers/loans_controller.rb
    def approve
      @loan = Loan.find(params[:loan_id])
      @loan.update(status: 'Approved')
      redirect_to loans_path, notice: 'Loan has been approved.'
    end

    # app/controllers/loans_controller.rb

    def reject
      @loan = Loan.find(params[:loan_id])
      @loan.update(status: 'Rejected')
      redirect_to loans_path, notice: 'Loan has been rejected.'
    end
 
    private
  
    def loan_params
      params.require(:loan).permit(:amount, :name)
    end
  end
  