//
//  DashboardView.swift
//  
//
//  Created by DOMINIC NDONDO on 9/8/23.
//
import ComposableArchitecture
import SwiftUI

public struct DashboardView: View {
    public let store: StoreOf<DashboardFeature>
    
    public init(store: StoreOf<DashboardFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text("Dashboard View")
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(
            store: Store(
                initialState: DashboardFeature.State()){
                DashboardFeature()
            }
        )
    }
}
