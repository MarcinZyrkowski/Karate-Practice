function fn() {
  var env = karate.env;
  karate.log('karate.env system property was :', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    baseURL: 'https://reqres.in/'
  }

  // pretty output of body in requests
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  return config;
}