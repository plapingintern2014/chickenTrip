package  {
	import flash.display.Sprite;
	
	public class McRedEgg extends Sprite{
		private var isRedEgg:int = 2;
		private var speedX:int = 5;

		public function McRedEgg(dir:int) {
			this.x = (dir+1)*150;
			this.y = Math.random()*400;
		}
		
		public function update(){
			this.x -= speedX;
		}
		
		public function eggType():int{
			return isRedEgg;
		}

	}
	
}
