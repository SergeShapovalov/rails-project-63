# frozen_string_literal: true

class Tag
  def self.build(tag, attributes = [])
    block_tags = ['div']

    [
      "<#{tag}",
      attributes.empty? ? '' : ' ',
      attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' '),
      '>',
      (yield.to_s if block_given?),
      ("</#{tag}>" if block_given? || block_tags.include?(tag))
    ].join
  end
end

puts Tag.build('br') # <br>
puts Tag.build('img', src: 'path/to/image') # <img src="path/to/image">
puts Tag.build('input', type: 'submit', value: 'Save') # <input type="submit" value="Save">

puts Tag.build('label') { 'Email' } # <label>Email</label>
puts Tag.build('label', for: 'email') { 'Email' } # <label for="email">Email</label>
puts Tag.build('div') # <div></div>
