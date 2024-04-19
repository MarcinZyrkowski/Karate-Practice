## Scenario Outline:
if the Examples column header has a ! appended, 
each value will be evaluated as a JavaScript data-type 
(number, boolean, or even in-line JSON) - else 
it defaults to string.

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