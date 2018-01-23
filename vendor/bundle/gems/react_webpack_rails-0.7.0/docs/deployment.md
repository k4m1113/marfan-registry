#### Heroku
Heroku will generally assume that it is a Rails application if deployed without further configuration. However, Heroku needs to install the
node packages and use webpack to seed the asset pipeline with the `react_bundle`.

Two main steps are necessary to allow the application to properly deploy onto Heroku. First, tell Heroku that you're using two buildpacks and make sure
the nodejs one is first:

```bash
$ heroku buildpacks:clear # this line is only necessary if buildpacks were previously specified
$ heroku buildpacks:add --index 1 https://github.com/heroku/heroku-buildpack-nodejs
$ heroku buildpacks:add --index 2 https://github.com/heroku/heroku-buildpack-ruby
```

Second, amend the provided `package.json` file to include a `postinstall` script that is the same as the build script (by default; otherwise
however as configured for production as described earlier for webpack). This `postinstall` script makes sure the `react_bundle` file is put
into `app/assets/javascript` before Heroku's `assets:precompile` step when it builds the Rails app.

```json
"scripts": {
  "test": "karma start",
  "start": "webpack -w --config webpack/dev.config.js",
  "build": "webpack -p --config webpack/production.config.js",
  "postinstall": "webpack -p --config webpack/production.config.js"
},
```

Deploying to Heroku should now work correctly:

```bash
  $ git push heroku master    # or however you'd like to push to Heroku
```

#### Tie Webpack assets to Rails rake tasks

Rake task `assets.rake`
```ruby
# The webpack must compile assets before assets:environment task.
# Otherwise Sprockets sees no changes and doesn't precompile assets.
Rake::Task['assets:precompile']
  .clear_prerequisites
  .enhance(['assets:compile_environment'])

# Remove Webpack assets as well
Rake::Task['assets:clobber'].enhance do
  Rake::Task['assets:clobber_webpack'].invoke
end

namespace :assets do
  #In this task, set prerequisites for the assets:precompile task
  task :compile_environment => :webpack do
    Rake::Task['assets:environment'].invoke
  end

  desc 'Compile Webpack assets'
  task :webpack do
    sh "NODE_ENV=#{Rails.env} npm run build" # this runs a react_webpack_rails script
  end

  desc 'Remove compiled Webpack assets'
  task :clobber_webpack do
    rm_rf "#{Rails.application.config.root}/app/assets/javascripts/react_bundle.js"
    rm_rf "#{Rails.application.config.root}/app/assets/stylesheets/react_bundle.css"
  end
end
```
