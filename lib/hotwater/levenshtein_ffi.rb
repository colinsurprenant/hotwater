require 'ffi'

module Hotwater
	
  module C
    # int levenshtein_distance(const char *str1, const char *str2);
    attach_function :levenshtein_distance, [:string, :string], :int
  end

  def levenshtein_distance(s1, s2)
    result = C::levenshtein_distance(s1, s2)
    raise("memory allocation error") if result == -1
    result
  end

  def normalized_levenshtein_distance(s1, s2)
    result = C::levenshtein_distance(s1, s2)
    raise("memory allocation error") if result == -1
    return 0.0 if result == 0
    max = [s1.size, s2.size].max
    (max - result.to_f) / max
  end

  module_function :levenshtein_distance, :normalized_levenshtein_distance
end