//
//  DiaryCellView.swift
//  BootCamping
//
//  Created by 박성민 on 2023/01/18.
//

import SwiftUI

import AlertToast
import Firebase
import SDWebImageSwiftUI

struct DiaryCellView: View {
    
    @EnvironmentObject var bookmarkStore: BookmarkStore
    @EnvironmentObject var diaryStore: DiaryStore
    @EnvironmentObject var wholeAuthStore: WholeAuthStore
    @EnvironmentObject var blockedUserStore: BlockedUserStore
    @EnvironmentObject var reportStore: ReportStore
    
    @StateObject var campingSpotStore: CampingSpotStore = CampingSpotStore()
    @StateObject var diaryLikeStore: DiaryLikeStore = DiaryLikeStore()
    @StateObject var commentStore: CommentStore = CommentStore()
    
    @State var isBookmarked: Bool = false
    
    //선택한 다이어리 정보 변수입니다.
    var item: UserInfoDiary
    //삭제 알림
    @State private var isShowingDeleteAlert = false
    //유저 신고/ 차단 알림
    @State private var isShowingConfirmationDialog = false
    @State private var isShowingUserReportAlert = false
    
    // 현재 게시물의 신고 상태를 나타낼 변수
    @State private var reportState = ReportState.notReported
    
    @Binding var isShowingAcceptedToast: Bool
    @Binding var isShowingBlockedToast: Bool
    
    @EnvironmentObject var faceId: FaceId
    @AppStorage("faceId") var usingFaceId: Bool = false
    
    //댓글 버튼 클릭시 다음 화면으로 이동.
    @State var tag:Int? = nil
    
    @State private var isMore: Bool = false
    
    var diaryCampingSpot: [CampingSpot] {
        get {
            return campingSpotStore.campingSpotList.filter{
                $0.contentId == item.diary.diaryAddress
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            diaryUserProfile
            
            //MARK: - 잠금상태 && Faceid 설정 일때 잠금화면
            
            if item.diary.diaryIsPrivate && faceId.islocked == true {
                VStack(alignment: .center) {
                    Button {
                        faceId.authenticate()
                    } label: {
                        Image(systemName: "lock")
                            .resizable()
                            .padding()
                            .foregroundColor(Color.bcGreen)
                    }
                    .frame(height: UIScreen.screenWidth / 5)
                    .aspectRatio(contentMode: .fit)
                    .padding(.vertical, 10)
                    Text("비공개 캠핑 노트입니다")
                    Text("버튼을 눌러 잠금을 해제해주세요")
                }
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
                .background(Color.secondary)
            } else {
                diaryImage
                
                VStack(alignment: .leading) {
                    HStack(alignment: .center){
                        if (item.diary.uid == wholeAuthStore.currnetUserInfo!.id && item.diary.diaryIsPrivate) {
                            isPrivateImage
                        }
                        diaryTitle
                    }
                    
                    if isMore && !item.diary.diaryAddress.isEmpty {
                        diaryFullContent
                        NavigationLink {
                            CampingSpotDetailView(campingSpot: campingSpotStore.campingSpotList.first ?? campingSpotStore.campingSpot)
                        } label: {
                            diaryCampingLink
                                .padding(.bottom, 10)
                        }
                    } else if !isMore && item.diary.diaryAddress.isEmpty && item.diary.diaryContent.count < 35 {
                        diaryFullContent
                    } else if isMore {
                        diaryFullContent
                    } else {
                        diaryLimitContent
                    }
                }
                .padding(.horizontal, UIScreen.screenWidth * 0.03)
                
                diaryDetailInfo
                    .padding(.horizontal, UIScreen.screenWidth * 0.03)
                    .foregroundColor(.bcBlack)
                
                Divider().padding(.top, 5)
            }
        }
        .sheet(isPresented: $isShowingUserReportAlert) {
            if reportState == .alreadyReported {
                // 현재 다이어리의 reportState가 .alreadyReported인 경우 WaitingView(신고가 이미 접수되었음을 알려주는 뷰) 나옴
                WaitingView()
                    .presentationDetents([.fraction(0.3), .medium])
            } else {
                // 현재 다이어리의 reportState가 .alreadyReported가 아닌 경우 ReportView를 띄워 신고가 가능하게
                ReportView(reportState: $reportState, reportedDiaryId: item.diary.id)
                    .presentationDetents([.fraction(0.5), .medium, .large]) // 화면의 아래쪽 50%를 차지하는 시트를 만든다
                    .presentationDragIndicator(.hidden)
            }
        }
        .padding(.top, UIScreen.screenWidth * 0.03)
        .onAppear {
            commentStore.readCommentsCombine(diaryId: item.diary.id)
            diaryLikeStore.readDiaryLikeCombine(diaryId: item.diary.id)
            // 현재 다이어리가 신고된 다이어리인 경우 reportState를 .alreadyReported로, 그렇지 않은 경우 .notReported로
            reportState = (reportStore.reportedDiaries.filter { reportedDiary in reportedDiary.reportedDiaryId == item.diary.id }.count != 0) ? ReportState.alreadyReported : ReportState.notReported
        }
        // 다이어리의 상태가 nowReported(지금 신고된 경우)로 변경될 때 신고가 접수되었따는 토스트 알림을 띄움
        .onChange(of: reportState) { newReportState in
            isShowingAcceptedToast = (reportState == ReportState.nowReported)
        }
    }
}

private extension DiaryCellView {
    //MARK: - 메인 이미지
    var diaryImage: some View {
        ForEach(item.diary.diaryImageURLs, id: \.self) { url in
            WebImage(url: URL(string: url))
                .resizable()
                .placeholder {
                    Rectangle()
                        .foregroundColor(.secondary)
                        .skeletonAnimation()
                }
                .indicator(.activity)
                .transition(.fade(duration: 0.5))
                .scaledToFill()
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
                .clipped()
        }
        .pinchZoom()
        .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth)
        .tabViewStyle(PageTabViewStyle())
        // .never 로 하면 배경 안보이고 .always 로 하면 인디케이터 배경 보입니다.
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        //사진 두번 클릭시 좋아요
        .onTapGesture(count: 2) {
            //좋아요 버튼, 카운드
            if diaryLikeStore.diaryLikeList.contains(wholeAuthStore.currentUser?.uid ?? "") {
                //포함되있으면 아무것도 안함
            } else {
                diaryLikeStore.addDiaryLikeCombine(diaryId: item.diary.id)
                //탭틱
                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
            }
            diaryLikeStore.readDiaryLikeCombine(diaryId: item.diary.id)
        }
    }
    
