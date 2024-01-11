# G-PeTradise: Test, Track, Trade

**Team Members:**

Contribution History: [Link](https://github.com/Jayg000e/PetApp/graphs/contributors)

- Yunjia Wang   (yw4105)
- Jia Guo       (jg4692)
- Yu-Hsin Huang (yh3666)
- Hongzheng Zhu (hz2915)

## Dependencies

To get started, make sure to install Ruby version 3.1.4 using rbenv:

```shell
rbenv install --verbose 3.1.4
rbenv global 3.1.4
```

## Running the Application Locally

1. Install all the dependencies using Bundler:

```shell
bundle install --without production
```

2. Load the database:

```shell
rake db:reset
```

3. Start the local server:

```shell
rails s
```

## Running BDD and TDD Tests

We've provided both BDD (Cucumber) and TDD (RSpec) tests. To run the tests, use the following commands:

- To run BDD Cucumber tests:

Note: Chrome should be available in the test environment because selenium is used to test the UI with chrome starting from this tier. 

```shell
rake cucumber
```

- To run TDD RSpec tests:

```shell
rake spec
```

You can find coverage reports under the `coverage` folder.

## Heroku Link

For the deployed version of our application, visit our Heroku link at: https://agile-river-99147-09b2028b3c1f.herokuapp.com (No longer available)

## Interacting with the UI

We have moved the tutorial on interacting with our website to the following google doc

https://docs.google.com/presentation/d/1543wYC6SnCZ8m1tAixkz107eioMO-tll7SjGCRmlds4/edit#slide=id.g28b9651ab82_2_847


