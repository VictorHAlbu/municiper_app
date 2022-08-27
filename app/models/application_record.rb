class ApplicationRecord < ActiveRecord::Base
  include Utils::Filter

  self.abstract_class = true
end
