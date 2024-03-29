//
//  FirebaseCampingSpotService.swift
//  BootCamping
//
//  Created by Donghoon Bae on 2023/02/03.
//

import Combine

import Firebase
import FirebaseFirestore

enum FirebaseCampingSpotServiceError: Error {
    case badSnapshot
    case updateCampingSpotError
    
    var errorDescription: String? {
        switch self {
        case .badSnapshot:
            return "캠핑장리스트 가져오기 실패"
        case .updateCampingSpotError:
            return "캠핑장리스트 업데이트 실패"
        }
    }
}

//MARK: - 캠핑장 리스트 페이지네이션에 필요한 구조체

struct ReadDocuments {
    var campingSpots: [CampingSpot]?
    //addr1
    var campingSpotLocation: [String] = []
    //lctCl
    var campingSpotView: [String] = []
    //facltNm
    var campingSpotName: String = ""
    //contentId
    var campingSpotContenId: [String] = []
    //addr1
    var campingSpotAddr: String = ""
    
    var lastDoc: QueryDocumentSnapshot?
}

//MARK: - 캠핑장 리스트 불러오기 위한 컴바인 서비스

struct FirebaseCampingSpotService {
    
    let database = Firestore.firestore()
    
    func readCampingSpotService(readDocument: ReadDocuments) -> AnyPublisher<ReadDocuments, Error> {
        Future<ReadDocuments, Error> { promise in
            //MARK: - 최초 read
            if readDocument.lastDoc == nil {
                
                //MARK: - 최초 캠핑장 위치로 read
                
                if readDocument.campingSpotLocation != [] {
                    database.collection("CampingSpotList")
                        .whereField("doNm", in: readDocument.campingSpotLocation)
                        .order(by: "contentId", descending: false)
                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                        }
                }
                
                //MARK: - 최초 캠핑장 전망으로 read
                
                if readDocument.campingSpotView != [] {
                    database.collection("CampingSpotList")
                        .whereField("lctCl", isGreaterThanOrEqualTo: "\(readDocument.campingSpotView.first!)")
                        .whereField("lctCl", isLessThan: "\u{f8ff}" + "\(readDocument.campingSpotView.first!)" + "\u{f8ff}")
                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                        }
                }
                
                //MARK: - 최초 캠핑장 이름으로 read
                
                if readDocument.campingSpotName != "" {
                    database.collection("CampingSpotList")
                        .whereField("facltNm", isGreaterThanOrEqualTo: "\(readDocument.campingSpotName)")
                        .whereField("facltNm", isLessThan: "\u{f8ff}" + "\(readDocument.campingSpotName)" + "\u{f8ff}")
                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                        }
                }
                
                //MARK: - 최초 캠핑장 아이디로 read
                
