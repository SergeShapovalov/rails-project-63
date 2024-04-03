# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag'

module HexletCode
  autoload :Tag, 'tag'
  class Error < StandardError; end
end
