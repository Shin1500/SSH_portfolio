package CoffeShop;

import java.util.Scanner;

public class Payment {
    private Scanner scanner = new Scanner(System.in);

    public boolean processPayment(int amount) {
        int payment;
        while (true) {
            System.out.println(amount + "원을 계산해주세요");
            payment = scanner.nextInt();
            if (payment >= amount) {
                break;
            } else {
                System.out.println("결제금액이 부족합니다. 다시 결제해주세요.");
            }
        }

        int change = payment - amount;
        System.out.println("결제완료. 잔돈은 " + change + "원 입니다.");
        return true;
    }
}



