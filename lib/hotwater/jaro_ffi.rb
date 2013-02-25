require 'ffi'

module Hotwater
  
  module C
    # double jaro_distance(const char *ying, const char *yang)
    attach_function :jaro_distance, [:string, :string], :double

    # double jaro_winkler_distance(const char *ying, const char *yang, bool long_tolerance)
    attach_function :jaro_winkler_distance, [:string, :string, :bool], :double
  end

  # compute Jaro edit distance between 2 strings
  # @param s1 [String] first string
  # @param s2 [String] seconds string
  # @return [Float] edit distance between 0.0 and 1.0
  def jaro_distance(s1, s2)
    result = C::jaro_distance(s1, s2)
    raise("memory allocation error") if result < 0.0
    result
  end

  # compute Jaro-Winkler edit distance between 2 strings
  #
  # setting `long_tolerance = true` increases the probability of a match when the number
  # of matched characters is large.  This option allows for a little more
  # tolerance when the strings are large.  It is not an appropriate
  # test when comparing fixed length fields such as phone and social security numbers.
  #
  # @param s1 [String] first string
  # @param s2 [String] seconds string
  # @param long_tolerance [Boolean] add more tolerance when the strings are large. Default `false`
  # @return [Float] edit distance between 0.0 and 1.0
  def jaro_winkler_distance(s1, s2, long_tolerance = false)
    result = C::jaro_winkler_distance(s1, s2, long_tolerance)
    raise("memory allocation error") if result < 0.0
    result
  end

  module_function :jaro_distance, :jaro_winkler_distance
end