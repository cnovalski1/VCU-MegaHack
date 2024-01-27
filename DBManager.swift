//
// This provides the code for setting up the app database.
//
//

import Foundation
import Firebase

class DBManager: ObservableObject {
    @Published var users: [User] = []

    init() {
        fetchUsers()
    }

    func fetchUsers() {
        users.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Users")
        ref.getDocuments { snapshot, error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents {
                    let data = document.data()

                    let id = data["id"] as? String?? ""
                    let user = User(id: id, name: name)
                    self.users.append(user)
                }
            }
        }
    }

    func addUser(name: String){
        let db = Firestore.firestore()
        let ref = db.collection("Users").document(name)
        ref.setData(["name": name, "id": 10]) {error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    }