    //MARK: - 다이어리 작성자 프로필
    var diaryUserProfile: some View {
        HStack {
            if item.user.profileImageURL != "" {
                WebImage(url: URL(string: item.user.profileImageURL))
                    .resizable()
                    .placeholder {
                        Rectangle()
                            .foregroundColor(.secondary)
                            .skeletonAnimation()
                    }
                    .indicator(.activity)
                    .transition(.fade(duration: 0.5))
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            } else {
                Image("defaultProfileImage")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            }
            //유저 닉네임
            Text(item.diary.diaryUserNickName)
                .font(.callout)
            
            Spacer()
            
            //MARK: -...버튼 글 쓴 유저일때만 ...나타나도록
            
            if item.diary.uid == Auth.auth().currentUser?.uid {
                alertMenu
                //   .padding(.top, 5)
            }
            else {
                reportAlertMenu
                //  .padding(.top, 5)
            }
            
        }
        .padding(.horizontal, UIScreen.screenWidth * 0.03)
        
    }
    
    
    //MARK: - Alert Menu 버튼
    
    var alertMenu: some View {
        
        //MARK: - ... 버튼
        
        Menu {
            //기존 버튼
            NavigationLink {
                DiaryEditView(diaryTitle: item.diary.diaryTitle,
                              diaryIsPrivate: item.diary.diaryIsPrivate,
                              diaryContent: item.diary.diaryContent,
                              campingSpotItem: diaryCampingSpot.first ?? campingSpotStore.campingSpot,
                              campingSpot: diaryCampingSpot.first?.facltNm ?? "",
                              item: item, selectedDate: item.diary.diaryVisitedDate)
            } label: {
                Text("수정하기")
            }

            Button {
                isShowingDeleteAlert = true
            } label: {
                Text("삭제하기")
            }
            
        } label: {
            Image(systemName: "ellipsis")
                .font(.title3)
                .frame(width: 30, height: 30)
        }
        //MARK: - 노트 삭제 알림
        .alert("캠핑 노트를 삭제하시겠습니까?", isPresented: $isShowingDeleteAlert) {
            Button("취소", role: .cancel) {
                isShowingDeleteAlert = false
            }
            Button("삭제", role: .destructive) {
                diaryStore.deleteDiaryCombine(diary: item.diary)
            }
        }
    }
    
