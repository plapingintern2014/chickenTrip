package  {
	import flash.display.Sprite;
	
	public class McBlueEgg extends Sprite{
		private var isBlueEgg:int = 1;
		private var speedX:int = 5;

		public function McBlueEgg(dir:int) {
			this.x = (dir+1)*150;
			this.y = Math.random()*400;
		}
		
		public function update():void{
			this.x -= speedX;
		}
		
		public function eggType():int{
			return isBlueEgg;
		}

	}
	
}
