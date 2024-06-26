# 🏕️부트캠핑
`캠핑 사진과 캠핑장 정보 공유를 통해 더 나은 캠핑 문화를 만들어나가는, 캠퍼들을 위한 커뮤니티 앱 입니다.` <br>
`팀 프로젝트 1.0.0 출시 (리더, 6명), 1.2.2 개인 업데이트 (UIKit, SwiftUI, MVVM)` <br>

> 뷰 좋고 시설 좋은 캠핑장 가고 싶은데 어디가 좋은지 잘 모르겠어! <br>
> 차곡차곡 모아 둔 내 캠핑 사진들, 나만 보기는 아까워!<br>
> 내 캠핑만 모아서 기록하고, 일정도 관리할 수 있는 프라이빗한 공간이 필요해!<br>

- 나만 보기 아까운 내 캠핑 인증샷, 다른 캠퍼들에게 공유해 보는 건 어떠세요? <br>
- 다른 캠퍼들이 공유한 멋진 사진을 통해 인기 있는 캠핑장 정보도 알아보고, 나만의 캠핑 기록도 남길 수 있는 부트캠핑!
<br>

## 📱 스크린샷
<div align="center">
<img src="https://github.com/thekoon0456/thekoon0456/assets/106993057/4a14fb9a-85f8-491e-8746-517989acd86f" width="1000">
</div>

## 🔗 Links
### [📱 AppStore](https://apps.apple.com/kr/app/부트캠핑/id1672213235)
### [💻 GitHub](https://github.com/thekoon0456/BootCamping_Refactor)
### [📺 Youtube](https://www.youtube.com/watch?v=OoabE3G7iJQ)
### [👨‍💻 Blog](https://thekoon0456.tistory.com/search/부트캠핑?page=2)
<br>

