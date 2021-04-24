//
//  Parsing.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation

struct Parsing<T> {
    let parse: (Data) throws -> T
    
    init(parse: @escaping (Data) throws -> T) {
        self.parse = parse
    }
    
    static func decodeJSON() -> Parsing where T: Decodable {
        Self { data in
            let decoded = try fromSnakeCaseDecoder.decode(
                T.self,
                from: data
            )
            return decoded
        }
    }
}

extension Parsing where T == Void {
    static var void: Parsing {
        Self { _ in () }
    }
}

extension Parsing where T == Data {
    static var none: Parsing {
        Self { $0 }
    }
}

let fromSnakeCaseDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()
