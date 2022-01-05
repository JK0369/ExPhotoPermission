//
//  PhotoPermissionManager.swift
//  ExPhotoPermission
//
//  Created by Jake.K on 2022/01/05.
//

import RxSwift
import RxCocoa
import Photos

class PhotoPermissionManager {
  static let shared = PhotoPermissionManager()
  private init() {}
  
  func requestPhoto() -> Observable<PHAuthorizationStatus> {
    Observable<PHAuthorizationStatus>.create { observable in
      PHPhotoLibrary.requestAuthorization {
        observable.onNext($0)
        observable.onCompleted()
      }
      return Disposables.create()
    }
  }
}
