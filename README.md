
![Logo of the project](https://github.com/Lucasdfg07/RubyWebCrawler/blob/master/public/logo.png)


## Ruby Web Crawler 
This application is a web crawler did for Inovamind's thenical challenge.


## Technology 

Here are the technologies used in this project.

* Ruby version  2.5.1
* Ruby on Rails version 5.0.1
* Docker 
* Docker Compose
* MongoDB

## Services Used

* Github

## Ruby Gems

* Devise
* Mongoid
* Pry-Rails
* Simple_token_authentication
* Rest-Client
* Jbuilder
* Responders


## Getting started

* Dependency
  - Docker
  - Docker Compose

* To build the containers:
>    $ sudo docker-compose build

* To create the bank and do as migrations:
>    $ sudo docker-compose run --rm app bundle exec rake db:seed

* To install as gens:
>    $ sudo docker-compose run --rm app bundle install

* To run the project:
>    $ sudo docker-compose up


## Test Using Postman

* Step 1
  * Enter into the postman and put the local URL with the API endpoint (localhost:3000/api/v1/quotes/the_word_that_you_will_search.json) and run it.
  * You will see something like the image above:
  
  ![Step 1 Postman](https://github.com/Lucasdfg07/RubyWebCrawler/blob/master/public/step1.png)
  
* Step 2
  * Authentication error needs the user creation and authentication in Devise, so...
  * Enter into the terminal and put "rails c".
  * Into the "rails c", create your User with the command: User.create(email: "your_email", password: "your_password")
  * The register will return you the authentication_token. Copy that!
  
  ![Step 2 Postman](https://github.com/Lucasdfg07/RubyWebCrawler/blob/master/public/step2.png)
  
* Step 3
  * Write the Postman header with your informations that you catch in the last step.
  * Your Header will appear like:
  
  ![Step 3 Postman](https://github.com/Lucasdfg07/RubyWebCrawler/blob/master/public/step3.png)
  
* Step 4
  * Thats it!!! You made it.
  * Now, click in "Send" and search your tags about the http://quotes.toscrape.com/ website.
  
  ![Step 4 Postman](https://github.com/Lucasdfg07/RubyWebCrawler/blob/master/public/step4.png)
  
## Test Using Localhost Project

* Step 1
  * Run the project and try to access localhost:3000/users/sign_in
  * Sign In or Sign Up into the devise form:
  
  ![Step 1 Localhost](https://github.com/Lucasdfg07/RubyWebCrawler/blob/master/public/step1_local.png)
  
  * After Signed In, type localhost:3000/api/v1/quotes/the_word_that_you_will_search.json.
  * Will Work because you now already have your access token to use the system!! :D
  
  ![Step 2 Localhost](https://github.com/Lucasdfg07/RubyWebCrawler/blob/master/public/step2_local.png)


## Features

The main features of the application are;

* Scrap the website http://quotes.toscrape.com/ searching tags and return the equivalent:
 - Quote (Title)
 - Author
 - Author About
 - Tags


## Links

  - Repository: https://github.com/Lucasdfg07/RubyWebCrawler
    - In case of sensitive bugs like security vulnerabilities, please contact
      Lucassiqueiraferandes07@gmail.com directly instead of using issue tracker. We value your effort
      to improve the security and privacy of this project!

  ## Versioning

  1.0.0.0


  ## Authors

  * **Lucas Siqueira Fernandes** 

  Please follow github and join us!
  Thanks to visiting me and good coding!
