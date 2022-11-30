# Setting Constraints with Auto Layout

UIKit 앱은 View의 레이아웃과 그 관계를 설명하기 위해 Constraint 기반의 접근 접근 방식을 사용합니다. Auto Layout은 당신이 선언한 Constraint을 기준으로 View 계층에 있는 모든 뷰의 사이즈와 위치를 동적으로 계산합니다.  
  
이 튜토리얼에서는 Auto Layout의 Constraint를 만들어서 Reminder Cell의 View를 정화하게 배치합니다.  

## 1. Add Constraints with Auto Layout

Auto Layout의 Constraint는 주로 View 계층의 View 사이의 관계를 설명합니다. 이 섹션에서는 `circle button view`와 그 부모인 cell의 content view 사이의 Constraint를 만듭니다.  
  
*Step 생략*  
  
### 📌 Circle button의 constraint 확인

Document Outline에서 circle button 관련 Constraint를 살펴보자. 

~~~markdown
Table View Cell
- Content View
    - Button
        - Constraints
            - width = 44
            - aspect = 1:1
    - Title
    - Date
    - Constraints
        - Button.leading = leading
        - Button.centerY = centerY
~~~

부모 view와 관계된 constraint(위치 관련)는 부모 View의 Constraint에 속하고, button 크기에 관한 Constraint는 button의 Constraint에 속한다.  

## 2. Set Constraints Between Elements

캔버스의 두 view 사이에 constraint를 만들려면 view에서 다른 view로 컨트롤-드래그하면 나오는 메뉴에서 constraint의 종류를 선택하여 사용합니다. 이번 섹션에서는 button, Title label, content view 사이에 constraint를 만듭니다.  
  
*Step 생략*  
  
### 📌 Title label의 constraint 확인

Document Outline에서 Title label 관련 constraint를 살펴보자. 

~~~markdown
Table View Cell
- Content View
    - Button
    - Title
    - Date
    - Constraints
        - Title.top = top
        - Title.leading = Button.trailing
        - trailing >= Title.trailing
~~~

Button 과는 다르게 Label의 크기는 Constraint를 주지 않았는데, Label의 컨텐츠인 텍스트의 길이와 폰트 크기에 따라 자동으로 크기가 설정되어서 그런 것 같다.  
  
trailing은 부모의 trailing과 같거나 작도록 했는데, 텍스트의 길이가 짧으면 trailing이 작아지고, 크더라도 부모의 trailing는 넘기지 않도록 최댓값을 지정하는 느낌이다.

## 3. Add Constraints to the Date Label

이번 섹션에서는 Date Label에 constraint을 추가하여 cell의 레이아웃을 완성합니다.  
  
*Step 생략*  
  
Reminder cell 안의 모든 view에 constraint을 주었습니다. 이 몇 가지 수정으로 cell이 간단하게 새로운 크기와 방향에 적응할 수 있습니다. 이것은 추가 작업 없이 right-to-left 언어도 적응할 수 있게합니다.

### 📌 Date label의 constraint 확인

Document Outline에서 Date label 관련 constraint를 살펴보자. 

~~~markdown
Table View Cell
- Content View
    - Button
    - Title
    - Date
    - Constraints
        - trailing >= Date.trailing
        - Date.top = Title.bottom
        - bottom >= Date.bottom
        - Date.leading = Title.leading
~~~

Date.leading을 Title.leading과 동일하게 하여 Title의 Leading에 의존하여 맞춰지게 했다.  
  
반면에 Date.trailing은 Title과 맞추지 않고 따로 설정했는데, Title과 Date의 컨텐츠(텍스트) 길이가 다를 것이므로 이렇게 설정한 것 같다.
  
Date.bottom은 부모의 bottom과 같거나 작도록 해서 Title과 Date의 폰트 크기가 작아져서 세로 길이가 줄어들어도 부모의 세로 길이와 충돌하지 않도록 하는 것 같다.

## 4. Check Your Understanding

### Q1. view의 너비 또는 높이를 정의할 수 있는 tool은 무엇인가요?

A. Add New Contraints tool

### Q2. view의 constraint에 기반하여 view 계층에서 view의 크기와 위치를 계산하는 기능은 무엇인가요?

A. Auto Layout