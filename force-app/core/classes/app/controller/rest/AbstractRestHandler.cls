public abstract class AbstractRestHandler implements RestHandler {

    public virtual void handleGet() {
        throw new MethodNotAllowedException();
    }

    public virtual void handlePost() {
        throw new MethodNotAllowedException();
    }

    public virtual void handlePut() {
        throw new MethodNotAllowedException();
    }

    public virtual void handlePatch() {
        throw new MethodNotAllowedException();
    }

    public virtual void handleDelete() {
        throw new MethodNotAllowedException();
    }
}