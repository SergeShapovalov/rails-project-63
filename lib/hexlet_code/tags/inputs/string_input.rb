# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def build
        [
          label,
          {
            tag: :input,
            value: @value,
            attributes: @attributes.merge({ type: :text })
          }
        ]
      end
    end
  end
end