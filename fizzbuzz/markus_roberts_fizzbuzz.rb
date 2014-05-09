# ====================================================================
#  Markus Roberts' (markus@reality.com) Amazing Fizzbuzz Ruby Hangman
# ====================================================================

# Many of you are probably familiar with the infamous fizz-buzz interview
# question: http://blog.codinghorror.com/why-cant-programmers-program/

# While I applaud the idea of making sure people can actually write at
# least a little bit of code before hiring them to write code (in the same
# way as I support making sure life guards can swim and pilots know how to
# fly safely) I'm perpetually dismayed by the frequency with which the
# actual FizzBuzz problem is apparently given to potential programmers.
# It some how feels as if the interviewer is subtly missing the point.
# I've spoken to two people, both of whom were happy to get down to code
# in an interview, who recently found themselves doubting if they wanted
# to work with the company that was interviewing them when this particular
# question was asked.  As one of them said, "couldn't they at least bother
# to change it to FuzzBizz?"

# Be that as it may.  If you ever find yourself facing this question and
# doubting if you really want the job on that account, why not have a
# little fun with it and test the interviewer?  For example, you could
# solve classic FizzBuzz with the following lucid ruby:

# (1..100).each { |number|
#   puts case number
#     when multiple_of[3] & multiple_of[5]; "FizzBuzz"
#     when multiple_of[3];                  "Fizz"
#     when multiple_of[5];                   "Buzz"
#     else                                   number
#   end
# }

# It's practically a direct translation of the problem statement into
# code.  Of course, to make it work you'll have to define multiple_of,
# which you can easily do as follows:

# __________
#     ____&o
#         ____a___a____a___o__a__
#     end
# end

# multiple_of = ____________________

# Their reaction to this solution should help you figure out if you really
# want the job or not, while at the same time making it easier to back out
# gracefully if you decide not.  :)

# ===== SOLUTION =====

# The trick relies on the fact that Proc#=== and Proc#[] are both synonyms
# for Proc.call, so a lambda used in a when clause of a case statement
# gets called with the selector value of the cases statement, and if the
# result it returns is truthy, that branch is taken, and a lambda
# subscripted as if it were a Hash or Array also gets called, and the
# result is the return value..

# Since we want a different lambda depending on the multiplier we're
# testing, multiple_of is itself a lambda (which we call with the Proc#[])
# that returns the lambda we want, so that case/when will call it via ===
# and do what we want.  In code:

# multiple_of = ->(a){->(o){o%a==0}}

# For the "&" in the first when clause, we need to define Proc#& to take a
# second lambda and produce a wrapper lambda that, when called with some
# arguments, will call both constituent lambdas with those same arguments
# and then return the results of &&-ing their results together.  In code:

class Proc
    def &o
        ->(*a){call(*a)&&o[*a]}
    end
end

With that, we can do this:

(1..100).each { |number|
  puts case number
      when multiple_of[3] & multiple_of[5]; "FizzBuzz"
      when multiple_of[3];                  "Fizz"
      when multiple_of[5];                   "Buzz"
      else                                   number
    end
}

# There was also some talk about how to interpret the response you get it
# if you provide this answer in an interview (short answer: worry if they
# are either overly confused or overly impressed, but if they understand
# the code but are concerned about your sanity, immediately explain that
# you were testing them and reassure them that they passed).
