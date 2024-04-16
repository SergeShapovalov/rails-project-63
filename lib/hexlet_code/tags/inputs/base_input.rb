# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(input)
        @attributes = input.except(:label, :type, :value)
        @label = input[:label]
        @value = input[:value]
      end

      def label
        {
          tag: :label,
          value: @label[:value],
          attributes: {
            for: @label[:for]
          }
        }
      end
    end
  end
end
