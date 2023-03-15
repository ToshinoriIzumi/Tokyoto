module ConditionsSupportShowHelper

  def replace_head_of_line_to_interpoint(data)
    data.sub(/^/, '・')
  end

  def replace_comma_to_interpoint(data)
    data.gsub(/,/, '・')
  end
end