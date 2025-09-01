//
//  FierbaseProjectTests.swift
//  FierbaseProjectTests
//
//  Created by piotr koscielny on 1/9/25.
//

import Testing

import Testing
@testable import FierbaseProject

struct SignInAndLoginWithEmailViewModelTests {
    
    @Test
    func testCreateUserSuccess() async throws {
        let repository = AuthRepositoryMock()
        let viewModel = SingInWithEmailViewModel(repository: repository)
        viewModel.email = "test@test.com"
        viewModel.password = "password123"

        let user = try await viewModel.creatUser()
        
        #expect(user.uid == "123")
        #expect(user.email == "mock@test.com")
    }
    
    @Test
    func testCreateUserFailure() async {
        var repository = AuthRepositoryMock()
        repository.shouldThrowError = true
        let viewModel = SingInWithEmailViewModel(repository: repository)
        viewModel.email = "fail@test.com"
        viewModel.password = "pass"
        
        await #expect(throws: Error.self) {
            _ = try await viewModel.creatUser()
        }
    }
    
    @Test
    func testSignInUserSuccess() async throws {
        let repository = AuthRepositoryMock()
        let viewModel = LoginWithEmailViewModel(repository: repository)
        viewModel.email = "test@test.com"
        viewModel.password = "password123"

        let user = try await viewModel.loginUser()

        #expect(user.uid == "123")
    }
    
    @Test
    func testSignInUserFailure() async {
        var repository = AuthRepositoryMock()
        repository.shouldThrowError = true
        let viewModel = LoginWithEmailViewModel(repository: repository)
        viewModel.email = "fail@test.com"
        viewModel.password = "wrong"

        await #expect(throws: Error.self) {
            _ = try await viewModel.loginUser()
        }
    }
}
