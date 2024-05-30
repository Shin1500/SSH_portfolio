package CoffeShop;
import java.util.Scanner;

public class Main {
    private static Scanner scanner = new Scanner(System.in);
    private static Menu menu = new Menu();
    private static Order order = new Order();
    private static Payment payment = new Payment();

    public static void main(String[] args) {
        while (true) {
            menu.showMainMenu();
            int mainChoice = scanner.nextInt();
            switch (mainChoice) {
                case 1:
                	MainMenu();
                    break;
                case 2:
                	TotalStatistics();
                    break;
                case 3:
                    System.out.println("시스템 종료");
                    return;
                default:
                    System.out.println("잘못된 선택입니다.");
            }
        }
    }

    private static void MainMenu() {
        menu.showCategoryMenu();
        int categoryChoice = scanner.nextInt();
        switch (categoryChoice) {
            case 1:
                menu.showCoffeeMenu();
                ItemCount(menu.coffeeMenu, menu.coffeePrices);
                break;
            case 2:
                menu.showDessertMenu();
                ItemCount(menu.dessertMenu, menu.dessertPrices);
                break;
            case 3:
                menu.showTeaMenu();
                ItemCount(menu.teaMenu, menu.teaPrices);
                break;
            default:
                System.out.println("잘못된 선택입니다.");
        }
    }

    private static void ItemCount(String[] items, int[] prices) {
        int itemChoice = scanner.nextInt();
        if (itemChoice >= 1 && itemChoice <= items.length) {
            String item = items[itemChoice - 1];
            int price = prices[itemChoice - 1];
            System.out.println(item + "를 선택하셨습니다. 수량을 입력해주세요");
            int count = scanner.nextInt();
            order.addOrder(item, price, count);
            System.out.println("수량: " + count + "개");
            System.out.println("1.결제 2.주문목록");
            int choice = scanner.nextInt();
            if (choice == 1) {
                int totalOrderAmount = order.getTotalOrderAmount();
                boolean paymentSuccessful = payment.processPayment(totalOrderAmount);
                if (paymentSuccessful) {
                    order.processPayment(totalOrderAmount);
                    order.clearOrder();
                }
            } else if (choice == 2) {
                order.showOrderList();
            } else {
                System.out.println("잘못된 선택입니다.");
            }
        } else if (itemChoice == items.length + 1) {
            order.showOrderList();
        } else {
            System.out.println("잘못된 선택입니다.");
        }
    }

    private static void TotalStatistics() {
        order.showSalesStatistics();
    }
}

