# frozen_string_literal: true

class Tag
  def self.build(tag, attributes = [])
    block_tags = %w[div form]

    [
      "<#{tag}",
      attributes.empty? ? '' : ' ',
      attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' '),
      '>',
      (yield if block_given?),
      ("</#{tag}>" if block_given? || block_tags.include?(tag))
    ].join
  end
end
