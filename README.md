# Hotwater v0.1.0

Ruby & JRuby gem with fast **string edit distance** C implementations using FFI bindings.

### Algorithms

- Levenshtein & Damerau Levenshtein
- Jaro & Jaro Winkler
- N-Gram

## Installation

Add this line to your application's Gemfile:

    gem 'hotwater'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hotwater

## Usage

```ruby
Hotwater.levenshtein_distance("abc", "acb") # => 2
Hotwater.damerau_levenshtein_distance("abc", "acb") # => 1

# do normalization based on the string sizes
Hotwater.normalized_levenshtein_distance("abc", "acb").round(4) # => 0.3333
Hotwater.normalized_damerau_levenshtein_distance("abc", "acb").round(4) # => 0.6667

Hotwater.jaro_distance("martha", "marhta").round(4) # => 0.9444
Hotwater.jaro_winkler_distance("martha", "marhta").round(4) # => 0.9611

# default is bigram
Hotwater.ngram_distance("natural", "contrary").round(4) # => 0.25

# specify trigram
Hotwater.ngram_distance("natural", "contrary", 3).round(4) # => 0.2083
```

## Developement

1. Fort it
2. Install gems `$ bundle install`
3. Compile lib `$ rake compile`
4. Run specs `$ rake spec`
5. Clean compiler generated files `$ rake clean`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Credits
- Some C code from the https://github.com/sunlightlabs/jellyfish project
- N-Gram ported from Apache Lucene 4.0.0 NGramDistance.java 

## Author
Colin Surprenant, [@colinsurprenant](http://twitter.com/colinsurprenant), [http://github.com/colinsurprenant](http://github.com/colinsurprenant), colin.surprenant@gmail.com

## License
Hotwater is distributed under the Apache License, Version 2.0. 

