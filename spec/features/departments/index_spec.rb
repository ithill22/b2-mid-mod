require 'rails_helper'

RSpec.describe 'Departments Index Page' do
  before :each do
    @department_1 = Department.create!(name: 'IT', floor: 'Basement')
    @department_2 = Department.create!(name: 'HR', floor: '2nd Floor')
    @employee_1 = @department_1.employees.create!(name: 'John', level: 2)
    @employee_2 = @department_2.employees.create!(name: 'Jane', level: 3)
    @ticket_1 = Ticket.create!(subject: 'Printer not working', age: 4)
    @ticket_2 = Ticket.create!(subject: 'Computer not working', age: 2)
    
    EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_1.id)
    EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_2.id)
  end

  describe 'As a user, when i visit the department index page' do
    it 'I see each departments name and floor, a a list of each departments employees' do
      visit '/departments'

      expect(page).to have_content(@department_1.name)
      expect(page).to have_content(@department_1.floor)
      expect(page).to have_content(@department_2.name)
      expect(page).to have_content(@department_2.floor)
      expect(page).to have_content(@employee_1.name)
      expect(page).to have_content(@employee_2.name)
    end
  end
end