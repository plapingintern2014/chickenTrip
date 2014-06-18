package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Main extends Sprite{

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
					mcChicken.speed = -5;
				}
				break;
			}
		}
		
		private function onUp(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case 38 : {
					isDown = false;
					mcChicken.speed = 7;
				} break;
			}
		}

	}
	
}
