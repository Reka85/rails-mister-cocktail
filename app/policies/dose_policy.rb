class DosePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  # only the creator of the cocktail can create dose for the cocktail
  def create?
    user == record.cocktail.user
  end

  # only creator of dose can delete it
  def destroy?
    user == record.cocktail.user
  end
end
