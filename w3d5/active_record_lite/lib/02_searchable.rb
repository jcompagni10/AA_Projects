require_relative 'db_connection'
require_relative '01_sql_object'





module Searchable


  def value_pairs(params)
    pairs = []
    params.each do |attrib, val|
      pairs << ["#{attrib} = '#{val}'"]
    end
    pairs.join("AND ")
  end

  def where(params)
    vp = value_pairs(params)
    result = DBConnection.execute2(<<-SQL)

      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{vp}

    SQL

    parse_all(result[1..-1])
  end

  private



end

class SQLObject
  extend Searchable
  # def self.value_pairs(params)
  #   pairs = []
  #   params.each do |attrib, val|
  #     pairs << ["#{attrib} = '#{val}'"] unless attrib == :id
  #   end
  #   pairs.join(", ")
  # end
  #
  # def self.where(params)
  #   vp = value_pairs(params)
  #   DBConnection.execute2(<<-SQL)
  #
  #     SELECT
  #       *
  #     FROM
  #       #{self.class.table_name}
  #     WHERE
  #       #{vp}
  #
  #   SQL
  # end

end

if __FILE__ == $0
  class Cat < SQLObject
  end
  Cat.finalize!
  c = Cat.new
  require "byebug"
  require "pry"
  pry
end
