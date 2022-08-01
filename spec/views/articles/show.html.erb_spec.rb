# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/show', type: :view do
  before do
    @article = assign(:article, create(:article))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to include(@article.title)
    expect(rendered).to include(@article.body.to_s)
  end
end
