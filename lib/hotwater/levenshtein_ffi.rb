require 'ffi'

module Hotwater
	
  module C
    # int levenshtein_distance(const char *str1, const char *str2);
    attach_function :levenshtein_distance, [:string, :string], :int
  end

  # compute Levenshtein edit distance between 2 strings
  # @param s1 [String] first string
  # @param s2 [String] seconds string
  # @return [Integer] edit distance
  def levenshtein_distance(s1, s2)
    result = C::levenshtein_distance(s1, s2)
    raise("memory allocation error") if result == -1
    result
  end

  # compute normalized Levenshtein edit distance between 2 strings
  # normalization weight the edit distance using the string lengths where 
  # an edit on a small string has more impact than on a longer string
  # @param s1 [String] first string
  # @param s2 [String] seconds string
  # @return [Float] edit distance between 0.0 and 1.0
  def normalized_levenshtein_distance(s1, s2)
    result = C::levenshtein_distance(s1, s2)
    raise("memory allocation error") if result == -1
    return 0.0 if result == 0.0
    max = [s1.size, s2.size].max
    (max - result.to_f) / max
  end

  module_function :levenshtein_distance, :normalized_levenshtein_distance
end