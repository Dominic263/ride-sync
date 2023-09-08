//
//  StatisticsView.swift
//  
//
//  Created by DOMINIC NDONDO on 9/8/23.
//
import ComposableArchitecture
import SwiftUI

public struct StatisticsView: View {
    
    public let store: StoreOf<StatisticsFeature>
    
    public init(store: StoreOf<StatisticsFeature>) {
        self.store = store
    }
    
    public var body: some View {
        Text("Statistics View")
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView(
            store: Store(
                initialState: StatisticsFeature.State()){
                    StatisticsFeature()
                }
        )
    }
}
