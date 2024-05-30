package Parking;

//java.util패키지 안의 클래스 사용
//java.util패키지 안의 인터페이스 사용
import java.util.ArrayList; //ArrayList는 크기가 동적으로 조정되는 배열을 구현한 클래스로, 리스트의 요소를 추가, 제거, 수정하는 다양한 기능을 제공한다.
import java.util.Comparator; // Comparator는 객체 간의 비교를 수행하는 인터페이스로, 주로 정렬이나 순서 결정에 사용된다. 객체를 비교하기 위해 compare 메서드를 구현해야 한다.


interface InnerMemberArray { //InnerMemberArray인터페이스 정의. 인터페이스는 메서드의 집합으로, 클래스가 구현해야 하는 메서드를 정의한다
    boolean isMember(String carNum); //매개변수인 carNum이 회원인지 여부를 확인하는 메서드
    Member findMember(String any); //주어진 조건(any)에 해당하는 회원을 찾는 메서드
    void showAll(); //모든 회원의 정보를 출력하는 메서드
    void showMember(String numOrName); //주어진 아이디나 이름에 해당하는 회원의 정보를 출력하는 메서드
    MemberArray sortMemberById(); //회원을 아이디로 정렬한 후 정렬된 회원 목록을 반환
    MemberArray sortMemberIssueDate(); //회원을 회원가입일로 정렬한 후 정렬된 회원 목록을 반환
} 

public class MemberArray extends ArrayList<Member> implements InnerMemberArray { //InnerMemberArray인터페이스를 구현하고 ArrayList클래스를 상속하여 Member객체들을 저장하는 MemberArray클래스 정의
    public boolean isMember(String carNum) { //매개변수인 carNum이 회원인지 여부를 반환하는 메서드
        if (findMember(carNum) == null) { //carNum을 가진 회원이 null이면 
            return false; //해당 차 번호를 가진 회원이 없으면 false를 반환
        }
        return true; //해당 차 번호를 가진 회원이 있으면 true를 반환
    } 

    public Member findMember(String any) { //주어진 조건(any)에 해당하는 회원을 찾는 메서드
        for (Member member : this) { //확장된 for반복문 - MemberArray 객체에 저장된 각 Member 객체를 반복
            if (member.memId.equals(any)) { //주어진 조건(any)에 해당하는 회원Id를 찾으면
                return member; //해당 회원을 반환
            }
            if (member.carNum.equals(any)) { //주어진 조건(any)에 해당하는 차 번호를 찾으면
                return member; //해당 회원을 반환
            }
            if (member.memName.equals(any)) { //주어진 조건(any)에 해당하는 회원이름을 찾으면
                return member; //해당 회원을 반환
            }
        }
        return null; //모든 회원 정보에서 일치하는 회원을 찾지 못한 경우, null을 반환
    } 

    public void showAll() { //모든 회원의 정보를 출력하는 메서드
        System.out.printf("%-15s %-15s %-15s\n", "아이디", "차량번호", "이름"); //아이디, 차량번호, 이름을 출력하는 헤더를 출력
        for (Member member : this) { //확장된 for반복문 - MemberArray 객체에 저장된 각 Member 객체를 반복
            System.out.printf("%-15s %-15s %-15s\n", member.memId, member.carNum, member.memName); //회원Id, 차 번호, 회원이름을 지정된 형식에 맞게 출력
        }
    } 

    public void showAll(MemberArray mlist) { //MemberArray 객체에 저장된 회원들의 정보를 출력하는 메서드
        System.out.printf("%-15s %-15s %-15s\n", "아이디", "차량번호", "이름"); //아이디, 차량번호, 이름을 출력하는 헤더를 출력
        for (Member member : mlist) { //확장된 for반복문 - MemberArray 객체에 저장된 각 mlist 객체를 반복
            System.out.printf("%-15s %-15s %-15s\n", member.memId, member.carNum, member.memName); //회원Id, 차 번호, 회원이름을 지정된 형식에 맞게 출력
        }
    } 

    public void showMember(String numOrName) { //주어진 아이디나 이름에 해당하는 회원의 정보를 출력하는 메서드
        Member member = findMember(numOrName); //주어진 아이디나 이름에 해당하는 회원을 찾아 member 변수에 할당
        if (member == null) { //해당하는 회원이 없으면 null
            System.out.println("검색 결과 없음."); //검색 결과 없음 출력
        }
        else { //해당하는 회원이 있으면
            System.out.printf("%-15s %-15s %-15s\n", "아이디", "차량번호", "이름"); //아이디, 차량번호, 이름을 출력
            System.out.printf("%-15s %-15s %-15s\n", member.memId, member.carNum, member.memName); //아이디, 차 번호, 회원이름을 출력
        }
    } 

    public MemberArray sortMemberById() { //회원을 아이디로 정렬한 후 정렬된 회원 목록을 반환하는 메서드
        MemberArray sortedMember = new MemberArray(); //sortedMember라는 새로운 MemberArray 객체를 생성
        sortedMember.addAll(this); //MemberArray 객체에 저장된 모든 회원을 sortedMember에 복사
        sortedMember.sort(Comparator.comparing(member -> member.memId)); //sortedMember에 저장된 회원들을 memId를 기준으로 정렬, omparator.comparing() 메서드를 사용하여 회원 객체의 memId를 비교
        return sortedMember; //정렬된 회원 목록을 담고 있는 sortedMember 객체 반환
    } 

    public MemberArray sortMemberIssueDate() { //회원을 회원가입일로 정렬한 후 정렬된 회원 목록을 반환
        MemberArray sortedMember = new MemberArray(); //sortedMember라는 새로운 MemberArray 객체를 생성
        sortedMember.addAll(this); //MemberArray 객체에 저장된 모든 회원을 sortedMember에 복사
        sortedMember.sort(Comparator.comparing(member -> member.issueDate)); //sortedMember에 저장된 회원들을 issueDate를 기준으로 정렬, Comparator.comparing() 메서드를 사용하여 회원 객체의 issueDate를 비교
        return sortedMember; //정렬된 회원 목록을 담고 있는 sortedMember 객체를 반환
    } 

    public static void main(String[] args) {
        MemberArray mlist = new MemberArray(); //새로운 MemberArray 객체인 mlist를 생성, mlist는 회원들의 정보를 담고 있다.	

        mlist.add(new Member("123", "이상목", "123나1234")); //mlist에 회원 객체를 추가, 각 회원은 아이디, 이름, 차량번호를 갖고 있다.
        mlist.add(new Member("1233", "김철수", "12나1234")); //mlist에 회원 객체를 추가, 각 회원은 아이디, 이름, 차량번호를 갖고 있다.
        mlist.add(new Member("1243", "김영희", "13나1234")); //mlist에 회원 객체를 추가, 각 회원은 아이디, 이름, 차량번호를 갖고 있다.

        mlist.showMember("이상목"); //showMember 메서드를 호출하여 이름이 "이상목"인 회원의 정보를 출력

    }
}
