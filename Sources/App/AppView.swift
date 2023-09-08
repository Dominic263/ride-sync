//
//  AppView.swift
//  
//
//  Created by DOMINIC NDONDO on 9/8/23.
//
import ComposableArchitecture
import Statistics
import Dashboard
import Settings
import Controls
import SwiftUI

public struct AppView: View {
    
    public let store: StoreOf<AppFeature>
    
    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: { $0 } ) { viewStore in
            TabView(selection: viewStore.$selectedTab) {
                
                DashboardView(
                    store: self.store.scope(
                        state: \.dashboardState,
                        action: {.dashboard($0)}
                    )
                )
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                
                //Statistics View
                ControlsView(
                    store: self.store.scope(
                        state: \.controlsState,
                        action: { .controls($0) }
                    )
                )
                .tabItem {
                    VStack {
                        Image(systemName: "antenna.radiowaves.left.and.right")
                        Text("Connect")
                    }
                }
                .tag(Tab.statistics)
                
                //Settings View
                SettingsView(
                    store: self.store.scope(
                        state: \.settingsState,
                        action: { .settings($0) }
                    )
                )
                .tabItem {
                    VStack {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                }
                .tag(Tab.settings)
                
                //Statistics View
                StatisticsView(
                    store: self.store.scope(
                        state: \.statisticsState,
                        action: { .statistics($0) }
                    )
                )
                .tabItem {
                    VStack {
                        Image(systemName: "chart.bar")
                        Text("Statistics")
                    }
                }
                .tag(Tab.statistics)
                
                
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(
            store: Store(
                initialState: AppFeature.State()) {
                    AppFeature()
                }
        )
    }
}
