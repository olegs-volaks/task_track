# frozen_string_literal: true

module AppLayouts
  class LayoutSidenavComponent < ApplicationComponent
    renders_one :sidebar, AppLayouts::SidebarComponent

    private

    def footer_text
      t('.footer', year: DateTime.current.year).html_safe
    end
  end
end
