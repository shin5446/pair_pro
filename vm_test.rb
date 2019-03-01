class VendingMachine
    # ステップ０　お金の投入と払い戻しの例コード
    # ステップ１　扱えないお金の例コード
  
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    # Money
    MONEY = [10, 50, 100, 500, 1000].freeze
    # ステップ２ ジュースの管理
    DRINKS = [{name:'cola',price:120,stock:0},
              {name:'redbull',price:200,stock:0},
              {name:'water',price:100,stock:0}
              ]
  
    # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
    def initialize
      # 最初の自動販売機に入っている金額は0円
      @slot_money = 0
      @sales_amount = 0
      @drink_menu = []
    end
  
    # 投入金額の総計を取得できる。
    def current_slot_money
      # 自動販売機に入っているお金を表示する
      @slot_money
    end
  
    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    # 投入は複数回できる。
    # Money
    def slot_money(money)
      # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
      # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
      return false unless MONEY.include?(money.throw_into)
      # 自動販売機にお金を入れる
      @slot_money += money.throw_into
    end
  
    # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
    # Money
    def return_money
      # 返すお金の金額を表示する
      puts @slot_money
      # 自動販売機に入っているお金を0円に戻す
      @slot_money = 0
  
    end
  
    def put_drinks(drink = 0, number = DeliveryDrink.new(1))
      DRINKS[drink][:stock] += number.deliver_drinks
    end
  
    def drinks_available
      DRINKS.each do |drink|
        a = drink[:price]
        b = drink[:stock]
        c = drink[:name]
        if @slot_money >= a && b >= 1
          puts "#{c},#{a}円 発売中"
        else
          puts "#{c}準備中"
        end
      end
    end
  
    def buy_drinks
      puts "番号を選んでください"
      puts "0.コーラ　1.レッドブル　2.水"
      a = gets.to_i
      b = DRINKS[a][:price]
      c = DRINKS[a][:stock]
  
      if  @slot_money >= b && c >= 1
          puts  @sales_amount += b
          DRINKS[a][:stock] = c - 1
          puts "お釣り#{@slot_money -= b}"
      end
    end
end

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

class Owner
    WHOLESALE_DRINKS = [{name:'cola',price:60},
                        {name:'redbull',price:100},
                        {name:'water',price:50}
                        ]
    def purchase_drinks
    end
end

class Drink

    DRINKS = [{name:'cola',price:120,stock:0},
              {name:'redbull',price:200,stock:0},
              {name:'water',price:100,stock:0}
              ]

    def initialize(drink)
        # case drink
        # when DRINKS[0]
        #  @cola = DRINKS[0]
        # when drink
        #  @redbull = DRINKS[1]
        # when DRINKS[2]
        #  @water =DRINKS[2]
        # else
        #  raise
        # end

        if drink == DRINKS[0]
            @cola = DRINKS[0]
            elsif drink == DRINKS[1]
            @redbull = DRINKS[1]
            elsif drink == DRINKS[2]
            @water =DRINKS[2]
            else
            raise
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