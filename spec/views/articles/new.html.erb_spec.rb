# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/new', type: :view do
  before do
    assign(:article, build(:article))
  end

  it 'renders new article form' do
    render

    assert_select 'form[action=?][method=?]', articles_path, 'post' do
      assert_select 'textarea[name=?]', 'article[title]'

      assert_select 'input[name=?]', 'article[body]'

      assert_select 'input[name=?]', 'article[external]'
    end
  end
end
