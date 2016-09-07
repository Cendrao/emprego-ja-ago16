require 'rails_helper'

feature 'User create jobs' do
  scenario 'successfully' do
    company = create :company

    category = create :category

    job = build(:job, company: company, category: category)

    visit new_job_path

    fill_in 'Título',       with: job.title
    fill_in 'Local',        with: job.location
    select  category.name,  from: 'Categoria'
    select  company.name,   from: 'Empresa'
    fill_in 'Descrição',    with: job.description

    click_on 'Criar Vaga'

    expect(page).to have_css('h1', text: job.title)
    expect(page).to have_content job.location
    expect(page).to have_content category.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
  end

  scenario 'and mark as featured' do
    company = create :company

    category = create :category

    job = build(:job, company: company, category: category)

    visit new_job_path

    fill_in 'Título',       with: job.title
    fill_in 'Local',        with: job.location
    select  category.name,  from: 'Categoria'
    select  company.name,   from: 'Empresa'
    fill_in 'Descrição',    with: job.description
    check   'Destaque'

    click_on 'Criar Vaga'

    expect(page).to have_css('h1', text: job.title)
    expect(page).to have_content job.location
    expect(page).to have_content category.name
    expect(page).to have_content company.name
    expect(page).to have_content job.description
    expect(page).to have_css('strong', text: 'Destaque')
  end

  scenario 'and should fill all fields' do
    visit new_job_path

    click_on 'Criar Vaga'

    expect(page).to have_content 'Não foi possível criar a vaga'
  end
end
