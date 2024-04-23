# frozen_string_literal: true

module Elements
  class PageHeaderComponent < ApplicationComponent
    def initialize(title:)
      @title = title
    end
  end
end
