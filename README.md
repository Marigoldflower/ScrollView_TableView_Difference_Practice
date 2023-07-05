# ScrollView_TableView_Difference_Practice

### TableView 사용의 장점  

------------

우선 TableView는 테이블 뷰 셀을 재사용하여, 보여줘야 할 데이터의 구조를 "재활용"하는 방식을 사용한다.  
이는 TableView의 굉장히 큰 장점인데, 데이터가 엄청나게 많아도  
TableView는 화면을 채울만큼만 인스턴스를 생성하기에 메모리 용량 걱정을 하지 않아도 되기 때문이다.   


### TableView 사용의 단점  

------------

하지만 셀을 "재사용"하는 것은 TableView의 단점이기도 하다.  
우선 사용했던 셀을 다음 줄에서도, 그 다음 줄에서도, 10번째 줄에서도 계속 똑같이 사용하기 때문에  
각각의 셀의 구성이나 형태를 다르게 만들고자 할 때에는 TableView를 사용해서는 안 된다.

그림을 통해 자세히 알아보자.  

<img width="373" alt="스크린샷 2023-07-05 오후 5 54 50" src="https://github.com/Marigoldflower/ScrollView_TableView_Difference_Practice/assets/100112897/30ec76e7-1fc2-4afc-b79d-dcde7cd9a108">  

  
이미지, 두꺼운 폰트, 작은 글씨체의 셀이 계속 반복되는 것을 확인할 수 있다.  
TableView는 사용했던 셀을 다시 재사용하기 때문에 셀의 형태와 구성은 동일하다.  

반면에 다음과 같은 그림을 보자.

![814b564c-e3b1-4939-9c2e-e1decb4a173c](https://github.com/Marigoldflower/ScrollView_TableView_Difference_Practice/assets/100112897/7e88f80f-5731-4308-a40b-13aaca277808)  


위의 날씨 앱을 보면 각각의 구성요소가 모두 형태가 다른 것을 확인할 수 있다.  
첫 번째 영역은 날씨 Label만 존재하고, 세 번째 영역은 여러 날씨 데이터를 가로로 스크롤하여 확인할 수 있게끔 되어있으며  
네 번째 영역은 여러 날씨 데이터를 세로로 스크롤하여 확인할 수 있다.
따라서 위와 같은 날씨 앱은 셀을 재활용하는 방식을 채택한 것이 아닌   
각각의 객체들이 서로 다른 형태를 띄도록 만들어준 것이다.  


### ScrollView와 StackView의 조합

------------








정리하자면 **재사용셀을 사용해야할 때**엔 **TableView를 사용**하고  
**재사용셀을 사용하지 않고 서로 다른 여러 객체들을 띄워야 할 때**에는 **ScrollView + StackView 조합을 사용**하면 된다. 


------------

## 출처 

- [https://soojin.ro/blog/uitableview-hype](https://soojin.ro/blog/uitableview-hype)



