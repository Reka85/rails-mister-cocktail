class Api::V1::CocktailsController < Api::V1::BaseController
  def index
    @cocktails = policy_scope(Cocktail)
  end
end
