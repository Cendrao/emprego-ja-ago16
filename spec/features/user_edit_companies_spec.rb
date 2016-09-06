require 'rails_helper'
  feature 'User edit companies' do
    scenario 'successfully' do
      company = Company.create(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476')

      visit edit_company_path(company)

      fill_in 'Telefone', with: '1234-4567'
      fill_in 'Email'  , with: 'contato@campuscode.com.br'
      click_on 'Alterar Empresa'

      expect(page).to have_css('h1', text: company.name)
      expect(page).to have_content('1234-4567')
      expect(page).to have_content('contato@campuscode.com.br')

    end
  end
