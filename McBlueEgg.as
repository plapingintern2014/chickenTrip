package  {
	import flash.display.Sprite;
	
	public class McBlueEgg extends Sprite{
		private var isBlueEgg:int = 1;
		private var speedX:int = 5;

		public function McBlueEgg(dir:int) {
			this.x = -(Math.random() *200)*(dir+1);
			this.y = (Math.random() * 600)-135;
		}
		
		public function update():void{
			this.x += speedX;
		}
		
		public function eggType():int{
			return isBlueEgg;
		}

	}
	
}