                if readDocument.campingSpotContenId != [] {
                    database.collection("CampingSpotList")
                        .whereField("contentId", in: readDocument.campingSpotContenId)
                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                        }
                }
                
                //MARK: - 최초 캠핑장 주소로 read
                
                if readDocument.campingSpotAddr != "" {
                    database.collection("CampingSpotList")
                        .whereField("addr1", isGreaterThanOrEqualTo: "\(readDocument.campingSpotAddr)")
                        .whereField("addr1", isLessThan: "\u{f8ff}" + "\(readDocument.campingSpotAddr)" + "\u{f8ff}")
                    //                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                                print("##############################FIRST##################################")
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                        }
                }
                
                //MARK: - 페이지네이션에서 쓰이는 read
                
            } else {
                
                //MARK: - 페이지네이션에서 캠핑장 위치로 read
                
                if readDocument.campingSpotLocation != [] {
                    database.collection("CampingSpotList")
                        .whereField("doNm", in: readDocument.campingSpotLocation)
                        .order(by: "contentId", descending: false)
                        .start(afterDocument: readDocument.lastDoc!)
                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                        }
                }
                
                //MARK: - 페이지네이션에서 캠핑장 전망으로 read
                
                if readDocument.campingSpotView != [] {
                    database.collection("CampingSpotList")
                        .whereField("lctCl", isGreaterThanOrEqualTo: "\(readDocument.campingSpotView.first!)")
                        .whereField("lctCl", isLessThan: "\u{f8ff}" + "\(readDocument.campingSpotView.first!)" + "\u{f8ff}")
                        .start(afterDocument: readDocument.lastDoc!)
                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                            
                        }
                }
                
                //MARK: - 페이지네이션에서 캠핑장 이름으로 read
                
                if readDocument.campingSpotName != "" {
                    database.collection("CampingSpotList")
                        .whereField("facltNm", isGreaterThanOrEqualTo: "\(readDocument.campingSpotName)")
                    //                        .whereField("facltNm", isLessThan: "\(readDocument.campingSpotName)" + "\u{f8ff}")
                        .whereField("facltNm", isLessThan: "\u{f8ff}" + "\(readDocument.campingSpotName)" + "\u{f8ff}")
                        .start(afterDocument: readDocument.lastDoc!)
                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                        }
                }
                
                //MARK: - 페이지네이션에서 캠핑장 아이디로 read
                
                if readDocument.campingSpotContenId != [] {
                    database.collection("CampingSpotList")
                        .whereField("contentId", in: readDocument.campingSpotContenId)
                        .start(afterDocument: readDocument.lastDoc!)
                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                        }
                }
                
                //MARK: - 페이지네이션에서 캠핑장 주소로 read
                
                if readDocument.campingSpotAddr != "" {
                    database.collection("CampingSpotList")
                        .whereField("addr1", isGreaterThanOrEqualTo: "\(readDocument.campingSpotAddr)")
                        .whereField("addr1", isLessThan: "\u{f8ff}" + "\(readDocument.campingSpotAddr)" + "\u{f8ff}")
                        .start(afterDocument: readDocument.lastDoc!)
                        .limit(to: 10)
                        .getDocuments { snapshot, error in
                            if let error = error {
                                promise(.failure(error))
                                return
                            }
                            guard let snapshot = snapshot else {
                                promise(.failure(FirebaseCampingSpotServiceError.badSnapshot))
                                return
                            }
                            
                            var readDocument: ReadDocuments = ReadDocuments()
                            var campingSpots: [CampingSpot] = []
                            
                            campingSpots = snapshot.documents.map { docData in
                                return CampingSpot(
                                    contentId: docData["contentId"] as? String ?? "",
                                    facltNm: docData["facltNm"] as? String ?? "",
                                    lineIntro: docData["lineIntro"] as? String ?? "",
                                    intro: docData["intro"] as? String ?? "",
                                    allar: docData["allar"] as? String ?? "",
                                    insrncAt: docData["insrncAt"] as? String ?? "",
                                    trsagntNo: docData["trsagntNo"] as? String ?? "",
                                    bizrno: docData["bizrno"] as? String ?? "",
                                    facltDivNm: docData["facltDivNm"] as? String ?? "",
                                    mangeDivNm: docData["mangeDivNm"] as? String ?? "",
                                    mgcDiv: docData["mgcDiv"] as? String ?? "",
                                    manageSttus: docData["manageSttus"] as? String ?? "",
                                    hvofBgnde: docData["hvofBgnde"] as? String ?? "",
                                    hvofEnddle: docData["hvofEnddle"] as? String ?? "",
                                    featureNm: docData["featureNm"] as? String ?? "",
                                    induty: docData["induty"] as? String ?? "",
                                    lctCl: docData["lctCl"] as? String ?? "",
                                    doNm: docData["doNm"] as? String ?? "",
                                    sigunguNm: docData["sigunguNm"] as? String ?? "",
                                    zipcode: docData["zipcode"] as? String ?? "",
                                    addr1: docData["addr1"] as? String ?? "",
                                    addr2: docData["addr2"] as? String ?? "",
                                    mapX: docData["mapX"] as? String ?? "",
                                    mapY: docData["mapY"] as? String ?? "",
                                    direction: docData["direction"] as? String ?? "",
                                    tel: docData["tel"] as? String ?? "",
                                    homepage: docData["homepage"] as? String ?? "",
                                    resveUrl: docData["resveUrl"] as? String ?? "",
                                    resveCl: docData["resveCl"] as? String ?? "",
                                    manageNmpr: docData["manageNmpr"] as? String ?? "",
                                    gnrlSiteCo: docData["gnrlSiteCo"] as? String ?? "",
                                    autoSiteCo: docData["autoSiteCo"] as? String ?? "",
                                    glampSiteCo: docData["glampSiteCo"] as? String ?? "",
                                    caravSiteCo: docData["caravSiteCo"] as? String ?? "",
                                    indvdlCaravSiteCo: docData["indvdlCaravSiteCo"] as? String ?? "",
                                    sitedStnc: docData["sitedStnc"] as? String ?? "",
                                    siteMg1Width: docData["siteMg1Width"] as? String ?? "",
                                    siteMg2Width: docData["siteMg2Width"] as? String ?? "",
                                    siteMg3Width: docData["siteMg3Width"] as? String ?? "",
                                    siteMg1Vrticl: docData["siteMg1Vrticl"] as? String ?? "",
                                    siteMg2Vrticl: docData["siteMg2Vrticl"] as? String ?? "",
                                    siteMg3Vrticl: docData["siteMg3Vrticl"] as? String ?? "",
                                    siteMg1Co: docData["siteMg1Co"] as? String ?? "",
                                    siteMg2Co: docData["siteMg2Co"] as? String ?? "",
                                    siteMg3Co: docData["siteMg3Co"] as? String ?? "",
                                    siteBottomCl1: docData["siteBottomCl1"] as? String ?? "",
                                    siteBottomCl2: docData["siteBottomCl2"] as? String ?? "",
                                    siteBottomCl3: docData["siteBottomCl3"] as? String ?? "",
                                    siteBottomCl4: docData["siteBottomCl4"] as? String ?? "",
                                    siteBottomCl5: docData["siteBottomCl5"] as? String ?? "",
                                    tooltip: docData["tooltip"] as? String ?? "",
                                    glampInnerFclty: docData["glampInnerFclty"] as? String ?? "",
                                    caravInnerFclty: docData["caravInnerFclty"] as? String ?? "",
                                    prmisnDe: docData["prmisnDe"] as? String ?? "",
                                    operPdCl: docData["operPdCl"] as? String ?? "",
                                    operDeCl: docData["operDeCl"] as? String ?? "",
                                    trlerAcmpnyAt: docData["trlerAcmpnyAt"] as? String ?? "",
                                    caravAcmpnyAt: docData["caravAcmpnyAt"] as? String ?? "",
                                    toiletCo: docData["toiletCo"] as? String ?? "",
                                    swrmCo: docData["swrmCo"] as? String ?? "",
                                    wtrplCo: docData["wtrplCo"] as? String ?? "",
                                    brazierCl: docData["brazierCl"] as? String ?? "",
                                    sbrsCl: docData["sbrsCl"] as? String ?? "",
                                    sbrsEtc: docData["sbrsEtc"] as? String ?? "",
                                    posblFcltyCl: docData["posblFcltyCl"] as? String ?? "",
                                    posblFcltyEtc: docData["posblFcltyEtc"] as? String ?? "",
                                    clturEventAt: docData["clturEventAt"] as? String ?? "",
                                    clturEvent: docData["clturEvent"] as? String ?? "",
                                    exprnProgrmAt: docData["exprnProgrmAt"] as? String ?? "",
                                    exprnProgrm: docData["exprnProgrm"] as? String ?? "",
                                    extshrCo: docData["extshrCo"] as? String ?? "",
                                    frprvtWrppCo: docData["frprvtWrppCo"] as? String ?? "",
                                    frprvtSandCo: docData["frprvtSandCo"] as? String ?? "",
                                    fireSensorCo: docData["fireSensorCo"] as? String ?? "",
                                    themaEnvrnCl: docData["themaEnvrnCl"] as? String ?? "",
                                    eqpmnLendCl: docData["eqpmnLendCl"] as? String ?? "",
                                    animalCmgCl: docData["animalCmgCl"] as? String ?? "",
                                    tourEraCl: docData["tourEraCl"] as? String ?? "",
                                    firstImageUrl: docData["firstImageUrl"] as? String ?? "",
                                    createdtime: docData["createdtime"] as? String ?? "",
                                    modifiedtime: docData["modifiedtime"] as? String ?? ""
                                )
                            }
                            
                            if snapshot.documents.count > 0 {
                                readDocument.lastDoc = snapshot.documents.last!
                                readDocument.campingSpots = campingSpots
                                promise(.success(readDocument))
                            } else {
                                promise(.failure(FirebaseCampingSpotServiceError.updateCampingSpotError))
                            }
                        }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
