class AttrAccessorObject
  def self.my_attr_accessor(*names)
    instance_vars = names.map {|attrib| "@#{attrib}".to_sym}
    instance_vars.each_with_index do |attrib, idx|
      define_method(names[idx]){instance_variable_get(attrib)}
      define_method("#{names[idx]}="){|val|instance_variable_set(attrib, val)}
    end
  end
end
