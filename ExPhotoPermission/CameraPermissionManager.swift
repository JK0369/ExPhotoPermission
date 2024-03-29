//
//  CameraPermissionManager.swift
//  ExPhotoPermission
//
//  Created by Jake.K on 2022/01/05.
//

import RxSwift
import RxCocoa
import AVFoundation

class CameraPermissionManager {
  static let shared = CameraPermissionManager()
  
  func requestCamera(mediaType: AVMediaType = .video) -> Observable<Bool> {
    Observable<Bool>.create { observable in
      AVCaptureDevice.requestAccess(for: mediaType) { isGranted in
        DispatchQueue.main.async {
          observable.onNext(isGranted)
          observable.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}
