package  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;

	public class Map extends Bitmap{
		private var map1:BitmapData;
		private var spdX = 5;
		
		public function Map() {
			map1 = new BDataMap1(0,0);
			//this.x = stage.width/2;
			//this.y = stage.height/2;
			super(map1);
			//this.bitmapData = map1;
		}
		
		public function update(){
			this.x += spdX;
		}

	}
	
}
