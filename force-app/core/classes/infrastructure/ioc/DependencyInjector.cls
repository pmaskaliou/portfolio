public class DependencyInjector {
    private static final Map<Type, Object> MOCK_CONTAINER;

    static {
        DependencyInjector.MOCK_CONTAINER = new Map<Type, Object>();
    }

    public static Object getInstance(Type classType) {
        return DependencyInjector.MOCK_CONTAINER.containsKey(classType)
            ? DependencyInjector.getMockByType(classType)
            : Type.forName(String.valueOf(classType)).newInstance();
    }

    public static void setMock(Type classType, Object instance) {
        DependencyInjector.MOCK_CONTAINER.put(classType, instance);
    }

    public static Object getMockByType(Type classType) {
        return DependencyInjector.MOCK_CONTAINER.get(classType);
    }
}
