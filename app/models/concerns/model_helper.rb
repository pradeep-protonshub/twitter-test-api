module ModelHelper
  extend ActiveSupport::Concern

  def changed_fields
    saved_changes.transform_values(&:first).keys.reject { |n| n=="updated_at"}
  end

  def is_this_changed? field
    saved_change_to_attribute? field.to_s
  end

  def before_save_value field
    attribute_before_last_save field
  end

end