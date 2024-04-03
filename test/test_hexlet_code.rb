# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  def setup
    user = Struct.new :name, :job, keyword_init: true
    @user = user.new name: 'Serhii', job: 'Developer'
  end

  def test_form_for
    form = HexletCode.form_for @user, url: '/users'
    assert_equal '<form action="/users" method="post"></form>', form
  end
end
