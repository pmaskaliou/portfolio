public class RestHandlerConfig {
    private static final Map<String, Type> HANDLER_TYPE_BY_RESOURCE_PATH;

    static {
        HANDLER_TYPE_BY_RESOURCE_PATH = new Map<String, Type>{
                '/v1/contact' => RestContactHandler.class
        };
    }

    public static Map<String, Type> getConfiguration() {
        return HANDLER_TYPE_BY_RESOURCE_PATH.clone();
    }
}
