//: [Previous](@previous)

//: # Timer with Bools and Optionals

import Foundation

//: * Has an editable ttl when stopped
//: * Has a fixed due date when running
//: * Has a fixed ttl when paused

final class ClockTimer {
    var duration: TimeInterval
    var pausedTTL: TimeInterval?
    var dueDate: Date?

    init(defaultDuration: TimeInterval) {
        duration = defaultDuration
    }

    func start() {
        guard dueDate == nil else { return } // Already running -> noop
        let ttl: TimeInterval

        if let pausedTTL = pausedTTL { // isPaused
            ttl = pausedTTL
        } else {
            ttl = duration
        }
        // Keeping the state valid
        pausedTTL = nil
        dueDate = Date().addingTimeInterval(ttl)
        // TODO: Also program the state change at the end
    }

    func stop() {
        // Keeping the state valid
        pausedTTL = nil
        dueDate = nil
    }

    func pause() {
        // The only valid state to pause is when running
        guard pausedTTL == nil else { return } // Already paused
        guard let dueDate = dueDate else { fatalError("Invalid state") } // Neither paused, stopped or running??

        // Keeping the state valid
        pausedTTL = dueDate.timeIntervalSinceNow
        self.dueDate = nil
    }
}

// Not the tick-timer update, just called on user interaction
func updateDisplay(timer: ClockTimer) {
    if let dueDate = timer.dueDate {
        // running, should display the countdown (calculated ttl)
    } else if let pausedTTL = timer.pausedTTL {
        // Paused, should display the ttl
    } else {
        // stopped, should display an editing interface to change ttl
    }
}

//: [Next](@next)
