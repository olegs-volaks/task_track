# frozen_string_literal: true

module Elements
  class DescriptionListRowComponent < ApplicationComponent
    def initialize(title:, description:)
      @title = title
      @description = description
    end
  end
end
