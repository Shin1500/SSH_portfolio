package CoffeShop;

import java.util.ArrayList;
import java.util.List;

public class Order {
    private List<String> orderList = new ArrayList<>();
    private List<Integer> orderPrices = new ArrayList<>();
    private int totalSales = 0;
    private List<String> salesItems = new ArrayList<>();
    private List<Integer> salesCounts = new ArrayList<>();

    public void addOrder(String item, int price, int count) {
        int totalPrice = price * count;
        orderList.add(item + " x " + count);
        orderPrices.add(totalPrice);

        int index = salesItems.indexOf(item);
        if (index == -1) {
            salesItems.add(item);
            salesCounts.add(count);
        } else {
        	salesCounts.set(index, salesCounts.get(index) + count);
        }
    }

    public int getTotalOrderAmount() {
        int total = 0;
        for (int price : orderPrices) {
            total += price;
        }
        return total;
    }

    public void clearOrder() {
        orderList.clear();
        orderPrices.clear();
    }

    public void processPayment(int amount) {
        totalSales += amount;
    }

    public int getTotalSales() {
        return totalSales;
    }

    public void showOrderList() {
        System.out.println("주문목록:");
        for (int i = 0; i < orderList.size(); i++) {
            System.out.println(orderList.get(i) + ": " + orderPrices.get(i) + "원");
        }
    }

    public void showSalesStatistics() {
        System.out.println("총 매출 통계: " + totalSales + "원");
        System.out.println("판매된 메뉴 목록:");
        for (int i = 0; i < salesItems.size(); i++) {
            System.out.println(salesItems.get(i) + " x " + salesCounts.get(i));
        }
    }
}



