package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Main extends Sprite{

		//public var speed:int = 5;
		private var mcChicken:McChicken;
		private var isDown:Boolean = false;
		
		public function Main() {
			mcChicken = new McChicken();
			this.addChild(mcChicken);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onUp);
		}
		
		private function onDown(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case 38 : {
					isDown = true;
					if(mcChicken.speed > -10) {
						mcChicken.speed -= 2.0;
					}
				}
				break;
			}
		}
		
		private function onUp(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case 38 : {
					isDown = false;
				} break;
			}
		}
		
		/*if(stage.contains(mcChicken)){
			if(e.target.y >= (400 - (e.target.height / 2))){
				mcChicken.removeEventListener(Event.ENTER_FRAME, loop);
				this.removeChild(mcChicken);
			}
		}*/

	}
	
}
