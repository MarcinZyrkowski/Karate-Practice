## Project description
In this project Karate framework is used to test https://reqres.in/ 

In newest version of karate there is no option running tests by "green arrow" in intellij idea.
This feature requires paid subscription.

### Running tests
To have ability to run particular tests gradle task was introduced in this project:
`gradle karate -Ptags=@debug`
by this command you can run any test which is marked by tag. you can modify it during developing tests
`gradle karate` will run all tests

Also we have option to choose env which we prefer using the following command:
`gradle karate -Ptags=@debug -Dkarate.env=dev`

Another additional option is ability to run tests in parallel. Then we need add additional property:
`"-Dkarate.options=--threads 10"`
e.g.
`gradle karate "-Dkarate.options=--threads 10"`
