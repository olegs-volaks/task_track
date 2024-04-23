# frozen_string_literal: true

module Tasks
  class SearchComponent < ApplicationComponent
    include ModelAttributeHumanizer

    define_humanize_methods_for Task

    def initialize(search:, current_user:)
      @search = search
      @current_user = current_user
    end

    private

    def t_task_deadline_from
      "#{t_task_deadline} #{t('.from')}"
    end

    def t_task_deadline_to
      "#{t_task_deadline} #{t('.to')}"
    end

    def statuses_collection
      Task.statuses.keys.map do |status|
        [
          I18n.t("activerecord.enums.task.status.#{status}"),
          status
        ]
      end
    end

    def users_collection
      users = Tasks::UserAssignedUsersListService.new(@current_user).call

      decorate_all(users).map { |user| [user.full_name, user.id] }
    end
  end
end
