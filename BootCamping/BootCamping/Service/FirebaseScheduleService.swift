//
//  FirebaseScheduleService.swift
//  BootCamping
//
//  Created by 박성민 on 2023/02/02.
//

import Combine

import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

enum FirebaseScheduleServiceError: Error {
    case badSnapshot
    case createScheduleError
    case deleteScheduleError
    
    var errorDescription: String? {
        switch self {
        case .badSnapshot:
            return "스케줄 가져오기 실패"
        case .createScheduleError:
            return "스케줄 추가 실패"
        case .deleteScheduleError:
            return "스케줄 삭제 실패"
        }
    }
}

struct FirebaseScheduleService {
    
    let database = Firestore.firestore()
    
    //MARK: - Read FirebaseScheduleService
    
    func readScheduleService() -> AnyPublisher<[Schedule], Error> {
        Future<[Schedule], Error> { promise in
            guard let userUID = Auth.auth().currentUser?.uid else { return }
            
            database.collection("UserList")
                .document(userUID)
                .collection("Schedule")
                .getDocuments { (snapshot, error) in
                    if let error = error {
                        print(error)
                        promise(.failure(FirebaseScheduleServiceError.badSnapshot))
                        return
                    }
                    
                    guard let snapshot = snapshot else {
                        promise(.failure(FirebaseScheduleServiceError.badSnapshot))
                        return
                    }
                    
                    var schedules = [Schedule]()
                    
                    for document in snapshot.documents {
                        
                        let docData = document.data()
                        
                        let id: String = docData["id"] as? String ?? ""
                        let title: String = docData["title"] as? String ?? ""
                        let date: String = docData["date"] as? String ?? ""
                        let color: String = docData["color"] as? String ?? ""
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd"
                        
                        let schedule: Schedule = Schedule(id: id, title: title, date: dateFormatter.date(from: date) ?? Date(), color: color)
                        schedules.append(schedule)
                    }
                    promise(.success(schedules))
                }
        }
        .eraseToAnyPublisher()
    }
    
    //MARK: - Create FirebaseScheduleService
    
    func createScheduleService(schedule: Schedule) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            guard let userUID = Auth.auth().currentUser?.uid else { return }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            self.database.collection("UserList")
                .document(userUID)
                .collection("Schedule")
                .document(schedule.id)
                .setData(["id": schedule.id,
                          "title": schedule.title,
                          "date": dateFormatter.string(from: schedule.date),
                          "color": schedule.color
                         ]) { error in
                    if let error = error {
                        print(error)
                        promise(.failure(FirebaseScheduleServiceError.createScheduleError))
                    } else {
                        promise(.success(()))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
    
    //MARK: - Delete FirebaseScheduleService
    
    func deleteScheduleService(schedule: Schedule) -> AnyPublisher<Void, Error> {
        Future<Void, Error> { promise in
            guard let userUID = Auth.auth().currentUser?.uid else { return }
            self.database.collection("UserList")
                .document(userUID)
                .collection("Schedule")
                .document(schedule.id).delete() { error in
                    if let error = error {
                        print(error)
                        promise(.failure(FirebaseScheduleServiceError.deleteScheduleError))
                    } else {
                        promise(.success(()))
                    }
                }
        }
        .eraseToAnyPublisher()
    }
}
