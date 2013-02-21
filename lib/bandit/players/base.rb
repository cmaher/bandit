module Bandit
  class BasePlayer
    def self.get_player(name, config)
      config ||= {}

      case name 
      when :round_robin then RoundRobinPlayer.new(config)
      when :epsilon_greedy then EpsilonGreedyPlayer.new(config)
      when :softmax then SoftmaxPlayer.new(config)
      when :ucb then UcbPlayer.new(config)
      else raise UnknownPlayerEngineError, "#{name} not a known player type"
      end
    end

    def initialize(config)
      @config = config
      @storage = Bandit.storage
    end
    
    def choose_alternative(experiment)
      # return the alternative that should be chosen
      raise NotImplementedError
    end

    # store state variable by name
    def set(name, value)
      @storage.player_state_set(self, name, value)
    end

    # get state variable by name
    def get(name)
      @storage.player_state_get(self, name)
    end

    def name
      self.class.to_s
    end

    private 

    def get_option(exp, name, default)
      return exp.options[name] unless exp.options[name].nil?
      return @config[name] unless @config[name].nil?
      return default
    end
  end
end
