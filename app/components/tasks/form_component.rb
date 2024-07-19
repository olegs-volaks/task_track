# frozen_string_literal: true

module Tasks
  class FormComponent < ApplicationComponent
    use_helpers :rich_text_area_tag

    def initialize(form, **options)
      @form = form
      @options = options
    end
  end
end
