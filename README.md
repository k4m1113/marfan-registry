#NMF Tool

The NMF Tool is a global database for tracking the symptoms of Marfan Syndrome. On the client-side patients may input information about themselves and their symptoms while doctors can add symptoms about their patients and generate after-visit summaries including medication, patient symptoms, familial symptoms, and follow-up.

[Heroku Deployment](https://nmf-tool.herokuapp.com/)

## Features
* Doctors and Patients have separate portals and profiles (TO BE IMPLEMENTED WITH HIPAA COMPLIANCE)
* Doctors may add information during visits in a distraction-free interface to maintain as much bedside manner as possible
* After-visit letters are generated in proper, readable English

## Technologies
* Login/Registration functionality to be implemented with [Devise](https://github.com/plataformatec/devise/wiki)
* Feature testing with [Capybara](https://github.com/jnicklas/capybara)
* Model testing with [Rspec](http://rspec.info/) and [FactoryGirl](https://github.com/thoughtbot/factory_girl)
* iPad- and browser-friendly styling with [Bootstrap](https://getbootstrap.com/)
