class SupportsSearchService
  class << self
    def search_by(public_assistance, children_counts, city_id)
      search_supports(
        search_conditions_id(
          search_statues(public_assistance, children_counts)
        ),
        city_id
      ) 
    end

    private
    def search_statues(public_assistance, children_counts)
      Status.where(status: public_assistance)
        .or(Status.where(status: children_counts))
        .select(:id)
        .distinct
    end

    def search_conditions_id(statuses)
      all_condition_ids = []
      statuses.each do |status|
        tmp = []
        status.conditions_supports_statuses.each do |conditions_supports_status|
          tmp.push(
            conditions_supports_status.condition_id
          )
        end
        all_condition_ids.push(tmp)
      end
      condition_ids = []
      all_condition_ids.each_with_index do |tmp_condition_id, index|
        if index == 0
          condition_ids = tmp_condition_id
        else
          condition_ids = condition_ids & tmp_condition_id
        end
      end
      return condition_ids
    end

    def search_supports(condition_ids, city_id)        
      return [] if condition_ids.size == 0
      supports = []
      support_ids = []
      condition_ids.each do |condition_id|
        condition_supports = ConditionsSupport.where(
          condition_id: condition_id,
          city_id: city_id
        )
        next if condition_supports == nil
        condition_supports.to_a.each do |condition_support|
          if support_ids.include?(condition_support.support_id)
            next
          end
          supports.push(condition_support.support)
          support_ids.push(condition_support.support_id)
        end
      end
      return supports
    end
  end
end