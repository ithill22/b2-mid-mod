require 'rails_helper'

RSpec.describe Employee, type: :model do
  before :each do
    test_data
  end

  describe 'relationships' do
    it { should belong_to :department }
    it { should have_many :employee_tickets }
    it { should have_many(:tickets).through(:employee_tickets) }
  end

  describe 'instance methods' do
    describe '#tickets_by_age' do
      it 'returns tickets by age' do
        expect(@employee_1.tickets_by_age).to eq([@ticket_3, @ticket_1])
        expect(@employee_2.tickets_by_age).to eq([@ticket_2, @ticket_4])
      end
    end

    describe '#oldest_ticket' do
      it 'returns oldest ticket' do
        expect(@employee_1.oldest_ticket).to eq(@ticket_3.subject)
        expect(@employee_2.oldest_ticket).to eq(@ticket_2.subject)
      end
    end
  end
end