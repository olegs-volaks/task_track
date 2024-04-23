# frozen_string_literal: true

module Elements
  class TableHeaderComponent < ApplicationComponent
    def initialize(**options)
      @options = options
    end

    def call
      tag.th(content, **element_options)
    end

    def element_options
      @options.merge(default_options)
    end

    def default_options
      { scope: 'col' }
    end
  end
end
