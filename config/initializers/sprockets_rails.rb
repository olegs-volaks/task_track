# frozen_string_literal: true
module Sprockets
  module Rails
    class SourcemappingUrlProcessor
      remove_const :REGEX if const_defined?(:REGEX)

      REGEX = /\/\/# sourceMappingURL=(?:.*\/)?(.*\.map)/
    end
  end
end