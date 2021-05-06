//
//  WebService.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import Foundation

protocol WebServiceCore {
    func performRequest(
        _ path: String,
        queue: DispatchQueue,
        completion: @escaping (Result<Void, Error>) -> Void
    )
    
    func performRequest<ParsedResponse>(
        _ path: String,
        responseParsing: Parsing<ParsedResponse>,
        queue: DispatchQueue,
        completion: @escaping (Result<ParsedResponse, Error>) -> Void
    )
}

extension WebServiceCore {
    func performRequest<ParsedResponse>(
        _ path: String,
        responseParsing: Parsing<ParsedResponse>,
        queue: DispatchQueue = .main,
        completion: @escaping (Result<ParsedResponse, Error>) -> Void
    ) {
        performRequest(
            path,
            responseParsing: responseParsing,
            queue: queue,
            completion: completion
        )
    }
    
    func performRequest(
        _ path: String,
        queue: DispatchQueue = .main,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        performRequest(path, queue: queue, completion: completion)
    }
}

class WebServiceCoreImp: WebServiceCore {
    private let session: URLSession
    private var dataTask: URLSessionDataTask?
        = nil
    
    init(
        session: URLSession = URLSession(configuration: .default)
    ) {
        self.session = session
    }
    
    func performRequest(
        _ path: String,
        queue: DispatchQueue,
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        return performRequest(
            path,
            responseParsing: .void,
            queue: queue,
            completion: completion
        )
    }

    func performRequest<ParsedResponse>(
        _ path: String,
        responseParsing: Parsing<ParsedResponse>,
        queue: DispatchQueue,
        completion: @escaping (Result<ParsedResponse, Error>) -> Void
    ) {
        let url = URL(string: path)!
        let request = URLRequest(url: url)
        peformDataRequest(request, queue: queue) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                do {
                    let model = try responseParsing.parse(data!)
                    completion(.success(model))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    }
    
    private func peformDataRequest(
        _ request: URLRequest,
        queue: DispatchQueue,
        completion: @escaping (Result<Data?, Error>) -> Void
    ) {
        dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                completion(.failure(error))
            } else {
                queue.async { completion(.success(data)) }
            }
        }
        
        dataTask?.resume()
    }
}
