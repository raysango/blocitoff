class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    record.user == user && scope.where(:id => record.id).exists?
  end

  def create?
    user.list == nil
  end

  def new?
    user.list == nil
  end

  def update?
    false
  end

  def edit?
    record.user == user
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end

