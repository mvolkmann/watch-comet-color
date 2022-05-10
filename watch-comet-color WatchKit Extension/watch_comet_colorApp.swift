//
//  watch_comet_colorApp.swift
//  watch-comet-color WatchKit Extension
//
//  Created by Mark Volkmann on 5/10/22.
//

import SwiftUI

@main
struct watch_comet_colorApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
