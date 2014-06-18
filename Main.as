package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Main extends Sprite{

		//public var speed:int = 5;
		private var mcChicken:McChicken;
		private var isDown:Boolean = false;
		
		private var mcEgg:McEgg;
		private var i:uint = 0;
		private var speedX:int = 5;
		private var num:uint = 3;
		private var eggs:Array;
		
		public function Main() {
			mcChicken = new McChicken();
			this.addChild(mcChicken);
			
			eggs = new Array();
			for(i = 0; i < num; i++)	{
				mcEgg = new McEgg(i, this.speedX);
				eggs.push(mcEgg);
				this.addChild(mcEgg);
			}
			stage.addEventListener(Event.ENTER_FRAME, loop);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onUp);
		}
		
		public function loop(e:Event)	: void	{
			for(i = 0; i < eggs.length; i++)	{
				eggs[i].update();
			}
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
