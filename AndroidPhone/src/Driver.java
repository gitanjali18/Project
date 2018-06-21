import java.util.Scanner;

public class Driver {
	public static void main(String args[]) {
		Scanner scan = new Scanner(System.in);
		
		AndroidPhone phone = new AndroidPhone();
		
		int price,size;
		double thickness;
		boolean isAudioJackPresent;
		String name,brand;
		
    	System.out.println("Phone Name : ");
    	name = scan.nextLine();
	    System.out.println("Phone Brand : ");
	    brand=scan.nextLine();
   	    System.out.println("Phone Price : ");
   	    price = scan.nextInt();
	    System.out.println("Screen Size : ");
	    size = scan.nextInt();
	    System.out.println("Thickness : ");
	    thickness  = scan.nextDouble();
	    System.out.println("Is AudioJackpresent : ");
	    isAudioJackPresent = scan.nextBoolean();
	    
	    phone.buildPhone(price, size, thickness, isAudioJackPresent, name, brand);
	    phone.myAwesomePhone();
	    
	    scan.close();
	}

}
