# frozen_string_literal: true

class TaskDecorator < ApplicationDecorator
  def t_status
    I18n.t("activerecord.enums.task.status.#{status}")
  end

  def created_by_full_name
    decorated_created_by.full_name
  end

  def assigned_to_full_name
    decorated_assigned_to.full_name
  end

  def l_deadline
    I18n.l(deadline, format: :long)
  end

  private

  def decorated_created_by
    @decorated_created_by ||= decorate(created_by)
  end

  def decorated_assigned_to
    @decorated_assigned_to ||= decorate(assigned_to)
  end
end
