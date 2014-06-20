package  {
	import flash.display.Sprite;
	
	public class McGoldEgg extends Sprite {

		private var speedX:Number;
		private var numCase:Number;
		private var type:String;

		public function McGoldEgg(speedX: Number) {
			this.speedX = speedX;
			this.type = "gold";
			this.create();
			this.run();
		}
		
		public function create(): void {
			this.x = - (Math.random() * 400);
			this.y = Math.random() * 600;
		}
		
		public function run() : void {
			if(this.x>=1200){
				this.create();
			}
			else{
				this.x += speedX;
				this.speedX = 5;
			}
		}
		
		public function getType() : Boolean {
			return false;
		}
	}
	
}
