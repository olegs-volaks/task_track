# frozen_string_literal: true

module AppLayouts
  class NavLinkComponent < ApplicationComponent
    use_helpers :fa_solid

    def initialize(title:, link:, icon:, active:)
      @title = title
      @link = link
      @icon = icon
      @active = active
    end

    def link_class
      html_class = ['nav-link']
      html_class << 'active' if @active

      html_class.join(' ')
    end
  end
end
