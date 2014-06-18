﻿package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	
	public class Main extends Sprite{

		//public var speed:int = 5;
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
			
			/*if(!mcChicken.hasEventListener(Event.ENTER_FRAME)) {
				trace("ficlk");
				this.removeChild(mcChicken);
			}*/
		}
		
		public function loop(e:Event)	: void	{
			
				for(i = 0; i < eggs.length; i++)	{
					eggs[i].update();
				}
				
				/*if(mcChicken.hitTestObject(mcEgg)) {
					this.removeChild(mcEgg);
				}*/
				
				if(this.contains(mcChicken)) {
					if(mcChicken.hitTestObject(mcGrass)) {
						   mcChicken.death();
					   	this.removeChild(mcChicken);
					}
					
				}
			
		}
		
		private function onDown(e:KeyboardEvent):void {
			switch(e.keyCode) {
				case 38 : {
					isDown = true;
					if(mcChicken.y < 0 + (mcChicken.height / 2)) {
						stage.removeEventListener(KeyboardEvent.KEY_DOWN, onDown);
					}
					else {
						stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
					}
					if(mcChicken.speed > -10) {
						mcChicken.speed -= 2.0;
					}
				}
				break;
			}
			
			if(mcChicken.y > (400 - (mcChicken.height / 2))) {
				if(this.contains(mcChicken)) {
					mcChicken.death();
					this.removeChild(mcChicken);
				}
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
