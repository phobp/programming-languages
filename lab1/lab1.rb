#Brendan Pho
puts "Hello world"
x = -5
if x < 0
    puts "negative"
else
    puts "positive"
end

i = 10
while i != 0
    puts i if i.even?
    i -= 1
end
r = rand(100)
case 
when r.even?
    print r, " is even\n"
when r < 10
    print r, " is small\n"
else
    print r, " is big and odd\n"
end
puts self, self.class
$array = Array.new
def genArray(n=10) 
    return $array if n < 1
    return $array[0,0] = genArray(n-1)
end
print genArray(10), "\n"
