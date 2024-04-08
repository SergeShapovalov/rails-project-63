# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  autoload :FormBuilder, 'form_builder'
  autoload :FormRender, 'form_render'

  def self.form_for(user, attributes = {})
    builded_form = FormBuilder.new(user, **attributes)
    yield(builded_form) if block_given?
    FormRender.render_html(builded_form)
  end
end
