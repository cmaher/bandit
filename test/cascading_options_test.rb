require File.join File.dirname(__FILE__), 'helper'

class CascadingOptionsTest < Test::Unit::TestCase
  include SetupHelper

  def setup
    @default = 1

    config = Bandit.config
    config.storage = "memory"
    config.player_config = { option: 2 }
    @player_config = config.player_config

    @player = Bandit::BasePlayer.get_player(:round_robin, @player_config)

    options = { option: 3 }
    @exp = mock('experiment')
    @exp.stubs(:options).returns(options)
  end

  def get_option
    @player.send(:get_option, @exp, :option, @default).to_i
  end

  def test_default_option
    @player_config[:option] = nil
    @exp.options[:option] = nil
    assert_equal(get_option, @default)
  end

  def test_config_option
    @exp.options[:option] = nil
    assert_equal(get_option, @player_config[:option])
  end

  def test_experiment_option
    assert_equal(get_option, @exp.options[:option])
  end
end
