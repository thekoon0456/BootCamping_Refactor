//
//  ContentView.swift
//  BootCamping
//
//  Created by Deokhun KIM on 2023/01/17.
//

import SwiftUI

import FirebaseAuth
import FirebaseAnalytics

struct ContentView: View {
    //로그인 유무 변수
    @AppStorage("login") var isSignIn: Bool = false
    @AppStorage("_isFirstLaunching") var isFirstLaunching: Bool = true
    
    //탭뷰 화면전환 셀렉션 변수
    @EnvironmentObject var tabSelection: TabSelector
    @EnvironmentObject var diaryStore: DiaryStore
    @EnvironmentObject var wholeAuthStore: WholeAuthStore
    @EnvironmentObject var scheduleStore: ScheduleStore
    @EnvironmentObject var blockedUserStore: BlockedUserStore
    @EnvironmentObject var localNotificationCenter: LocalNotificationCenter
    @EnvironmentObject var reportStore: ReportStore
    
    //로딩 중 로딩 뷰
    @State var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            if isLoading {
                SplashScreenView().transition(.identity).zIndex(1)
            }
            
            if isSignIn {
                TabView(selection: $tabSelection.screen) {
                    Group {
                        //MARK: - 첫번째 홈탭
                        NavigationStack {
                            HomeView()
                        }.tabItem {
                            Label("메인", systemImage: "tent")
                        }.tag(TabViewScreen.one)
                        
                        //MARK: - 두번째 캠핑장 탭
                        NavigationStack {
                            SearchCampingSpotView()
                        }.tabItem {
                            Label("캠핑장 검색", systemImage: "magnifyingglass")
                        }.tag(TabViewScreen.two)
                        
                        //MARK: -세번째 캠핑노트 탭
                        NavigationStack {
                            if diaryStore.myDiaryUserInfoDiaryList.count == 0 {
                                DiaryEmptyView()
                            } else {
                                MyCampingDiaryView()
                            }
                        }.tabItem {
                            Label("내 캠핑노트", systemImage: "book")
                        }.tag(TabViewScreen.three)
                        
                        //MARK: - 네번째 마이페이지 탭
                        NavigationStack {
                            MyPageView()
                        }.tabItem {
                            Label("마이 페이지", systemImage: "person")
                        }.tag(TabViewScreen.four)
                    }
                    .onAppear {
                        if wholeAuthStore.currentUser != nil {
                            diaryStore.firstGetMyDiaryCombine()
                            diaryStore.mostLikedGetDiarysCombine()
                            diaryStore.firstGetRealTimeDiaryCombine()
                            scheduleStore.readScheduleCombine()
                            reportStore.readReportCombine()
                            //For Googole Analystic
                            Analytics.logEvent(
                                AnalyticsEventLogin,
                                parameters:
                                    ["LoginEmail": "\(String(describing: Auth.auth().currentUser?.email))",
                                     "LoginUID": "\(String(describing: Auth.auth().currentUser?.uid))"]
                            )
                            wholeAuthStore.getUserInfo(userUID: wholeAuthStore.currentUser!.uid) {}
                        }
                    }
                }
            } else {
                LoginView()
                    .task {
                        if Auth.auth().currentUser?.uid == nil {
                            isSignIn = false
                        }
                    }
            }
        }
        .onChange(of: wholeAuthStore.currnetUserInfo) { _ in
            if wholeAuthStore.currentUser != nil {
                diaryStore.firstGetMyDiaryCombine()
                diaryStore.mostLikedGetDiarysCombine()
                diaryStore.firstGetRealTimeDiaryCombine()
                scheduleStore.readScheduleCombine()
                reportStore.readReportCombine()
                //For Googole Analystic
                Analytics.logEvent(
                    AnalyticsEventLogin,
                    parameters:
                        ["LoginEmail": "\(String(describing: Auth.auth().currentUser?.email))",
                         "LoginUID": "\(String(describing: Auth.auth().currentUser?.uid))"]
                )
                wholeAuthStore.getUserInfo(userUID: wholeAuthStore.currentUser!.uid) {}
            }
        }
        // 푸시 알림으로 앱 진입 시 네 번째 탭(마이페이지 탭)으로 이동
        .onReceive(localNotificationCenter.$pageToNavigationTo) {
            guard let notificationSelection = $0 else  { return }
            self.tabSelection.change(to: notificationSelection)
        }
        .task {
            localNotificationCenter.getCurrentSetting()
            //현재 로그인 되어있는지
            if isSignIn {
                wholeAuthStore.getUserInfo(userUID: wholeAuthStore.currentUser!.uid) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation { isLoading.toggle() }
                    }
                }
            } else {
                // 로그인 안되어있을경우
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation { isLoading.toggle() }
                }
            }
        }
        .fullScreenCover(isPresented: $isFirstLaunching) {
            OnboardingTabView(isFirstLaunching: $isFirstLaunching)
        }
    }
}

//MARK: - 탭뷰 화면전환 함수
enum TabViewScreen {
    case one
    case two
    case three
    case four
}

//탭뷰 화면전환 함수입니다.
final class TabSelector: ObservableObject {
    
    @Published var screen: TabViewScreen = .one
    
    func change(to screen: TabViewScreen) {
        self.screen = screen
    }
}
