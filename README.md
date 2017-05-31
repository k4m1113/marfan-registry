# National Marfan Foundation Tool

[![Heroku Deployment](https://heroku-badge.herokuapp.com/?app=nmf-tool)](https://nmf-tool.herokuapp.com/)
[![Codeship Build Status](https://app.codeship.com/projects/247cce80-e26e-0133-9815-5e7bb9818a79/status?branch=master)](https://app.codeship.com/projects/145614)

The NMF Tool is a clinical tool and global database for collecting and tracking relevant information about connective tissue disorders, including health data and family history.

Built with the [National Marfan Foundation](https://www.marfan.org/) and the [American Heart Association](https://www.marfan.org/about-us/news/2016/11/13/marfan-foundation-announces-collaboration-american-heart-association-pilot), the application is currently live as a proof-of-concept for further consideration by the AHA, to be demonstrated at the [33rd annual NMF conference](https://www.marfan.org/resources/patients/conference) in Atlanta in August 2017.

## Features
* iPad-first design to maximize engagement between doctors and patients
* [After-visit letters](https://nmf-tool.herokuapp.com/visits/1/report) generated in proper, readable English without the need for dictation
* Medication parsing from EPIC Electronic Health Record
* Handwriting recognition with [MyScript](http://myscript.com/technology/#text)
* "Fuzzy Data" collection and manipulation

## Technologies
* [Ruby 2.3.4](https://www.ruby-lang.org/en/news/2017/03/30/ruby-2-3-4-released/) and [Rails 5.1.1](http://weblog.rubyonrails.org/2017/5/12/Rails-5-0-3-and-5-1-1-have-been-released/)
* [Webpack](https://github.com/rails/webpacker) asset management
* Stylus-first UI with [Bootstrap 4](https://v4-alpha.getbootstrap.com/)
* [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) photo and document uploading to [AWS](https://aws.amazon.com/)
* [jQuery UI](https://jqueryui.com/) widgets
* Feature testing with [Capybara](https://github.com/jnicklas/capybara)
* Model testing with [RSpec](http://rspec.info/) and [FactoryGirl](https://github.com/thoughtbot/factory_girl)
* Login/Registration functionality to be implemented with [Devise](https://github.com/plataformatec/devise/wiki)
