require 'rails_helper'
  feature 'User edit companies' do
    scenario 'successfully' do
      company = create :company

      visit edit_company_path(company)

      fill_in 'Telefone', with: '1234-4567'
      fill_in 'Email'  , with: 'contato@campuscode.com.br'
      click_on 'Alterar Empresa'

      expect(page).to have_css('h1', text: company.name)
      expect(page).to have_content('1234-4567')
      expect(page).to have_content('contato@campuscode.com.br')
    end

    scenario 'and should fill all fields' do
      company = create :company

      visit edit_company_path(company)

      fill_in 'Nome',     with: ''
      fill_in 'Local',    with: ''
      fill_in 'Email',    with: ''
      fill_in 'Telefone', with: ''

      click_on 'Alterar Empresa'

      expect(page).to have_content 'Não foi possível atualizar a Empresa'
    end
  end
