class ContractsController < ApplicationController
  before_action :set_drafts, only: [:new, :generate]
  def new
    @contract = Contract.new
  end

  def generate
    @contract = Contract.new(contract_params)
    @user = User.find(params[:user_id])
    request.format = :pdf if contract_params['pdf'] == 'true'

    if @contract.valid?
      respond_to do |format|
        format.html {
          render layout: 'pdf_only',
          template: "contracts/generate/template_#{@contract.draft.id}" 
        }
        format.pdf {
          render template: "contracts/generate/template_#{@contract.draft.id}",
          pdf: "#{@contract.draft.name}_#{@user.en_user_field.last_name}",
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
    params.require(:contract).permit(:draft_id, :pdf, :number, :start_date, :end_date)
  end

  def set_drafts
    @drafts = Draft.pluck(:name, :id)
  end
end
