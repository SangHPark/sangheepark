@isTest
global class ParkServiceMock implements WebServiceMock{
	global void doInvoke (
    	Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType ) {
            ParkService.byCountryResponse response_x = 
                new ParkService.byCountryResponse();
            String[] rtn_park = new String[]{'Park A', 'Park B'};
            response_x.return_x = rtn_park;
            response.put('response_x',response_x);
        }
}