# frozen_string_literal: true

class FormBuilder
  def initialize(entity, url: '#', method: 'post', **attributes)
    @entity = entity
    @form_body = {
      inputs: [],
      submit: {},
      form_options: { action: url, method:, **attributes }
    }
  end

  def getbody
    @form_body
  end

  def input(name, **attributes)
    @form_body[:inputs] << {
      name:,
      **attributes.merge({ value: @entity.send(name) })
    }
  end

  def submit(value = 'Save', **attributes)
    @form_body[:submit] = attributes.merge({ type: :submit, value: })
  end
end
