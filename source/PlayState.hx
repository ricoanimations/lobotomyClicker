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
	var shop3:FlxSprite;
	var shop4:FlxSprite;
	var shop5:FlxSprite;
	var shop6:FlxSprite;
	var shopText:FlxText;
	var shopText2:FlxText;
	var shopText3:FlxText;
	var shopText4:FlxText;
	var shopText5:FlxText;
	var shopText6:FlxText;
	var lobotomies:FlxText;
	var number:Int = 0;
	var numberMultiplier:Int = 0;
	var shopNumber:Int = 15;
	var shopNumber2:Int = 40;
	var shopNumber3:Int = 70;
	var shopNumber4:Int = 120;
	var shopNumber5:Int = 200;
	var shopNumber6:Int = 450;
	var shopNumberMultiplier:Int = 1;
	var shopNumberMultiplier2:Int = 2;
	var shopNumberMultiplier3:Int = 3;
	var shopNumberMultiplier4:Int = 5;
	var shopNumberMultiplier5:Int = 8;
	var shopNumberMultiplier6:Int = 15;

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
		shop3 = new FlxSprite();
		shop3.makeGraphic(300, 120, FlxColor.BLACK);
		shop3.alpha = 0.5;
		shop3.x = 980;
		shop3.y = 240;
		add(shop3);
		shop4 = new FlxSprite();
		shop4.makeGraphic(300, 120, FlxColor.BLACK);
		shop4.alpha = 0.5;
		shop4.x = 980;
		shop4.y = 360;
		add(shop4);
		shop5 = new FlxSprite();
		shop5.makeGraphic(300, 120, FlxColor.BLACK);
		shop5.alpha = 0.5;
		shop5.x = 980;
		shop5.y = 480;
		add(shop5);
		shop6 = new FlxSprite();
		shop6.makeGraphic(300, 120, FlxColor.BLACK);
		shop6.alpha = 0.5;
		shop6.x = 980;
		shop6.y = 600;
		add(shop6);
		shopText = new FlxText(980, 0, 0, '+1 multiplier\n${shopNumber} lobotomies', 48);
		shopText.setFormat("Times New Roman", 48);
		add(shopText);
		shopText2 = new FlxText(980, 120, 0, '+2 multiplier\n${shopNumber2} lobotomies', 48);
		shopText2.setFormat("Times New Roman", 48);
		add(shopText2);
		shopText3 = new FlxText(980, 240, 0, '+3 multiplier\n${shopNumber3} lobotomies', 48);
		shopText3.setFormat("Times New Roman", 48);
		add(shopText3);
		shopText4 = new FlxText(980, 360, 0, '+5 multiplier\n${shopNumber4} lobotomies', 48);
		shopText4.setFormat("Times New Roman", 48);
		add(shopText4);
		shopText5 = new FlxText(980, 480, 0, '+8 multiplier\n${shopNumber5} lobotomies', 48);
		shopText5.setFormat("Times New Roman", 48);
		add(shopText5);
		shopText6 = new FlxText(980, 600, 0, '+15 multiplier\n${shopNumber6} lobotomies', 48);
		shopText6.setFormat("Times New Roman", 48);
		add(shopText6);
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
		if (FlxG.mouse.overlaps(shop) || FlxG.mouse.overlaps(shop2) || FlxG.mouse.overlaps(shop3))
		{
			if (FlxG.mouse.justPressed)
			{
				if (FlxG.mouse.overlaps(shop))
				{
					if (number >= shopNumber)
					{
						number -= shopNumber;
						numberMultiplier += 1;
						shopNumberMultiplier += 1;
						shopNumber += (1 + shopNumberMultiplier);
						shop.alpha = 0.1;
						remove(shopText);
						shopText = new FlxText(980, 0, 0, '+1 multiplier\n${shopNumber} lobotomies', 48);
						shopText.setFormat("Times New Roman", 48);
						add(shopText);
					}
				}
				else if (FlxG.mouse.overlaps(shop2))
				{
					if (number >= shopNumber2)
					{
						number -= shopNumber2;
						numberMultiplier += 2;
						shopNumberMultiplier2 += 2;
						shopNumber2 += (2 + shopNumberMultiplier2);
						shop2.alpha = 0.1;
						remove(shopText2);
						shopText2 = new FlxText(980, 120, 0, '+2 multiplier\n${shopNumber2} lobotomies', 48);
						shopText2.setFormat("Times New Roman", 48);
						add(shopText2);
					}
				}
				else if (FlxG.mouse.overlaps(shop3))
				{
					if (number >= shopNumber3)
					{
						number -= shopNumber3;
						numberMultiplier += 3;
						shopNumberMultiplier3 += 3;
						shopNumber3 += (3 + shopNumberMultiplier3);
						shop3.alpha = 0.1;
						remove(shopText3);
						shopText3 = new FlxText(980, 240, 0, '+3 multiplier\n${shopNumber3} lobotomies', 48);
						shopText3.setFormat("Times New Roman", 48);
						add(shopText3);
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
				shop3.alpha = 0.5;
			}
		}
		if (FlxG.mouse.overlaps(shop4) || FlxG.mouse.overlaps(shop5) || FlxG.mouse.overlaps(shop6))
		{
			if (FlxG.mouse.justPressed)
			{
				if (FlxG.mouse.overlaps(shop4))
				{
					if (number >= shopNumber4)
					{
						number -= shopNumber4;
						numberMultiplier += 5;
						shopNumberMultiplier4 += 5;
						shopNumber4 += (5 + shopNumberMultiplier4);
						shop4.alpha = 0.1;
						remove(shopText4);
						shopText4 = new FlxText(980, 360, 0, '+5 multiplier\n${shopNumber4} lobotomies', 48);
						shopText4.setFormat("Times New Roman", 48);
						add(shopText4);
					}
				}
				else if (FlxG.mouse.overlaps(shop5))
				{
					if (number >= shopNumber5)
					{
						number -= shopNumber5;
						numberMultiplier += 8;
						shopNumberMultiplier5 += 8;
						shopNumber5 += (8 + shopNumberMultiplier5);
						shop5.alpha = 0.1;
						remove(shopText5);
						shopText5 = new FlxText(980, 480, 0, '+8 multiplier\n${shopNumber5} lobotomies', 48);
						shopText5.setFormat("Times New Roman", 48);
						add(shopText5);
					}
				}
				else if (FlxG.mouse.overlaps(shop6))
				{
					if (number >= shopNumber6)
					{
						number -= shopNumber6;
						numberMultiplier += 15;
						shopNumberMultiplier6 += 15;
						shopNumber6 += (15 + shopNumberMultiplier6);
						shop6.alpha = 0.1;
						remove(shopText6);
						shopText6 = new FlxText(980, 600, 0, '+15 multiplier\n${shopNumber6} lobotomies', 48);
						shopText6.setFormat("Times New Roman", 48);
						add(shopText6);
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
				shop4.alpha = 0.5;
				shop5.alpha = 0.5;
				shop6.alpha = 0.5;
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
