require 'ffi'

module Hotwater
  
  module C
    # double ngram_distance(const char str1*, const char str2*, int n, int mode);
    attach_function :ngram_distance, [:string, :string, :int], :double
  end

  # compute N-Gram distance between 2 strings
  # @param s1 [String] first string
  # @param s2 [String] seconds string
  # @param n [Integer] number of characters per gram, default is 2
  # @return [Float] edit distance between 0.0 and 1.0
  def ngram_distance(s1, s2, n = 2)
    result = C::ngram_distance(s1, s2, n)
    raise("memory allocation error") if result == -1
    result
  end

  module_function :ngram_distance

end