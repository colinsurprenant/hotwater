require 'ffi'

module Hotwater
  
  module C
    # double jaro_distance(const char *ying, const char *yang)
    attach_function :jaro_distance, [:string, :string], :double

    # double jaro_winkler_distance(const char *ying, const char *yang, bool long_tolerance)
    attach_function :jaro_winkler_distance, [:string, :string, :bool], :double
  end

  def jaro_distance(s1, s2)
    result = C::jaro_distance(s1, s2)
    raise("memory allocation error") if result < 0.0
    result
  end

  def jaro_winkler_distance(s1, s2, long_tolerance = false)
    result = C::jaro_winkler_distance(s1, s2, long_tolerance)
    raise("memory allocation error") if result < 0.0
    result
  end

  module_function :jaro_distance, :jaro_winkler_distance
end