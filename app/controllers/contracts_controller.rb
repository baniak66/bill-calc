class ContractsController < ApplicationController

  def index
  end

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.create(contract_params)
    if @contract.save
      redirect_to contracts_path
    else
      render "new"
    end
  end

  private
    def contract_params
      params.require(:contract).permit(:date, :number, :employer_name, :employee_name, :gross_amount, :tax_rate, :bill_number)
    end

end
