public with sharing class NebulaLogger implements Logger {
    public void error(String message, Exception e) {
        Nebula.Logger.error(message, e);
    }

    public void warn(String message) {
        Nebula.Logger.warn(message);
    }

    public void info(String message) {
        Nebula.Logger.info(message);
    }

    public void debug(String message) {
        Nebula.Logger.debug(message);
    }

    public void saveLog() {
        Nebula.Logger.saveLog();
    }
}