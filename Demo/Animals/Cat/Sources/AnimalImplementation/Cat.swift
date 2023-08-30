// The Swift Programming Language
// https://docs.swift.org/swift-book

import DyLibRuntimeLoader
import AnimalInterface

@_cdecl("load_animal")
func load() -> UnsafeMutableRawPointer {
    dyLibCreator(factory: Cat(), forType: Animal.self)
}

struct Cat: Animal {
    func speak() -> String {
        "meow"
    }
}
