public with sharing class RestRequestHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger();

    private final Map<Type, RestErrorMessage> restErrorMessagesByTypes;

    public RestRequestHandler(Map<Type, RestErrorMessage> restErrorMessagesByTypes) {
        this.restErrorMessagesByTypes = restErrorMessagesByTypes;
    }

    public void handleRequest(RestHandler concreteHandler, String httpMethod) {
        Savepoint mainSavePoint = Database.setSavepoint();

        try {
            if (concreteHandler == null) {
                throw new ResourceNotFoundException();
            }

            if (httpMethod == HttpConstants.METHOD_GET) {
                concreteHandler.handleGet();
            } else if (httpMethod == HttpConstants.METHOD_POST) {
                concreteHandler.handlePost();
            } else if (httpMethod == HttpConstants.METHOD_PUT) {
                concreteHandler.handlePut();
            } else if (httpMethod == HttpConstants.METHOD_PATCH) {
                concreteHandler.handlePatch();
            } else if (httpMethod == HttpConstants.METHOD_DELETE) {
                concreteHandler.handleDelete();
            }
        } catch (Exception e) {
            LOGGER.error('Failed to process request.', e);
            this.handleException(e);
            Database.rollback(mainSavePoint);
        } finally {
            LOGGER.saveLog();
        }
    }

    private void handleException(Exception e) {
        Type exceptionType = this.getType(e);

        if (this.restErrorMessagesByTypes.containsKey(exceptionType)) {
            RestErrorMessage errorMessage = this.restErrorMessagesByTypes.get(exceptionType);
            if (errorMessage.statusCode != null) {
                RestContextFacade.setResponseStatusCode(errorMessage.statusCode);
            }
            if (String.isNotBlank(errorMessage.message)) {
                RestContextFacade.setResponseBody(errorMessage.message);
            }
        } else {
            throw e;
        }
    }

    private Type getType(Exception e) {
        return Type.forName(e.getTypeName());
    }
}
