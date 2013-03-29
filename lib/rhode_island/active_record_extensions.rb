module RhodeIsland
  module ActiveRecordExtensions
    extend ActiveSupport::Concern
 
    included do
    end

    module ClassMethods
      def has_state_machine(states)
        send :include, InstanceMethods
        class_eval do
          states.each do |state|
            define_method :"is_#{state}?" do
              self.state == state.to_s
            end unless self.respond_to?(:"is_#{state}?")

            define_method :"make_#{state}" do
              self.make(state)
            end

            define_method :"make_#{state}!" do
              self.make!(state)
            end
          end
        end
      end
    end

    module InstanceMethods
      def make(new_state)
        old_state = self.state
        before_leaving_method_name = :"before_leaving_#{old_state}"
        before_entering_method_name = :"before_making_#{new_state}"
        self.send(before_leaving_method_name) if self.respond_to?(before_leaving_method_name)
        self.send(before_entering_method_name) if self.respond_to?(before_entering_method_name)
        self.state = new_state
        new_state
      end

      def make!(new_state)
        self.make(new_state)
        self.save!
      end
    end
  end
end

ActiveRecord::Base.send :include, RhodeIsland::ActiveRecordExtensions