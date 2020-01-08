class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  include ModelHelper

  scope :created_this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }
  scope :updated_this_month, -> { where(updated_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  def self.bulk_create(attributes)
    transaction do
      create attributes
    end
  end

  # NOTE: normalize ensures all default values are set for each record
  #       Keys in each hash must be a string...for now!
  def self.bulk_insert(hashes, normalize = false)
    normalize_hashes(hashes) if normalize

    transaction do
      import(hashes, validate: false, on_duplicate_key_ignore: true)
    end
  end

  def self.normalize_hash(obj, defaults)
    defaults.each { |k, v| obj[k] ||= v }
    obj
  end

  def self.normalize_hashes(hashes)
    defaults = base_class.new.attributes.except('id', 'created_at', 'updated_at')

    hashes.each { |obj| normalize_hash(obj, defaults) }
  end

  def self.update_or_create_by(args, attributes)
    obj = self.find_or_initialize_by(args)
    obj.update!(attributes)
    return obj
  end

  def self.pg_result_to_active_record(result)
    fields = result.fields
    result.values.map { |value_set| self.instantiate(Hash[fields.zip(value_set)])}
  end

end
