package Parking;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.Scanner;


interface InnerParkingLot
{
	void carIn();
	void carOut(Car car);
	int getCurrentSpace();
    String errorType(int errorCode);
    void setPricePerTenMin(int price);
//    void showAllOutCarPayments();
}

public class ParkingLot implements InnerParkingLot{
    CarArray currentCars = new CarArray(); // database
    CarArray outCars = new CarArray(); // database
    int spaceTotal = 70; // 전체 주차가능 수
    private int space = this.currentCars.size(); // 현재 주차중인 수
    int pricePerTenMin = 200;

    
    @Override
    public int getCurrentSpace() { // 현재 주차가능 공간
        int spaceLeft = spaceTotal - space;
        return spaceLeft;
    }
    
    @Override
    public void carIn() {
        if (this.space < this.spaceTotal) {
        	Scanner sc = new Scanner(System.in);
			
			System.out.print("입차 차량 번호 입력(0 입력시 랜덤 생성) > ");
			String inCarNum = sc.nextLine(); // 차량 번호 입력
			inCarNum = Utils.fakeCarNumRecognizer(inCarNum);
            String strCarType = null;
            List<String> selectCarType = Arrays.asList("일반", "경차");
            int intCarType = Utils.showMenu(selectCarType, sc);
            if (intCarType == 1) {
                strCarType = "일반";
            }
            else if (intCarType == 2) {
                strCarType = "경차";
            }		
			currentCars.add(new Car(inCarNum, strCarType)); // carNum, carType 가지는 자동차 입차
            setSpace();
			Utils.showCarInfo(inCarNum, "입고");
			Utils.showLotInfo(getCurrentSpace()); // 남은 주차 자리 출력
        }
        else {
            System.out.println(errorType(1));
        }
    }

    public void carIn(Car car) {
        if (this.space < this.spaceTotal) {
            currentCars.add(car);
            setSpace();
        }
        else {
            System.out.println(errorType(1));
        }
    }
    
    @Override
    public void carOut(Car car) {
    	if (car.isPaid == true) {
    		currentCars.remove(car);
            outCars.add(car); // 차량 출고
            }
    	else {
            System.out.println(errorType(3));
    	}
        setSpace();
    }


    @Override
    public String errorType(int errorCode) { // 에러 정의
        switch (errorCode) {
            case 1:
                return "주차 공간이 가득 찼습니다.";
            case 2:
            	return "주차된 차량이 없습니다.";
            case 3:
                return "정산이 완료되지 않았습니다.";
            case 4:
            	return "출차된 차량이 없습니다.";
            default:
                return "오류없음";
        }
    }

    @Override
    public void setPricePerTenMin(int price) {
        this.pricePerTenMin = price;
    }

//    @Override
//    public void showAllOutCarPayments() {
//        if (outCars.size() == 0) {
//            System.out.println("결제된 차량이 없습니다.");
//        }
//        else {
//                for (Car car : outCars) {
//                System.out.printf("차량번호: %s 결제금액: %d \n", car.carNum, car.totalPay);
//            }
//        }
//    }

    public void setTestCurrentCars(int num) {
        Utils.makeCars(num, this);
        for (Car car : this.currentCars) {
            car.addHours(randNum(1, 6));
        }
    }

    public void setTestOutCarsAll() {
        if (this.currentCars.size() == 0) {
            System.out.println("사이즈가 0입니다.");
        }
        else {
            while(this.currentCars.size() != 0) {
                NewPayment pay = new NewPayment(this.currentCars.get(0), this);
                pay.execPay(pay.getAmount());
            }
        }
    }

    public void setTestOutCars(int num, MemberArray ma) {
        if (this.currentCars.size() == 0) {
            System.out.println("사이즈가 0입니다.");
        }
        else {
            if (this.currentCars.size() < num) {
                num = this.currentCars.size();
            }
            num = this.currentCars.size() - num;
            while(this.currentCars.size() > num) {
                NewPayment pay = new NewPayment(this.currentCars.get(0), this);
                pay.setDiscount(ma);
                pay.execPay(pay.getAmount());
            }
        }
    }

    public int randNum(int min, int max) {
        Random random = new Random();
        int rNum = random.nextInt(max - min + 1) + min;
        return rNum;
    }

    private void setSpace() {
        this.space = this.currentCars.size();
    }

    public int getSpace() {
        return this.space;
    }
}
