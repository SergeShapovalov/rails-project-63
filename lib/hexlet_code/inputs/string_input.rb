# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def build
        {
          tag: :input,
          value: @value,
          label:,
          attributes: @attributes.merge({ type: :text })
        }
      end
    end
  end
end
