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
`karate -Ptags=@debug -Dkarate.env=dev`

## Karate Features

### Template literal
In JavaScript, the double backticks `` ` ` `` are used to define a template literal.
Template literals are a way to create strings that can span multiple lines and include expressions
or variables directly within the string using `${...}` syntax.
example: 
> `` ` ``${baseURL}api/users`` ` ``


### Variable reference
In Karate, when you use the `#(...)` syntax within a string, it is treated as a variable reference
or expression that gets evaluated and replaced at runtime. The result of the expression is then used to
build the string.