import SwiftUI
import Firebase

@main
struct App: App {
    @StateObject var dataManager = DBManager

    init(){
        App.configure()
    }

    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
        }
    }
}