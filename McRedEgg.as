package  {
	import flash.display.Sprite;
	
	public class McRedEgg extends Sprite{
		private var isRedEgg:int = 2;
		private var speedX:int = 5;

		public function McRedEgg(dir:int) {
			this.x = -(Math.random() *200)*(dir+1)
			this.y = (Math.random() * 600)-135;
		}
		
		public function update(){
			this.x += speedX;
		}
		
		public function eggType():int{
			return isRedEgg;
		}

	}
	
}
