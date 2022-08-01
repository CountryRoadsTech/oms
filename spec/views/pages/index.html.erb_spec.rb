# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'pages/index', type: :view do
  before do
    @pages = assign(:pages, [create(:page), create(:page)])
  end

  it 'renders a list of pages' do
    render
    expect(rendered).to include(@pages.first.title)
    expect(rendered).to include(@pages.second.title)
    expect(rendered).to include(@pages.first.subtitle)
    expect(rendered).to include(@pages.second.subtitle)
  end
end
