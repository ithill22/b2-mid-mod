require 'rails_helper'

RSpec.describe 'Departments Index Page' do
  let!(:department_1) { Department.create!(name: 'IT', floor: 'Basement') }
  let!(:department_2) { Department.create!(name: 'HR', floor: '2nd Floor') }
  let!(:employee_1) { Employee.create!(name: 'John', level: 2, department_id: department_1.id) }
  let!(:employee_2) { Employee.create!(name: 'Jane', level: 3, department_id: department_2.id) }
  let!(:ticket_1) { Ticket.create!(title: 'Printer not working', age: 4, employee_id: employee_1.id) }
  let!(:ticket_2) { Ticket.create!(title: 'Computer not working', age: 2, employee_id: employee_2.id) }

  describe 'As a user, when i visit the department index page' do
    it 'I see each departments name and floor, a a list of each departments employees' do
      visit '/departments'

      expect(page).to have_content(department_1.name)
      expect(page).to have_content(department_1.floor)
      expect(page).to have_content(department_2.name)
      expect(page).to have_content(department_2.floor)
      expect(page).to have_content(employee_1.name)
      expect(page).to have_content(employee_2.name)
    end
  end
end