module ApplicationHelper

  def income_to_db(param)
    param.to_i * 10000
  end

  def income_to_view(data)
    data.to_i / 10000
  end
end
