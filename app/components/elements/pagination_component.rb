# frozen_string_literal: true

module Elements
  class PaginationComponent < ApplicationComponent
    use_helpers :pagy_bootstrap_nav, :pagy_info

    def initialize(pagy:)
      @pagy = pagy
    end

    def render?
      @pagy.count > 0
    end
  end
end
