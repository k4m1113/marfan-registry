## Ruby Boolean

![Build Status](https://travis-ci.org/yez/ruby-boolean.svg?branch=master)

This is an extremely simple addition of a Boolean module.

Install:

```ruby
gem install 'ruby-boolean'
```

or in your Gemfile

```ruby
gem 'ruby-boolean'
```

It's purpose to avoid doing:

```ruby
foo = true
if foo.is_a?(TrueClass) || foo.is_a?(FalseClass)
  # do something that's specific to booleans
end
```

Now it can be reduced to:

```ruby
require 'ruby-boolean'

true.is_a?(Boolean)  #=> true
false.is_a?(Boolean) #=> true
"foo".is_a?(Boolean) #=> false
```
