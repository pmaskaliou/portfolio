@RestResource(UrlMapping='/v1/*')
global with sharing class RestRequestDispatcher implements RestHandler {
    private static final RestRequestHandler REST_BASE_HANDLER;
    private static final RestHandler CONCRETE_HANDLER;

    static {
        RestHandlerFactory handlerFactory = new RestHandlerFactory(
                RestContext.request,
                RestHandlerConfig.getConfiguration()
        );

        REST_BASE_HANDLER = new RestRequestHandler(RestErrorMessageConfig.getConfiguration());
        CONCRETE_HANDLER = handlerFactory.getConcreteHandler();
    }

    @HttpGet
    global static void handleGet() {
        REST_BASE_HANDLER.handleRequest(CONCRETE_HANDLER, HttpConstants.METHOD_GET);
    }

    @HttpPost
    global static void handlePost() {
        REST_BASE_HANDLER.handleRequest(CONCRETE_HANDLER, HttpConstants.METHOD_POST);
    }

    @HttpPut
    global static void handlePut() {
        REST_BASE_HANDLER.handleRequest(CONCRETE_HANDLER, HttpConstants.METHOD_PUT);
    }

    @HttpPatch
    global static void handlePatch() {
        REST_BASE_HANDLER.handleRequest(CONCRETE_HANDLER, HttpConstants.METHOD_PATCH);
    }

    @HttpDelete
    global static void handleDelete() {
        REST_BASE_HANDLER.handleRequest(CONCRETE_HANDLER, HttpConstants.METHOD_DELETE);
    }
}
