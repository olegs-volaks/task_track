# frozen_string_literal: true

module Tasks
  class PreviewComponent < ApplicationComponent
    include ModelAttributeHumanizer
    use_helpers :fa_solid

    define_humanize_methods_for Task

    def initialize(task:)
      @task = task
    end

    def decorated_task
      @decorated_task ||= decorate(@task)
    end
  end
end
