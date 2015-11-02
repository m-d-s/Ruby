a = (1..16).to_a
i = 0;
a.each do |elem|
    p a[i,4] if i %4 == 0 
    i = i + 1
end

