class DosePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  # only the creator of the cocktail can create dose for the cocktail
  def create?
    is_user_the_owner?
  end

  # only creator of dose can delete it
  def destroy?
    is_user_the_owner?
  end

  private

  def is_user_the_owner?
    user == record.cocktail.user
  end
end
