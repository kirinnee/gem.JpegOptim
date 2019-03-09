# Binary Transformer for JpegOptim

Binary Transformer plugin for jpeg optim. 

Requires JpegOptim to be available via the PATH variable globally

To use it, please also install gem [Binary Transformer](https://gitlab.com/ruby-gem/binary-transformer), and 
see [usage](#Usage).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bt_jpegoptim'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bt_jpegoptim

## Dependency
This depends on [JpegOptim](https://github.com/tjko/jpegoptim), so please ensure its available via
global PATH. 

JpegOptim has to be at least version 1.4.4

To Check JpegOptim version:
```bash
$ jpegoptim --help
```

## Getting Started
Install and require binary transform, and create a JpegOptim
instance. The constructor can take in the following fields

|Field|Description|
|---|---|
| strip_all: | Strip all metadata from the jpeg image. Default: true |
| progressive: | Make the jpeg progressive. Default: true |
| quality: | The maximum quality to keep. Default: 75|

```ruby
require "binary_transformer"
require "bt_jpegoptim"

# Read image as binary
image = IO.binread "image.jpg"

# Use binary_transformer module to allow stream-like piping
image.extend StreamLike

# Create a pngquant instance with the follow settings. Settings not chosen will be set default
jpegoptim = BT::JpegOptim.new(quality: 50) 

# Pipe it through the transformer instance
compressed = image > jpegoptim

# Write it out
IO.binwrite compressed, "small.jpg"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. 

Then, run `rake unit` to run the unit tests.

To install this gem onto your local machine, run `rake install:local`. 
 at . This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.MD) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning 
We use [SemVer](https://semver.org/) for versioning. For the versions available, see the tags on this repository.

## Authors
* [kirinnee](mailto:kirinnee@gmail.com) 

## License
This project is licensed under MIT - see the [LICENSE.md](LICENSE.MD) file for details