package  {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class McEgg extends Sprite{
		private var speedX:Number;
		private var _isStop:Boolean;

		public function McEgg(_name : int, speedX: Number) {
			this.name = "Egg" + _name;
			this.x = Math.random() * 550 +550;
			this.y = Math.random() * 400;
			this.speedX = speedX;
			this.run();
		}
		
		
		public function run() : void	{
				this.x += speedX;
				this.speedX = -5;
		}
	}
	
}
