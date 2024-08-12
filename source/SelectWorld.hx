package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

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
		world3 = new FlxSprite();
		world3.loadGraphic("assets/images/worlds/locked.png");
		world3.x = 648;
		world3.y = 40;
		world3.antialiasing = true;
		add(world3);

		world4 = new FlxSprite();
		world4.loadGraphic("assets/images/worlds/locked.png");
		world4.x = 964;
		world4.y = 40;
		world4.antialiasing = true;
		add(world4);

		world5 = new FlxSprite();
		world5.loadGraphic("assets/images/worlds/locked.png");
		world5.x = 16;
		world5.y = 380;
		world5.antialiasing = true;
		add(world5);

		world6 = new FlxSprite();
		world6.loadGraphic("assets/images/worlds/locked.png");
		world6.x = 332;
		world6.y = 380;
		world6.antialiasing = true;
		add(world6);
		world7 = new FlxSprite();
		world7.loadGraphic("assets/images/worlds/locked.png");
		world7.x = 648;
		world7.y = 380;
		world7.antialiasing = true;
		add(world7);

		world8 = new FlxSprite();
		world8.loadGraphic("assets/images/worlds/locked.png");
		world8.x = 964;
		world8.y = 380;
		world8.antialiasing = true;
		add(world8);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(world1))
		{
			if (FlxG.mouse.justPressed)
			{
				FlxTween.tween(world2, {alpha: 0}, 0.5);
				FlxTween.tween(world3, {alpha: 0}, 0.5);
				FlxTween.tween(world4, {alpha: 0}, 0.5);
				FlxTween.tween(world5, {alpha: 0}, 0.5);
				FlxTween.tween(world6, {alpha: 0}, 0.5);
				FlxTween.tween(world7, {alpha: 0}, 0.5);
				FlxTween.tween(world8, {alpha: 0}, 0.5);
				FlxTween.tween(world1, {x: FlxG.width / 2 - world1.width / 2, y: FlxG.height / 2 - world1.height / 2}, 0.5);
				new FlxTimer().start(1, function(world1Small:FlxTimer)
				{
					FlxTween.tween(world1.scale, {x: 0.9, y: 0.9}, 0.4);
				});
				new FlxTimer().start(1.4, function(world1Scale:FlxTimer)
				{
					FlxTween.tween(world1.scale, {x: 100, y: 100}, 2);
				});
				new FlxTimer().start(3.4, function(world1Timer:FlxTimer)
				{
					FlxG.switchState(new FirstWorld());
				});
			}
		}
	}
}