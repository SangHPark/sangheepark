@isTest 
private class AnimalLocatorTest  {

    @isTest static void test() {
	    Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
	    
	    String animal_name = AnimalLocator.getAnimalNameById(1);
	    
	    String expectedValue = 'ChickenPark';
	    System.assertEquals(animal_name, expectedValue);
	    

	}

}