// The Swift Programming Language
// https://docs.swift.org/swift-book
import Foundation

public protocol Animal {
    init()
    func speak() -> String
}

open class AnimalClass: Animal {
    required public init() {}
    open func speak() -> String {
        fatalError("Child class must implement")
    }
}
