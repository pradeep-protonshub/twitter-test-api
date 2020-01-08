module CustomQueries
  extend ActiveSupport::Concern

  class_methods do
    def find_from_array_any_value(column_name, array)
      ActiveRecord::Base.connection.execute("select * from #{self.table_name} where ARRAY[#{column_name}] && ARRAY[#{array.map{ |a| "'#{a.gsub("'", "")}'"}.join(',')}]::varchar[] order by id limit 1")
    end
  end

end