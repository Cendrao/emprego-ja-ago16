require 'rails_helper'

RSpec.describe Company, type: :model do
  before do
    @company = Company.create(name: 'Campus Code',
                              location: 'São Paulo',
                              phone: '11 2369 3476',
                              mail: 'contato@campuscode.com.br')

    @category = Category.create(name: 'Desenvolvedor')
  end

  describe "#premium?" do
    context "has zero jobs" do
      it "is not premium" do
        expect(@company).to_not be_premium
      end
    end

    context "has 4 jobs" do
      it "is not premium" do
        4.times do
          @company.jobs.create(title: 'Desenvolvedor Rails',
                               description: 'Desenvolvedor Full Stack Rails',
                               location: 'São Paulo - SP',
                               category: @category)
        end
        expect(@company).to_not be_premium
      end
    end

    context "has 5 jobs" do
      it "is premium" do
        5.times do
          @company.jobs.create(title: 'Desenvolvedor Rails',
                               description: 'Desenvolvedor Full Stack Rails',
                               location: 'São Paulo - SP',
                               category: @category)
        end
        expect(@company).to be_premium
      end
    end

    context "has 10 jobs" do
      it "is premium" do
        10.times do
          @company.jobs.create(title: 'Desenvolvedor Rails',
                               description: 'Desenvolvedor Full Stack Rails',
                               location: 'São Paulo - SP',
                               category: @category)
        end
        expect(@company).to be_premium
      end
    end
  end
end
