class EmployeeQueries

  def entry_exit(id,start_date,end_date)
    User.find(id).dialings
    .where("date >= :start_date AND date <= :end_date", {start_date: start_date, end_date: end_date})
    .order(date: :asc)
  end

  def late_employees(start_date,end_date)
    Dialing.where("category='Entry' AND hour>=9 AND minute>=1 AND date >= :start_date AND date <= :end_date", {start_date: start_date,end_date: end_date})
    .order(date: :asc)
  end

  def overtime_employees(start_date,end_date)
    Dialing.where("category='Exit' AND hour>=19 AND minute>=1 AND date >= :start_date AND date <= :end_date", {start_date: start_date,end_date: end_date})
    .order(date: :asc)
  end

end