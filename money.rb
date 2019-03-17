class Money
    POSSIBLE_MONEY = [1, 5, 10, 50, 100, 500, 1000, 5000, 10000].freeze

      def initialize(money)
        @attribute = money
        raise unless POSSIBLE_MONEY.include?(money)
      end

      def throw_into
        @attribute
      end
  end