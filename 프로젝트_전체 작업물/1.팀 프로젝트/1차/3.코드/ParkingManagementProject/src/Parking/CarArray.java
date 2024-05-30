package Parking;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

interface InnerCarArray {
    Car findCar(String carNum);
    void showAll();
    int showAllCar();
    void showAllPay();
}

public class CarArray extends ArrayList<Car> implements InnerCarArray {

    public Car findCar(String carNum) {
        for (Car car : this) {
            if (car.carNum.equals(carNum)) {
                return car;
            }
        }
        return null;
    }

    public void showAll() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        System.out.printf("%-15s %-15s %-15s %-40s %-40s\n", "차량번호", "차량타입", "결제금액", "입차시간", "출차시간");
        int sum = 0;
        for (Car car : this) {
            LocalDateTime timeIn = LocalDateTime.ofInstant(car.timeIn, ZoneId.systemDefault());
            LocalDateTime timeOut = LocalDateTime.ofInstant(car.timeIn, ZoneId.systemDefault());
            String timeInFormat = timeIn.format(formatter);
            String timeOutFormat = timeOut.format(formatter);
            System.out.printf("%-15s %-15s %d%-15s %-40s %-40s\n", car.carNum, car.carType, car.totalPay, "원", timeInFormat, timeOutFormat);
            sum += car.totalPay;
        }
        System.out.printf("합계: %45d\n", sum);
    }

    public int showAllCar() {
        for (Car car : this) {
            String timeOut = "출차 전";
            if (car.timeOut != null) {
                timeOut = Utils.timeFomatter(car.timeOut);
            }
            System.out.printf("%-15s %-15s %d%-15s %-40s %-40s\n", car.carNum, car.carType, car.totalPay, "원", Utils.timeFomatter(car.timeIn), timeOut);
        }
        return this.size();
    }
    
    public void showAllPay() {
        System.out.printf("%-15s %-15s %-15s\n", "차량번호", "결제금액", "출차시간");
        int sum = 0;
        for (Car car : this) {
            System.out.printf("%-15s %d%-15s %-15s\n", car.carNum, car.totalPay, "원", Utils.timeFomatter(car.timeIn));
            sum += car.totalPay;
        }
        System.out.printf("총 차량 수: %d\n", this.size());
        System.out.printf("합계: %d원\n", sum);
    }
}
