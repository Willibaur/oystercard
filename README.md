This is an project about how to build a gem from scratch, is part of the second
week course at Makers Academy.

Steps I followed on this challenge

1. Create a repo on git with README and clone it, write something about the
   project and do my first `git commit` and `git push -u origin master`

2. List all gems available with `gem list` command.
   If `bundler` was installed it was fine, if not, I use `gem install bundler` and
   then run `bundle init` so my `Gemfile` is generate.

   I update the Gemfile with:
   ```
   source "https://rubygems.org"
   ruby '2.2.3'
   group :development, :test do
    gem "rspec"
   end
   ```
   If ruby is not installed I run `rvm install 2.2.3`

3. I have to initialize rspec with `rspec --init` then I update the `.rspec` with
   `--format documentation`.

   I create the `spec/oystercard_spec.rb` and initialize it with
   ```
   describe Oystercard do
   end
   ```
   Then run rspec and start the debugging process by creating the class `oystercard.rb`.

   Then start the whole BDD process by using user stories, irb and rspec.
