class ContractsController < ApplicationController
  before_action :set_drafts, only: [:new, :generate]
  before_action :set_persons_type, only: [:new, :generate]
  before_action :set_request_format, only: [:generate]

  def new
    @contract = Contract.new
    @contract.build_en_contract_field
    @contract.build_ua_contract_field
  end

  def generate
    @user = User.find(params[:user_id])
    @contract = @user.contracts.build(contract_params)

    if @contract.valid?
      @draft_name = @contract.draft.name.downcase
      @contract_template = ContractGenerateService.new(@user, @contract).generate
      respond_to do |format|
        format.html { render contracts_html }
        format.pdf  { render contracts_pdf }
      end
    else
      render :new
    end
  end

  private
  def contract_params
    params.require(:contract).permit(
      :draft_id,
      :person_type_id,
      :pdf,
      :number,
      :start_date,
      :end_date,
      en_contract_field_attributes: contract_field_attributes,
      ua_contract_field_attributes: contract_field_attributes
    )
  end

  def contract_field_attributes
    [
      :customer_payment,
      :maximum_bonuses_size,
      :total_payments
    ]
  end

  def set_persons_type
    @person_types = PersonType.pluck(:name, :id)
  end

  def set_drafts
    @drafts = Draft.pluck(:name, :id)
  end

  def set_request_format
    request.format = :pdf if params[:commit].downcase == 'pdf'
  end

  def contracts_html
    { layout: 'pdf_only' }
  end

  def contracts_pdf
    {
      layout: 'pdf_only',
      pdf: "#{@draft_name}_#{@user.en_user_field.short_name}",
      stylesheets: [
        'app/assets/javascripts/application.js',
        'app/assets/fonts/times_new_roman.css',
        'app/assets/stylesheets/prince.css'
      ]
    }
  end
end
