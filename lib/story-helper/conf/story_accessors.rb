# Defines a basic cached accessor
def meta_accessor(accessor, klass, find_by_field="name", field_value=accessor)
  src = <<-RUBY
    def #{accessor}(reload=false)
      return @#{accessor} if @#{accessor} && !reload
      @#{accessor} = #{klass.to_s}.find_by_#{find_by_field}("#{field_value}")
    end
  RUBY
  class_eval src, __FILE__, __LINE__
end

# Generalized accessor functor
def scoped_meta_accessor(model_str, key, value, scoped_type, scoped_type_id, default_accessor_str)
  scoped_field = "#{scoped_type}_id"
  src = <<-RUBY
    def #{key}(#{scoped_type}=#{default_accessor_str}, reload=false)
      key = "@#{key}_" + #{scoped_type}.#{scoped_type_id}.to_s.gsub(' ', '_')
      if reload || !instance_variable_defined?(key.to_sym)
        instance_variable_set(key.to_sym, #{model_str}.find_by_name_and_#{scoped_field}(%q(#{value}), #{scoped_type}.id))
      end
      instance_variable_get(key.to_sym)
    end
  RUBY
  class_eval src, __FILE__, __LINE__
end

module StoryAccessors
  
  module Methods

    ####### Accounts #######
    # %w(amy sarah joanne julia erin).each do |acct|
    #   meta_accessor(acct.to_s, Account, "login")
    # end
    
  end
  
end
