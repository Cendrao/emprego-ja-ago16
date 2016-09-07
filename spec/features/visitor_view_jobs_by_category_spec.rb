require 'rails_helper'

feature 'Visitor view jobs by category' do
  scenario 'successfully' do
    category = create :category

    job = create(:job, category: category)

    another_job = create(:job, category: category, title: 'Dev Java')

    visit root_path

    click_on category.name

    expect(page).to have_css('h1', text: category.name)
    expect(page).to have_content(job.title)
    expect(page).to have_content(another_job.title)
  end

  scenario 'and view only the current category jobs' do

    category = create :category

    job = create(:job, category: category)

    another_category = create(:category, name: 'Analista QA')

    another_job = create(:job, category: another_category, title: 'Dev Java')

    visit root_path

    click_on another_category.name

    expect(page).to have_css('h1', text: another_category.name)
    expect(page).to have_content another_job.title
    expect(page).to have_content another_job.location
    expect(page).not_to have_content job.title
  end

  scenario 'view a friendly empty message' do
    category = create :category

    visit root_path

    click_on category.name

    expect(page).to have_content 'Nenhuma vaga disponível'
  end
end
