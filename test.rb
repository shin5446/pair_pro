# [ "a", "b", "c", "d"]という配列を[ ["a"], ["b"], ["c"], ["d"] ]という配列に変換するコード
# [1,2,3,4,5]を120に変換(すべてかけ合わせる)するコード
# [:a, :b, :c]を[ { a: 1 }, { b: 2 }, { c: 3 } ]に変換する

# A = [ "a", "b", "c", "d"]
# p A.map { |n| [n] }
# p A.map.each_slice(1).to_a

# A = [1,2,3,4,5]
# p times = A.inject{|result,n| result*n}

# A = [:a, :b, :c]

#  p A.each_with_index.map {|n,i| {"#{n}": i+1}}

product = {:lemon=>145, :aplle=>180, :orange=>170, :tomato=>120, :grape=>140}
new_item = { peach: 160 }

# と言う二つの変数を使って、以下の出力結果を得てください

# 出力結果１
# => [:lemon, :aplle, :orange, :tomato, :grape]
p product.keys
# 出力結果２
# => {:lemon=>145, :aplle=>180, :orange=>170, :tomato=>120, :grape=>140, :peach=>160}
p product.merge(new_item)
# 出力結果３
# => {:aplle=>180, :orange=>170}
p product.select {|k,v| v >= new_item.values[0]}
