require_relative '02_searchable'
require 'active_support/inflector'
# require "byebug"
# Phase IIIa

class AssocOptions
  attr_accessor(
    :foreign_key,
    :class_name,
    :primary_key
  )


  def model_class
    class_name.constantize
  end

  def table_name
    model_class.table_name
  end
end

class BelongsToOptions < AssocOptions
  def initialize(name, options = {})
    puts "****************"
    puts "#{name}"
    puts "****************"
    defaults = {
      foreign_key: ("#{name}_id").to_sym,
      primary_key: :id,
      class_name: name.singularize.camelcase
    }

    options.each {|k, v| defaults[k] = v }

    @foreign_key = defaults[:foreign_key]
    @class_name = defaults[:class_name]
    @primary_key = defaults[:primary_key]
    Associatable.set_assoc(name.to_sym, self)
  end
end

class HasManyOptions < AssocOptions
  def initialize(name, self_class_name, options = {})

    defaults = {
      foreign_key: ("#{self_class_name.downcase}_id").to_sym,
      primary_key: :id,
      class_name: name.singularize.camelcase
    }

    options.each {|k,v| defaults[k] = v }

    @foreign_key = defaults[:foreign_key]
    @class_name = defaults[:class_name]
    @primary_key = defaults[:primary_key]
  end
end

module Associatable
  # Phase IIIb
  attr_accessor :assoc_options
  def belongs_to(name, options = {})
    opts = BelongsToOptions.new(name.to_s, options)
    define_method(name) do
      foreign_key = self.send(opts.foreign_key)
      target_class = opts.model_class
      primary_key = opts.primary_key
      target_class.where({primary_key => foreign_key}).first
    end
  end

  def has_many(name, options = {})
    define_method(name) do
      own_class = self.class.to_s
      opts = HasManyOptions.new(name.to_s, own_class, options)
      foreign_key = opts.foreign_key
      target_class = opts.model_class
      primary_key = self.send(opts.primary_key)
      target_class.where({foreign_key => primary_key})
    end
  end

  def assoc_options
    @@assoc_options ||= {}
    puts @assoc_options
  end

  def self.set_assoc(k,v)
    @@assoc_options = {}
    @@assoc_options[k] = v
  end
end

class SQLObject
  extend Associatable
end

# options = BelongsToOptions.new('owner',
#                                foreign_key: :human_id,
#                                class_name: 'Human',
#                                primary_key: :human_id
# )


# define_method(name) do
#   opts = BelongsToOptions.new(name.to_s, options)
#   foreign_key = self.send(opts.foreign_key)
#   target_class = opts.class_name.to_s.constantize
#   data = DBConnection.execute2(<<-SQL)
#     SELECT
#       *
#     FROM
#       #{self.class.table_name}
#     WHERE
#       #{opts.primary_key} = #{foreign_key}
#     SQL
#   target_class.parse_all(data[1..-1])
# end
