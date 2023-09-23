//
//  Dependencies.swift
//  
//  Setup for Dependencies 
//  Created by DOMINIC NDONDO on 9/23/23.
//

import Foundation
import MQTTNIO
import Logging
import NIOTransportServices
import ComposableArchitecture



/*
 func connect() async {
     do {
         _ = try await self.client.connect(cleanSession: view.serverDetails.cleanSession)
         self.client.addCloseListener(named: "EmCuTeeTee") { result in
             guard !self.shuttingDown else { return }
             Task {
                 await self.view.addMessage("Connection closed", now: true)
                 await self.view.addMessage("Reconnecting...", now: true)
                 await self.connect()
             }
         }
         await self.view.addMessage("Connection successful", now: true)
     } catch {
         await self.view.addMessage("Failed to connect\n\(error)", now: true)
     }
 }
 
 */
///MQTTDependencies controls the MQTT client
public struct MQTTDependencies {
    public static var client: MQTTClient? = nil
    public var connect: (ServerDetails) async -> Bool
}


//static let eventLoopGroup = NIOTSEventLoopGroup()

extension MQTTClient {
    
    //mock out a client connection
    static var mock = MQTTClient(
        host: "localhost",
        port: 1883,
        identifier: "dndond01",
        eventLoopGroupProvider: .createNew,
        logger: Logger(label: "MQTTLogger"),
        configuration: .init(
            version: .v3_1_1,
            useSSL: false,
            useWebSockets: false,
            webSocketURLPath: "/mqtt"
        )
    )
    
}
///extensions on the MQTTDependencies
extension MQTTDependencies: DependencyKey {
    public static var liveValue = Self (
     connect: { details in
         do {
             //set the client to the mock
             MQTTDependencies.client = .mock
             
                 _  = try await MQTTDependencies.client?.connect(cleanSession: true)
                 //try to secure a connection
             Task {
                 MQTTDependencies.client?.addCloseListener(named: "dndond01") { result in
                     //guard !self.shuttingDown else { return }
                 }
             }
         }
        catch {
               print("Failed to connect\n\(error)")
               return false
        }
         
         if ((MQTTDependencies.client?.isActive()) != nil) {
             return true
         }
         
         return false
     }
    )
}

//register the property to be accessed in reducer
extension DependencyValues {
    public var mqttClient: MQTTDependencies {
        get { self[MQTTDependencies.self]  }
        set { self[MQTTDependencies.self] = newValue }
    }
}
