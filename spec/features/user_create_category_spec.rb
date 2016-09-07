require 'rails_helper'

feature 'user create categories' do
  scenario 'successfully' do
    category = create :category
    visit new_category_path
    fill_in 'Nome', with: category.name
    click_on 'Criar Categoria'
    expect(page).to have_css('h1', text: category.name)
  end

  scenario 'with blank name' do
    visit new_category_path
    click_on 'Criar Categoria'
    expect(page).to have_content('Não foi possível criar a categoria')
  end
end
