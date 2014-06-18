package  {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class McChicken extends Sprite {
		
		public var speed:int = 5;
		
		public function McChicken() {
			this.x = 400;
			this.y = 200;
			
			this.addEventListener(Event.ENTER_FRAME, loop);
		}
		
		public function loop(e:Event):void {
			e.target.y += speed;
			speed += 1;
		}
			/*
			if(stage.contains(mcChicken)){
				if(e.target.y >= (400 - (e.target.height / 2))){
					mcChicken.removeEventListener(Event.ENTER_FRAME, loop);
					this.removeChild(mcChicken);
				}
			}*/
	}
	
}
