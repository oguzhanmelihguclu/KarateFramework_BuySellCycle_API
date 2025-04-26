function fn() {
  var config = {
    base_url: 'https://qa.buysellcycle.com',
    adminEmail: 'admin.oguzhan@buysellcycle.com',
    adminPassword: 'Bsc.0425',
    customerEmail: 'customer.oguzhan@gmail.com',
    customerPassword: 'Bsc.0425',
    unauthorizedExceptionMessage: 'status code: 401, reason phrase: Unauthorized',
    notFoundExceptionMessage: 'status code: 404, reason phrase: Not Found',
    badRequestExceptionMessage: 'status code: 400, reason phrase: Bad Request',
    unprocessableEntityExceptionMessage: 'status code: 422, reason phrase: Unprocessable Entity',
    invalidToken: 'invalid'
  };
  return config;
}
