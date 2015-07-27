class PicturePolicy < ApplicationPolicy
  def show?
    true
  end

  def new?
    create?
  end

  def create?
    !user.nil?
  end

  def update?
    user && (user.admin? || record.user_id == user.id)
  end

  def edit?
    update?
  end

  def destroy?
    user && user.admin?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end