package  {
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class McEgg extends Sprite{
		private var speedX:Number;
		private var _isStop:Boolean;

		public function McEgg(_name : int, speedX: Number) {
			this.name = "Egg" + _name;
			this.x = Math.random() * 550 + 550;
			this.y = Math.random() * 400;
			this.speedX = speedX;
			this.startMove();
		}
		
		public function startMove() : void	{
			this.isStop = false;
		}
		
		public function stopMove() : void	{
			this.isStop = true;
		}
		
		public function set isStop(t:Boolean) : void	{
			this._isStop = t;
		}
		
		public function get isStop()	: Boolean	{
			return this._isStop;
		}
		public function update() : void	{
			if(!this.isStop)	{
				this.x += speedX;
					this.speedX = -5;
			}
		}
	}
	
}
