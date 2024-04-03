# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def fixture(filename)
    File.read(File.dirname(__FILE__) + "/fixtures/#{filename}.html")
  end

  def setup
    user = Struct.new :name, :job, :gender, keyword_init: true
    @user = user.new name: 'Serhii', job: 'Developer', gender: 'm'
    @user_hexlet = user.new job: 'hexlet'
  end

  def test_form_for_empty
    original = fixture('form_for_empty')
    form = HexletCode.form_for @user, url: '/users'

    assert_equal original, form
  end

  def test_form_for_input
    original = fixture('form_for_input')

    form = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal original, form
  end

  def test_form_for_attributes
    original = fixture('form_for_attributes')

    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    assert_equal original, form
  end

  def test_form_for_default
    original = fixture('form_for_default')

    form = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    assert_equal original, form
  end

  def test_from_for_redefine_default
    original = fixture('from_for_redefine_default')

    form = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal original, form
  end

  def test_form_for_field_missing
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        # Поля age у пользователя нет
        f.input :age
      end
    end
  end

  def test_form_for_submit
    original = fixture('form_for_submit')

    form = HexletCode.form_for @user_hexlet do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal original, form
  end

  def test_form_for_submit_value
    original = fixture('form_for_submit_value')

    form = HexletCode.form_for @user_hexlet, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert_equal original, form
  end
end
