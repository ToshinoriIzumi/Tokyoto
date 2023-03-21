class ConditionsSupportSearchService
  class << self
    def search_by(support_id, public_assistance, children_counts, city_id)
      search_conditions_supports_id(
        search_conditions_id(
          search_statues(public_assistance, children_counts)
        ),
        support_id,
        city_id
      ) 
    end

    private
    def search_statues(public_assistance, children_counts)
      Status.where(id: public_assistance)
        .or(Status.where(id: children_counts))
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

    def search_conditions_supports_id(condition_ids, support_id, city_id)
      return [] if condition_ids.size == 0
      conditions_support_ids = []
      condition_ids.each do |condition_id|
        condition_supports = ConditionsSupport.where(
          support_id: support_id,
          condition_id: condition_id,
          city_id: city_id
        )
        next if condition_supports == nil
        condition_supports.to_a.each { |condition_support| conditions_support_ids.push(condition_support.id) }
      end
      return conditions_support_ids
    end
  end
end