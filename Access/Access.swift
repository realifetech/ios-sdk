//
//  Access.swift
//  RealifeTech
//
//  Created by YOU-HSUAN YU on 2023/1/11.
//  Copyright © 2023 Realife Tech. All rights reserved.
//

import Foundation

public protocol Access {
    func getMyTickets(pageSize: Int, completion: @escaping (Result<PaginatedObject<Ticket>, Error>) -> Void)
    func getMyTicketById(id: Int, completion: @escaping (Result<Ticket, Error>) -> Void)
    func getUpcomingTicket(completion: @escaping (Result<Ticket?, Error>) -> Void)
    func getTicketAuths(completion: @escaping (Result<[TicketAuth], Error>) -> Void)
    func getWalletPass(ticketId: String, completion: @escaping (Result<WalletPass?, Error>) -> Void)
}
