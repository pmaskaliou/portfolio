@IsTest
public class GenericSelectorMock implements System.StubProvider {
    public static Object mockResult;

    public static void createAndPassMockToDependencyInjector(Type classToMock) {
        Object stub = Test.createStub(classToMock, new GenericSelectorMock());
        DependencyInjector.setMock(classToMock, stub);
    }

    public Object handleMethodCall(
            Object stubbedObject,
            String stubbedMethodName,
            Type returnType,
            List<Type> listOfParamTypes,
            List<String> listOfParamNames,
            List<Object> listOfArgs
    ) {

        return mockResult;
    }
}
