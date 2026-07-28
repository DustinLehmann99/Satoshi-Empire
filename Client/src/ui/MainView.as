package ui
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFormat;
   
   public class MainView extends Sprite
   {
      
      private var text:TextField;
      
      public function MainView()
      {
         super();
         this.text = new TextField();
         this.text.width = 800;
         this.text.height = 600;
         var format:TextFormat = new TextFormat();
         format.size = 24;
         this.text.defaultTextFormat = format;
         this.text.text = "SATOSHI EMPIRE\n\n" + "Connecting...";
         addChild(this.text);
      }
      
      public function update(data:Object) : void
      {
         var miner:Object = null;
         if(data.Player == null)
         {
            return;
         }
         var player:Object = data.Player;
         this.text.text = "SATOSHI EMPIRE\n\n" + "Wallet\n" + player.Wallet.Satoshi + " Satoshi\n\n" + "Bitcoin\n" + player.Wallet.Bitcoin + " BTC\n\n" + "Miners\n";
         for each(miner in player.Miners)
         {
            this.text.appendText("\n" + miner.Name + "\nHashrate: " + miner.Hashrate);
         }
      }
   }
}

