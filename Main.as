package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	
	public class Main extends Sprite{

		//public var speed:int = 5;
		private var mcChicken:McChicken;
		private var isDown:Boolean = false;
		
		private var mcGrass:McGrass;
		
		private var eggs:Array;
		private var timer:Timer;
		private var i:uint = 0;
		private var speedX:int = 5;
		private var num:uint = 60;
		private var mcEgg:McEgg;
		
		public function Main() {
			mcChicken = new McChicken();
			this.addChild(mcChicken);
			mcGrass = new McGrass();
			this.addChild(mcGrass);
			
			eggs = new Array();
			
			for(i = 0; i < num; i++)	{
				var random = Math.random();
				if(random > 0.9)	{
					mcEgg = new McEgg(this.speedX,1);
					eggs.push(mcEgg);
					this.addChild(mcEgg);
				}
				else if(random > 0.6)	{
					mcEgg = new McEgg(this.speedX,2);
					eggs.push(mcEgg);
					this.addChild(mcEgg);
				}
			}
			/*
			for(i = 0; i < num; i++)	{
					mcEgg = new McEgg(this.speedX);
					eggs.push(mcEgg);
					this.addChild(mcEgg);
			}*/
			stage.addEventListener(Event.ENTER_FRAME, loop);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onUp);
			
			/*if(!mcChicken.hasEventListener(Event.ENTER_FRAME)) {
				trace("ficlk");
				this.removeChild(mcChicken);
			}*/
		}
		
		public function loop(e:Event)	: void	{
			
				for(i = 0; i < eggs.length; i++){
					eggs[i].run();
					if(this.contains(eggs[i])&&this.contains(mcChicken)) {
						if(mcChicken.hitTestObject(eggs[i])) {
							this.removeChild(eggs[i]);
							var random = Math.random();
							if(random > 0.9)	{
								mcEgg = new McEgg(this.speedX,1);
								eggs.push(mcEgg);
								this.addChild(mcEgg);
							}
							else if(random > 0.6)	{
								mcEgg = new McEgg(this.speedX,2);
								eggs.push(mcEgg);
								this.addChild(mcEgg);
							}
						}
					}
				}
				
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
