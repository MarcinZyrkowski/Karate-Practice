function fn() {
  var env = karate.env;
  karate.log('karate.env system property was :', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    baseURL: 'https://reqres.in/' + env
  }

  // pretty output of body in requests and responses
  karate.configure('logPrettyRequest', true);
  karate.configure('logPrettyResponse', true);

  return config;
}
