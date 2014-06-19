package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Main extends Sprite{

		private var speed:int = 5;
		private var mcChicken:McChicken;
		private var isDown:Boolean = false;
		
		private var mcGrass:McGrass;
		
		private var mcEgg:McEgg;
		private var i:uint = 0;
		private var speedX:int = 5;
		private var num:uint = 3;
		private var eggs:Array;
		
		public function Main() {
			mcChicken = new McChicken();
			this.addChild(mcChicken);
			mcGrass = new McGrass();
			this.addChild(mcGrass);
			
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
		
		public function loop(e:Event) : void {
			trace(mcChicken.speed);
			for(i = 0; i < eggs.length; i++) {
				eggs[i].update();
				if(this.contains(eggs[i])) {
					if(mcChicken.hitTestObject(eggs[i])) {
						this.removeChild(eggs[i]);
					}
				}
			}
			
			if(this.contains(mcChicken)) {
				if(mcChicken.hitTestObject(mcGrass)) {
					mcChicken.death();
					this.removeChild(mcChicken);
				}
			}
			
					if(mcChicken.y < 0 + (mcChicken.height / 2)) {
						this.removeEventListener(KeyboardEvent.KEY_DOWN, onDown);
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
		

	}
	
}
