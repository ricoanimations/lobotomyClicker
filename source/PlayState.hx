package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var bg:FlxSprite;
	var face:FlxSprite;
	var shop:FlxSprite;
	var lobotomies:FlxText;
	var number:Float = 0;
	var numberMultiplier:Float = 1;
	var shopPurchased:Bool = false;

	override public function create()
	{
		super.create();
		bg = new FlxSprite();
		bg.makeGraphic(1280, 720, FlxColor.GRAY);
		add(bg);

		face = new FlxSprite();
		face.loadGraphic("assets/images/unrated.png");
		face.scale.set(0.25, 0.25);
		face.updateHitbox();
		face.x = 100;
		face.y = 100;
		add(face);

		lobotomies = new FlxText(0, 100, 0, '${number} lobotomies', 48);
		lobotomies.setFormat("Times New Roman", 48);
		add(lobotomies);
		shop = new FlxSprite();
		shop.makeGraphic(300, 300, FlxColor.BLACK);
		shop.alpha = 0.5;
		shop.x = 980;
		shop.y = 0;
		add(shop);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(face))
		{
			if (FlxG.mouse.pressed)
			{
				face.scale.set(0.275, 0.275);
				face.updateHitbox();
				if (shopPurchased)
				{
					number += 1 * numberMultiplier;
					numberMultiplier += 1.01;
					Std.string(Std.int(number));
				}
				else
				{
					number += 1;
				}
				remove(lobotomies);
				lobotomies = new FlxText(0, 100, 0, '${number} lobotomies', 48);
				lobotomies.setFormat("Times New Roman", 48);
				add(lobotomies);
			}
			if (FlxG.mouse.justReleased)
			{
				face.scale.set(0.25, 0.25);
				face.updateHitbox();
			}
		}
		if (FlxG.mouse.overlaps(shop))
		{
			if (FlxG.mouse.pressed)
			{
				number -= 100;
				if (number < 100)
				{
					remove(bg);
					bg = new FlxSprite();
					bg.makeGraphic(1280, 720, FlxColor.GRAY);
					add(bg);
					remove(face);
					face = new FlxSprite();
					face.loadGraphic("assets/images/unrated.png");
					face.scale.set(0.25, 0.25);
					face.updateHitbox();
					face.x = 100;
					face.y = 100;
					add(face);
				}
				else if (number >= 100 && number < 500)
				{
					remove(bg);
					bg = new FlxSprite();
					bg.makeGraphic(1280, 720, FlxColor.YELLOW);
					add(bg);
					remove(face);
					face = new FlxSprite();
					face.loadGraphic("assets/images/auto.png");
					face.scale.set(0.25, 0.25);
					face.updateHitbox();
					face.x = 100;
					face.y = 100;
					add(face);
				}
				shop.alpha = 0.1;
				shopPurchased = true;
			}
			if (FlxG.mouse.justReleased)
			{
				shop.alpha = 0.5;
			}
		}
		switch (number)
		{
			case 100 | 500:
				remove(bg);
				bg = new FlxSprite();
				switch (number)
				{
					case 100:
						bg.makeGraphic(1280, 720, FlxColor.YELLOW);
					case 500:
						bg.makeGraphic(1280, 720, FlxColor.BLUE);
				}
				add(bg);
				remove(face);
				face = new FlxSprite();
				switch (number)
				{
					case 100:
						face.loadGraphic("assets/images/auto.png");
					case 500:
						face.loadGraphic("assets/images/easy.png");
				}
				face.scale.set(0.25, 0.25);
				face.updateHitbox();
				face.x = 100;
				face.y = 100;
				add(face);
		}
	}
}
