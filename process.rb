# 自販機プログラム処理の実行の１例
# 以下をirbで実行

# 自販機クラスをインスタンス化
vm = VendingMachine.new
# 自販機にコーラ、レッドブル、水のドリンクテーブルを投入
vm.add_drink_table(drink = Drink.new("コーラ"))
vm.add_drink_table(drink = Drink.new("レッドブル"))
vm.add_drink_table(drink = Drink.new("水"))
# 自販機にコーラ、レッドブル、水の在庫を5個ずつ投入
vm.put_drinks(drink_name = "コーラ", number = DeliveryDrink.new(5))
vm.put_drinks(drink_name = "レッドブル", number = DeliveryDrink.new(5))
vm.put_drinks(drink_name = "水", number = DeliveryDrink.new(5))
# お金クラスから1000円と言う概念を作り出す
en_1000 = Money.new(1000)
# 1000円を投入
vm.slot_money(en_1000)

# ここからドリンク購入可能

# １回目

# 現在の投入金額
puts "投入されているお金#{vm.current_slot_money}"
# 現在販売可能なドリンク
vm.drinks_available
# ドリンクを購入
vm.buy_drinks
# お金を返却
vm.return_money

# 2回目

# お金クラスから500円と言う概念を作り出す
en_500 = Money.new(500)
# 500円を投入
vm.slot_money(en_500)
# 投入されているお金
vm.current_slot_money
# ドリンクを購入
vm.buy_drinks
# お金を返却
vm.return_money
# 現在の売り上げを計算
vm.current_sales_amount