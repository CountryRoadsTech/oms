# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'articles/index', type: :view do
  before do
    @articles = assign(:articles, [create(:article), create(:article)])
  end

  it 'renders a list of articles' do
    render
    expect(rendered).to include(@articles.first.title)
    expect(rendered).to include(@articles.second.title)
  end
end
