class ContractsController < ApplicationController
  before_action :set_drafts, only: [:new, :generate]
  before_action :set_persons_type, only: [:new, :generate]
  def new
    @contract = Contract.new
    @contract.build_en_contract_field
    @contract.build_ua_contract_field
  end

  def generate
    @user = User.find(params[:user_id])
    @contract = @user.contracts.build(contract_params)
    @person_type = @contract.person_type.name
    draft_name = @contract.draft.name.downcase
    request.format = :pdf if params[:commit].downcase == 'pdf'

    if @contract.valid?
      respond_to do |format|
        format.html {
          render layout: 'pdf_only',
          template: "contracts/drafts/#{draft_name}"
        }
        format.pdf {
          render template: "contracts/drafts/#{draft_name}",
          layout: 'pdf_only',
          pdf: "#{draft_name}_#{@user.en_user_field.short_name}",
          stylesheets: [
            'app/assets/javascripts/application.js',
            'app/assets/fonts/times_new_roman.css',
            'app/assets/stylesheets/prince.css'
          ]
        }
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
end
