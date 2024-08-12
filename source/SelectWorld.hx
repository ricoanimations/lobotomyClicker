package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class SelectWorld extends TitleState
{
	var world1:FlxSprite;
	var world2:FlxSprite;
	var world3:FlxSprite;
	var world4:FlxSprite;
	var world5:FlxSprite;
	var world6:FlxSprite;
	var world7:FlxSprite;
	var world8:FlxSprite;

	override public function create()
	{
		super.create();

		bg = new FlxSprite();
		bg.makeGraphic(1280, 720, 0xFF0080FF);
		add(bg);

		world1 = new FlxSprite();
		world1.loadGraphic("assets/images/worlds/world1.png");
		world1.x = 16;
		world1.y = 40;
		world1.antialiasing = true;
		add(world1);

		world2 = new FlxSprite();
		world2.loadGraphic("assets/images/worlds/locked.png");
		world2.x = 332;
		world2.y = 40;
		world2.antialiasing = true;
		add(world2);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(world1))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxG.switchState(new FirstWorld());
			}
		}
	}
}