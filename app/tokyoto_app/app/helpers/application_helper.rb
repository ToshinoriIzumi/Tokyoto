module ApplicationHelper

  def income_to_db(param)
    param.to_i * 10000
  end

  def income_to_view(data)
    data.to_i / 10000
  end

  def age(date)
    (Date.today.strftime('%Y%m%d').to_i - date.strftime('%Y%m%d').to_i) / 10000
  end
end
