# frozen_string_literal: true

class FormRender
  autoload :Tag, 'tag'
  def self.render_html(builder_form)
    body = builder_form.getbody
    submit = body[:submit]

    Tag.build(:form, body[:form_options]) do
      body[:inputs].map { |i| input(**i) }.join + (submit.empty? ? '' : submit(**submit))
    end
  end

  def self.input(name:, value:, as: :input, **attributes)
    result = if as == :text
               textarea(name, value, **attributes)
             else
               Tag.build(:input, { name:, type: :text, value: }.merge(attributes))
             end

    label(name) + result
  end

  def self.textarea(name, value, cols: 20, rows: 40, **attributes)
    Tag.build(
      :textarea,
      {
        name:,
        cols:,
        rows:
      }.merge(attributes)
    ) { value }
  end

  def self.submit(value:, **attributes)
    Tag.build(
      :input,
      {
        type: 'submit',
        value:
      }.merge(attributes)
    )
  end

  def self.label(name)
    Tag.build(:label, { for: name }) do
      name.capitalize
    end
  end
end
