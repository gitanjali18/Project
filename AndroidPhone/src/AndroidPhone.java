
public class AndroidPhone {
	   private int phonePrice,screenSize;
	   private double thickness;
	   private boolean isAudioJackPresent;
	   private String phoneName,phoneBrand;
	   
	   public void myAwesomePhone(){
		   System.out.println("Phone Name : "+phoneName);
		   System.out.println("Phone Brand : "+phoneBrand);
		   System.out.println("Phone Price : "+phonePrice);
		   System.out.println("Screen Size : "+screenSize);
		   System.out.println("Thickness : "+thickness);
		   System.out.println("Is AudioJackpresent : "+isAudioJackPresent);
   
	   }
	   
	   public void buildPhone(int phonePrice,
			   int screenSize,
	           double thickness,
	           boolean isAudioJackPresent,
	           String phoneName,
	           String phoneBrand) {
		   this.phonePrice=phonePrice;
		   this.screenSize=screenSize;
		   this.thickness=thickness;
		   this.isAudioJackPresent=isAudioJackPresent;
		   this.phoneName=phoneName;
		   this.phoneBrand=phoneBrand;
	   }
} 
