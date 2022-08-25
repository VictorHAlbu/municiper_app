module Utils::Filter
  extend ActiveSupport::Concern

  included do

    scope :search, -> (params, value) do
      unless value.blank?
        query = []
        params.each do |k|
          query.push(query_builder(k,value))
        end
        return self.where(query.to_sentence(words_connector: 'or ', two_words_connector: 'or ', last_word_connector: 'or '))
      end
    end

  end

  module ClassMethods
    def query_builder(k,value)
      if ActiveRecord::Base.connection.adapter_name == "PostgreSQL"
        return "unaccent(#{k.to_s}::text) ilike unaccent('%#{value}%')"
      else
        return "#{k.to_s} like '%#{value}%'"
      end
    end
  end
  
end
