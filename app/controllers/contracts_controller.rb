class ContractsController < ApplicationController
  before_action :set_drafts, only: [:new, :generate]
  def new
    @contract = Contract.new
  end

  def generate
    @contract = Contract.new(contract_params)
    @user = @contract.user
    draft_name = @contract.draft.name.downcase
    request.format = :pdf if params[:commit].downcase == 'pdf'

    respond_to do |format|
      format.html {
        render layout: 'pdf_only',
        template: "contracts/drafts/#{draft_name}"
      }
      format.pdf {
        render_with_princely template: "contracts/drafts/#{draft_name}",
        layout: 'pdf_only',
        pdf: "#{draft_name}_#{@user.name}",
        stylesheets: ["application", "prince"]
      }
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
