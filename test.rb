# [ "a", "b", "c", "d"]という配列を[ ["a"], ["b"], ["c"], ["d"] ]という配列に変換するコード
# [1,2,3,4,5]を120に変換(すべてかけ合わせる)するコード
# [:a, :b, :c]を[ { a: 1 }, { b: 2 }, { c: 3 } ]に変換する

# A = [ "a", "b", "c", "d"]
# p A.map { |n| [n] }
# p A.map.each_slice(1).to_a

# A = [1,2,3,4,5]
# p times = A.inject{|result,n| result*n}

A = [:a, :b, :c]

 p A.each_with_index.map {|n,i| {"#{n}": i+1}}
