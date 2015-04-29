package im.actor.model.js.providers.websocket;

import im.actor.model.network.ConnectionEndpoint;

/**
 * Created by ex3ndr on 29.04.15.
 */
public class WebSocketAsyncConnectionFactory implements AsyncConnectionFactory {
    @Override
    public AsyncConnection createConnection(ConnectionEndpoint endpoint, AsyncConnectionInterface connectionInterface) {
        return new WebSocketAsyncConnection(endpoint, connectionInterface);
    }
}
