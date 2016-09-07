require 'rails_helper'

feature 'Visitor view jobs on home page' do
  scenario 'successfully' do
    job = create :job

    visit root_path

    expect(page).to have_content(job.title)
    expect(page).to have_content(job.company.name)
    expect(page).to have_content(job.location)
    expect(page).not_to have_content('Destaque')
  end

  scenario 'and view a list of jobs' do
    job = create :job

    another_job = create(:job, title: 'UX Senior', featured: true)

    visit root_path

    expect(page).to have_css('h1',text: job.title)
    expect(page).to have_content(job.company.name)
    expect(page).not_to have_content(job.description)
    expect(page).to have_css('h1',text: another_job.title)
    expect(page).to have_content(another_job.company.name)
    expect(page).to have_css('strong', text: 'Destaque')
    expect(page).not_to have_content(another_job.description)
  end
end
