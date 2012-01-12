module RSpecRailsMatchers
  module Validations

    class NumericalityOf

      def initialize(attribute, options={})
        @attribute, @options = attribute, options
      end

      def matches?(model)
        invalid_on_non_numeric?(model, @attribute) && 
          (@options[:allow_blank] == true ? 
             invalid_on_blank?(model, @attribute) : true
          )
      end

      def failure_message_for_should
        "expected #{model.class.name} to validate numerciality of #{@attribute}"
      end

      def failure_message_for_should_not
        "expected #{model.class.name} not to validate numerciality of #{@attribute}"
      end

      def invalid_on_non_numeric?(model, attr)
        model.send("#{attr}=", 'abcd')
        model.invalid? && 
          model.errors[attr].include?(
            I18n::t('errors.messages.not_a_number')
          )
      end
  
      def invalid_on_blank?( model, attr )
        model.send("#{attr}=", nil)
        model.valid?

        !model.errors[attr].include?(
          I18n::t('errors.messages.not_a_number')
        )
      end

    end

    def validate_numericality_of(attribute, options = {})
      NumericalityOf.new(attribute, options)
    end


  end
end

