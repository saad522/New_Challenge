//
//  UserListVC.swift
//  New_Challenge
//
//  Created by Saad Saissi Hassani on 29/5/2023.
//

import UIKit

class UserListVC: UIViewController {

    //MARK: Properties -
    private var cellID = "UserListViewCellID"
    private var rowHeight : CGFloat = 80
    
    private var users = [UserListViewModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tv_userListTv.reloadData()
            }
        }
    }
    
    private var presenter : BasePresenter?
    private lazy var imageService = ImageService()
    private var max : Int = 6
    private var currentPage : Int = 1
    var avatarImage : UIImage!
    //MARK: Outlets -
    @IBOutlet weak var tv_userListTv: UITableView!
    
    //MARK: Init Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        creatUI()
    }


    //MARK: Actions -
}

//MARK: Implementation of UITableViewDelegate & UITableViewDataSource methods
extension UserListVC: UITableViewDelegate & UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { users.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! UserListViewCell
        let user = self.users[indexPath.row]
        cell.user = user
        cell.imageRequest = imageService.imageData(url: URL(string: user.avatarURL)!, completion: { data, error in
            if let error {
                self.showMessageError(error.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                guard let data else {return}
                cell.img_userPhoto.image = UIImage(data: data)
            }
        })
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { self.rowHeight }
    func creatUI() {
        ///Calling ws
        self.presenter = BasePresenter(view: self)
        self.getUsers()
        
        tv_userListTv.delegate = self
        tv_userListTv.dataSource = self
        let nibName = UINib(nibName: "UserListViewCell", bundle: nil)
        tv_userListTv.register(nibName, forCellReuseIdentifier: cellID)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        loadPage(by: indexPath)
    }
    
    func loadPage(by indexPath: IndexPath) {
        let cellPage = (indexPath.row + 1) / max + 1
        if cellPage >= 2 && cellPage > currentPage {
            self.getUsers(with: cellPage)
            currentPage = cellPage
        }
        
    }
    
    func getUsers(with page : Int = 1) {
        self.presenter?.retrievedUsers(page: page)
    }
}


extension UserListVC : UserListView {
    func showMessageError(_ body: String) {
        print("\(body)")
    }
    
    func listRetrievedOf(_ users: [UserListViewModel]) {
        self.users.append(contentsOf: users)
    }
}
