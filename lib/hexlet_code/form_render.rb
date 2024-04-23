# frozen_string_literal: true

module HexletCode
  class FormRender
    autoload :Tag, 'hexlet_code/tag'
    def self.render_html(builder_form)
      builder = builder_form.form_body
      body = render_html_body_array(builder)

      submit = builder[:submit]
      body << Tag.build(:input, submit.merge({ type: :submit })) unless submit.empty?

      Tag.build(:form, builder[:form_options]) { body.join }
    end

    def self.render_html_body_array(builder)
      builder[:inputs].map do |input|
        label = input[:label] || {}

        [
          (Tag.build(label[:tag], label[:attributes]) { label[:value] } unless label.empty?),
          Tag.build(input[:tag], input[:attributes]) { input[:value] }
        ].join
      end
    end
  end
end
