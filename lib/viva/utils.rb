module Viva
  module Utils
    def self.normalize_keys(hash)
      out = {}
      hash.each do |key, value|
        out[key.downcase.to_sym] = value
      end
      out
    end
  end
end