# frozen_string_literal: true

class Builder
  def initialize(params)
    @params = params
    @result = ''
  end

  def input(name, as: :input, **attributes)
    if as == :text
      textarea(name, **attributes)
    else
      @result += Tag.build(
        'input',
        {
          name: name,
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
        name: name,
        cols: cols,
        rows: rows
      }.merge(attributes)
    ) { @params.send(name) }
  end
end
