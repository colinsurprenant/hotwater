require 'hotwater/version'
require 'ffi'
require 'ffi-compiler/loader'

module Hotwater
  module C
    extend FFI::Library
    ffi_lib FFI::Compiler::Loader.find('hotwater')
  end
end

require 'hotwater/levenshtein_ffi'
require 'hotwater/damerau_levenshtein_ffi'
require 'hotwater/jaro_ffi'
require 'hotwater/ngram_ffi'