    //MARK: - 유저 신고 / 차단 버튼
    var reportAlertMenu: some View {
        //MARK: - ... 버튼입니다.
        Button(action: {
            isShowingConfirmationDialog.toggle()
        }) {
            Image(systemName: "ellipsis")
                .font(.title3)
                .frame(width: 30,height: 30)
        }
        .confirmationDialog("알림", isPresented: $isShowingConfirmationDialog,
                            titleVisibility: .hidden,
                            actions: {
            Button("게시물 신고하기", role: .destructive) {
                isShowingUserReportAlert.toggle()
            }
            Button("\(item.user.nickName)님 차단하기", role: .destructive) {
                blockedUserStore.addBlockedUserCombine(blockedUserId: item.diary.uid)
                wholeAuthStore.readMyInfoCombine(user: wholeAuthStore.currnetUserInfo!)
                isShowingBlockedToast.toggle()
            }
            Button("취소", role: .cancel) {}
        })
    }
    
    //MARK: - 제목
    var diaryTitle: some View {
        Text(item.diary.diaryTitle)
            .font(.system(.title3, weight: .semibold))
            .padding(.top, 10)
            .padding(.bottom, 5)
            .multilineTextAlignment(.leading)
    }
    
    // MARK: - 다이어리 공개 여부를 나타내는 이미지
    private var isPrivateImage: some View {
        Image(systemName: "lock")
            .foregroundColor(Color.secondary)
    }
    
    //MARK: - 내용 + 더보기
    var diaryLimitContent: some View {
        HStack {
            Text("\(item.diary.diaryContent)")
                .lineLimit(1)
                .multilineTextAlignment(.leading)
            Text("더보기")
                .foregroundColor(.secondary)
                .onTapGesture {
                    isMore.toggle()
                    campingSpotStore.readCampingSpotListCombine(
                        readDocument: ReadDocuments(campingSpotContenId: [item.diary.diaryAddress])
                    )
                }
        }.padding(.bottom, 15)
    }
    
    //MARK: - 내용
    var diaryFullContent: some View {
        Text("\(item.diary.diaryContent)")
            .multilineTextAlignment(.leading)
            .padding(.bottom, 15)
    }
    
    //MARK: - 캠핑장 이동
    var diaryCampingLink: some View {
        HStack {
            WebImage(url: URL(string: campingSpotStore.campingSpotList.first?.firstImageUrl == "" 
                              ? campingSpotStore.noImageURL
                              : campingSpotStore.campingSpotList.first?.firstImageUrl ?? ""))
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.trailing, 5)
            
            VStack(alignment: .leading, spacing: 3) {
                Text(campingSpotStore.campingSpotList.first?.facltNm ?? "")
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                HStack {
                    Text("방문일자: \(item.diary.diaryVisitedDate.getKoreanDate())")
                        .padding(.vertical, 2)
                }
                .font(.footnote)
                .foregroundColor(.secondary)
            }
            .foregroundColor(.bcBlack)
            
            Spacer()
            
            Image(systemName: "chevron.right.2")
                .font(.footnote)
                .foregroundColor(.secondary)
            
        }
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.bcDarkGray, lineWidth: 1)
                .opacity(0.3)
        )
    }
    
    
    //MARK: - 좋아요, 댓글, 타임스탬프
    var diaryDetailInfo: some View {
        HStack {
            Button {
                //좋아요 버튼, 카운드
                if diaryLikeStore.diaryLikeList.contains(wholeAuthStore.currentUser?.uid ?? "") {
                    diaryLikeStore.removeDiaryLikeCombine(diaryId: item.diary.id)
                } else {
                    diaryLikeStore.addDiaryLikeCombine(diaryId: item.diary.id)
                    //탭틱
                    UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
                }
                diaryLikeStore.readDiaryLikeCombine(diaryId: item.diary.id)
                
            } label: {
                Image(systemName: diaryLikeStore.diaryLikeList.contains(wholeAuthStore.currentUser?.uid ?? "") ? "flame.fill" : "flame")
                    .foregroundColor(diaryLikeStore.diaryLikeList.contains(wholeAuthStore.currentUser?.uid ?? "") ? .red : .secondary)
            }
            
            Text("\(diaryLikeStore.diaryLikeList.count)")
                .font(.callout)
                .foregroundColor(.secondary)
                .padding(.leading, -2)
                .frame(width: 20, alignment: .leading)
            
            //댓글버튼
            NavigationLink(destination: DiaryDetailView(item: item), tag: 1, selection: $tag) {
                EmptyView()
            }
            
            Button {
                self.tag = 1
                diaryStore.isCommentButtonClicked = true
            } label: {
                Image(systemName: "message")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
            
            Text("\(commentStore.commentList.count)")
                .font(.callout)
                .foregroundColor(.secondary)
                .frame(width: 20, alignment: .leading)
                .padding(.leading, -2)
            
            Spacer()
            //작성 경과시간
            Text("\(TimestampToString.dateString(item.diary.diaryCreatedDate)) 전")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding(.bottom, 15)
    }
    
}
