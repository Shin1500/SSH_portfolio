package Parking;

import java.time.Duration;

public class NewPayment {
    Car car;
    ParkingLot parkingLot;
    double discount = 0;
    int basicCharge = 1000;

    public NewPayment(Car car, ParkingLot parkingLot) {
        this.car = car;
        this.parkingLot = parkingLot;
    }

    public void setDiscount(double d) {
        this.discount = d;
    }
    
    public void setDiscount(MemberArray ma) {
        double d1 = 0;
        double d2 = 0;
    	if(this.car.carType.equals("경차"))
    	{
    		d1 = 0.5;
    	}
    	
    	if(ma.findMember(this.car.carNum) != null)
    	{
            d2 = 0.3;
        }
        this.discount = d1;
        
        if(d1 != 0) {
        this.discount = d1*(1+d2);
        } else if(d1 == 0) {
        	this.discount = d2;
        }
    }

    int getAmount() {
        if (car.timeOut == null) {
            car.setTimeOut();
        }
        Duration duration = Duration.between(this.car.timeIn, this.car.timeOut);
        int durationMin = (int) duration.toMinutes()/10;
        int amount = (int)(durationMin*parkingLot.pricePerTenMin*(1-discount) - car.paidAmount) + basicCharge;
        return amount;
    }

    int getChanges(int amount, int receive) {
        return receive - amount;
    }

    Car execPay(int receive) {
        if (car.timeOut == null) {
            car.setTimeOut();
        }
        if (getAmount() == receive) {
            car.setTimeOut();
            System.out.println("----------" + Utils.timeFomatter(car.timeOut));
            car.setPaidAmount(receive);
            car.isPaid = true;
            System.out.printf("안녕히 가세요. 감사합니다.\n");
            parkingLot.carOut(car);
            car.setTotalPay(receive);
            return this.car;
        }
        else if (getAmount() < receive) {
            car.setTimeOut();
            System.out.println("----------" + Utils.timeFomatter(car.timeOut));
            car.setPaidAmount(receive);
            car.isPaid = true;
            System.out.printf("거스름돈은 %d원 입니다. 감사합니다.\n", -getAmount());
            parkingLot.carOut(car);
            car.setTotalPay(receive+getAmount());
            return this.car;
        }
        else {
            car.setTimeOut();
            car.setPaidAmount(receive);
            System.out.printf("다시 정산을 해주시기 바랍니다. 감사합니다.\n");
            car.setTotalPay(receive);
            return this.car;
        }
    }
}
