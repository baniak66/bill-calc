class ContractsController < ApplicationController

  def index
    @contracts = Contract.all
  end

  def show
    @contract = Contract.find(params[:id])
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

  def generate_bill
    @contract = Contract.find(params[:id])
    respond_to do |format|
      format.pdf do
        render pdf: "Bill #{@contract.bill_number}"
      end
    end
  end

  private
    def contract_params
      params.require(:contract).permit(:date, :number, :employer_name, :employee_name, :gross_amount, :cost_rate, :bill_number)
    end

end
