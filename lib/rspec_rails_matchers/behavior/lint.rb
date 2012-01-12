module RSpecRailsMatchers
  module Behavior
    module Lint
      share_as :AnActiveModel do

        it { should respond_to(:to_model) }
        it { should respond_to(:to_key) }
        it { should respond_to(:to_param) }

        it { should respond_to(:valid?) }
        it("should have boolean valid?") { [true, false].should include subject.valid? }

        it { should respond_to(:persisted?) }
        it("should have boolean persisted?") { [true, false].should include subject.persisted? }
        
        its(:class) { should respond_to(:model_name) }

        context "the model name" do
          def subject
            super.class.model_name
          end

          it                  { should be_kind_of(String) }
          its(:human)         { should be_kind_of(String) }
          its(:partial_path)  { should be_kind_of(String) }
          its(:singular)      { should be_kind_of(String) }
          its(:plural)        { should be_kind_of(String) }
        end

        context "when its not persisted" do
          def subject
            obj = super.dup
            obj.stub!(:persisted?).and_return(false)
            obj
          end

          its(:to_key)   { should be_nil }
          its(:to_param) { should be_nil }
        end

        it { should respond_to(:errors) }
        
        context "errors" do
          def subject
            super.errors
          end

          it { should respond_to(:[]) }
          it { should respond_to(:full_messages) }

          context "[:hello]" do
            it { subject[:hello].should be_an_instance_of(Array) }

            its(:full_messages) { should be_an_instance_of(Array) }
          end
        end
      end 
    end
  end
end
