class ContractGenerateService
  def initialize(user, contract)
    @context = Object.new
    add_helper_methods
    @user = user
    @contract = contract
    @draft_name = @contract.draft.name.downcase
  end

  def generate
    Haml::Engine.new(Template.find_by_name(@draft_name).body)
    .render(@context, locals = locals_for_haml_engine)
  end

  private
  def add_helper_methods
    class << @context
      include ContractsHelper
    end
  end

  def locals_for_haml_engine
    {
      user:          @user,
      contract:      @contract,
      person_type:   @contract.person_type.name,
      ua_user_field: @user.ua_user_field,
      ru_user_field: @user.ru_user_field,
      en_user_field: @user.en_user_field,
    }
  end
end
