# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag'

module HexletCode
  class Error < StandardError; end

  autoload :Tag, 'tag'
  autoload :Builder, 'builder'

  def self.form_for(entity, url: '#', method: 'post', **attributes)
    builder = Builder.new(entity)

    Tag.build('form', { action: url, method: }.merge(attributes)) do
      yield builder if block_given?
    end
  end
end
