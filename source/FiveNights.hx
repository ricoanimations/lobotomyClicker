package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flash.system.System;
import flixel.util.FlxTimer;

class FiveNights extends FlxState
{
    var bar:FlxSprite;
    var health:Float = 100;

    override public function create()
    {
        super.create();
        bar = new FlxSprite();
        bar.makeGraphic(1000, 50, FlxColor.LIME);
        bar.alpha = 0.75;
        bar.x = (FlxG.width / 2) - (bar.width / 2);
        bar.y = (((FlxG.height / 2) - (bar.height / 2)) / 4) * 7;
        add(bar);
    }

    override public function update(elapsed:Float)
	{
		super.update(elapsed);

        if (!FlxG.keys.pressed.G)
        {
            health -= 0.2;
            bar.scale.x = health / 100;
            if (health <= 0)
            {
                health = 0;
                jumpscare();
            }
        }
        else
        {
            health += 0.25;
            bar.scale.x = health / 100;
            if (health > 100)
            {
                health = 100;
            }
        }
    }

    private function jumpscare()
    {
        var scary:FlxSprite;
        scary = new FlxSprite();
        scary.loadGraphic("assets/images/evil-pfp.png");
        scary.screenCenter();
        add(scary);
        new FlxTimer().start(3, function(scare:FlxTimer)
		{
			System.exit(0);
		});
    }
}