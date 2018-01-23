RWR View Helpers
====

This gem provides handy view helpers to be used with netguru's [react_webpack_rails](https://github.com/netguru/react_webpack_rails).

## Setup

* Javascript
  ```sh
  $ npm install --save rwr-view-helpers
  ```

* Ruby
  ```ruby
  # your Gemfile
  gem 'rwr-view_helpers'
  ```

## Usage

First add this require statement in your `/app/assets/javascripts/application.js`

```js
//= require rwr_view_helpers
```

Then use it in your React components

```js
import React from 'react';
import { imagePath } from 'rwr-view-helpers';
import { facebookIcon } from 'constants/icon-urls';

export default ({ alt }) => (
  <img alt={alt} src={imagePath(facebookIcon)} />
);
```

## Caching

Going through all the assets on every request would be veeery slow, so rwr-view_helpers takes advantage of `/tmp/cache` in your project.
Unfortunately at the moment we don't have any mechanism to generate new cache each time new assets are added.

Current work-around is to run this task, when adding new assets to the project:

```shell
$ rake tmp:clear
```

## Contributing

#### Issues

Found a bug in rwr-view_helpers? Open an issue on [GitHub Issues](https://github.com/netguru/rwr-view_helpers/issues).

#### Pull requests

Interested in contributing to rwr-view_helpers? That's great, and thank you for your interest!

After checking out the repo, run `bundle exec rake setup:all` to install every environment dependencies.

To get your contributions accepted, make sure:

* All the tests pass. Run `bundle exec rake test:all`.
* Any new code paths you've added are covered by tests.
* Describe your changes in pull request (what it adds, how to migrate from previous version etc.)

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
