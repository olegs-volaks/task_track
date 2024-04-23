# frozen_string_literal: true

module Elements
  class TableComponent < ApplicationComponent
    renders_many :headers, Elements::TableHeaderComponent
    renders_many :rows

    def initialize(**html_options)
      @html_options = html_options
    end

    private

    def table_class
      html_classes = ['table']
      html_classes << @html_options[:class]

      html_classes.compact.join(' ')
    end
  end
end
