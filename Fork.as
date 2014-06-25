package  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class Fork extends Bitmap{
		private var fork:BitmapData;
		private var speedX:int;
		
		public function Fork(speedX:int) {
			fork = new BDataFork(0,0);
			super(fork);
			
			this.speedX = speedX;
		}
		
		public function update():void{
			this.x += (speedX+10);
			
				if(this.x > 1600)	{
					this.x = -40;
					this.y = (Math.random() * 200) + 200;
				}

		}
		
	}
	
}