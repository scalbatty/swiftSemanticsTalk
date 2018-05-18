
//: # Basic loading state representation
import Cocoa

final class UserDetailsViewController: NSViewController {
    var isLoading: Bool = false
    var error: UserLoadingError?
    var userDetails: UserDetails?

    func updateDisplay() {
        // In this the right order??
        if let userDetails = userDetails {
            displayUserDetails(userDetails)
        } else if isLoading {
            displayLoader()
        } else if let error = error {
            displayError(error)
        }
        // What does this mean if I get down there??
    }

    func displayUserDetails(_ userDetails: UserDetails) {}

    func displayError(_ error: Error) {}

    func displayLoader() {}
}

//: [Next](@next)
