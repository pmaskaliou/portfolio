public class RestContextFacade {
    private static final RestRequest REQUEST;
    private static final RestResponse RESPONSE;

    static {
        REQUEST = RestContext.request;
        RESPONSE = RestContext.response;
    }

    private static void addTextPlainContentHeader() {
        RESPONSE.addHeader(HttpConstants.HEADER_NAME_CONTENT_TYPE, HttpConstants.HEADER_VALUE_TEXT_PLAIN);
    }

    private static void addJsonContentHeader() {
        RESPONSE.addHeader(HttpConstants.HEADER_NAME_CONTENT_TYPE, HttpConstants.HEADER_VALUE_JSON);
    }

    public static String getParam(String key) {
        return REQUEST.params?.get(key);
    }

    public static String getRequestBody() {
        return REQUEST.requestBody != null ? REQUEST.requestBody.toString() : null;
    }

    public static void setResponseStatusCode(Integer statusCode) {
        RESPONSE.statusCode = statusCode;
    }

    public static void setResponseBody(Object responseBody) {
        setResponseBody(responseBody, false);
    }

    public static void setResponseBody(Object responseBody, Boolean suppressApexObjectNulls) {
        if (responseBody != null) {
            if (responseBody instanceof String) {
                addTextPlainContentHeader();
            } else {
                addJsonContentHeader();
                responseBody = JSON.serialize(responseBody, suppressApexObjectNulls);
            }
            RESPONSE.responseBody = Blob.valueOf(String.valueOf(responseBody));
        }
    }
}