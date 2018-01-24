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

```jsx
import React, { Component } from 'react';
import { imagePath } from 'rwr-view-helpers';

export default ({ alt }) => (
  <img alt={alt} src={imagePath('spongebob.png')} />
);
```

## Caching

Going through all the assets on every request would be veeery slow, so rwr-view_helpers takes advantage of `/tmp/cache` in your project.
Unfortunately at the moment we don't have any mechanism to generate new cache each time new assets are added.

Current work-around is to run this task, when adding new assets to the project:

```shell
$ rake tmp:clear
```
