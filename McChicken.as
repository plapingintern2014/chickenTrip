package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class McChicken extends MovieClip {
		
		public var speed:Number = 2.5;
		private var timer:Timer;
		private var _isBig:Boolean = false;
		
		public function McChicken() {
			this.x = 275;
			this.y = 200;
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop(e:Event):void {
			this.y += speed;
			if(speed <= 10) {
				speed ++;
			}
			if(this.y < 0 + (this.height / 2)) {
				var hitSpeed = speed;
				speed = -hitSpeed;
				speed += speed;
			}
		}
		
		public function bigChick(){
			this.timer = new Timer(0,400);
			//trace(this.width);
			//trace(this.height);
			this.timer.addEventListener(TimerEvent.TIMER, tick);
			this.timer.addEventListener(TimerEvent.TIMER_COMPLETE, tock);
			this.timer.start();
		}
		
		public function tick(e:TimerEvent):void{
			this._isBig = true;
			this.width = 150;
			this.height = 170;
		}
		
		public function tock(e:TimerEvent):void{
			this._isBig = false;
			this.width = 76;
			this.height = 86;
		}
		
		public function isBig():Boolean{
			return _isBig;
		}
		
		public function death():void {
			this.removeEventListener(Event.ENTER_FRAME, loop);
		}
	}
	
}
