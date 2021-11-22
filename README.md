# Test Assignment for SmartPension


First of all, thank you for considering my application and reviewing this assignment.
Please, feel free to ask any questions via [LinkedIn](https://www.linkedin.com/in/verily/) 
or email: matusenco@protonmail.com

I had a hard time thinking whether I should create a very simple Ruby script because 
it is a test assigment, or I should write the code as if it would be used in production.
At the risk of being dismissed for over-engineering the solution, I chose the letter.


## Project Setup

1. Please, use `ruby 2.7.2` to run this code. My guess is that it should work
just as well with `v2.7.0` or even `v2.5.x` but it just wasn't tested
with these versions.
2. Make sure you have Bundler installed, or install it by running  
`gem install bundler`
3. Install project dependencies  
`bundle install`
4. Create rspec binstub  
`bundle binstubs rspec-core`


## Run App

(should be executed in the project root directory)  
`ruby ./app.rb parse_webserver_log --plain_text_file data/webserver.log --cache`

 - `./app.rb` - **required** - the script file being executed
 - `parse_webserver_log` - **required** argument - use case slug
 - `--plain_text_file` - **required** argument - data provider slug
 - `data/webserver.log` - **required** argument - data source
 - `--cache` optional argument - instructs the use case to cache the results
for faster retrieval on the subsequent calls


## Run Tests

(should be executed in the project root directory)  
`bin/rspec`


## Architecture

This project uses the Clean Architecture ([the concept](https://8thlight.com/blog/uncle-bob/2012/08/13/the-clean-architecture.html),
[a talk by the author](https://www.youtube.com/watch?v=WpkDN78P884) and [a slightly different interpretation](https://www.freecodecamp.org/news/a-quick-introduction-to-clean-architecture-990c014448d2/))

I do not pretend to be a great software architect, so the choice is based solely
on the plausibility of Robert C. Martin's arguments and my limited experience 
at a number of IT projects. 

In my opinion, this type of architecture, if implemented correctly, can significantly
reduce coupling. For example, you can easily extend `DataProviders` class and 
add a class, which would get the logs from the database instead of a file.

However, there are deviations from the Clean Architecture in the code. For example, 
I called my entities 'domains'.


## Code Style

In terms of Ruby style, my personal preferences largely match with the guides 
developed by [Ruby Style Guide](https://rubystyle.guide) and [Better Specs](https://www.betterspecs.org/).
You may find it reflected in the Rubocop config file.
But again, this is only a preference, and as long as there _is_ a guide
adopted by the company, I will readily go with it. 


## Comments

My opinion is that in most cases good code doesn't have to be documented. 
A notable exception in Ruby are types (classes) of function arguments and returns,
where comments may significantly increase the code readability.  
However, just as with the code style, if the company policy is that rich doc blocks
and code comments are required, I will surely do them.


## Other Notes

Due to the lack of time, I wasn't been able to provide the full test coverage.
I hope the amount of tests I _did_ provide proves that I can write them.

Having the liberty to choose the implementation, I decided to call my domain
'URI' instead of 'Page'. This makes no difference at all on a tiny project like this,
but technically, a page can have multiple URIs, and in theory, at a certain moment we 
might want to create Page domain and have one-to-many relation to URI objects.
