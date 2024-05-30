package Parking;

import java.time.Instant;
import java.time.temporal.ChronoUnit;


abstract class AbstractCar {
    String carNum;
    String carType;
    int memNum;
    boolean isPaid;
    int paidAmount;
    Instant timeIn;
    Instant timeOut;
    
    public AbstractCar(String carNum, String carType) {
        this.carNum = carNum;
        this.carType = carType;
    }
}

interface InnerCar {
    void setMemNum(int memNum);
    void setTimeOut();
    String getCarNum();
    String getCarType();
    int getPaidAmount();
    void setPaidAmount(int paidAmount);
    void addAnHour();
}



public class Car extends AbstractCar implements InnerCar {
    String carNum;
    String carType;
    boolean isPaid = false;
    String memNum = null;
    int paidAmount = 0;
    int totalPay = 0;
    public Instant timeIn = Instant.now();
    public Instant timeOut = null;

    public Car(String carNum, String carType) {
        super(carNum, carType);
    	this.carNum = carNum;
        this.carType = carType;
    }


    public String getCarNum() {
        return this.carNum;
    }

    public String getCarType() {
        return this.carType;
    }

    public void setMemNum(String memNum) {
        this.memNum = memNum;
    }

    public void setTimeOut() {
        this.timeOut = Instant.now();
    }

    public int getPaidAmount() {
        return this.paidAmount;
    }

    public void setPaidAmount(int paidAmount) {
        this.paidAmount += paidAmount;
    }

    public void addAnHour() {
        this.timeIn = this.timeIn.minus(1, ChronoUnit.HOURS);
    }

    public void addHours(int n) {
        this.timeIn = this.timeIn.minus(n, ChronoUnit.HOURS);
    }
    
    public void carPrint() {
    	System.out.printf("차량 번호: %-8s | 차량 종류: %-5s | 입차 시간: %-8s\n", carNum, carType, Utils.timeFomatter(timeIn));
    }

    public void setTotalPay(int amount) {
        this.totalPay += amount;
    }


    @Override
    public void setMemNum(int memNum) {
        throw new UnsupportedOperationException("Unimplemented method 'setMemNum'");
    }
}