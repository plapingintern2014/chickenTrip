﻿package  {
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	
	public class Main extends Sprite{
		
		private var map:Map;
		private var mapArr:Array;
		
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
		private var mcGoldEgg:McGoldEgg;
		
		private var specEggs:Array;
		private var mcBlueEgg:McBlueEgg;
		private var mcRedEgg:McRedEgg;
		private var randomEgg:Number;
		
		private var score:int = 0;
		private var txtScoreBoard:TxtScoreBoard;
		
		//obstacle
		private var cloud:Cloud;
		private var forkSpoonArray:Array;
		private var spoon:Spoon;
		private var fork:Fork;
		private var ranForkSpoon:int=1;
		private var snake:Snake;
		private var checkSnake:int=1;

		
		public function Main() {
			
			mapArr = new Array();
			for(i = 0; i < 4; i++){
				map = new Map();
				map.x = 0-(1542*i);
				map.y = 0;
				mapArr.push(map);
				this.addChild(map);
			}
			
			
			
			mcChicken = new McChicken();
			this.addChild(mcChicken);
			mcGrass = new McGrass();
			this.addChild(mcGrass);
			
			
			txtScoreBoard = new TxtScoreBoard();
			this.addChild(txtScoreBoard);
			
			eggs = new Array();
			
			for(i = 0; i < num; i++)	{
				var randomType = Math.random();
				if(randomType > 0.1) {
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
				} else {
					mcGoldEgg = new McGoldEgg(this.speedX);
					eggs.push(mcGoldEgg);
					this.addChild(mcGoldEgg);
				}
			}
			
			specEggs = new Array();
			
			for(i=0; i<num/5; i++){
				randomEgg = Math.random();
				if(randomEgg >= 0.5){
					mcBlueEgg = new McBlueEgg(i);
					specEggs.push(mcBlueEgg);
					this.addChild(mcBlueEgg);
					//trace(mcBlueEgg.x)
				}else if(randomEgg < 0.5){
					mcRedEgg = new McRedEgg(i);
					specEggs.push(mcRedEgg);
					this.addChild(mcRedEgg);
					//trace(mcRedEgg.x)
				}
			}
			
			//ostacle
			cloud = new Cloud(this.speedX);
			this.addChild(cloud);
			
			spoon = new Spoon(this.speedX);
			spoon.x=1000;
			this.addChild(spoon);
			
			fork = new Fork(this.speedX);
			this.addChild(fork);
			
			snake = new Snake();
			
			
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
		
		public function loop(e:Event): void	{
				
				for(i = 0; i<mapArr.length; i++){
					mapArr[i].update();
				}
			
				for(i = 0; i < eggs.length; i++){
					eggs[i].run();
					if(this.contains(eggs[i])&&this.contains(mcChicken)) {
						if(eggs[i].getType()) {
							if(mcChicken.hitTestObject(eggs[i])) {
								score ++;
								txtScoreBoard.setScore(score);
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
						} else {
							if(mcChicken.hitTestObject(eggs[i])) {
								this.removeChild(eggs[i]);
								score += 10;
								txtScoreBoard.setScore(score);
								mcGoldEgg = new McGoldEgg(this.speedX);
								eggs.push(mcGoldEgg);
								this.addChild(mcGoldEgg);
							}
						}
					}
				}
				
				for(i = 0; i < specEggs.length; i++)	{
					specEggs[i].update();
					if(mcChicken.hitTestObject(specEggs[i])){
				   	//trace("hit")
				  	 if(specEggs[i].eggType() === 1){
					   //trace("blue");
					   mcChicken.bigChick();
					   this.removeChild(specEggs[i]);
					   specEggs.splice(i,1);
				   	 }
				   	 if(specEggs[i].eggType() === 2){
					   //trace("red");
					   this.removeChild(specEggs[i]);
					   specEggs.splice(i,1);
				   	 }
				 	}
				}
				
				if(this.contains(mcChicken)) {
					if(mcChicken.hitTestObject(mcGrass)) {
						   mcChicken.death();
					   	this.removeChild(mcChicken);
					}
					
				}
			//cloud
			cloud.update();
			
			//forkAndSpoon
			fork.update();
			
			spoon.update();
			
			//snake
			if(stage.mouseY >= 450 && checkSnake===1){
				this.addChild(snake);
				snake.y = 600;
				snake.x = stage.mouseX;
				snake.snakeStatus(1);
				checkSnake=0;
			}
			
			snake.update();

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
