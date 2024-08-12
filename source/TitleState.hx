package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class TitleState extends FlxState
{
	var bg:FlxSprite;
	var enter:FlxSprite;
	var logo:FlxText;

	override public function create()
	{
		super.create();
		bg = new FlxSprite();
		bg.makeGraphic(1280, 720, 0xFFC8C8C8);
		add(bg);
		logo = new FlxText();
		logo.x = 400;
		logo.y = 400;
		logo.text = 'LOBOTOMY CLICKER';
		logo.setFormat("assets/fonts/pusab.otf", 64);
		add(logo);
		enter = new FlxSprite();
		enter.makeGraphic(160, 90, FlxColor.LIME);
		enter.x = FlxG.width / 2 - enter.width / 2;
		enter.y = FlxG.height / 2 - enter.height / 2;
		add(enter);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(enter))
		{
			enter.alpha = 0.5;
			if (FlxG.mouse.justPressed)
			{
				FlxG.switchState(new SelectWorld());
			}
			if (FlxG.mouse.justReleased)
			{
				enter.alpha = 1;
			}
		}
	}
}