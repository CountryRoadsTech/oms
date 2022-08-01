# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/edit', type: :view do
  before do
    @article = assign(:article, create(:article))
  end

  it 'renders the edit article form' do
    render

    assert_select 'form[action=?][method=?]', article_path(@article), 'post' do
      assert_select 'textarea[name=?]', 'article[title]'

      assert_select 'input[name=?]', 'article[body]'

      assert_select 'input[name=?]', 'article[external]'
    end
  end
end
