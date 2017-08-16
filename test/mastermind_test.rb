require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'
require 'pry'


class MasterMindTest < MiniTest::Test

  def test_does_it_exist?
    mastermind = MasterMind.new

    assert_instance_of MasterMind, mastermind
  end

  def test_does_welcome_message_print
    mastermind = MasterMind.new

    expected = "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    assert_equal expected, mastermind.welcome_message
  end

  def test_has_answer
    mastermind = MasterMind.new

    assert_equal 4, mastermind.answer.length
  end


end
