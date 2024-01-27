import SwiftUI
import FireBase

@State private var email = ""
@State private var password = ""
@State private var userIsLoggedIn = false

// Cut out var body code, create this code and paste into.
var body: some View {
    if userIsLoggedIn {
        ListView()
    } else {
        content
    }
}

var content: some View {
    // here is where you put all your design code
}

// Below is code to put below .frame
// Move from login screen.
.onAppear {
    Auth.auth().addStateDidChangeListener {
        auth, user in
        if user != nil {
            userIsLoggedIn.toggle()
        }
    }
}

// Below are the login/register functions.

// login function
func login() {
    Auth.auth().signIn(withEmail: email, password: password) { result, error in
        if error != nil{
            print(error!.localizedDescription)
        }
    }
}

// Register function.
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }