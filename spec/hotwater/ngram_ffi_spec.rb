require 'rspec'
require 'hotwater'

describe Hotwater do

  it "should compute unigram distance" do
    Hotwater.ngram_distance("", "al", 1).round(4).should == 0.0
    Hotwater.ngram_distance("al", "al", 1).round(4).should == 1.0
    Hotwater.ngram_distance("a", "a", 1).round(4).should == 1.0
    Hotwater.ngram_distance("b", "a", 1).round(4).should == 0.0
    Hotwater.ngram_distance("martha", "marhta", 1).round(4).should == 0.6667
    Hotwater.ngram_distance("jones", "johnson", 1).round(4).should == 0.4286
    Hotwater.ngram_distance("natural", "contrary", 1).round(4).should == 0.25
    Hotwater.ngram_distance("abcvwxyz", "cabvwxyz", 1).round(4).should == 0.75
    Hotwater.ngram_distance("dwayne", "duane", 1).round(4).should == 0.6667
    Hotwater.ngram_distance("dixon", "dicksonx", 1).round(4).should == 0.5
    Hotwater.ngram_distance("six", "ten", 1).round(4).should == 0.0
    Hotwater.ngram_distance("zac ephron", "zac efron", 1).round(4).should == Hotwater.ngram_distance("zac ephron", "kai ephron", 1).round(4)
    Hotwater.ngram_distance("brittney spears", "britney spears", 1).round(4).should > Hotwater.ngram_distance("brittney spears", "brittney startzman", 1)
    Hotwater.ngram_distance("12345678", "12890678", 1).round(4).should == Hotwater.ngram_distance("12345678", "72385698", 1)
  end

  it "should compute bigram distance" do
    Hotwater.ngram_distance("", "al", 2).round(4).should == 0.0
    Hotwater.ngram_distance("al", "al", 2).round(4).should == 1.0
    Hotwater.ngram_distance("a", "a", 2).round(4).should == 1.0
    Hotwater.ngram_distance("b", "a", 2).round(4).should == 0.0
    Hotwater.ngram_distance("a", "aa", 2).round(4).should == 0.5
    Hotwater.ngram_distance("martha", "marhta", 2).round(4).should == 0.6667
    Hotwater.ngram_distance("jones", "johnson", 2).round(4).should == 0.4286
    Hotwater.ngram_distance("natural", "contrary", 2).round(4).should == 0.25
    Hotwater.ngram_distance("abcvwxyz", "cabvwxyz", 2).round(4).should == 0.625
    Hotwater.ngram_distance("dwayne", "duane", 2).round(4).should == 0.5833
    Hotwater.ngram_distance("dixon", "dicksonx", 2).round(4).should == 0.5
    Hotwater.ngram_distance("six", "ten", 2).round(4).should == 0.0
    Hotwater.ngram_distance("zac ephron", "zac efron", 2).round(4).should > Hotwater.ngram_distance("zac ephron", "kai ephron", 2).round(4)
    Hotwater.ngram_distance("brittney spears", "britney spears", 2).round(4).should > Hotwater.ngram_distance("brittney spears", "brittney startzman", 2)
    Hotwater.ngram_distance("0012345678", "0012890678", 2).round(4).should == Hotwater.ngram_distance("0012345678", "0072385698", 2)
  end

  it "should compute bigram distance by default" do
    Hotwater.ngram_distance("", "al").round(4).should == 0.0
    Hotwater.ngram_distance("al", "al").round(4).should == 1.0
    Hotwater.ngram_distance("a", "a").round(4).should == 1.0
    Hotwater.ngram_distance("b", "a").round(4).should == 0.0
    Hotwater.ngram_distance("a", "aa").round(4).should == 0.5
    Hotwater.ngram_distance("martha", "marhta").round(4).should == 0.6667
    Hotwater.ngram_distance("jones", "johnson").round(4).should == 0.4286
    Hotwater.ngram_distance("natural", "contrary").round(4).should == 0.25
    Hotwater.ngram_distance("abcvwxyz", "cabvwxyz").round(4).should == 0.625
    Hotwater.ngram_distance("dwayne", "duane").round(4).should == 0.5833
    Hotwater.ngram_distance("dixon", "dicksonx").round(4).should == 0.5
    Hotwater.ngram_distance("six", "ten").round(4).should == 0.0
    Hotwater.ngram_distance("zac ephron", "zac efron").round(4).should > Hotwater.ngram_distance("zac ephron", "kai ephron").round(4)
    Hotwater.ngram_distance("brittney spears", "britney spears").round(4).should > Hotwater.ngram_distance("brittney spears", "brittney startzman")
    Hotwater.ngram_distance("0012345678", "0012890678").round(4).should == Hotwater.ngram_distance("0012345678", "0072385698")
  end

  it "should compute trigram distance" do
    Hotwater.ngram_distance("", "al", 3).round(4).should == 0.0
    Hotwater.ngram_distance("al", "al", 3).round(4).should == 1.0
    Hotwater.ngram_distance("a", "a", 3).round(4).should == 1.0
    Hotwater.ngram_distance("b", "a", 3).round(4).should == 0.0
    Hotwater.ngram_distance("martha", "marhta", 3).round(4).should == 0.7222
    Hotwater.ngram_distance("jones", "johnson", 3).round(4).should == 0.4762
    Hotwater.ngram_distance("natural", "contrary", 3).round(4).should == 0.2083
    Hotwater.ngram_distance("abcvwxyz", "cabvwxyz", 3).round(4).should == 0.5625
    Hotwater.ngram_distance("dwayne", "duane", 3).round(4).should == 0.5278
    Hotwater.ngram_distance("dixon", "dicksonx", 3).round(4).should == 0.4583
    Hotwater.ngram_distance("six", "ten", 3).round(4).should == 0.0
    Hotwater.ngram_distance("zac ephron", "zac efron", 3).round(4).should > Hotwater.ngram_distance("zac ephron", "kai ephron", 3).round(4)
    Hotwater.ngram_distance("brittney spears", "britney spears", 3).round(4).should > Hotwater.ngram_distance("brittney spears", "brittney startzman", 3)
    Hotwater.ngram_distance("0012345678", "0012890678", 3).round(4).should < Hotwater.ngram_distance("0012345678", "0072385698", 3)
  end
end
