//
//  APIClient.swift
//  Stockholm
//
//  Created by Daniil Sentsov on 15.02.2021.
//

import Foundation

class APIClient {
    
    class func getRequest<T: Decodable>(route: Route, _ completion: @escaping ValueClosure<Result<T>>) {
        guard let request: URLRequest = route.request else {
            completion(.failure(CustomError(description: R.string.localizable.errorUrl_empty())))
            return
        }
        let task = smartDataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(CustomError(description: R.string.localizable.errorData_null())))
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .iso8601custom
            guard let json = try? JSONSerialization.jsonObject(with: data) else {
                completion(.failure(CustomError.parsingError))
                return
            }
            let responseObject = (json as? [String: Any])?["data"]
            let errorObject = (json as? [String: Any])
            
            if let jsonObject = responseObject, let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed) {
                do {
                    completion(.success(try decoder.decode(T.self, from: data)))
                } catch let err {
                    completion(.failure(err))
                }
            } else if let jsonObject = errorObject, let data = try? JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed) {
                do {
                    let serverError = try JSONDecoder().decode(ServerError.self, from: data)
                    completion(.failure(CustomError(description: serverError.message)))
                } catch let err {
                    completion(.failure(err))
                }
            } else {
                completion(.failure(CustomError(description: R.string.localizable.errorError_message_empty())))
            }
        })
        task.resume()
    }
    
    class func smartDataTask(with request: URLRequest, completionHandler: @escaping ValueClosure<(Data?, URLResponse?, Error?)>) -> URLSessionDataTask {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 10.0
        let session = URLSession(configuration: sessionConfig)
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            completionHandler((data, response, error))
        })
        return task
    }
    
}
