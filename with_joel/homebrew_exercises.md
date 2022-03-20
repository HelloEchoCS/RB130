## Block-chain
Without running the code, what is the output on line 11 and why?
```ruby
def outer_method(num, &block)
  num += yield
  inner_method(num, &block)
end

def inner_method(num, &block)
  num + yield
end

proc_obj = proc { 4 }
puts outer_method(3, &proc_obj)
```

## Splat Ops
How the splat operator `*` works in Ruby? Give an example.
Without running the code, what is the output on the last line and why?
```ruby
def a_method(*arg) # add or remove `*` here, also consider adding more params, does Ruby allows two `*`s?
  arg.each { |item| p item } # add or remove `*` here
end

arr = [1, 2, 3]

a_method(arr) # add or remove `*` here, also consider adding more params
```