@isTest
global class AnimalsHttpCalloutMock implements HttpCalloutMock  {
    
    global HTTPResponse respond (HTTPRequest request) {
        HTTPResponse response = new HTTPResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animals": ["majestic badger", "fluffy bunny", "scary bear", "chicken", "funny moose"]}');
        response.setStatusCode(200);
        return response;
    }
}