public class ParkLocator {
    public static String[] country(String cntry) {
        ParkService.ParksImplPort parklist = new ParkService.ParksImplPort();
        return parklist.byCountry(cntry);
    }
}