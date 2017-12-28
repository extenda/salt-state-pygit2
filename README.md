Testing
-------
We use `test-kithcen` for testing this state. `test-kitchen` is configured to launch a Centos 7 virutal machine on Virtualbox and provision the VM using the Salt state in this repo. Serverspec is then used to execute tests against the VM to ensure that it is in its desired state.

You will need to have the following installed: Ruby v2.3.3, `bundler` gem, Vagrant, and Virtualbox. Once these requirements are fulfilled you just need to run the following from the root of this repo:

```sh
# install required ruby gems
bundle install
# launch VM, provision, and run tests
kithcen verify
# if tests pass then you can destroy the environment
kitchen destroy
```

Generally you will want to follow the principles of Test Driven Development (TDD) when working on this Salt state. This means you should first write a test, run test kitchen (`kitchen verify`) and watch it fail, write the code (state) to make you test pass, rerun your tests (`kitchen verify`), and repeat until all tests pass.
