# Testing Rails applications with Rspec

<p align="left">
  <a href="https://github.com/augusto-queirantes/rails-rspec/actions">
    <img
      alt="spec status"
      src="https://github.com/augusto-queirantes/rails-rspec/workflows/Specs/badge.svg"
    >
  </a>

  <a href="https://github.com/augusto-queirantes/rails-rspec/actions">
    <img
      alt="linter status"
      src="https://github.com/augusto-queirantes/rails-rspec/workflows/Linter/badge.svg"
    >
  </a>
</p>

## Requirements

- Ruby v3.0.1
- Rails v6.1.3

## Setup

```
git clone git@github.com:augusto-queirantes/rails-rspec.git
bundle install
bundle exec rake db:create
bundle exec rake db:migrate
```

## Specs

Run `bundle exec rspec` to run all project specs

## Linting

Run `bundle exec rubocop` to lint all files
