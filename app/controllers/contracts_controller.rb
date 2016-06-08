class ContractsController < ApplicationController
  def new
    @contract = Contract.new
    @drafts =  Draft.pluck(:name, :id)
    @users = User.joins(:en_user_field).map { |u| [u.en_user_field.full_name, u.id] }
  end

  def generate
    @contract = Contract.new(contract_params)
    @user = @contract.user
    request.format = :pdf if contract_params['pdf'] == 'true'

    respond_to do |format|
      format.html { render layout: 'pdf_only', template: "contracts/generate/template_#{@contract.draft.id}" }
      format.pdf { render template: "contracts/generate/template_#{@contract.draft.id}",
        pdf: "#{@contract.draft.name}_#{@user.en_user_field.last_name}",
        stylesheets: ["app/assets/javascripts/application.js", 'app/assets/fonts/times_new_roman.css', "app/assets/stylesheets/prince.css"]
      }
    end
  end

  private
  def contract_params
    params.require(:contract).permit(:user_id, :draft_id, :pdf, :number, :start_date, :end_date)
  end
end
