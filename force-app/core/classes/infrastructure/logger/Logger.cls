public interface Logger {
    void error(String message, Exception e);

    void warn(String message);

    void info(String message);

    void debug(String message);

    void saveLog();
}