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
	var shop2:FlxSprite;
	var shopText:FlxText;
	var shopText2:FlxText;
	var lobotomies:FlxText;
	var number:Int = 0;
	var numberMultiplier:Int = 0;

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
		shop.makeGraphic(300, 120, FlxColor.BLACK);
		shop.alpha = 0.5;
		shop.x = 980;
		shop.y = 0;
		add(shop);
		shop2 = new FlxSprite();
		shop2.makeGraphic(300, 120, FlxColor.BLACK);
		shop2.alpha = 0.5;
		shop2.x = 980;
		shop2.y = 120;
		add(shop2);
		shopText = new FlxText(980, 0, 0, '+1 multiplier\n15 lobotomies', 48);
		shopText.setFormat("Times New Roman", 48);
		add(shopText);
		shopText2 = new FlxText(980, 120, 0, '+2 multiplier\n40 lobotomies', 48);
		shopText2.setFormat("Times New Roman", 48);
		add(shopText2);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.mouse.overlaps(face))
		{
			if (FlxG.mouse.justPressed)
			{
				face.scale.set(0.275, 0.275);
				face.updateHitbox();
				number += (1 + numberMultiplier);
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
		if (FlxG.mouse.overlaps(shop) || FlxG.mouse.overlaps(shop2))
		{
			if (FlxG.mouse.justPressed)
			{
				if (FlxG.mouse.overlaps(shop))
				{
					if (number >= 15)
					{
						number -= 15;
						numberMultiplier += 1;
						shop.alpha = 0.1;
					}
				}
				else if (FlxG.mouse.overlaps(shop2))
				{
					if (number >= 40)
					{
						number -= 40;
						numberMultiplier += 2;
						shop2.alpha = 0.1;
					}
				}	
				remove(lobotomies);
				lobotomies = new FlxText(0, 100, 0, '${number} lobotomies', 48);
				lobotomies.setFormat("Times New Roman", 48);
				add(lobotomies);
				if (number < 15)
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
					faceOverlap();
					add(face);
				}
				else if (number >= 15)
				{
					remove(bg);
					bg = new FlxSprite();
					bg.makeGraphic(1280, 720, 0xFFFFC000);
					add(bg);
					remove(face);
					face = new FlxSprite();
					face.loadGraphic("assets/images/auto.png");
					face.scale.set(0.25, 0.25);
					face.updateHitbox();
					face.x = 100;
					face.y = 100;
					faceOverlap();
					add(face);
				}
			}
			if (FlxG.mouse.justReleased)
			{
				shop.alpha = 0.5;
				shop2.alpha = 0.5;
			}
		}
		if (number >= 15)
		{
			remove(bg);
			bg = new FlxSprite();
			bg.makeGraphic(1280, 720, 0xFFFFC000);
			add(bg);
			remove(face);
			face = new FlxSprite();
			face.loadGraphic("assets/images/auto.png");
			face.scale.set(0.25, 0.25);
			face.updateHitbox();
			face.x = 100;
			face.y = 100;
			faceOverlap();
			add(face);
		}
		if (number >= 50)
		{
			remove(bg);
			bg = new FlxSprite();
			bg.makeGraphic(1280, 720, FlxColor.BLUE);
			add(bg);
			remove(face);
			face = new FlxSprite();
			face.loadGraphic("assets/images/easy.png");
			face.scale.set(0.25, 0.25);
			face.updateHitbox();
			face.x = 100;
			face.y = 100;
			faceOverlap();
			add(face);
		}
	}
	private function faceOverlap()
	{
		if (FlxG.mouse.overlaps(face))
		{
			if (FlxG.mouse.justPressed)
			{
				face.scale.set(0.275, 0.275);
				face.updateHitbox();
			}
			else if (FlxG.mouse.justReleased)
			{
				face.scale.set(0.25, 0.25);
				face.updateHitbox();
			}
		}
	}
}
