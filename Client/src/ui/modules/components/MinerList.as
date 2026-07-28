package ui.modules.components
{
    import flash.display.Sprite;

    import models.PlayerModel;
    import models.MinerModel;


    public class MinerList extends Sprite
    {
        private var entries:Array = [];


        public function MinerList()
        {

        }


        public function refresh(
            player:PlayerModel
        ):void
        {
            clear();


            var yPos:int = 0;


            for each(
                var miner:MinerModel
                in player.miners
            )
            {
                var entry:MinerEntry =
                    new MinerEntry();


                entry.y =
                    yPos;


                entry.update(
                    miner
                );


                addChild(
                    entry
                );


                entries.push(
                    entry
                );


                yPos += 30;
            }
        }


        private function clear():void
        {
            while(numChildren > 0)
            {
                removeChildAt(0);
            }


            entries = [];
        }
    }
}