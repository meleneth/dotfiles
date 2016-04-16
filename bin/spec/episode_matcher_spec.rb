require 'spec_helper'
require 'episode_matcher'

describe "episode_guess" do
  it "works for false case" do
    guess = episode_match("no_numbers_here")
    expect(guess).to be false
  end
end
