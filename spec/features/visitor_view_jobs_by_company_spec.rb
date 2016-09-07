require 'rails_helper'

feature 'Visitor view jobs by company' do
  scenario 'successfully' do
    category = create(:category, name: 'Desenvolvedor')
    category_ux = create(:category, name: 'UX')

    company = create :company

    job = create(:job, company: company, category: category)

    another_job = create(:job, title: 'UX Senior', company: company, category: category_ux)

    visit root_path

    click_on company.name

    expect(page).to have_css('h1', text: company.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(category.name)

    expect(page).to have_content(another_job.title)
    expect(page).to have_content(category_ux.name)
  end

  scenario 'and view only the company jobs' do
    category = create(:category, name: 'Desenvolvedor')

    company = create :company

    job = create(:job, company: company, category: category)

    another_company = create(:company, name: 'Google')

    visit root_path

    click_on another_company.name

    expect(page).to have_css('h1', text: another_company.name)
    expect(page).not_to have_content(job.title)
    expect(page).not_to have_content(job.category.name)
  end


  scenario 'view a friendly message' do
    company = create :company

    visit root_path

    click_on company.name

    expect(page).to have_content 'Nenhuma vaga disponível'
  end
end
