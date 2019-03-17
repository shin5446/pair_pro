require './drink'
require './money'

class VendingMachine

    # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
    MONEY = [10, 50, 100, 500, 1000].freeze
    DRINKS_TABLE = []


    # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
    def initialize
      # 最初の自動販売機に入っている金額は0円
      @slot_money = 0
      @sales_amount = 0
    end

    # 投入金額の総計を取得できる。
    def current_slot_money
      # 自動販売機に入っているお金を表示する
      @slot_money
    end

    def current_sales_amount
      @sales_amount
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

    def add_drink_table(drink = Drink.new("コーラ"))
      if drink.cola
        DRINKS_TABLE << drink.cola
      elsif drink.redbull
        DRINKS_TABLE << drink.redbull
      elsif drink.water
        DRINKS_TABLE << drink.water
      else
        puts "ダメです"
      end
    end

    def put_drinks(drink = 0, number = DeliveryDrink.new(1))
      DRINKS_TABLE[drink][:stock] += number.deliver_drinks
    end

    def drinks_available
      DRINKS_TABLE.each do |drink|
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
      DRINKS_TABLE.each_with_index do |drink,i|
        name = drink[:name]
        puts "#{i}.#{name}"
      end

      a = gets.to_i
      b = DRINKS_TABLE[a][:price]
      c = DRINKS_TABLE[a][:stock]

      if  @slot_money >= b && c >= 1
          puts  @sales_amount += b
          DRINKS_TABLE[a][:stock] = c - 1
          puts "投入されているお金#{@slot_money -= b}"
      end
    end
end