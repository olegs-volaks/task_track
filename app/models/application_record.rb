class ApplicationRecord < ActiveRecord::Base
  include RansackFilter

  primary_abstract_class
end
