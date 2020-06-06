puts "Hello World!\n";
print "Hello World 2\n";
print 1;
puts "\n";

print <<EOF
Hi World
My name is Ruby!
EOF

# This is a comment

## Classes and OOP
puts "\n\n--Classes--"

class HelloWorld
    def initialize(name)
        @name = name
        
        puts "Hello " + @name
        puts "How are you?"
        
    end

    def calculator(operator, num1, num2)
        if operator == "+"
            return num1 + num2
        elsif operator == "-"
            return num1 - num2
        elsif operator == "x"
            return num1 * num2
        elsif operator == "/"
            return num1 / num2
        else
            return "Invalid operator"
        end
    end
end

myObject = HelloWorld.new("Sidhant")
puts myObject.calculator("+",1,2)
puts myObject.calculator("-",1,2)
puts myObject.calculator("x",1,2)
puts myObject.calculator("/",1,2)
puts myObject.calculator("^",1,2)