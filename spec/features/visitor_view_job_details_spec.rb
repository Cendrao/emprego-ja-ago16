require 'rails_helper'

feature 'Visitor visits job details' do
  scenario 'successfully' do
    category = create :category

    job = create :job 

    visit root_path

    click_on job.title

    expect(page).to have_content job.title
    expect(page).to have_content category.name
    expect(page).to have_content job.company.name
    expect(page).to have_content job.description
    expect(page).to have_content job.location
  end

  scenario 'and return to home' do
    job = create :job

    visit job_path(job)

    click_on 'Voltar'

    expect(current_path).to eq(root_path)
  end
end
