//
//  Models.swift
//  
//  This file contains the source for Models related to client-broker connection
//  Created by DOMINIC NDONDO on 9/22/23.
//
import MQTTNIO
import Foundation

///ServerDetails defines the settings that the user sets for a broker connection.
public struct ServerDetails {
    public let identifier: String
    public let hostname: String
    public let port: Int
    public let version: MQTTClient.Version
    public let cleanSession: Bool
    public let useTLS: Bool
    public let useWebSocket: Bool
    public let webSocketUrl: String
    public let username: String?
    public let password: String?
}

///This struct represents the message being received from the broker.
public struct Message: Identifiable, Equatable {
    public let string: String
    public let id: UUID
    public init(string: String, id: UUID) {
        self.string = string
        self.id = id
    }
}
