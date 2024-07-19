class ApplicationRecord < ActiveRecord::Base
  include RansackFilter
  include ActionText::Attachable

  primary_abstract_class
end
