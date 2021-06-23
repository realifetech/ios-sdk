//
//  ProductRepositoryTests.swift
//  RealifeTechTests
//
//  Created by Mickey Lee on 23/06/2021.
//  Copyright © 2021 Realife Tech. All rights reserved.
//

import XCTest
import Apollo
@testable import RealifeTech

final class ProductRepositoryTests: XCTestCase {

    private func makeGraphQLManagerAndSUT<DataType>(
        ofType type: DataType.Type
    ) -> (graphQLManager: MockGraphQLManager<DataType>, sut: ProductRepository) {
        let graphQLManager = MockGraphQLManager<DataType>()
        let sut = ProductRepository(graphQLManager: graphQLManager)
        return (graphQLManager: graphQLManager, sut: sut)
    }

    private func makeProductFragment(id: String = "1") -> ApolloType.FragmentProduct {
        ApolloType.FragmentProduct(id: id)
    }
}

extension ProductRepositoryTests {

    func test_getProducts_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetProductsQuery.Data.self)

        let getProducts = ApolloType
            .GetProductsQuery
            .Data
            .GetProduct(edges: [], nextPage: 123)
        let data = ApolloType
            .GetProductsQuery
            .Data(getProducts: getProducts)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetProductsQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getProducts(
            pageSize: 1,
            page: 1,
            filters: nil
        ) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(
                returnedResponse.items.count,
                expectedResult.data?.getProducts?.edges?.count)
            XCTAssertEqual(
                returnedResponse.nextPage,
                expectedResult.data?.getProducts?.nextPage)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getProducts_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetProductsQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)
        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getProducts(
            pageSize: 1,
            page: 1,
            filters: nil
        ) { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getProductById_graphQLManagerHasData_completeWithSuccessCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetProductByIdQuery.Data.self)
        let productFragment = makeProductFragment()

        let getProduct = ApolloType
            .GetProductByIdQuery
            .Data
            .GetProduct(unsafeResultMap: [:])
        var data = ApolloType
            .GetProductByIdQuery
            .Data(getProduct: getProduct)
        data.getProduct?.fragments.fragmentProduct = productFragment
        let expectedResult = GraphQLResult<
            ApolloType
            .GetProductByIdQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getProductById(id: productFragment.id) { result in
            guard case let .success(returnedResponse) = result else {
                return XCTFail("This test should return success")
            }
            XCTAssertEqual(returnedResponse.id, productFragment.id)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getProductById_graphQLManagerHasNoData_completeWithNoDataErrorCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetProductByIdQuery.Data.self)

        let data = ApolloType
            .GetProductByIdQuery
            .Data(getProduct: nil)
        let expectedResult = GraphQLResult<
            ApolloType
            .GetProductByIdQuery
            .Data>(
            data: data,
            extensions: nil,
            errors: nil,
            source: .cache,
            dependentKeys: nil)
        graphQLManager.resultReturns = .success(expectedResult)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getProductById(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? GraphQLManagerError, GraphQLManagerError.noDataError)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }

    func test_getProductById_graphQLManagerReturnsError_completeWithFailureCase() {
        let (graphQLManager, sut) = makeGraphQLManagerAndSUT(ofType: ApolloType.GetProductByIdQuery.Data.self)

        graphQLManager.resultReturns = .failure(DummyError.failure)

        let expectation = XCTestExpectation(description: "callback is fulfilled")
        sut.getProductById(id: "1") { result in
            guard case let .failure(returnedError) = result else {
                return XCTFail("This test should return failure")
            }
            XCTAssertEqual(returnedError as? DummyError, DummyError.failure)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.01)
    }
}
