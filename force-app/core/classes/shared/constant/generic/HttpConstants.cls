public class HttpConstants {
    public static final String METHOD_GET = 'GET';
    public static final String METHOD_POST = 'POST';
    public static final String METHOD_PUT = 'PUT';
    public static final String METHOD_PATCH = 'PATCH';
    public static final String METHOD_DELETE = 'DELETE';

    public static final String HEADER_NAME_AUTHORIZATION = 'Authorization';
    public static final String HEADER_NAME_CONTENT_TYPE = 'Content-Type';

    public static final String HEADER_VALUE_JSON = 'application/json';
    public static final String HEADER_VALUE_TEXT_PLAIN = 'text/plain';

    public static final Integer STATUS_CODE_BAD_REQUEST = 400;
    public static final Integer STATUS_CODE_RESOURCE_NOT_FOUND = 404;
    public static final Integer STATUS_CODE_METHOD_NOT_ALLOWED = 405;

    public static final String ERROR_CODE_NOT_FOUND = 'NOT_FOUND';

    public static final String ERROR_MESSAGE_URL_NOT_FOUND = 'Could not find a match for URL';
}
