class StatusBarNotificationPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    scope.where(:id => record.id).exists? and record.user_id == user.id
  end

  def create?
   true
  end

  def new?
    create?
  end

  def update?
    record_belongs_to_user?
  end

  def edit?
    update?
  end

  def destroy?
    record_belongs_to_user?
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id)
      end
    end
  end
end
