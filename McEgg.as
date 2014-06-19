package  {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class McEgg extends Sprite{
		private var speedX:Number;
		private var _isStop:Boolean;

		public function McEgg(speedX: Number) {
			this.x = (Math.random() * 550) + (Math.random() *1000);
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
