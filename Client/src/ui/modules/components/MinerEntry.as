package ui.modules.components
{
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;

    import models.MinerModel;


    public class MinerEntry extends Sprite
    {
        private var nameText:TextField;
        private var hashText:TextField;
        private var rewardText:TextField;


        public function MinerEntry()
        {
            build();
        }


        private function build():void
        {
            nameText =
                createText(
                    0,
                    0,
                    200
                );

            hashText =
                createText(
                    210,
                    0,
                    80
                );

            rewardText =
                createText(
                    300,
                    0,
                    100
                );


            addChild(nameText);
            addChild(hashText);
            addChild(rewardText);
        }


        private function createText(
            xPos:int,
            yPos:int,
            width:int
        ):TextField
        {
            var field:TextField =
                new TextField();


            field.x =
                xPos;

            field.y =
                yPos;

            field.width =
                width;

            field.height =
                25;


            field.defaultTextFormat =
                new TextFormat(
                    "_sans",
                    14
                );


            return field;
        }


        public function update(
            miner:MinerModel
        ):void
        {
            nameText.text =
                miner.name;


            hashText.text =
                "Hash: " +
                miner.hashrate;


            rewardText.text =
                "+" +
                miner.lastReward;
        }
    }
}