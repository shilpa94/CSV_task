class EmployeesController < ApplicationController
  require 'csv'
  def index
    @employee = Employee.all
    @department = Department.all
    @position = Position.all
    @timelog = Timelog.all
    # @login_date = Timelog.select(:date).distinct
    # @hours_logged = Timelog.select(:hours_logged).distinct

    name = params[:employee]
    department = params[:department]
    position = params[:position]
    login_date = params[:login_date]
    hours_logged = params[:hours_logged]
  
   @search_results = Employee.joins(:department, :position).where("employees.name LIKE ?", "%#{name}%") 
   @search_results = @search_results.where('departments.id = ?',department) if department.present?
   @search_results = @search_results.where('positions.id = ?',position) if position.present?
   # @search_results = @search_results.where('timelogs.date = ?',login_date) if login_date.present?
   # @search_results = @search_results.where('timelogs.hours_logged = ?',hours_logged) if hours_logged.present?





  # @search_results = Employee.includes(:department, :position).where(departments: {id: department}, positions: {id: position})
  

  # @search_results = Employee.includes(:department, :position, :timelogs).where(departments: {id: department}, positions: {id: position}, timelogs: {hours_logged: hours_logged, date: login_date})

  # @search_results = Employee.includes(:timelogs).where(timelogs: {date: login_date})
  # @search_results = Employee.includes(:timelogs).where(timelogs: {hours_logged: hours_logged})

    # @search_results = Employee.joins(:employee_designation).where(
    #   'employee_designations.department_id' => department,
    #   'employee_designations.position_id' => position)
    # @search_results = Employee.search{
    #   fulltext name
    #   with(:department, department) if department.present?
    #   with(:position, position) if position.present?
    #   # with(:hours, hours_logged) if hours_logged.present?
    # }.results
  end

  def create_csv
    emp = params[:employee]
    dep = params[:department]
    pos = params[:position]
    # binding.pry
    csv_string = CSV.generate do |csv|
      csv << ["Name", "Email", "Phone", "Department", "Designation", "Day", "Hours"]
       @search_results = Employee.joins(:department, :position).where("employees.name LIKE ?", "%#{emp}%") 
       @search_results = @search_results.where('departments.id = ?',dep) if dep.present?
       @search_results = @search_results.where('positions.id = ?',pos) if pos.present?
      @search_results.each do |search|
        record = [search.name, search.email, search.phone, search.department.name,search.position.name ]
        search.timelogs.each do |tl|
          record << [tl.date, tl.hours_logged]
        end
        csv << record
      end
    end
    out_file = File.new("Details.csv", "w")
    out_file.puts(csv_string)
    out_file.close 
    redirect_to root_path
  end

end
