package Parking;

//java.util패키지 안의 클래스 사용
import java.util.Scanner; //사용자로부터의 입력을 읽어오는데 사용하는 클래스

public class MemberList { //MemberList클래스 정의
	MemberArray mlist = new MemberArray(); //MemberArray 객체인 mlist를 생성
	String memId; //회원Id
	String memName; //회원이름
	String carNum; //차 번호

	public void addMember() { //회원을 추가하는 메서드
		Scanner sc = new Scanner(System.in); //사용자의 입력을 받는 객체 sc생성
		
		System.out.println("회원 정보를 입력하세요."); //회원 정보를 입력하세요 출력
		System.out.print("회원 ID > "); //회원 ID > 출력
		memId = sc.nextLine(); //memId는 사용자가 입력한 회원Id
		
		System.out.print("회원 이름 > "); //회원 이름 > 출력
		memName = sc.nextLine(); //memName는 사용자가 입력한 회원이름
		
		System.out.print("차량 번호 > "); //차량 번호 > 출력
		carNum = sc.nextLine(); //carNum은 사용자가 입력한 차 번호
		
		mlist.add(new Member(memId, memName, carNum)); //사용자로부터 입력받은 회원 정보(memId, memName, carNum)를 사용하여 새로운 Member 객체를 생성하고, 이를 mlist에 추가
	} 
}
	
