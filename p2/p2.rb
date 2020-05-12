#
# CS 430 Spring 2019 P2 (Ruby 2)
#
# Name: Brendan Pho
#

require_relative 'defs.rb'

# Your solution code goes here

class EInt
    def eval
        @val
    end

    def count_ops
        0
    end

    def height
       1 
    end

    def postfix
        @val.to_s
    end

    def uniq_ints
        [@val]
    end
end

class EBinOp

    def eval
        @val = parse_op(left.eval, right.eval)
    end

    def parse_op(first, second)
        case op
        when "+"
            first + second
        when "-"
            first - second
        when "*"
            first * second
        end
    end

    def count_ops
        1 + left.count_ops + right.count_ops
    end

    def height 
        1 + (left.height >= right.height ? left.height : right.height)
    end

    def postfix
        "#{left.postfix} #{right.postfix} #{@op.to_s}"
    end

    def uniq_ints
        [left.uniq_ints, right.uniq_ints].flatten.uniq
    end
end
    
