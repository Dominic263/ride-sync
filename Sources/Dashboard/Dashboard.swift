//
//  Dashboard.swift
//  
//
//  Created by DOMINIC NDONDO on 9/8/23.
//

import ComposableArchitecture
import Foundation

public struct DashboardFeature: Reducer {
    public struct State: Equatable {
        public init() {}
    }
    
    public enum Action: Equatable {
        case none
    }
    
    public init() {}
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .none:
                return .none
            }
        }
    }
}
