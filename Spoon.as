package  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	public class Spoon extends Bitmap{
		private var spoon:BitmapData;
		private var speedX:int;
		public function Spoon(speedX:int) {
			spoon = new BDataSpoon(0,0);
			super(spoon);
			
			this.speedX = speedX;
		}
		
		public function update():void{
			this.x += (speedX+10);
			
				if(this.x > 1600)	{
					this.x = -40;
					this.y = (Math.random() *200) + 200;
				}
		}
		
	}
	
}
	