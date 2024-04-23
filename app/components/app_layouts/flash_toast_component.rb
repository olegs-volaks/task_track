# frozen_string_literal: true

module AppLayouts
  class FlashToastComponent < ApplicationComponent
    def initialize(text:, type: 'notice')
      @text = text
      @type = type
    end

    private

    def flash_class
      case @type
      when 'success'
        'text-bg-success'
      when 'notice'
        'text-bg-primary'
      when 'alert'
        'text-bg-warning'
      when 'error'
        'text-bg-danger'
      else
        ''
      end
    end
  end
end
