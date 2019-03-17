class Drink

    DRINKS = [{name:'コーラ',price:120,stock:0},
              {name:'レッドブル',price:200,stock:0},
              {name:'水',price:100,stock:0}
              ]
    MENU = ["コーラ", "レッドブル", "水"]

    def initialize(drink)

      raise unless MENU.include?(drink)

        if drink == "コーラ"
            @cola = DRINKS[0]
            elsif drink == "レッドブル"
            @redbull = DRINKS[1]
            elsif drink == "水"
            @water =DRINKS[2]
        end
    end

    def cola
      @cola
    end

    def redbull
      @redbull
    end

    def water
      @water
    end

end

class DeliveryDrink

    DELIVERY_NUMBERS = [1, 5, 10, 50, 100]

    def initialize(number)
      @attribute = number
      raise unless DELIVERY_NUMBERS.include?(number)
    end

    def deliver_drinks
      @attribute
    end
end