function fn() {
  var env = karate.env;
  karate.log('karate.env system property was :', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    baseURL: 'https://reqres.in/'
  }

  return config;
}