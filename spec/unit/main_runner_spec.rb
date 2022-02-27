# frozen_string_literal: true

require_relative "../spec_helper"
require_relative '../../lib/mastermind_corlassion/main_runner'

RSpec.describe "MainRunner" do

  let(:main_runner){MastermindCorlassion::MainRunner.new}



  it "code is all 1s" do
    guess = [1,1,2,2]
    code = [1,1,1,1]
    feedback = main_runner.feedback_logic(guess, code)
    expect(feedback).to eq([2,0])
  end

end
