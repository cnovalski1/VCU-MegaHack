import SwiftUI
import Firebase

struct NewUserView: View {
    @EnvironmentObject var dataManager: DBManager
    @State private var newUser = ""
    var body: some View {
        VStack {
            TextField("User", text: $newUser)

            Button {
                dataManager.addUser(name: newUser)
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
}

struct NewUserView_Previews: PreviewProvider {
    static var previews: some View {
        NewUserView()
    }
}