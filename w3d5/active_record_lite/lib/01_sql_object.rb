require_relative 'db_connection'
require 'active_support/inflector'

# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    if @columns.nil?
      data = DBConnection.execute2(<<-SQL)
        SELECT
          *
        FROM
          #{table_name}
        SQL
      @columns = data.first.map(&:to_sym)
    else
      @columns
    end
  end

  def attributes
    @attributes ||= {}
  end

  def self.finalize!
    self.columns.each do |attrib|
      define_method(attrib.to_s){attributes[attrib]}
      define_method("#{attrib}="){|val| attributes[attrib] = val}
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name.tableize
  end

  def self.table_name
    @table_name || self.to_s.tableize
  end


  def self.all
    data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table_name}
      SQL
    self.parse_all(data[1..-1])

  end

  def self.single_instance(data)
    self.parse_all(data[1..1]).first
  end

  def self.parse_all(results)
    instances = results.map do |instance|
      self.new(instance)
    end
    instances
  end

  def self.find(id)
    instance = DBConnection.execute2(<<-SQL, id)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        id = ?
    SQL

    self.single_instance(instance)
  end

  def initialize(params = {})
    cols ||= self.class.columns
    params.each do |name, val|
      raise "unknown attribute \'#{name}\'" unless cols.include?(name.to_sym)
      self.send("#{name}=".to_sym, val)
    end
  end

  def self.col_names
    cols = @columns.dup
    cols.delete(:id)
    cols.join(', ')
  end

  def attribute_values
    attributes = []
    @attributes.each {|_, v| attributes << v if v}
    attributes
  end


  def q_marks
    (["?"] * (self.class.columns.length-1)).join(", ")
  end

  def value_pairs
    pairs = []
    @attributes.each do |attrib, val|
      pairs << ["#{attrib} = '#{val}'"] unless attrib == :id
    end
    pairs.join(", ")
  end

  def insert
    DBConnection.execute2(<<-SQL, attribute_values)
    INSERT INTO
      #{self.class.table_name} (#{self.class.col_names})
    VALUES
      (#{q_marks})

    SQL
    self.id = DBConnection.instance.last_insert_row_id
  end

  def update
    puts value_pairs
    DBConnection.execute2(<<-SQL, self.id)

    UPDATE
      #{self.class.table_name}
    SET
      #{value_pairs}
    WHERE
      ?

    SQL
  end

  def save
    if self.id
      update
    else
      insert
    end
  end

end
