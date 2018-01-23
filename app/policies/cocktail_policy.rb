class CocktailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


  # anyone can create a cocktail
  # new? is not necessary here, see in app_policy.rb: new? calls create? => new? will also return true
  def create?
    return true
  end

  def index?
    true
  end
end
