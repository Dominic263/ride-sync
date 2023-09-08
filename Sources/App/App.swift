//
//  App.swift
//  
//
//  Created by DOMINIC NDONDO on 9/8/23.
//
import ComposableArchitecture
import Statistics
import Settings
import Dashboard
import Controls
import Foundation

public enum Tab: Identifiable {
    case settings
    case statistics
    public var id: Self { self }
}

public struct AppFeature: Reducer {
    public struct State: Equatable {
        @BindingState public var selectedTab: Tab
        public var statisticsState: StatisticsFeature.State = StatisticsFeature.State()
        public var settingsState: SettingsFeature.State = SettingsFeature.State()
        public var dashboardState: DashboardFeature.State = DashboardFeature.State()
        public var controlsState: ControlsFeature.State = ControlsFeature.State()
        
        public init(selectedTab: Tab = .statistics) {
            self.selectedTab = selectedTab
        }
    }
    
    public init() {}
    
    public enum Action: Equatable, BindableAction {
        case binding(BindingAction<State>)
        case settings(SettingsFeature.Action)
        case statistics(StatisticsFeature.Action)
        case dashboard(DashboardFeature.Action)
        case controls(ControlsFeature.Action)
    }
    
    public var body: some ReducerOf<Self> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .binding(_):
                return .none
            case .settings(_): //TODO - We will send delegate actions from the child here
                return .none
            case .statistics(_): //TODO - We will send delegate actions from the child here
                return .none
            case .dashboard(_):
                return .none
            case .controls(_):
                return .none
            }
        }
        
        Scope(state: \.settingsState, action: /Action.settings) {
            SettingsFeature()
        }
        
        Scope(state: \.statisticsState, action: /Action.statistics) {
            StatisticsFeature()
        }
        
        Scope(state: \.dashboardState, action: /Action.dashboard) {
            DashboardFeature()
        }
        
        Scope(state: \.controlsState, action: /Action.controls) {
            ControlsFeature()
        }
        
    }
}
