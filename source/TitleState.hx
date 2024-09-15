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
	var enter2:FlxSprite;
	var enter3:FlxSprite;
	var logo:FlxText;

	override public function create()
	{
		super.create();
		bg = new FlxSprite();
		bg.makeGraphic(1280, 720, 0xFFC8C8C8);
		add(bg);
		logo = new FlxText();
		logo.text = 'LOBOTOMY CLICKER';
		logo.setFormat("assets/fonts/pusab.otf", 64);
		logo.x = FlxG.width / 2 - logo.width / 2;
		logo.y = 0;
		add(logo);
		enter = new FlxSprite();
		enter.makeGraphic(160, 90, FlxColor.LIME);
		enter.x = FlxG.width / 2 - enter.width / 2;
		enter.y = FlxG.height / 2 - enter.height / 2;
		add(enter);
		enter2 = new FlxSprite();
		enter2.makeGraphic(160, 90, FlxColor.LIME);
		enter2.x = FlxG.width / 2 - enter.width / 2;
		enter2.y = (FlxG.height / 2 - enter.height / 2) + enter.height;
		add(enter2);
		enter3 = new FlxSprite();
		enter3.makeGraphic(160, 90, FlxColor.LIME);
		enter3.x = FlxG.width / 2 - enter.width / 2;
		enter3.y = (FlxG.height / 2 - enter.height / 2) + (enter.height * 2);
		add(enter3);
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
		if (FlxG.mouse.overlaps(enter2))
		{
			enter2.alpha = 0.5;
			if (FlxG.mouse.justPressed)
			{
				FlxG.switchState(new PingPong());
			}
			if (FlxG.mouse.justReleased)
			{
				enter2.alpha = 1;
			}
		}
		if (FlxG.mouse.overlaps(enter3))
		{
			enter3.alpha = 0.5;
			if (FlxG.mouse.justPressed)
			{
				FlxG.switchState(new FiveNights());
			}
			if (FlxG.mouse.justReleased)
			{
				enter3.alpha = 1;
			}
		}
	}
}