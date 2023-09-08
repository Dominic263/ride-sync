//
//  ControlsView.swift
//  
//
//  Created by DOMINIC NDONDO on 9/8/23.
//
import ComposableArchitecture
import SwiftUI

public struct ControlsView: View {
    
    public let store: StoreOf<ControlsFeature>
    
    public init(store: StoreOf<ControlsFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewStore in
            Text("Controls View")
        }
        
    }
}

struct ControlsView_Previews: PreviewProvider {
    static var previews: some View {
        ControlsView(
            store: Store(
                initialState: ControlsFeature.State()
            ){
                ControlsFeature()
            }
        )
    }
}
