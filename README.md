In this project Karate framework is used to test https://reqres.in/ 

In newest version of karate there is no option running tests by "green arrow" in intellij idea.
This feature requires paid subscription.

To have ability to run particular tests gradle task was introduce in this project:
`gradle karate -Ptags=@debug`
by this command you can run any test which is marked by tag. you can modify it during developing tests
`gradle karate` will run all tests
