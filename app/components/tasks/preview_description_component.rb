# frozen_string_literal: true

module Tasks
  class PreviewDescriptionComponent < ApplicationComponent
    include ModelAttributeHumanizer
    define_humanize_methods_for Task

    def initialize(task:)
      @task = task
    end
  end
end
