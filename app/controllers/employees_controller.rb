class EmployeesController < ApplicationController
  def index
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.find(params[:id])
    EmployeeTicket.create!(employee_id: @employee.id, ticket_id: params[:ticket_id])
    redirect_to "/employees/#{@employee.id}"
  end
end