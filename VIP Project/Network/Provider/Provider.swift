//
//  Provider.swift
//  VIP Project
//
//  Created by Victor on 06/02/2022.
//

import Foundation
import Moya
import Combine

protocol ClientProtocol {

    associatedtype Target
    func request<C: Codable>(_ target: Target) -> AnyPublisher<C, Error>

    /// Performs a network call.
    ///
    /// - Parameter target: the endpoint to which make the call.
    /// - Returns: AnyPublisher<Void, Error>
    func request(_ target: Target) -> AnyPublisher<Void, Error>

}

class MoyaClient<Target: TargetType>: ClientProtocol {

    private let provider: MoyaProvider<Target>
//    private let authManager: AuthManagerProtocol
    private let networkObserver: NetworkObserverProtocol

//    init(
////        authManager: AuthManagerProtocol,
//        networkObserver: NetworkObserverProtocol) {
//        self.networkObserver = networkObserver
////        self.authManager = authManager
//        provider = MoyaProvider<Target>(
//            endpointClosure: MoyaProvider<Target>.defaultEndpointMapping,
//            requestClosure: { (endpoint, completion) in
//                guard var request = try? endpoint.urlRequest() else {
//                    return completion(.failure(MoyaError.underlying(ClientError.unknownError, nil)))
//                }
//                request.timeoutInterval = 180
////                authManager
////                    .sign(request)
////                    .replaceError(with: request)
////                    .sink(receiveValue: { completion(.success($0)) })
//            },
//            stubClosure: MoyaProvider.neverStub,
//            callbackQueue: nil,
//            session: MoyaProvider<Target>.defaultAlamofireSession(),
//            plugins: [NetworkLoggerPlugin()],
//            trackInflights: false)
    init(networkObserver: NetworkObserverProtocol) {
        self.networkObserver = networkObserver
        
        let requestSession = MoyaProvider<Target>.defaultAlamofireSession()
        
        provider = MoyaProvider<Target>(session: requestSession,
                                        plugins: [])
    }

    func request<C>(_ target: Target) -> AnyPublisher<C, Error> where C: Decodable, C: Encodable {
        return Future { [provider, networkObserver] promise in
            guard networkObserver.isConnectedToInternet else {
                promise(.failure(ProviderError.noInternetConnection))
                return
            }

            provider.request(target) { response in
                switch response {
                case .success(let value):
                    promise((Result(catching: { try value.filterSuccessfulStatusCodes().map(C.self) })))
                case .failure(let err):
                    promise(.failure(err))
                }
            }
        }.eraseToAnyPublisher()
    }

    func request(_ target: Target) -> AnyPublisher<Void, Error> {
        return Future { [provider, networkObserver] promise in
            guard networkObserver.isConnectedToInternet else {
                promise(.failure(ProviderError.noInternetConnection))
                return
            }

            provider.request(target) { response in
                switch response {
                case .success(let value):
                    promise(Result(catching: { try value.filterSuccessfulStatusCodes() }))
                case .failure(let err):
                    promise(.failure(err))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
