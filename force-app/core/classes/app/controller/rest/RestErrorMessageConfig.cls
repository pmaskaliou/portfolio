public class RestErrorMessageConfig {
    private final static Map<Type, RestErrorMessage> ERROR_MESSAGE_BY_EXCEPTION_TYPE;

    static {
        ERROR_MESSAGE_BY_EXCEPTION_TYPE = new Map<Type, RestErrorMessage>{
                ResourceNotFoundException.class => new RestErrorMessage(
                        HttpConstants.STATUS_CODE_RESOURCE_NOT_FOUND,
                        HttpConstants.ERROR_CODE_NOT_FOUND,
                        HttpConstants.ERROR_MESSAGE_URL_NOT_FOUND
                ),
                MethodNotAllowedException.class => new RestErrorMessage(
                        HttpConstants.STATUS_CODE_METHOD_NOT_ALLOWED
                ),
                InvalidDataException.class => new RestErrorMessage(
                        HttpConstants.STATUS_CODE_RESOURCE_NOT_FOUND,
                        HttpConstants.ERROR_CODE_NOT_FOUND
                )
        };
    }

    public static Map<Type, RestErrorMessage> getConfiguration() {
        return ERROR_MESSAGE_BY_EXCEPTION_TYPE.clone();
    }
}
