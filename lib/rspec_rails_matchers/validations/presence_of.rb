module RSpecRailsMatchers
  module Validations

    class PresenceOf

      def initialize(attribute)
        @attribute = attribute
      end

      def matches?(model)
        model.send("#{@attribute}=", nil)
        model.invalid? && model.errors[@attribute].any?
      end

      def failure_message_for_should
        "expected #{model.class.name} to validate presence of #{@attribute}"
      end

      def failure_message_for_should_not
        "expected #{model.class.name} to not validate presence of #{@attribute}"
      end

    end

    def validate_presence_of(attribute)
      PresenceOf.new attribute
    end
  end
end

