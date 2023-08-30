// The Swift Programming Language
// https://docs.swift.org/swift-book

import DyLibRuntimeLoader
import AnimalInterface

@_cdecl("load_animal")
func load() -> UnsafeMutableRawPointer {
    dyLibCreator(factory: Dog(), forType: Animal.self)
}

struct Dog: Animal {
    func speak() -> String {
        "woof"
    }
}
