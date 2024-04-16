# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :form_body

    def initialize(entity, url: '#', method: 'post', **attributes)
      @entity = entity
      @form_body = {
        inputs: [],
        submit: {},
        form_options: { action: url, method:, **attributes }
      }
    end

    def input(name, **attributes)
      @form_body[:inputs].concat(build_input_attributes(name, **attributes))
    end

    def submit(value = 'Save', **attributes)
      @form_body[:submit] = attributes.merge({ type: :submit, value: })
    end

    def build_input_attributes(name, as: :string, **attributes)
      params = {
        name:,
        type: as,
        value: @entity.send(name),
        label: {
          value: name.to_s.capitalize,
          for: name
        }
      }.merge(**attributes)

      input_class = "HexletCode::Inputs::#{as.to_s.capitalize}Input".constantize
      input_class.new(params).build
    end
  end
end
