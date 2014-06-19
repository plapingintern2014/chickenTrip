package  {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class McEgg extends Sprite{
		private var speedX:Number;
		private var numCase:Number;

		public function McEgg(speedX: Number, numCase:Number) {
			this.speedX = speedX;
			this.numCase = numCase;
			this.createEgg();
			this.run();
		}
		public function createEgg() :void{
			if(numCase == 1){
				this.x = -(Math.random() *100);
				this.y = (Math.random() * 400);
			}
			else if(numCase == 2){ 
				this.x = -(Math.random() *100);
				this.y = Math.random() * 600;
				
			}
		}
		
		public function run() : void	{
			if(this.x>=1200){
				this.createEgg();
			}
			else{
				this.x += speedX;
				this.speedX = 5;
			}
		}
	}
	
}
