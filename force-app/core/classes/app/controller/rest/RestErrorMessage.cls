public class RestErrorMessage {
    public Integer statusCode { get; private set; }
    public String errorCode { get; private set; }
    public String message { get; private set; }

    public RestErrorMessage(Integer statusCode) {
        this(statusCode, null, null);
    }

    public RestErrorMessage(Integer statusCode, String errorCode) {
        this(statusCode, errorCode, null);
    }

    public RestErrorMessage(Integer statusCode, String errorCode, String message) {
        this.statusCode = statusCode;
        this.errorCode = errorCode;
        this.message = message;
    }
}
