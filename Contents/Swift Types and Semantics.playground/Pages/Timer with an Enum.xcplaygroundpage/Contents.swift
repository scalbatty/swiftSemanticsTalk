//: [Previous](@previous)

//: # Timer with an Enum

import Foundation

//: * Has an editable ttl when stopped
//: * Has a fixed due date when running
//: * Has a fixed ttl when paused

final class ClockTimer {
    enum State {
        case stopped
        case paused(ttl: TimeInterval)
        case running(dueDate: Date)
    }

    var duration: TimeInterval
    var state: State

    init(defaultDuration: TimeInterval) {
        duration = defaultDuration
        state = .stopped
    }

    func start() {
        switch state {
        case .running: return // noop (should be a guard but Swift insists on getting all cases!)
        case let .stopped:
            startWithTTL(duration)
        case let .paused(ttl):
            startWithTTL(ttl)
        }
    }

    private func startWithTTL(_ ttl: TimeInterval) {
        // Should we check again here?
        state = .running(dueDate: Date().addingTimeInterval(ttl))
        // TODO: Also program the state change at the end
    }

    func stop() {
        switch state {
        case .stopped: return // noop
        case .paused, .running: state = .stopped
        }
    }

    func pause() {
        guard case let .running(dueDate) = state else { return }
        state = .paused(ttl: dueDate.timeIntervalSinceNow)
    }
}


func updateDisplay(timer: ClockTimer) {
    switch timer.state {
    case .stopped: break // Show editing interface
    case let .running(dueDate): break // show countdown
    case let .paused(ttl): break // show paused interface with ttl
    }
}

//: [Next](@next)
