class AdminController < ApplicationController
  def dashboard
    @loans = Loan.all
  end
end
