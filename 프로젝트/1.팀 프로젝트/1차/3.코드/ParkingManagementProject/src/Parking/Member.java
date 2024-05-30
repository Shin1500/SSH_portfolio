package Parking;

//java.time패키지 안의 클래스들 사용
import java.time.Instant; //시간의 특정 시점을 표현

public class Member{ //Member클래스 정의
    String memId; //회원Id
    String memName; //회원이름
    String carNum; //차 번호
    Instant issueDate = Instant.now(); //회원가입일(issueDate)은 현재시간

    public Member(String memId, String memName, String carNum) { //Member클래스 생성자 정의
        this.memId = memId; //생성자 매개변수인 memId를 Member클래스의 memId 변수에 할당
        this.memName = memName; //생성자 매개변수인 memName을 Member클래스의 memName 변수에 할당
        this.carNum = carNum; //생성자 매개변수인 carNum을 Member클래스의 carNum 변수에 할당
    } 
    
    public String getId() { //회원Id 반환 메서드
        return this.memId; //현재 인스턴스(Member클래스)의 회원Id를 반환
    } 

    public String getCarNum() { //차 번호 반환 메서드
        return this.carNum; //현재 인스턴스(Member클래스)의 차 번호를 반환
    } 

    public String getName() { //회원이름 반환 메서드
        return this.memName; //현재 인스턴스(Member클래스)의 회원이름을 반환
    } 

    public void setId(String memId) { //회원Id 설정 메서드
        this.memId = memId; //현재 인스턴스(Member클래스)의 memId변수는 매개변수memId으로 설정
    } 

    public void setName(String memName) { //회원이름 설정 메서드
    	this.memName = memName; //현재 인스턴스(Member클래스)의 memName변수는 매개변수memName으로 설정
    }
    
    public void setNum(String carNum) { //차 번호 설정 메서드
        this.carNum = carNum; //현재 인스턴스(Member클래스)의 carNum변수는 매개변수carNum으로 설정
    } 
    
    public void memberPrint() { //회원의 정보를 출력하는 메서드
    	System.out.printf("회원 번호: %-8s | 회원 이름: %-8s | 차량 번호: %-8s\n", memId, memName, carNum); //회원Id, 회원이름, 차 번호를 지정된 형식으로 출력
    }
}