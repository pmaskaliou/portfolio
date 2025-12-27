@IsTest
public class SObjectTestUtil {
    private static final String ID_TEMPLATE_WITHOUT_PREFIX = '000000000000000';
    private static Integer idCounter = 0;

    public static Id generateId(SObjectType sObjectType) {
        String keyPrefix = sObjectType.getDescribe(SObjectDescribeOptions.DEFERRED).getKeyPrefix();
        return keyPrefix + (ID_TEMPLATE_WITHOUT_PREFIX + idCounter++).right(ID_TEMPLATE_WITHOUT_PREFIX.length());
    }
}
