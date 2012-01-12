require 'rspec_rails_matchers/validations/presence_of'
require 'rspec_rails_matchers/validations/confirmation_of'

module RSpecRailsMatchers
  module Validations
   autoload :NumericalityOf, 'rspec_rails_matchers/validations/numericality_of'
    autoload :LengthOf,       'rspec_rails_matchers/validations/length_of'
    autoload :UniquenessOf,   'rspec_rails_matchers/validations/uniqueness_of'

    include NumericalityOf
    include LengthOf
    include UniquenessOf
  end
end

