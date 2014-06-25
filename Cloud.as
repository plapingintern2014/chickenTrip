package  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Cloud extends Bitmap{
		private var cloud1:BitmapData;
		private var cloud2:BitmapData;
		private var cloud3:BitmapData;
		private var timer:Timer;
		private var stat:int = 1;
		private var speedX:Number;
		private var i:int;
		
		public function Cloud(speedX: Number) {
			cloud1=new BDataCloud1(0,0);
			cloud2=new BDataCloud2(0,0);
			cloud3=new BDataCloud3(0,0);	
			super(cloud1);
			
			this.speedX = speedX;
			
			this.timer = new Timer(400);
			this.timer.addEventListener(TimerEvent.TIMER, this.tick);
			this.timer.start();
		}
		
		public function cloudStatus(id:int):void{
			if(id===1){
				this.bitmapData=cloud1;
			}else if(id===2){
				this.bitmapData=cloud2;
			}
			else  if(id===3){
				this.bitmapData=cloud3;
				timer.stop();
			}
		}
		
		private function tick(e:TimerEvent):void{
			if(stat===1){
				stat = 2;
				cloudStatus(stat);
			}else{
				stat = 1;
				cloudStatus(stat);
			}
		}
		
		public function update(){
			this.x += (speedX);
	
			if(this.x > 1600)	{
				this.x = -200;
				this.y = (Math.random() * 200) + 200;
			}
		}
	}
	
}