## 🧑🏻‍💻핵심 키워드
![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-0052CC?style=for-the-badge&logo=swift&logoColor=white)
![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white)
![Combine](https://img.shields.io/badge/Combine-F54A2A?style=for-the-badge&logo=swift&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white)

![Firebase](https://img.shields.io/badge/Firebase-039BE5?style=for-the-badge&logo=Firebase&logoColor=white)
![Google](https://img.shields.io/badge/google-4285F4?style=for-the-badge&logo=google&logoColor=white)
![KakaoTalk](https://img.shields.io/badge/kakaotalk-ffcd00.svg?style=for-the-badge&logo=kakaotalk&logoColor=000000)
![Lottie](https://img.shields.io/badge/Lottie-007ACC?style=for-the-badge&logo=Lottie&logoColor=white)
<br>
<br>

## 📌주요 기능
- 포토카드 뷰: 유저의 반응(좋아요, 댓글)이 좋은 사진을 포토카드화하여 다른 유저들의 클릭을 유도<br>
- 실시간 캠핑일기: 유저들이 업로드한 게시글을 실시간으로 피드 노출<br>
- 캠핑장 검색: 한국관광공사 고캠핑 API를 활용, 캠핑장 데이터를 지역별, 전망별로 분류<br>
- 캠핑장 정보: 캠핑장 데이터를 한 눈에 보기 좋게 뷰 구성, 북마크 기능 추가 및 MapView 사용
- 캠핑일기 작성: 사진 추가 기능, 공개/비공개 설정 기능 <br>
- 마이 페이지: 내 캠핑 일정 등록 기능, 관심있는 캠핑장과 캠핑일기 북마크 및 관리<br>
<br>

## 🖐️담당 구현 파트
- 메인 홈 탭 구현
- 캠핑일기 탭 구현
- 내 캠핑일기의 비공개 일기화면에서 FaceID 구현, AppStorage로 저장
- 이미지 로딩, 캐싱
- 다크모드 구현
<br>

## 📱구동 화면
|<img src="https://user-images.githubusercontent.com/114223237/222381783-de2153bc-5b53-49b7-af76-5c2af1d321b0.gif"></img>|<img src="https://user-images.githubusercontent.com/114223237/222381623-6ee28409-21ee-4427-9c60-e1ce0e7f68dc.gif"></img>|<img src="https://user-images.githubusercontent.com/114223237/222385759-ef3a9738-31e6-4f6c-8f2c-c1cd86fe218c.gif"></img>|<img src="https://user-images.githubusercontent.com/114223237/222385743-e6acddcf-0ae0-4a09-a5dc-2658766bfd6c.gif"></img>|<img src="https://user-images.githubusercontent.com/114223237/222382137-6c9223de-2505-4486-a209-dfa6217d2fe6.gif"></img>
|:-:|:-:|:-:|:-:|:-:|
|`온보딩뷰`|`로그인 및 회원가입`|`다크모드`|`인기 캠핑 포토카드`|`실시간 캠핑 피드`|
|<img src="https://user-images.githubusercontent.com/114223237/222382016-757b9274-8556-4f96-88ca-d797fe76bfed.gif"></img>|<img src="https://user-images.githubusercontent.com/114223237/222381916-de59591f-1f5e-4666-b5cd-2736d8c945f5.gif"></img>|<img src="https://user-images.githubusercontent.com/114223237/222383116-b7fb7fdc-cf86-438e-8119-03da92cea9e8.gif"></img>|<img src="https://user-images.githubusercontent.com/114223237/222383091-b3863957-1ddf-4579-8306-fd403ab82fb5.gif"></img>|<img src="https://user-images.githubusercontent.com/114223237/222383712-cf3d4f1a-5247-4d35-b4d3-6cd8e343ed19.gif"></img>|
|`캠핑장 검색`|`캠핑장 정보`|`내 캠핑일기`|`캠핑일기 작성`|`마이페이지`|
<br>

## ✅ 담당 파트 트러블 슈팅
### 캠핑일기 Cell 마다 좋아요, 댓글의 숫자가 제대로 표기되지 않는 문제 
<div markdown="1">

```
기존에는 좋아요와 댓글 Data를 EnvironmentObject로 구성했었는데
각 Cell의 DetailView로 들어갔다가 List로 다시 돌아왔을때
화면에 보이는 모든 Cell의 좋아요와 댓글 숫자가 동기화되는 문제가 발생했습니다.
diaryLikeStore와 commentStore를 각 Cell 마다 @StateObject로 구현하고
해당 데이터를 DetailView와 Binding해서
Cell마다 독립적으로 좋아요와 댓글 개수를 구현할 수 있었습니다.

```

```swift
// 기존 EnvironmentObject를 StateObject로 리팩토링
@StateObject var diaryLikeStore: DiaryLikeStore = DiaryLikeStore()
@StateObject var commentStore: CommentStore = CommentStore()
```

```swift
/MARK: - 좋아요, 댓글, 타임스탬프 구현

var diaryDetailInfo: some View {
    HStack {
        Button {
            //좋아요 버튼, 카운트
            if diaryLikeStore.diaryLikeList.contains(wholeAuthStore.currentUser?.uid ?? "") {
                diaryLikeStore.removeDiaryLikeCombine(diaryId: item.diary.id)
            } else {
                diaryLikeStore.addDiaryLikeCombine(diaryId: item.diary.id)
                //탭틱
                UIImpactFeedbackGenerator(style: .rigid).impactOccurred()
            }
            diaryLikeStore.readDiaryLikeCombine(diaryId: item.diary.id)
            
        } label: {
            Image(systemName: diaryLikeStore.diaryLikeList
                .contains(wholeAuthStore.currentUser?.uid ?? "") ? "flame.fill" : "flame")
                .foregroundColor(diaryLikeStore.diaryLikeList
                    .contains(wholeAuthStore.currentUser?.uid ?? "") ? .red : .secondary)
        }
        
        Text("\(diaryLikeStore.diaryLikeList.count)")
            .font(.callout)
            .foregroundColor(.secondary)
            .padding(.leading, -2)
            .frame(width: 20, alignment: .leading)
        
        //댓글버튼
        navigationDestination(isPresented: $isCommentButtonClicked) {
            DiaryDetailView(item: item)
            }
        Button {
            isCommentButtonClicked.toggle()
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
```
</div>
<br>

### 사용자가 사용하는 흐름에 따라 자연스럽게 시점 이동이 되지 않는 문제
<div markdown="1">

``` 
ScrollViewReader를 활용해서 각 상황에 맞는 화면이 자동으로 스크롤되도록 구현했습니다.
Cell에서 댓글 작성 버튼을 눌렀을때 바로 댓글 작성을 할 수 있도록 키보드가 올라온 채로 세부 화면으로 이동,
댓글 작성 창을 누르면 댓글 화면으로 이동,
댓글 작성 완료 버튼을 누르면 화면 가장 아래로 이동하도록 구현했습니다.
```

```swift
ScrollViewReader { proxy in
    VStack {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading) {
                diaryUserProfile.id(topID)
                    
                Group {
                    diaryDetailTitle
                    diaryDetailContent
                    
                    if !campingSpotStore.campingSpotList.isEmpty {
                        diaryCampingLink
                    }
                    //좋아요, 댓글, 타임스탬프
                    diaryDetailInfo
                    
                    Divider()
                    
                //댓글
                ForEach(commentStore.commentList) { comment in
                        DiaryCommentCellView(commentStore: commentStore,
                                            scrollViewHelper: scrollViewHelper,
                                            item2: item,
                                            item: comment)
                    }
                }
                .padding(.horizontal, UIScreen.screenWidth * 0.03)
                
                //댓글 작성시 뷰 가장 아래로 이동
                EmptyView()
                    .frame(height: 0.1)
                    .id(bottomID)
                Spacer()
            }
            .task {
                //이전화면에서 댓글버튼 눌렀다면 바로 키보드 나오도록
                if diaryStore.isCommentButtonClicked {
                    self.inputFocused = true
                    proxy.scrollTo(commentButtonID, anchor: .top)
                    diaryStore.isCommentButtonClicked = false
                } else {
                withAnimation {
                    proxy.scrollTo(topID)
                }
            }
        }
    }
}
```
</div>
<br>

### 네트워크 사정이 좋지 않은 상황에서 이미지 로딩 문제
<div markdown="1">

```
이미지 로딩시 회색 화면을 스켈레톤 뷰로 구현었습니다.
통신환경이 좋은 곳에서는 로딩에 문제가 없지만 해외같이 통신환경이 좋지 않은 곳에서는 화면이 멈춘 것 같은 문제가 있어서
앱스토어에서 리젝을 당했고, 이를 해결하기 위해 로딩시 스켈레톤뷰에 반짝이는 애니메이션을 구현했습니다.
ViewModifier로 애니메이션을 만들어 기존 코드를 수정하지 않으면서 사용성을 높였습니다.
```

```swift
//스켈레톤 뷰 애니메이션 구현 ViewModifier

public struct Shimmer: ViewModifier {
    let animation: Animation
    @State private var phase: CGFloat = 0

    public init(animation: Animation = Self.defaultAnimation) {
        self.animation = animation
    }

    public static let defaultAnimation = Animation.linear(duration: 1.5).repeatForever(autoreverses: false)

    public init(duration: Double = 1.5, bounce: Bool = false, delay: Double = 0) {
        self.animation = .linear(duration: duration)
            .repeatForever(autoreverses: bounce)
            .delay(delay)
    }

    public func body(content: Content) -> some View {
        content
            .modifier(
                AnimatedMask(phase: phase).animation(animation)
            )
            .onAppear { phase = 0.8 }
    }

    struct AnimatedMask: AnimatableModifier {
        var phase: CGFloat = 0

        var animatableData: CGFloat {
            get { phase }
            set { phase = newValue }
        }

        func body(content: Content) -> some View {
            content
                .mask(GradientMask(phase: phase).scaleEffect(3))
        }
    }

    struct GradientMask: View {
        let phase: CGFloat
        let centerColor = Color.gray.opacity(0.5)
        let edgeColor = Color.gray.opacity(0.3)
        @Environment(\.layoutDirection) private var layoutDirection

        var body: some View {
            let isRightToLeft = layoutDirection == .rightToLeft
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: edgeColor, location: phase),
                    .init(color: centerColor, location: phase + 0.1),
                    .init(color: edgeColor, location: phase + 0.2)
                ]),
                startPoint: isRightToLeft ? .bottomTrailing : .topLeading,
                endPoint: isRightToLeft ? .topLeading : .bottomTrailing
            )
        }
    }
}
```

```swift
//skeletonAnimation 함수로 적용

public extension View {
    @ViewBuilder func skeletonAnimation(
        active: Bool = true, duration: Double = 1.5, bounce: Bool = false, delay: Double = 0
    ) -> some View {
        if active {
            modifier(Shimmer(duration: duration, bounce: bounce, delay: delay))
        } else {
            self
        }
    }
}
```
</div>
<br>

## 개발 환경
- iOS 16.0 이상 iPhone 전 기종 지원
- 다크모드 지원
- Xcode 14.2
<br>

## 협업 방법
- `FIGMA`를 통해 View 구상 및 업무 커뮤니케이션 <br>
- `NOTION`을 활용한 TODO 정리 및 데일리 스크럼 <br>
- `Github`를 통한 프로젝트 이슈 관리 <br>
- `DISCORD`를 활용하여 라이브 페어 프로그래밍 및 실시간 커뮤니케이션 <br>
<br>

## 코드 컨벤션
```
- [Feat] : 새로운 기능 추가
- [Add]: 새로운 파일 추가 (json, img, asset, 목업데이터 등등) 
- [Fix] : 버그 수정 
- [Docs] : 문서 수정 
- [Style] : 코드 포맷팅, 세미콜론 누락, 코드 변경이 없는 경우 
- [Refactor] : 코드 리펙토링 
- [Chore] : 빌드 업무 수정, 패키지 매니저 수정 
```
<br>

## 팀원 소개

|김덕훈|박성민|배동훈|이민경|이소영|차소민|
|:-:|:-:|:-:|:-:|:-:|:-:|
|<img src="https://avatars.githubusercontent.com/u/106993057?v=4" width=100>|<img src="https://avatars.githubusercontent.com/u/104570633?v=4" width=100>|<img src="https://avatars.githubusercontent.com/u/65296382?v=4" width=100>|<img src="https://avatars.githubusercontent.com/u/107797217?v=4" width=100>|<img src="https://avatars.githubusercontent.com/u/114223237?v=4" width=100>|<img src="https://avatars.githubusercontent.com/u/114223423?v=4" width=100>|
|[@thekoon0456](https://github.com/thekoon0456)|[@SeongMin0106](https://github.com/SeongMin0106)|[@erun94510](https://github.com/erun94510)|[@mxnkng](https://github.com/mxnkng)|[@Primrose1101](https://github.com/Primrose1101)|[@chasomin](https://github.com/chasomin)|
<br>

## 라이센스
<details>
<summary>BootCamping</summary>
 
MIT License

Copyright (c) 2023 BootCamping

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</details>

<details>
<summary>SwiftUI-Introspect</summary>
 
Copyright 2019 Timber Software

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</details>

<details>
<summary>SDWebImageSwiftUI</summary>
 
Copyright (c) 2019 [lizhuoli1126@126.com](mailto:lizhuoli1126@126.com) [lizhuoli1126@126.com](mailto:lizhuoli1126@126.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
</details>

<details>
<summary>Lottie</summary>
 
Apache License
Version 2.0, January 2004
[https://www.apache.org/licenses/](https://www.apache.org/licenses/)

TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

1. Definitions.
    
    "License" shall mean the terms and conditions for use, reproduction,
    and distribution as defined by Sections 1 through 9 of this document.
    
    "Licensor" shall mean the copyright owner or entity authorized by
    the copyright owner that is granting the License.
    
    "Legal Entity" shall mean the union of the acting entity and all
    other entities that control, are controlled by, or are under common
    control with that entity. For the purposes of this definition,
    "control" means (i) the power, direct or indirect, to cause the
    direction or management of such entity, whether by contract or
    otherwise, or (ii) ownership of fifty percent (50%) or more of the
    outstanding shares, or (iii) beneficial ownership of such entity.
    
    "You" (or "Your") shall mean an individual or Legal Entity
    exercising permissions granted by this License.
    
    "Source" form shall mean the preferred form for making modifications,
    including but not limited to software source code, documentation
    source, and configuration files.
    
    "Object" form shall mean any form resulting from mechanical
    transformation or translation of a Source form, including but
    not limited to compiled object code, generated documentation,
    and conversions to other media types.
    
    "Work" shall mean the work of authorship, whether in Source or
    Object form, made available under the License, as indicated by a
    copyright notice that is included in or attached to the work
    (an example is provided in the Appendix below).
    
    "Derivative Works" shall mean any work, whether in Source or Object
    form, that is based on (or derived from) the Work and for which the
    editorial revisions, annotations, elaborations, or other modifications
    represent, as a whole, an original work of authorship. For the purposes
    of this License, Derivative Works shall not include works that remain
    separable from, or merely link (or bind by name) to the interfaces of,
    the Work and Derivative Works thereof.
    
    "Contribution" shall mean any work of authorship, including
    the original version of the Work and any modifications or additions
    to that Work or Derivative Works thereof, that is intentionally
    submitted to Licensor for inclusion in the Work by the copyright owner
    or by an individual or Legal Entity authorized to submit on behalf of
    the copyright owner. For the purposes of this definition, "submitted"
    means any form of electronic, verbal, or written communication sent
    to the Licensor or its representatives, including but not limited to
    communication on electronic mailing lists, source code control systems,
    and issue tracking systems that are managed by, or on behalf of, the
    Licensor for the purpose of discussing and improving the Work, but
    excluding communication that is conspicuously marked or otherwise
    designated in writing by the copyright owner as "Not a Contribution."
    
    "Contributor" shall mean Licensor and any individual or Legal Entity
    on behalf of whom a Contribution has been received by Licensor and
    subsequently incorporated within the Work.
    
2. Grant of Copyright License. Subject to the terms and conditions of
this License, each Contributor hereby grants to You a perpetual,
worldwide, non-exclusive, no-charge, royalty-free, irrevocable
copyright license to reproduce, prepare Derivative Works of,
publicly display, publicly perform, sublicense, and distribute the
Work and such Derivative Works in Source or Object form.
3. Grant of Patent License. Subject to the terms and conditions of
this License, each Contributor hereby grants to You a perpetual,
worldwide, non-exclusive, no-charge, royalty-free, irrevocable
(except as stated in this section) patent license to make, have made,
use, offer to sell, sell, import, and otherwise transfer the Work,
where such license applies only to those patent claims licensable
by such Contributor that are necessarily infringed by their
Contribution(s) alone or by combination of their Contribution(s)
with the Work to which such Contribution(s) was submitted. If You
institute patent litigation against any entity (including a
cross-claim or counterclaim in a lawsuit) alleging that the Work
or a Contribution incorporated within the Work constitutes direct
or contributory patent infringement, then any patent licenses
granted to You under this License for that Work shall terminate
as of the date such litigation is filed.
4. Redistribution. You may reproduce and distribute copies of the
Work or Derivative Works thereof in any medium, with or without
modifications, and in Source or Object form, provided that You
meet the following conditions:
    
    (a) You must give any other recipients of the Work or
    Derivative Works a copy of this License; and
    
    (b) You must cause any modified files to carry prominent notices
    stating that You changed the files; and
    
    (c) You must retain, in the Source form of any Derivative Works
    that You distribute, all copyright, patent, trademark, and
    attribution notices from the Source form of the Work,
    excluding those notices that do not pertain to any part of
    the Derivative Works; and
    
    (d) If the Work includes a "NOTICE" text file as part of its
    distribution, then any Derivative Works that You distribute must
    include a readable copy of the attribution notices contained
    within such NOTICE file, excluding those notices that do not
    pertain to any part of the Derivative Works, in at least one
    of the following places: within a NOTICE text file distributed
    as part of the Derivative Works; within the Source form or
    documentation, if provided along with the Derivative Works; or,
    within a display generated by the Derivative Works, if and
    wherever such third-party notices normally appear. The contents
    of the NOTICE file are for informational purposes only and
    do not modify the License. You may add Your own attribution
    notices within Derivative Works that You distribute, alongside
    or as an addendum to the NOTICE text from the Work, provided
    that such additional attribution notices cannot be construed
    as modifying the License.
    
    You may add Your own copyright statement to Your modifications and
    may provide additional or different license terms and conditions
    for use, reproduction, or distribution of Your modifications, or
    for any such Derivative Works as a whole, provided Your use,
    reproduction, and distribution of the Work otherwise complies with
    the conditions stated in this License.
    
5. Submission of Contributions. Unless You explicitly state otherwise,
any Contribution intentionally submitted for inclusion in the Work
by You to the Licensor shall be under the terms and conditions of
this License, without any additional terms or conditions.
Notwithstanding the above, nothing herein shall supersede or modify
the terms of any separate license agreement you may have executed
with Licensor regarding such Contributions.
6. Trademarks. This License does not grant permission to use the trade
names, trademarks, service marks, or product names of the Licensor,
except as required for reasonable and customary use in describing the
origin of the Work and reproducing the content of the NOTICE file.
7. Disclaimer of Warranty. Unless required by applicable law or
agreed to in writing, Licensor provides the Work (and each
Contributor provides its Contributions) on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied, including, without limitation, any warranties or conditions
of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
PARTICULAR PURPOSE. You are solely responsible for determining the
appropriateness of using or redistributing the Work and assume any
risks associated with Your exercise of permissions under this License.
8. Limitation of Liability. In no event and under no legal theory,
whether in tort (including negligence), contract, or otherwise,
unless required by applicable law (such as deliberate and grossly
negligent acts) or agreed to in writing, shall any Contributor be
liable to You for damages, including any direct, indirect, special,
incidental, or consequential damages of any character arising as a
result of this License or out of the use or inability to use the
Work (including but not limited to damages for loss of goodwill,
work stoppage, computer failure or malfunction, or any and all
other commercial damages or losses), even if such Contributor
has been advised of the possibility of such damages.
9. Accepting Warranty or Additional Liability. While redistributing
the Work or Derivative Works thereof, You may choose to offer,
and charge a fee for, acceptance of support, warranty, indemnity,
or other liability obligations and/or rights consistent with this
License. However, in accepting such obligations, You may act only
on Your own behalf and on Your sole responsibility, not on behalf
of any other Contributor, and only if You agree to indemnify,
defend, and hold each Contributor harmless for any liability
incurred by, or claims asserted against, such Contributor by reason
of your accepting any such warranty or additional liability.

END OF TERMS AND CONDITIONS

APPENDIX: How to apply the Apache License to your work.

```
  To apply the Apache License to your work, attach the following
  boilerplate notice, with the fields enclosed by brackets "{}"
  replaced with your own identifying information. (Don't include
  the brackets!)  The text should be enclosed in the appropriate
  comment syntax for the file format. We also recommend that a
  file or class name and description of purpose be included on the
  same "printed page" as the copyright notice for easier
  identification within third-party archives.

```

Copyright 2018 Airbnb, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

```
   <https://www.apache.org/licenses/LICENSE-2.0>

```

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</details>

<details>
<summary>https://www.pexels.com</summary>
  
https://www.pexels.com/ko-kr/license/
Aleksandar Pasaric / joon young, Park / Pixabay / Camille / BERK OZDEMIR /  Arri Bom
→ Sagui Andrea / Fabian Wiktor / Quang Nguyen Vinh / Lum3n / Pixabay / Asad Photo Maldives
</details>

<details>
<summary>한국관광공사 공공데이터 고캠핑</summary>
 
- 이용허락범위 제한없음
- [https://www.data.go.kr/ugs/selectPortalPolicyView.do](https://www.data.go.kr/ugs/selectPortalPolicyView.do)
</details>

<details>
<summary>swiftUIMailView</summary>
 
MIT License

Copyright (c) 2021 Gordan Glavaš

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
</details>

<details>
<summary>AlertToast</summary>
 
MIT License

Copyright (c) 2021 Elai Zuberman

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
</details>

<details>
<summary>Firebase</summary>
 
Apache License Version 2.0, January 2004 [http://www.apache.org/licenses/](http://www.apache.org/licenses/)

TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

1. Definitions.
    
    "License" shall mean the terms and conditions for use, reproduction, and distribution as defined by Sections 1 through 9 of this document.
    
    "Licensor" shall mean the copyright owner or entity authorized by the copyright owner that is granting the License.
    
    "Legal Entity" shall mean the union of the acting entity and all other entities that control, are controlled by, or are under common control with that entity. For the purposes of this definition, "control" means (i) the power, direct or indirect, to cause the direction or management of such entity, whether by contract or otherwise, or (ii) ownership of fifty percent (50%) or more of the outstanding shares, or (iii) beneficial ownership of such entity.
    
    "You" (or "Your") shall mean an individual or Legal Entity exercising permissions granted by this License.
    
    "Source" form shall mean the preferred form for making modifications, including but not limited to software source code, documentation source, and configuration files.
    
    "Object" form shall mean any form resulting from mechanical transformation or translation of a Source form, including but not limited to compiled object code, generated documentation, and conversions to other media types.
    
    "Work" shall mean the work of authorship, whether in Source or Object form, made available under the License, as indicated by a copyright notice that is included in or attached to the work (an example is provided in the Appendix below).
    
    "Derivative Works" shall mean any work, whether in Source or Object form, that is based on (or derived from) the Work and for which the editorial revisions, annotations, elaborations, or other modifications represent, as a whole, an original work of authorship. For the purposes of this License, Derivative Works shall not include works that remain separable from, or merely link (or bind by name) to the interfaces of, the Work and Derivative Works thereof.
    
    "Contribution" shall mean any work of authorship, including the original version of the Work and any modifications or additions to that Work or Derivative Works thereof, that is intentionally submitted to Licensor for inclusion in the Work by the copyright owner or by an individual or Legal Entity authorized to submit on behalf of the copyright owner. For the purposes of this definition, "submitted" means any form of electronic, verbal, or written communication sent to the Licensor or its representatives, including but not limited to communication on electronic mailing lists, source code control systems, and issue tracking systems that are managed by, or on behalf of, the Licensor for the purpose of discussing and improving the Work, but excluding communication that is conspicuously marked or otherwise designated in writing by the copyright owner as "Not a Contribution."
    
    "Contributor" shall mean Licensor and any individual or Legal Entity on behalf of whom a Contribution has been received by Licensor and subsequently incorporated within the Work.
    
2. Grant of Copyright License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare Derivative Works of, publicly display, publicly perform, sublicense, and distribute the Work and such Derivative Works in Source or Object form.
3. Grant of Patent License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable (except as stated in this section) patent license to make, have made, use, offer to sell, sell, import, and otherwise transfer the Work, where such license applies only to those patent claims licensable by such Contributor that are necessarily infringed by their Contribution(s) alone or by combination of their Contribution(s) with the Work to which such Contribution(s) was submitted. If You institute patent litigation against any entity (including a cross-claim or counterclaim in a lawsuit) alleging that the Work or a Contribution incorporated within the Work constitutes direct or contributory patent infringement, then any patent licenses granted to You under this License for that Work shall terminate as of the date such litigation is filed.
4. Redistribution. You may reproduce and distribute copies of the Work or Derivative Works thereof in any medium, with or without modifications, and in Source or Object form, provided that You meet the following conditions:
    
    (a) You must give any other recipients of the Work or Derivative Works a copy of this License; and
    
    (b) You must cause any modified files to carry prominent notices stating that You changed the files; and
    
    (c) You must retain, in the Source form of any Derivative Works that You distribute, all copyright, patent, trademark, and attribution notices from the Source form of the Work, excluding those notices that do not pertain to any part of the Derivative Works; and
    
    (d) If the Work includes a "NOTICE" text file as part of its distribution, then any Derivative Works that You distribute must include a readable copy of the attribution notices contained within such NOTICE file, excluding those notices that do not pertain to any part of the Derivative Works, in at least one of the following places: within a NOTICE text file distributed as part of the Derivative Works; within the Source form or documentation, if provided along with the Derivative Works; or, within a display generated by the Derivative Works, if and wherever such third-party notices normally appear. The contents of the NOTICE file are for informational purposes only and do not modify the License. You may add Your own attribution notices within Derivative Works that You distribute, alongside or as an addendum to the NOTICE text from the Work, provided that such additional attribution notices cannot be construed as modifying the License.
    
    You may add Your own copyright statement to Your modifications and may provide additional or different license terms and conditions for use, reproduction, or distribution of Your modifications, or for any such Derivative Works as a whole, provided Your use, reproduction, and distribution of the Work otherwise complies with the conditions stated in this License.
    
5. Submission of Contributions. Unless You explicitly state otherwise, any Contribution intentionally submitted for inclusion in the Work by You to the Licensor shall be under the terms and conditions of this License, without any additional terms or conditions. Notwithstanding the above, nothing herein shall supersede or modify the terms of any separate license agreement you may have executed with Licensor regarding such Contributions.
6. Trademarks. This License does not grant permission to use the trade names, trademarks, service marks, or product names of the Licensor, except as required for reasonable and customary use in describing the origin of the Work and reproducing the content of the NOTICE file.
7. Disclaimer of Warranty. Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.
8. Limitation of Liability. In no event and under no legal theory, whether in tort (including negligence), contract, or otherwise, unless required by applicable law (such as deliberate and grossly negligent acts) or agreed to in writing, shall any Contributor be liable to You for damages, including any direct, indirect, special, incidental, or consequential damages of any character arising as a result of this License or out of the use or inability to use the Work (including but not limited to damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses), even if such Contributor has been advised of the possibility of such damages.
9. Accepting Warranty or Additional Liability. While redistributing the Work or Derivative Works thereof, You may choose to offer, and charge a fee for, acceptance of support, warranty, indemnity, or other liability obligations and/or rights consistent with this License. However, in accepting such obligations, You may act only on Your own behalf and on Your sole responsibility, not on behalf of any other Contributor, and only if You agree to indemnify, defend, and hold each Contributor harmless for any liability incurred by, or claims asserted against, such Contributor by reason of your accepting any such warranty or additional liability.

END OF TERMS AND CONDITIONS

APPENDIX: How to apply the Apache License to your work.

```
  To apply the Apache License to your work, attach the following
  boilerplate notice, with the fields enclosed by brackets "[]"
  replaced with your own identifying information. (Don't include
  the brackets!)  The text should be enclosed in the appropriate
  comment syntax for the file format. We also recommend that a
  file or class name and description of purpose be included on the
  same "printed page" as the copyright notice for easier
  identification within third-party archives.

```

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

```
   <http://www.apache.org/licenses/LICENSE-2.0>

```

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
</details>

<details>
<summary>KakaoOpenSDK</summary>
 
Apache License Version 2.0, January 2004 [http://www.apache.org/licenses/](http://www.apache.org/licenses/)

TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

1. Definitions.
    
    "License" shall mean the terms and conditions for use, reproduction, and distribution as defined by Sections 1 through 9 of this document.
    
    "Licensor" shall mean the copyright owner or entity authorized by the copyright owner that is granting the License.
    
    "Legal Entity" shall mean the union of the acting entity and all other entities that control, are controlled by, or are under common control with that entity. For the purposes of this definition, "control" means (i) the power, direct or indirect, to cause the direction or management of such entity, whether by contract or otherwise, or (ii) ownership of fifty percent (50%) or more of the outstanding shares, or (iii) beneficial ownership of such entity.
    
    "You" (or "Your") shall mean an individual or Legal Entity exercising permissions granted by this License.
    
    "Source" form shall mean the preferred form for making modifications, including but not limited to software source code, documentation source, and configuration files.
    
    "Object" form shall mean any form resulting from mechanical transformation or translation of a Source form, including but not limited to compiled object code, generated documentation, and conversions to other media types.
    
    "Work" shall mean the work of authorship, whether in Source or Object form, made available under the License, as indicated by a copyright notice that is included in or attached to the work (an example is provided in the Appendix below).
    
    "Derivative Works" shall mean any work, whether in Source or Object form, that is based on (or derived from) the Work and for which the editorial revisions, annotations, elaborations, or other modifications represent, as a whole, an original work of authorship. For the purposes of this License, Derivative Works shall not include works that remain separable from, or merely link (or bind by name) to the interfaces of, the Work and Derivative Works thereof.
    
    "Contribution" shall mean any work of authorship, including the original version of the Work and any modifications or additions to that Work or Derivative Works thereof, that is intentionally submitted to Licensor for inclusion in the Work by the copyright owner or by an individual or Legal Entity authorized to submit on behalf of the copyright owner. For the purposes of this definition, "submitted" means any form of electronic, verbal, or written communication sent to the Licensor or its representatives, including but not limited to communication on electronic mailing lists, source code control systems, and issue tracking systems that are managed by, or on behalf of, the Licensor for the purpose of discussing and improving the Work, but excluding communication that is conspicuously marked or otherwise designated in writing by the copyright owner as "Not a Contribution."
    
    "Contributor" shall mean Licensor and any individual or Legal Entity on behalf of whom a Contribution has been received by Licensor and subsequently incorporated within the Work.
    
2. Grant of Copyright License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare Derivative Works of, publicly display, publicly perform, sublicense, and distribute the Work and such Derivative Works in Source or Object form.
3. Grant of Patent License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable (except as stated in this section) patent license to make, have made, use, offer to sell, sell, import, and otherwise transfer the Work, where such license applies only to those patent claims licensable by such Contributor that are necessarily infringed by their Contribution(s) alone or by combination of their Contribution(s) with the Work to which such Contribution(s) was submitted. If You institute patent litigation against any entity (including a cross-claim or counterclaim in a lawsuit) alleging that the Work or a Contribution incorporated within the Work constitutes direct or contributory patent infringement, then any patent licenses granted to You under this License for that Work shall terminate as of the date such litigation is filed.
4. Redistribution. You may reproduce and distribute copies of the Work or Derivative Works thereof in any medium, with or without modifications, and in Source or Object form, provided that You meet the following conditions:
    
    (a) You must give any other recipients of the Work or Derivative Works a copy of this License; and
    
    (b) You must cause any modified files to carry prominent notices stating that You changed the files; and
    
    (c) You must retain, in the Source form of any Derivative Works that You distribute, all copyright, patent, trademark, and attribution notices from the Source form of the Work, excluding those notices that do not pertain to any part of the Derivative Works; and
    
    (d) If the Work includes a "NOTICE" text file as part of its distribution, then any Derivative Works that You distribute must include a readable copy of the attribution notices contained within such NOTICE file, excluding those notices that do not pertain to any part of the Derivative Works, in at least one of the following places: within a NOTICE text file distributed as part of the Derivative Works; within the Source form or documentation, if provided along with the Derivative Works; or, within a display generated by the Derivative Works, if and wherever such third-party notices normally appear. The contents of the NOTICE file are for informational purposes only and do not modify the License. You may add Your own attribution notices within Derivative Works that You distribute, alongside or as an addendum to the NOTICE text from the Work, provided that such additional attribution notices cannot be construed as modifying the License.
    
    You may add Your own copyright statement to Your modifications and may provide additional or different license terms and conditions for use, reproduction, or distribution of Your modifications, or for any such Derivative Works as a whole, provided Your use, reproduction, and distribution of the Work otherwise complies with the conditions stated in this License.
    
5. Submission of Contributions. Unless You explicitly state otherwise, any Contribution intentionally submitted for inclusion in the Work by You to the Licensor shall be under the terms and conditions of this License, without any additional terms or conditions. Notwithstanding the above, nothing herein shall supersede or modify the terms of any separate license agreement you may have executed with Licensor regarding such Contributions.
6. Trademarks. This License does not grant permission to use the trade names, trademarks, service marks, or product names of the Licensor, except as required for reasonable and customary use in describing the origin of the Work and reproducing the content of the NOTICE file.
7. Disclaimer of Warranty. Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.
8. Limitation of Liability. In no event and under no legal theory, whether in tort (including negligence), contract, or otherwise, unless required by applicable law (such as deliberate and grossly negligent acts) or agreed to in writing, shall any Contributor be liable to You for damages, including any direct, indirect, special, incidental, or consequential damages of any character arising as a result of this License or out of the use or inability to use the Work (including but not limited to damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses), even if such Contributor has been advised of the possibility of such damages.
9. Accepting Warranty or Additional Liability. While redistributing the Work or Derivative Works thereof, You may choose to offer, and charge a fee for, acceptance of support, warranty, indemnity, or other liability obligations and/or rights consistent with this License. However, in accepting such obligations, You may act only on Your own behalf and on Your sole responsibility, not on behalf of any other Contributor, and only if You agree to indemnify, defend, and hold each Contributor harmless for any liability incurred by, or claims asserted against, such Contributor by reason of your accepting any such warranty or additional liability.

END OF TERMS AND CONDITIONS

APPENDIX: How to apply the Apache License to your work.

```
  To apply the Apache License to your work, attach the following
  boilerplate notice, with the fields enclosed by brackets "[]"
  replaced with your own identifying information. (Don't include
  the brackets!)  The text should be enclosed in the appropriate
  comment syntax for the file format. We also recommend that a
  file or class name and description of purpose be included on the
  same "printed page" as the copyright notice for easier
  identification within third-party archives.

```

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

```
   <http://www.apache.org/licenses/LICENSE-2.0>

```

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
</details>

<details>
<summary>GoogleSignIn</summary>
 
Apache License Version 2.0, January 2004 [http://www.apache.org/licenses/](http://www.apache.org/licenses/)

TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

1. Definitions.
    
    "License" shall mean the terms and conditions for use, reproduction, and distribution as defined by Sections 1 through 9 of this document.
    
    "Licensor" shall mean the copyright owner or entity authorized by the copyright owner that is granting the License.
    
    "Legal Entity" shall mean the union of the acting entity and all other entities that control, are controlled by, or are under common control with that entity. For the purposes of this definition, "control" means (i) the power, direct or indirect, to cause the direction or management of such entity, whether by contract or otherwise, or (ii) ownership of fifty percent (50%) or more of the outstanding shares, or (iii) beneficial ownership of such entity.
    
    "You" (or "Your") shall mean an individual or Legal Entity exercising permissions granted by this License.
    
    "Source" form shall mean the preferred form for making modifications, including but not limited to software source code, documentation source, and configuration files.
    
    "Object" form shall mean any form resulting from mechanical transformation or translation of a Source form, including but not limited to compiled object code, generated documentation, and conversions to other media types.
    
    "Work" shall mean the work of authorship, whether in Source or Object form, made available under the License, as indicated by a copyright notice that is included in or attached to the work (an example is provided in the Appendix below).
    
    "Derivative Works" shall mean any work, whether in Source or Object form, that is based on (or derived from) the Work and for which the editorial revisions, annotations, elaborations, or other modifications represent, as a whole, an original work of authorship. For the purposes of this License, Derivative Works shall not include works that remain separable from, or merely link (or bind by name) to the interfaces of, the Work and Derivative Works thereof.
    
    "Contribution" shall mean any work of authorship, including the original version of the Work and any modifications or additions to that Work or Derivative Works thereof, that is intentionally submitted to Licensor for inclusion in the Work by the copyright owner or by an individual or Legal Entity authorized to submit on behalf of the copyright owner. For the purposes of this definition, "submitted" means any form of electronic, verbal, or written communication sent to the Licensor or its representatives, including but not limited to communication on electronic mailing lists, source code control systems, and issue tracking systems that are managed by, or on behalf of, the Licensor for the purpose of discussing and improving the Work, but excluding communication that is conspicuously marked or otherwise designated in writing by the copyright owner as "Not a Contribution."
    
    "Contributor" shall mean Licensor and any individual or Legal Entity on behalf of whom a Contribution has been received by Licensor and subsequently incorporated within the Work.
    
2. Grant of Copyright License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable copyright license to reproduce, prepare Derivative Works of, publicly display, publicly perform, sublicense, and distribute the Work and such Derivative Works in Source or Object form.
3. Grant of Patent License. Subject to the terms and conditions of this License, each Contributor hereby grants to You a perpetual, worldwide, non-exclusive, no-charge, royalty-free, irrevocable (except as stated in this section) patent license to make, have made, use, offer to sell, sell, import, and otherwise transfer the Work, where such license applies only to those patent claims licensable by such Contributor that are necessarily infringed by their Contribution(s) alone or by combination of their Contribution(s) with the Work to which such Contribution(s) was submitted. If You institute patent litigation against any entity (including a cross-claim or counterclaim in a lawsuit) alleging that the Work or a Contribution incorporated within the Work constitutes direct or contributory patent infringement, then any patent licenses granted to You under this License for that Work shall terminate as of the date such litigation is filed.
4. Redistribution. You may reproduce and distribute copies of the Work or Derivative Works thereof in any medium, with or without modifications, and in Source or Object form, provided that You meet the following conditions:
    
    (a) You must give any other recipients of the Work or Derivative Works a copy of this License; and
    
    (b) You must cause any modified files to carry prominent notices stating that You changed the files; and
    
    (c) You must retain, in the Source form of any Derivative Works that You distribute, all copyright, patent, trademark, and attribution notices from the Source form of the Work, excluding those notices that do not pertain to any part of the Derivative Works; and
    
    (d) If the Work includes a "NOTICE" text file as part of its distribution, then any Derivative Works that You distribute must include a readable copy of the attribution notices contained within such NOTICE file, excluding those notices that do not pertain to any part of the Derivative Works, in at least one of the following places: within a NOTICE text file distributed as part of the Derivative Works; within the Source form or documentation, if provided along with the Derivative Works; or, within a display generated by the Derivative Works, if and wherever such third-party notices normally appear. The contents of the NOTICE file are for informational purposes only and do not modify the License. You may add Your own attribution notices within Derivative Works that You distribute, alongside or as an addendum to the NOTICE text from the Work, provided that such additional attribution notices cannot be construed as modifying the License.
    
    You may add Your own copyright statement to Your modifications and may provide additional or different license terms and conditions for use, reproduction, or distribution of Your modifications, or for any such Derivative Works as a whole, provided Your use, reproduction, and distribution of the Work otherwise complies with the conditions stated in this License.
    
5. Submission of Contributions. Unless You explicitly state otherwise, any Contribution intentionally submitted for inclusion in the Work by You to the Licensor shall be under the terms and conditions of this License, without any additional terms or conditions. Notwithstanding the above, nothing herein shall supersede or modify the terms of any separate license agreement you may have executed with Licensor regarding such Contributions.
6. Trademarks. This License does not grant permission to use the trade names, trademarks, service marks, or product names of the Licensor, except as required for reasonable and customary use in describing the origin of the Work and reproducing the content of the NOTICE file.
7. Disclaimer of Warranty. Unless required by applicable law or agreed to in writing, Licensor provides the Work (and each Contributor provides its Contributions) on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied, including, without limitation, any warranties or conditions of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A PARTICULAR PURPOSE. You are solely responsible for determining the appropriateness of using or redistributing the Work and assume any risks associated with Your exercise of permissions under this License.
8. Limitation of Liability. In no event and under no legal theory, whether in tort (including negligence), contract, or otherwise, unless required by applicable law (such as deliberate and grossly negligent acts) or agreed to in writing, shall any Contributor be liable to You for damages, including any direct, indirect, special, incidental, or consequential damages of any character arising as a result of this License or out of the use or inability to use the Work (including but not limited to damages for loss of goodwill, work stoppage, computer failure or malfunction, or any and all other commercial damages or losses), even if such Contributor has been advised of the possibility of such damages.
9. Accepting Warranty or Additional Liability. While redistributing the Work or Derivative Works thereof, You may choose to offer, and charge a fee for, acceptance of support, warranty, indemnity, or other liability obligations and/or rights consistent with this License. However, in accepting such obligations, You may act only on Your own behalf and on Your sole responsibility, not on behalf of any other Contributor, and only if You agree to indemnify, defend, and hold each Contributor harmless for any liability incurred by, or claims asserted against, such Contributor by reason of your accepting any such warranty or additional liability.

END OF TERMS AND CONDITIONS

APPENDIX: How to apply the Apache License to your work.

```
  To apply the Apache License to your work, attach the following
  boilerplate notice, with the fields enclosed by brackets "[]"
  replaced with your own identifying information. (Don't include
  the brackets!)  The text should be enclosed in the appropriate
  comment syntax for the file format. We also recommend that a
  file or class name and description of purpose be included on the
  same "printed page" as the copyright notice for easier
  identification within third-party archives.

```

Copyright [yyyy] [name of copyright owner]

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

```
   <http://www.apache.org/licenses/LICENSE-2.0>

```

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
</details>


