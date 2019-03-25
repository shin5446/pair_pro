require './drink'
require './money'

class VendingMachine

    # 使用可能なお金
    MONEY = [10, 50, 100, 500, 1000].freeze
    # 空のドリンクテーブル。ここにドリンクの情報を追加していく。
    DRINKS_TABLE = []

    # newした時の投入金額と売上金額を0とする
    def initialize
      @slot_money = 0
      @sales_amount = 0
    end

    # 現在の投入金額を確認できる
    def current_slot_money
      @slot_money
    end
    # 現在の投入金額を確認できる
    def current_sales_amount
      @sales_amount
    end

    #お金の投入ができる
    def slot_money(money)
      return false unless MONEY.include?(money.throw_into)
      @slot_money += money.throw_into
    end

    # 払い戻しができる
    def return_money
      puts @slot_money
      @slot_money = 0

    end

    # 定数DRINKS_TABLEにドリンクの情報を追加できる
    def add_drink_table(drink = Drink.new("コーラ"))
      if drink.cola
        DRINKS_TABLE << drink.cola
      elsif drink.redbull
        DRINKS_TABLE << drink.redbull
      elsif drink.water
        DRINKS_TABLE << drink.water
      else
        puts "そのようなドリンクは取り扱っていません。"
      end
    end

    # 各ドリンクに在庫を追加できる
    def put_drinks(drink_name = "コーラ", number = DeliveryDrink.new(5))
      DRINKS_TABLE.each_with_index do |drink,i|
        if drink[:name] == drink_name
          DRINKS_TABLE[i][:stock] += number.deliver_drinks
        end
      end
    end

    # 購入可能なドリンクを確認できる
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

    # ドリンクを買うことができる
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