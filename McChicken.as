package  {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class McChicken extends Sprite {
		
		public var speed:Number = 2.5;
		
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
				speed = 2.5;
			}
		}
		
		public function death():void {
			this.removeEventListener(Event.ENTER_FRAME, loop);
		}
	}
	
}
