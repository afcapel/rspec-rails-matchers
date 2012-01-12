require 'rspec_rails_matchers/validations/presence_of'
require 'rspec_rails_matchers/validations/confirmation_of'

module RSpecRailsMatchers
  module Validations
    autoload :LengthOf,       'rspec_rails_matchers/validations/length_of'
    autoload :UniquenessOf,   'rspec_rails_matchers/validations/uniqueness_of'

    include LengthOf
    include UniquenessOf
  end
end

