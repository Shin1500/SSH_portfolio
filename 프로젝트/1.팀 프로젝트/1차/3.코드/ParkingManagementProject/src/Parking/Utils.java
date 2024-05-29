package Parking;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Scanner;

public class Utils {
    // 메뉴 출력
    public static int showMenu(List<String> menu, Scanner sc) {
        while(true) {
            try {
                int i = 1;
                for(String item : menu) {
                    System.out.printf("%d. %-15s", i, item);
                    i++;
                }
                System.out.println();
                System.out.print("> ");
                int selectedMenu = sc.nextInt();
                sc.nextLine();
                if (selectedMenu > menu.size() || selectedMenu < 1) {
                    throw new IllegalArgumentException("범위 내 숫자 값을 입력해 주세요.");
                }
                return selectedMenu;
            }
            catch (IllegalArgumentException e) {
                System.out.println(e.getMessage());
            }
            catch (Exception e) {
                System.out.println("잘못된 입력입니다.");
                sc.nextLine();
            }
        }
    }

	// UI 출력
    public static void showUI(String str1) {
    	System.out.print("");
    	
    	for(int i = 0; i < str1.length()+6; i++) {
    		System.out.print("━");
    	}
    	System.out.println("");
    	System.out.println("◎ " + str1 + " ◎");
    	System.out.print("");
    	
    	for(int i = 0; i < str1.length()+6; i++) {
    		System.out.print("━");
    	}
    	System.out.println();
    }
    
    // 입출차 알림
    public static void showCarInfo(String carNum, String status) {
    	System.out.printf("%s 차량이 %s 되었습니다.\n", carNum, status);
    }
    
    // 남은 자리 알림
    public static void showLotInfo(int leftSpace) {
    	System.out.printf("주차 자리 %d개 남았습니다.\n", leftSpace);
    }
    
    // 랜덤 차량 번호 생성
    public static String fakeCarNumRecognizer(String carNum) {
        if (carNum.equals("0")) {
            Random random = new Random();
            carNum = String.valueOf(random.nextInt(10, 997)) + randKoChar() + String.valueOf(random.nextInt(1000, 9999));
            return carNum;
        }
        return carNum;
    }

    public static ArrayList<Car> makeCars(int num, ArrayList<Car> cars) {
        for (int i=0; i<num; i++) {
            cars.add(randCar());
        }
        
        return cars;
    }

    public static ArrayList<Car> makeCars(int num, ParkingLot cars) {
        for (int i=0; i<num; i++) {
            cars.carIn(randCar());
        }
        return cars.currentCars;
    }

    public static String randCarType() {
        List<String> carTypes = new ArrayList<>();
        carTypes.add("경차");
        carTypes.add("일반");
        Random random = new Random();
        return carTypes.get(random.nextInt(carTypes.size()));
    }

    public static String randKoChar() {
        List<String> koChar = Arrays.asList(
            "가", "나", "다", "라", "마", "바", "사", "아", "자", "차", 
            "카", "타", "파", "하", "거", "너", "더", "러", "머", "버", 
            "서", "어", "저", "처", "커", "터", "퍼", "허", "고", "노", 
            "도", "로", "모", "보", "소", "오", "조", "초", "코", "토", 
            "포", "호"
        );
        Random random = new Random();
        return koChar.get(random.nextInt(koChar.size()));
    }

    public static Car randCar() {
        Car car = new Car(fakeCarNumRecognizer("0"), randCarType());
        return car;
    }
    
    // 특정 carNum을 가진 Car 객체를 list에서 Car 타입으로 호출
    public static Car findCarInst(ArrayList list, String carNum) {
		for(Iterator<Car> itr = list.iterator(); itr.hasNext();) {
			Car it = itr.next();
			if(carNum.equals(it.carNum)) {
				return it;
			}
		}
        System.out.println("검색된 차량이 없습니다.");
        return null;
	}
	  
    // 특정 ID를 가진 member 객체를 list에서 member 타입으로 호출
    public static Member findMemInst(ArrayList list, String memId) {
		for(Iterator<Member> itr = list.iterator(); itr.hasNext();) {
			Member it = itr.next();
			if(memId.equals(it.memId)) {
				return it;
			}
		}
        System.out.println("검색된 회원이 없습니다."); 
        return null;
	}

    public static String timeFomatter(Instant i) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        LocalDateTime timeOut = LocalDateTime.ofInstant(i, ZoneId.systemDefault());
        String timeOutFormat = timeOut.format(formatter);
        return timeOutFormat;
    }
}
