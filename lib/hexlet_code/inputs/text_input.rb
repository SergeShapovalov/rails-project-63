# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      DEFAULT_COLS = 20
      DEFAULT_ROWS = 40

      def build
        cols = @attributes.fetch(:cols, DEFAULT_COLS)
        rows = @attributes.fetch(:rows, DEFAULT_ROWS)

        {
          tag: :textarea,
          value: @value,
          label:,
          attributes: @attributes.merge({ cols:, rows: })
        }
      end
    end
  end
end
