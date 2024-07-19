# frozen_string_literal: true

module Tasks
  class TableRowComponent < ApplicationComponent
    use_helpers :fa_solid

    def initialize(task:)
      @task = task
    end

    private

    def decorated_task
      @decorated_task ||= decorate(@task)
    end

    def truncated_short_description
      truncate(decorated_task.short_description, length: 50)
    end
  end
end
