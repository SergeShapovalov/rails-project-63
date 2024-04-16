# frozen_string_literal: true

module HexletCode
  class Tag
    SINGLE_TAGS = %i[br img input hr].freeze
    def self.build(tag, attributes = [])
      is_single = SINGLE_TAGS.include?(tag)
      attributes[:value] = yield if is_single && block_given?

      [
        "<#{tag}",
        attributes.empty? ? '' : ' ',
        attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' '),
        '>',
        ("#{yield}</#{tag}>" unless is_single),
      ].join
    end
  end
end
