# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/show', type: :view do
  before do
    @page = assign(:page, create(:page))
  end

  it 'renders attributes' do
    render
    expect(rendered).to include(@page.title)
    expect(rendered).to include(@page.subtitle)
    expect(rendered).to include(@page.body.to_s)
  end
end
