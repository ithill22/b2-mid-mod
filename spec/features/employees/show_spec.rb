require 'rails_helper'

RSpec.describe 'Employee Show Page' do
  before :each do
    @department_1 = Department.create!(name: 'IT', floor: 'Basement')
    @department_2 = Department.create!(name: 'HR', floor: '2nd Floor')
    @employee_1 = @department_1.employees.create!(name: 'John', level: 2)
    @employee_2 = @department_2.employees.create!(name: 'Jane', level: 3)
    @ticket_1 = Ticket.create!(subject: 'Printer not working', age: 1)
    @ticket_2 = Ticket.create!(subject: 'Computer not working', age: 2)
    @ticket_3 = Ticket.create!(subject: 'Complaint', age: 3)
    @ticket_4 = Ticket.create!(subject: 'Need new pencils', age: 1)
    
    EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_1.id)
    EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_2.id)
    EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_3.id)
    EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_4.id)
  end

  describe 'As a user, when i visit the employee show page' do
    it 'I see the employees name, department, and all of their tickets from oldest to youngest' do
      visit "/employees/#{@employee_1.id}"

      expect(page).to have_content(@employee_1.name)
      expect(page).to have_content(@employee_1.department.name)
      expect(@ticket_3.subject).to appear_before(@ticket_1.subject)

      within "#oldest-ticket" do
        expect(page).to have_content(@ticket_3.subject)
      end
    end
  end
end