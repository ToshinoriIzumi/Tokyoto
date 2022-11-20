class TagDecorator < Draper::Decorator
delegate_all

# Define presentation-specific methods here. Helpers are accessed through
# `helpers` (aka `h`). You can override attributes, for example:
#
#   def created_at
#     helpers.content_tag :span, class: 'time' do
#       object.created_at.strftime("%a %m/%d/%y")
#     end
#   end

  def color
    case object.name
      when '医療' then
        'orange'
      when '教育' then
        'teal'
      when '住宅' then
        'blue'
      when '育児' then
        'yellow'
      else
        'gray'
    end
  end

end