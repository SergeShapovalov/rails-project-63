# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag'

module HexletCode
  autoload :Tag, 'tag'

  def self.form_for(_user, url: '#')
    Tag.build('form', { action: url, method: 'post' })
  end

  class Error < StandardError; end
end
