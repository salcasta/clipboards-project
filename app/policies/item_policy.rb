class ItemPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user.id == record.user_id
  end

  def create?
    user.id == record.user_id
  end

  def new?
    create?
  end

  def update?
    user.id == record.user_id
  end

  def edit?
    update?
  end

  def destroy?
    user.id == record.user_id
  end

end
