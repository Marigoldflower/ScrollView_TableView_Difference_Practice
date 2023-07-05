# ScrollView_TableView_Difference_Practice

### TableView 사용의 장점  

------------

우선 TableView는 테이블 뷰 셀을 재사용하여 보여줘야 할 데이터의 구조를 재활용하는 방식을 사용한다. 
이는 TableView의 굉장히 큰 장점이기도 한데, 데이터가 엄청나게 많아도 TableView는 화면을 채울만큼만 인스턴스를 생성하기에  
메모리 용량 걱정을 하지 않아도 되기 때문이다.   


### TableView 사용의 단점  

------------

하지만 셀을 재사용하는 것은 TableView의 단점이기도 하다.  
우선 사용했던 셀을 다음 줄에서도, 그 다음 줄에서도, 10번째 줄에서도 계속 똑같이 사용하기 때문에  
각각의 셀의 구성이나 형태를 다르게 만들고자 할 때에는 TableView를 사용하기에 적합하지 못하다.  

그림을 통해 알아보자.  

<img width="373" alt="스크린샷 2023-07-05 오후 5 54 50" src="https://github.com/Marigoldflower/ScrollView_TableView_Difference_Practice/assets/100112897/3cb1142b-1315-4f0a-9d02-a98908cf7d71">











정리하자면 **재사용셀을 사용해야할 때**엔 **TableView를 사용**하고  
**재사용셀을 사용하지 않고 서로 다른 여러 객체들을 띄워야 할 때**에는 **ScrollView + StackView 조합을 사용**하면 된다. 


------------

## 출처 

- [https://soojin.ro/blog/uitableview-hype](https://soojin.ro/blog/uitableview-hype)



