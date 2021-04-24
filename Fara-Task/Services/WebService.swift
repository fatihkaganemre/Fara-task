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
        completion: @escaping (Result<Void, Error>) -> Void
    )
    
    func performRequest<ParsedResponse>(
        _ path: String,
        responseParsing: Parsing<ParsedResponse>,
        completion: @escaping (Result<ParsedResponse, Error>) -> Void
    )
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
        completion: @escaping (Result<Void, Error>) -> Void
    ) {
        return performRequest(
            path,
            responseParsing: .void,
            completion: completion
        )
    }

    func performRequest<ParsedResponse>(
        _ path: String,
        responseParsing: Parsing<ParsedResponse>,
        completion: @escaping (Result<ParsedResponse, Error>) -> Void
    ) {
        let url = URL(string: path)!
        let request = URLRequest(url: url)
        peformDataRequest(request) { result in
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
        _ completion: @escaping (Result<Data?, Error>) -> Void
    ) {
        dataTask = session.dataTask(with: request) { [weak self] data, response, error in
            defer {
                self?.dataTask = nil
            }
            
            if let error = error {
                completion(.failure(error))
            } else {
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            }
        }
        
        dataTask?.resume()
    }
}
