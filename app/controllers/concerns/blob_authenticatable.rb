# frozen_string_literal: true

require "active_support/concern"

# Code author: https://gist.github.com/dommmel/4e41b204b97238e9aaf35939ae8e1666
module BlobAuthenticatable
  extend ActiveSupport::Concern

  mattr_reader :auth_resource

  included do
    around_action :wrap_in_authentication
  end

  class_methods do
    def auth_resource
      @auth_resource || Devise.default_scope
    end

    private

    def blob_authenticatable(resource:)
      @auth_resource = resource
    end
  end

  private

  def wrap_in_authentication
    is_signed_in_and_authorized = send("#{self.class.auth_resource}_signed_in?") &&
      can_access_blob?(send("current_#{self.class.auth_resource}"))

    if is_signed_in_and_authorized
      yield
    else
      head :not_found
    end
  end

  def can_access_blob?(_user)
    true
  end
end
