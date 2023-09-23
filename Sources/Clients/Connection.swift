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
        
        public init(
            connected: Bool = false,
            displayMessage: String = "",
            messages: IdentifiedArrayOf<Message> = []
        ) {
            self.connected = connected
            self.displayMessage = displayMessage
            self.messages = messages
        }
    }
    
    public enum Action: Equatable {
        case connectButtonTapped
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .connectButtonTapped:
                return .none
            }
        }
    }
}






