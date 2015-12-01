User stories
====================

Here I have my user stories used for creating my feature_test, they allows me to
have a starting point in my BDD cycle.


```
In order to pay for my journey
As a customer
I need my fare deducted from my card
```

```
require './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.top_up(35)
oystercard.deduct(10)
```

```
In order to get through the barriers.
As a customer
I need to touch in and out.
```
require './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.top_up(35)
oystercard.touch_in
oystercard.touch_out
oystercard


```
In order to pay for my journey
As a customer
I need to have the minimum amount (£1) for a single journey.
```
require './lib/oystercard.rb'
oystercard = Oystercard.new
oystercard.touch_in


```
In order to pay for my journey
As a customer
When my journey is complete, I need the correct amount deducted from my card
```
