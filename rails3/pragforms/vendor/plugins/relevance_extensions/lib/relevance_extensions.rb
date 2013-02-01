#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
# RelevanceExtensions
module ActiveRecord
  module Validations
    module ClassMethods
       def validates_as_credit_card(*attr_names)
            configuration = { :message => "must be a valid credit card number.", :on => :save, :with => nil }
            configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)

            validates_each(attr_names, configuration) do |record, attr_name, value|
              if(value != nil)
                record.errors.add(attr_name, configuration[:message]) unless value.creditcard? && value.creditcard_type == record.send(configuration[:card_type])
              end
            end
        end
        
        def validates_not_blacklist(*attr_names)
          configuration = { :message => 'not a valid value.', :on => :save, :with => nil }
          configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
          
          validates_each(attr_names, configuration) do |record, attr_name, value|
            if(value != nil)
              record.errors.add(attr_name, configuration[:message]) unless !in_blacklist?(value)
            end
          end
        end
    end
  end
  
  class Base
    def to_csv(options = {:include_header => true, :only_header => false})
       options[:except]    = Array(options[:except]) << self.class.inheritance_column unless options[:only] # skip type column
       only_or_except = { :only => options[:only], :except => options[:except] }

       attributes_for_csv = attributes(only_or_except)
       results = ""
       results += '"' + attributes_for_csv.keys.join('","') + '"' + "\n" if(options[:include_header] || options[:only_header])
       return results if(options[:only_header])
       results += '"' + attributes_for_csv.values.join('","') + '"'
       return results
    end
    def streamlined_name(options = nil)
      if options
        options.map {|x| self.send(x)}.join('--')
      else
        return self.name if self.respond_to?('name')
        return self.title if self.respond_to?('title')
        return self.id
      end

    end
  end
end

module ActiveSupport #:nodoc:
  module CoreExtensions #:nodoc:
    module Array #:nodoc:
      module Conversions
        def to_csv(options = {:include_header => true, :only_header => false})
          results = ""
          if(options[:include_header])
            options[:only_header] = true
            results += self[0].to_csv(options) 
          end
          options[:only_header] = false
          options[:include_header] = false
          self.each do |record|
            results += record.to_csv(options) + "\n"
          end
          return results
        end
      end
    end
  end
end

