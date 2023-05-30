//
//  BasePresenter.swift
//  New_Challenge
//
//  Created by Saad Saissi Hassani on 29/5/2023.
//

import Foundation

protocol UserListView : AnyObject {
    func listRetrievedOf(_ users: [UserListViewModel])
    func showMessageError(_ body: String)
}

class BasePresenter {
    
    private weak var view : UserListView?
    private var interactor = BaseInteractor()
    
    init(view: UserListView) {
        self.view = view
    }
    
    
    public func retrievedUsers(page : Int) {
        
        self.interactor.getUserListFromWS(page: page) { userList, error in
            
            if let error {
                self.view?.showMessageError(error.localizedDescription)
                return
            }
            
            if let userListResponse = userList?.userList {
                
                let users : [UserListViewModel] = userListResponse.map { [weak self] in self!.mapping(user: $0) }
                
                self.view?.listRetrievedOf(users)
                
            } else {
                self.view?.showMessageError("Some thing wrong happend try again")
            }
            
        }
    }
}


//MARK: Data Binding
extension BasePresenter {
   private func mapping(user: User) -> UserListViewModel {
        UserListViewModel(id: user.id,
                          name: "\(user.firstName) \(user.lastName)",
                          email: user.email,
                          avatarURL: user.avatar)
    }
}
