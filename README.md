# Hotwater v0.1.2

[![build status](https://secure.travis-ci.org/colinsurprenant/hotwater.png)](http://travis-ci.org/colinsurprenant/hotwater)

Ruby & JRuby gem with fast **string edit distance** algorithms C implementations with FFI bindings.

### Algorithms

- [Levenshtein](https://en.wikipedia.org/wiki/Levenshtein_distance) & [Damerau Levenshtein](https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance) distance
- [Jaro & Jaro-Winkler](https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance) distance
- [N-Gram](https://en.wikipedia.org/wiki/N-gram) distance

## Installation

Tested on **OSX 10.8.2** and **Linux 12.10** with
- MRI Ruby 1.9.3 p385
- JRuby 1.7.2 (1.9.3 p327)

Add this line to your application's Gemfile:
```ruby
gem 'hotwater'
```
And then execute:
```sh
$ bundle
```
Or install it yourself as:
```sh
$ gem install hotwater
```

## Usage

```ruby
Hotwater.levenshtein_distance("abc", "acb") # => 2
Hotwater.damerau_levenshtein_distance("abc", "acb") # => 1

# normalization based on the string sizes
# where an edit on a small string has more weight than on a longer string
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

## Why?

Why Hotwater? as stated in the credits section, some of the C code comes from the [jellyfish Python project](https://github.com/sunlightlabs/jellyfish). Jelly fish made me think right away about New Brunswick beaches where I have been a couple of times in the past years. There is this legend about New Brunswick having warm water beaches. I even saw a tourism promotion TV commercial selling NB has having warm water. This is a lie! :P I never experienced warm water (in the generaly accepted definition) in NB, only lots of jellyfish :D (that being said, I have enjoyed every bit of my visits in New Brunswick and I really do not care about warm water really ;)

## Author

Colin Surprenant, [@colinsurprenant](http://twitter.com/colinsurprenant), [http://github.com/colinsurprenant](http://github.com/colinsurprenant), colin.surprenant@gmail.com

## License

Hotwater is distributed under the Apache License, Version 2.0. 

