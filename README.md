# National Marfan Foundation Tool

[![Heroku Deployment](https://heroku-badge.herokuapp.com/?app=nmf-tool)](https://nmf-tool.herokuapp.com/)
[![Codeship Build Status](https://app.codeship.com/projects/247cce80-e26e-0133-9815-5e7bb9818a79/status?branch=master)](https://app.codeship.com/projects/145614)

The NMF Tool is a proof-of-concept clinical tool and global database for collecting and tracking relevant information about connective tissue disorders, including health data and family history.

Built with the [National Marfan Foundation](https://www.marfan.org/) and the [American Heart Association](https://www.marfan.org/about-us/news/2016/11/13/marfan-foundation-announces-collaboration-american-heart-association-pilot), the application is currently live as a proof-of-concept for further consideration by the AHA, demonstrated at the [33rd annual NMF conference](https://www.marfan.org/resources/patients/conference) in Atlanta in August 2017.

## Features
* iPad-first design to maximize engagement between doctors and patients
* saves clinicians valuable time dictating and composing with [after-visit letters](https://nmf-tool.herokuapp.com/visits/1/report) generated in proper, readable English
* Instant medication import from EPIC Electronic Health Record
* Handwriting recognition with [MyScript](http://myscript.com/technology/#text)
* "Fuzzy Data" collection and parsing

## Stack
### Front End
* Stylus-first UI with [Bootstrap 4](https://v4-alpha.getbootstrap.com/)
* [jQuery UI](https://jqueryui.com/) widgets
* Gestural continuity with [Virtual Keyboard](https://github.com/Mottie/Keyboard) (hand never leaves mouse or stylus)
* Easy unit conversion with [Bootstrap Switch](http://bootstrapswitch.com/) views
* Intuitive, rapid collection of various data types through related topics
* Pedigree tool including ability to claim patients and establish relationships between patients
* Quickly add concerns with [Select2](https://select2.github.io/)

### Back End
* [Ruby 2.5.0](https://www.ruby-lang.org/en/news/2017/12/25/ruby-2-5-0-released/)
* [Rails 5.1.1](http://weblog.rubyonrails.org/2017/5/12/Rails-5-0-3-and-5-1-1-have-been-released/)
* [Webpack](https://github.com/rails/webpacker) asset management with [Yarn](https://yarnpkg.com/) and [Bower](https://bower.io/) packages
* [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) photo and document uploading to [AWS](https://aws.amazon.com/)
* Login/Registration functionality to be implemented with [Devise](https://github.com/plataformatec/devise/wiki)
* [Foreman](https://theforeman.org/) management of [Puma](http://puma.io/) server
* Deployment on [Heroku](https://www.heroku.com/home)

### Testing
* Model testing with [RSpec](http://rspec.info/) and [FactoryBot](https://github.com/thoughtbot/factory_girl)
* Feature testing with [Capybara](https://github.com/jnicklas/capybara) and [Selenium](http://www.seleniumhq.org/) powered by [ChromeDriver](https://sites.google.com/a/chromium.org/chromedriver/)
* Continuous Integration on [Codeship](https://app.codeship.com/projects/145614)
