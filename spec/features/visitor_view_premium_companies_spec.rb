require 'rails_helper'

feature 'Visitor view premium companies' do
  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                              location: 'São Paulo',
                              phone: '11 2369 3476',
                              mail: 'contato@campuscode.com.br')

    category = Category.create(name: 'Desenvolvedor')

    5.times do
      company.jobs.create(title: 'Desenvolvedor Rails',
                           description: 'Desenvolvedor Full Stack Rails',
                           location: 'São Paulo - SP',
                           category: category)
    end

    visit root_path

    click_on company.name

    expect(page).to have_css('h1', text: company.name)
    expect(page).to have_xpath("//img[contains(@src,'estrela')]")
  end
end
