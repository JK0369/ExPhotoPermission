//
//  ViewController.swift
//  ExPhotoPermission
//
//  Created by Jake.K on 2022/01/05.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func didTapPhotoPermissionButton(_ sender: Any) {
    PhotoPermissionManager.shared.requestPhoto()
      .bind { print($0) }
      .disposed(by: self.disposeBag)
  }
  
  @IBAction func didTapCameraPermissionButton(_ sender: Any) {
    CameraPermissionManager.shared.requestCamera()
      .bind { print($0) }
      .disposed(by: self.disposeBag)
  }
}
