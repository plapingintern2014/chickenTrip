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
				this.x = 600 + (Math.random() *1000);
				this.y = (Math.random() * 100)+300;
			}
			else if(numCase == 2){ 
				this.x = 600 + (Math.random() *1000);
				this.y = Math.random() * 100;
			}
		}
		
		public function run() : void	{
			if(this.x<=0){
				this.createEgg();
			}
			else{
				this.x += speedX;
				this.speedX = -5;
			}
		}
	}
	
}
