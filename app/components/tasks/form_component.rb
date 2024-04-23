# frozen_string_literal: true

module Tasks
  class FormComponent < ApplicationComponent
    def initialize(form, **options)
      @form = form
      @options = options
    end
  end
end
