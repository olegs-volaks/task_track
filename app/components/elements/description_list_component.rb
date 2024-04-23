# frozen_string_literal: true

module Elements
  class DescriptionListComponent < ApplicationComponent
    renders_many :rows, Elements::DescriptionListRowComponent
  end
end
