class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.exec_custom_insert(sql, vars)
    sql = ActiveRecord::Base::sanitize_sql_array([sql, vars])
    connection.exec_insert(sql, 'SQL')
  end
end
