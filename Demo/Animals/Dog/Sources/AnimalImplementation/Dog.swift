// The Swift Programming Language
// https://docs.swift.org/swift-book

import DyLibRuntimeLoader
import AnimalInterface

@_cdecl("load_animal")
func load() -> UnsafeMutableRawPointer {
    dyLibCreator(factory: Dog(), forType: Animal.self)
}

class Dog: AnimalClass {
    required init() {}
    override func speak() -> String {
        "woof"
    }
}
