require 'rails_helper'

feature 'User edit jobs' do
  scenario 'successfully' do
    company = create :company

    category = create :category

    job = create(:job, company: company, category: category)

    visit edit_job_path(job)

    fill_in 'Título',       with: 'Dev Android'
    fill_in 'Local',        with: 'Belo Horizonte'
    fill_in 'Descrição',    with: 'Desenvolvedor de apps integradas via API'

    click_on 'Atualizar Vaga'

    expect(page).to have_css('h1', text: 'Dev Android')
    expect(page).to have_content 'Belo Horizonte'
    expect(page).to have_content category.name
    expect(page).to have_content company.name
    expect(page).to have_content 'Desenvolvedor de apps integradas via API'
  end

  scenario 'and change company' do
    company = create :company

    category = create :category

    job = create(:job, company: company, category: category)

    google = create(:company, name: 'Google')

    visit edit_job_path(job)

    select google.name, from: 'Empresa'

    click_on 'Atualizar Vaga'

    expect(page).to have_css('h1', text: job.title)
    expect(page).to have_content 'Google'
  end

  scenario 'with valid data' do
    company = create :company

    category = create :category

    job = create(:job, company: company, category: category)

    visit edit_job_path(job)

    fill_in 'Título', with: ''

    click_on 'Atualizar Vaga'

    expect(page).to have_content 'Não foi possível atualizar a vaga'
  end
end
