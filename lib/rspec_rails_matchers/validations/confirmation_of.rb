module RSpecRailsMatchers
  module Validations

    class ConfirmationOf
      def initialize(attribute)
        @attribute = attribute
      end

      def matches?(model)
        if model.respond_to?("#{@attribute}_confirmation=")
          model.send("#{@attribute}=", 'asdf')
          model.send("#{@attribute}_confirmation=", 'asdfg')

          model.invalid? && 
            model.errors[@attribute].include?(
              I18n::t('errors.messages.confirmation')
            )
        end
      end

      def failure_message_for_should
        "expected #{model.class.name} to validate confirmation of #{@attribute}"
      end

      def failure_message_for_should_not
        "expected #{model.class.name} to not validate confirmation of #{@attribute}"
      end

    end

    def validate_confirmation_of(attribute)
      ConfirmationOf.new attribute
    end

  end
end
