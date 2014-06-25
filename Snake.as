package  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	public class Snake extends Bitmap{
		private var snake1:BitmapData;
		private var snake2:BitmapData;
		
		public function Snake() {
			snake1 = new BDataSnake1(0,0);
			snake2 = new BDataSnake2(0,0);
			super(snake1);
		}
			
		public function snakeStatus(id:int):void{
			if(id===1){
				this.bitmapData=snake1;
			}else if(id===2){
				this.bitmapData=snake2;
			}
		}
		
		public function update():void{
				if(this.y>405){ 
				   	this.y -= 5;
					trace("move");
				}
				 else{
					this.snakeStatus(2);
					trace("change");
				}
		}
	}
	
}
