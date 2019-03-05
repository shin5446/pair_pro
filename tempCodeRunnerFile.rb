def add_drink_table(drink)
      if drink == Drink.new("コーラ")
        DRINKS_TABLE << drink.cola
      elsif drink == Drink.new("レッドブル")
        DRINKS_TABLE << drink.redbull
      elsif drink == Drink.new("水")
        DRINKS_TABLE << drink.water
      else
        puts "ダメです"
      end
    end

    add_drink_table(Drink.new("レッドブル"))