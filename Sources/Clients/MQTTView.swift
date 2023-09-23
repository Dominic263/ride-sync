//
//  MQTTView.swift
//  
//
//  Created by DOMINIC NDONDO on 9/13/23.
//
import ComposableArchitecture
import SwiftUI
import UIExtensions

public struct MQTTView: View {
    public let store: StoreOf<ServerConnection>
    
    public init(
        store: StoreOf<ServerConnection>
    ){
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Spacer()
                Text("MESSAGE")
                    .font(.headline)
                    .padding()
                
                if(viewStore.isConnecting){
                    ProgressView()
                }
                Text(viewStore.displayMessage)
                    .font(.subheadline)
                    .padding()
                Spacer()
                Button(
                    action: {viewStore.send(.connectButtonTapped)}
                ) {
                    RoundedButtonView(
                        text: "connect",
                        image: "dot.radiowaves.left.and.right",
                        width: 120,
                        height: 60,
                        cornerRadius: 10,
                        foregroundColor: .mint,
                        imageColor: .blue,
                        textColor: .black
                    )
                }
                .buttonStyle(.plain)
                Spacer()
            }
        }
    }
}


struct ServerConnection_Previews: PreviewProvider {
    static var previews: some View {
        MQTTView(
            store: Store(
                initialState: ServerConnection.State()
            ){
                ServerConnection()
            }
        )
    }
}

