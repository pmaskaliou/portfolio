public class LoggerFactory {
    private static final Logger LOGGER;

    static {
        LOGGER = (Logger) DependencyInjector.getInstance(NebulaLogger.class);
    }

    public static Logger getLogger() {
        return LOGGER;
    }
}
