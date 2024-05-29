package CoffeShop;

public class Menu {
    public String[] coffeeMenu = {"아메리카노", "카페라테", "카푸치노", "카페모카", "아포카토"};
    public int[] coffeePrices = {4000, 4500, 4500, 5000, 5500};

    public String[] dessertMenu = {"샌드위치", "에그타르트", "딸기 케이크", "치즈 케이크"};
    public int[] dessertPrices = {6000, 3000, 7000, 7000};

    public String[] teaMenu = {"녹차", "레몬차", "유자차"};
    public int[] teaPrices = {3500, 3500, 3500};

    public void showMainMenu() {
    	System.out.println("┌────────────────────┐");
        System.out.println("	메뉴선택       ");
        System.out.println("└────────────────────┘");
        System.out.println("======================");
        System.out.println("▶1.주문 2.매출 통계 3.종료◀");
        System.out.println("======================");
    }

    public void showCategoryMenu() {
        System.out.println("1.커피 2.디저트 3.차");
    }

    public void showCoffeeMenu() {
        System.out.println("1.아메리카노(4000원) 2.카페라테(4500원) 3.카푸치노(4500원) 4.카페모카(5000원) 5.아포카토(5500원) 6.주문목록");
    }

    public void showDessertMenu() {
        System.out.println("1.샌드위치(6000원) 2.에그타르트(3000원) 3.딸기 케이크(7000원) 4.치즈 케이크(7000원) 5.주문목록");
    }

    public void showTeaMenu() {
        System.out.println("1.녹차(3500원) 2.레몬차(3500원) 3.유자차(3500원)");
    }
}


