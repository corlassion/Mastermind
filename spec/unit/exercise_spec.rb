# frozen_string_literal: true

require_relative "../spec_helper"
require_relative '../../lib/mastermind_corlassion/main_runner'

RSpec.describe do
  it "test_the_first_verse" do
    MastermindCorlassion::MainRunner.new
    expect("cool").to eq("neat")
  end
end


