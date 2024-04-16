# frozen_string_literal: true

module HexletCode
  class FormRender
    autoload :Tag, 'hexlet_code/tag'
    def self.render_html(builder_form)
      builder = builder_form.form_body
      body = builder[:inputs].map do |input|
        Tag.build(input[:tag], input[:attributes]) { input[:value] }
      end

      submit = builder[:submit]
      body << Tag.build(:input, submit.merge({ type: :submit })) unless submit.empty?

      Tag.build(:form, builder[:form_options]) { body.join }
    end
  end
end
