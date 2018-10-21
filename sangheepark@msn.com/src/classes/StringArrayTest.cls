public class StringArrayTest {
    public static String[] generateStringArray(Integer lenofarray) {
        List<String> myArray = new List<String>();
        
        For (Integer i = 0; i < lenofarray; i++ ) {
            myArray.add('Test ' + i);
            System.debug(myArray.get(i));
        }
        
        return myArray;
    }

}