# frozen_string_literal: true

module Tasks
  class ListComponent < ApplicationComponent
    include ModelAttributeHumanizer
    use_helpers :fa_solid, :sort_link

    define_humanize_methods_for Task

    def initialize(tasks:, pagy:, search:)
      @tasks = tasks
      @pagy = pagy
      @search = search
    end
  end
end
