module ConditionsSupportShowHelper

  def replace_head_of_line_to_interpoint(data)
    data.sub(/^/, '・') if data.present?
  end

  def replace_comma_to_interpoint(data)
    data.gsub(/,/, '・') if data.present?
  end
end