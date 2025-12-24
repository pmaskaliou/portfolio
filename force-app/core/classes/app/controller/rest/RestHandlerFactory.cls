public class RestHandlerFactory {
    private final RestRequest restRequest;
    private final Map<String, Type> handlerTypeByResourcePath;

    public RestHandlerFactory(RestRequest restRequest, Map<String, Type> handlerTypeByResourcePath) {
        this.restRequest = restRequest;
        this.handlerTypeByResourcePath = handlerTypeByResourcePath;
    }

    public RestHandler getConcreteHandler() {
        Type restHandlerType;
        RestHandler concreteHandler;

        if (handlerTypeByResourcePath.containsKey(restRequest.requestURI)) {
            restHandlerType = handlerTypeByResourcePath.get(restRequest.requestURI);
        }
        if (restHandlerType != null) {
            concreteHandler = (RestHandler) Type.forName(String.valueOf(restHandlerType)).newInstance();
        }

        return concreteHandler;
    }
}
