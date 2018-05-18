//: [Previous](@previous)

//: # Enum-based loading state representation
import Cocoa

final class UserDetailsViewController: NSViewController {
    private enum State {
        case loading
        case error(UserLoadingError)
        case success(UserDetails)
    }

    private var state: State = .loading // What value to get on init??

    func updateDisplay() {
        switch state {
        case let .success(userDetails):
            displayUserDetails(userDetails)
        case .loading:
            displayLoader()
        case let .error(error):
            displayError(error)
        }
    }

    func displayUserDetails(_ userDetails: UserDetails) {}

    func displayError(_ error: Error) {}

    func displayLoader() {}
}

//: ### Loading state can even be made generic

enum LoadingState<T, E> {
    case loading
    case error(E)
    case success(T)
}

//: [Next](@next)
