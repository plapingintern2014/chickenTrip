package  {
	import flash.text.TextField;
	
	public class TxtScoreBoard extends TextField {
		
		public function TxtScoreBoard() {
			this.x = 500;
			this.y = 20;
		}
		
		public function setScore(score:int){
			this.text = ""+score;
		}
				
	}
	
}
