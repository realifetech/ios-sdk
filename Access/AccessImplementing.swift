//
//  AccessImplementing.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/11.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation
#if !COCOAPODS
import GraphQL
#endif

public class AccessImplementing: Access {

    private let graphQLManager: GraphQLManageable

    init(graphQLManager: GraphQLManageable) {
        self.graphQLManager = graphQLManager
    }

    public func getMyTickets(pageSize: Int, completion: @escaping (Result<PaginatedObject<Ticket>, Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyTicketsQuery(pageSize: pageSize),
            cachePolicy: .returnCacheDataAndFetch
        ) { result in
            switch result {
            case .success(let response):
                let tickets = response.data?.getMyTickets?.edges?.compactMap {
                    Ticket(response: $0?.fragments.fragmentTicket)
                }
                let paginatedTickets = PaginatedObject<Ticket>(
                    items: tickets ?? [],
                    nextPage: response.data?.getMyTickets?.nextPage)
                completion(.success(paginatedTickets))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    public func getMyTicketById(id: Int, completion: @escaping (Result<Ticket, Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyTicketQuery(id: String(id)),
            cachePolicy: .returnCacheDataAndFetch) { result in
                switch result {
                case .success(let response):
                    guard let data = response.data,
                          let ticket = Ticket(response: data.getMyTicket?.fragments.fragmentTicket)
                    else {
                        return completion(.failure(GraphQLManagerError.noDataError))
                    }
                    completion(.success(ticket))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    public func getNextUpcomingTicket(completion: @escaping (Result<Ticket?, Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyTicketsQuery(
                pageSize: 1,
                filters: ApolloType.TicketFilter(
                    status: "active",
                    sessionDateAfter: "\(Date().startOfCurrentDay.twentyFourHourDateTimeStamp)"),
                order: ApolloType.TicketOrder(direction: "asc")),
            cachePolicy: .returnCacheDataAndFetch) { result in
                switch result {
                case .success(let response):
                    let tickets = response.data?.getMyTickets?.edges?.compactMap {
                        Ticket(response: $0?.fragments.fragmentTicket)
                    }
                    completion(.success(tickets?.first))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    public func getTicketAuths(completion: @escaping (Result<[TicketAuth], Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyTicketAuthsQuery(),
            cachePolicy: .fetchIgnoringCacheData) { result in
                switch result {
                case .success(let response):
                    guard let data = response.data else {
                        return completion(.failure(GraphQLManagerError.noDataError))
                    }
                    let ticketAuths = data.getMyTicketAuths?.compactMap {
                        TicketAuth(response: $0?.fragments.fragmentTicketAuth)
                    } ?? []
                    completion(.success(ticketAuths))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }

    public func getWalletPass(ticketId: String, completion: @escaping (Result<WalletPass?, Error>) -> Void) {
        graphQLManager.dispatch(
            query: ApolloType.GetMyTicketWalletPassQuery(ticketId: ticketId),
            cachePolicy: .returnCacheDataElseFetch
        ) { result in
                switch result {
                case .success(let response):
                    guard let data = response.data else {
                        return completion(.failure(GraphQLManagerError.noDataError))
                    }
                    let walletPass = WalletPass(response: data)
                    completion(.success(walletPass))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}
