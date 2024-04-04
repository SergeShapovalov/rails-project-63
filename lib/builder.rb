# frozen_string_literal: true

class Builder
  def initialize(params)
    @params = params
    @result = ''
  end

  def input(name, as: :input, **attributes)
    label(name)

    if as == :text
      textarea(name, **attributes)
    else
      @result += Tag.build(
        'input',
        {
          name:,
          type: 'text',
          value: @params.send(name)
        }.merge(attributes)
      )
    end
  end

  def textarea(name, cols: 20, rows: 40, **attributes)
    @result += Tag.build(
      'textarea',
      {
        name:,
        cols:,
        rows:
      }.merge(attributes)
    ) { @params.send(name) }
  end

  def submit(value = 'Save')
    @result += Tag.build(
      'input',
      {
        type: 'submit',
        value:
      }
    )
  end

  def label(name)
    @result += Tag.build('label', { for: name }) do
      name.capitalize
    end
  end
end
