class CocktailPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # anyone can create a cocktail
  # new? is not necessary here, see in app_policy.rb: new? calls create? => new? will also return true


  def create?
    #any logged in user can create a restaurant
    !user.nil?
  end

  def index?
    true
  end

  def update?
    is_user_the_owner? || user.admin
  end

  def destroy?
    # admin or user can destroy
    is_user_the_owner? || user.admin
  end

  private

  def is_user_the_owner?
    user == record.user
  end
end
