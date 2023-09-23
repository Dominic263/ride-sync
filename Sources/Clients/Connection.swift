//
//  Connection.swift
//  
//
//  Created by DOMINIC NDONDO on 9/22/23.
//
import Foundation
import MQTTNIO
import NIO
import Logging
import NIOTransportServices
import ComposableArchitecture

///Server Connection Reducer manages the connection made to MQTT brokers
public struct ServerConnection: Reducer {
    public init() {}
    
    public struct State: Equatable {
        public var connected: Bool
        public var displayMessage: String
        public var messages: IdentifiedArrayOf<Message>
        public var details: ServerDetails
        public var isConnected: Bool = false
        public var isConnecting: Bool = false
        public init(
            connected: Bool = false,
            displayMessage: String = "",
            messages: IdentifiedArrayOf<Message> = [], //TODO: check if this works compared to CircularBuffer
            details: ServerDetails = .mock,
            isConnected: Bool = false
        ) {
            self.connected = connected
            self.displayMessage = displayMessage
            self.messages = messages
            self.details = details
        }
    }
    
    public enum Action: Equatable {
        case connectButtonTapped
        case connectionResponse(Bool)
    }
    @Dependency(\.mqttClient) var client
    @Dependency(\.continuousClock) var clock //TODO: Allow some real time to pass before connection.
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .connectButtonTapped:
                state.isConnecting = true
                state.displayMessage = ""
                return .run { [state] send in
                    try await clock.sleep(for: .seconds(2))
                    await send(.connectionResponse(client.connect(state.details)))
                }
            case .connectionResponse(let bool):
                if(bool == true){
                    state.isConnected = true
                    state.displayMessage = "Connected Successfully."
                    state.isConnecting = false
                } else {
                    state.isConnected = false
                    state.isConnecting = false
                    state.displayMessage = "Connection Failed."
                }
                
                return .none
            }
        }
    }
}






