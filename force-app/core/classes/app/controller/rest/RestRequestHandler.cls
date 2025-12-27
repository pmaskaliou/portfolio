public with sharing class RestRequestHandler {
    private static final Logger LOGGER = LoggerFactory.getLogger();

    private final Map<Type, RestErrorMessage> restErrorMessagesByExceptionType;

    public RestRequestHandler(Map<Type, RestErrorMessage> restErrorMessagesByExceptionType) {
        this.restErrorMessagesByExceptionType = restErrorMessagesByExceptionType;
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

        if (this.restErrorMessagesByExceptionType.containsKey(exceptionType)) {
            RestErrorMessage errorMessage = this.restErrorMessagesByExceptionType.get(exceptionType);
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
