# frozen_string_literal: true

class AppLayouts::NotificationsComponent < ApplicationComponent
  renders_many :flash_toasts, "AppLayouts::FlashToastComponent"
end
