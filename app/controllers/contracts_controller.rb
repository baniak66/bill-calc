class ContractsController < ApplicationController
  before_action :set_contract, except: [:index, :new, :create]

  def index
    @contracts = Contract.all
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

  def update
    if @contract.update(contract_params)
      redirect_to @contract
    else
      render action: 'edit'
    end
  end

  def destroy
    if @contract.destroy
      redirect_to contracts_path
    end
  end

  def generate_bill
    respond_to do |format|
      format.pdf do
        render pdf: "Bill #{@contract.bill_number}"
      end
    end
  end

  private
    def contract_params
      params.require(:contract).permit(:date, :number, :employer_name, :employer_tax_number,
        :employee_name, :employee_tax_number, :gross_amount, :cost_rate, :bill_number)
    end

    def set_contract
      @contract = Contract.find(params[:id])
    end
end
