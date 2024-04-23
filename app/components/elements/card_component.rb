# frozen_string_literal: true

module Elements
  class CardComponent < ApplicationComponent
    renders_one :header
    renders_one :body
    renders_one :footer

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    def card_class
      html_classes = ['card']
      html_classes << @html_options[:class]

      html_classes.compact.join(' ')
    end
  end
end
