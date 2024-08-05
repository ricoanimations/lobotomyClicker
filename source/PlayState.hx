package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var bg:FlxSprite;
	var face:FlxSprite;
	var rebirth:FlxSprite;
	var rebirthText:FlxText;
	var rebirthTextCurrent:FlxText;
	var rebirthNumber:Float = 1;
	var rebirthMinimum:Float = 50000;
	var shop:FlxSprite;
	var shop2:FlxSprite;
	var shop3:FlxSprite;
	var shop4:FlxSprite;
	var shop5:FlxSprite;
	var shop6:FlxSprite;
	var cover:FlxSprite;
	var easteregg:FlxSprite;
	var easteregg2:FlxSprite;
	var shopText:FlxText;
	var shopText2:FlxText;
	var shopText3:FlxText;
	var shopText4:FlxText;
	var shopText5:FlxText;
	var shopText6:FlxText;
	var lobotomies:FlxText;
	var multiplierText:FlxText;
	var coverText:FlxText;
	var number:Float = 0;
	var numberMultiplier:Float = 0;
	var shopNumber:Float = 15;
	var shopNumber2:Float = 40;
	var shopNumber3:Float = 70;
	var shopNumber4:Float = 120;
	var shopNumber5:Float = 200;
	var shopNumber6:Float = 450;
	var shopNumberMultiplier:Float = 1;
	var shopNumberMultiplier2:Float = 2;
	var shopNumberMultiplier3:Float = 3;
	var shopNumberMultiplier4:Float = 5;
	var shopNumberMultiplier5:Float = 8;
	var shopNumberMultiplier6:Float = 15;
	var shopNumberShit:Float = 1;
	var shopNumberShit2:Float = 2;
	var shopNumberShit3:Float = 3;
	var shopNumberShit4:Float = 5;
	var shopNumberShit5:Float = 8;
	var shopNumberShit6:Float = 15;
	var restarts:Float = 0;
	var playMusic:Bool = true;
	var playSFX:Bool = true;
	var music:FlxSprite;
	var sfx:FlxSprite;
	var musicText:FlxText;
	var sfxText:FlxText;
	var randomNumber:Int;
	var whattheSFX:FlxSound;
	var rebirthMultiply:Float = 1;
	
	override public function create()
	{
		super.create();
		bg = new FlxSprite();
		bg.makeGraphic(1280, 720, 0xFFC8C8C8);
		add(bg);

		face = new FlxSprite();
		face.loadGraphic("assets/images/unrated.png");
		face.scale.set(0.25, 0.25);
		face.updateHitbox();
		face.screenCenter();
		add(face);

		lobotomies = new FlxText(0, 100, 0, '${number} lobotomies', 48);
		lobotomies.setFormat("Times New Roman", 48);
		add(lobotomies);
		multiplierText = new FlxText(400, 0, 0, 'current multiplier: ${numberMultiplier + 1}', 48);
		multiplierText.setFormat("Times New Roman", 48);
		add(multiplierText);

		rebirth = new FlxSprite();
		rebirth.makeGraphic(500, 120, FlxColor.BLACK);
		rebirth.alpha = 0.5;
		rebirth.x = 480;
		rebirth.y = 600;
		add(rebirth);
		rebirthText = new FlxText(480, 600, 0, 'rebirth\n${rebirthMinimum} lobotomies', 48);
		rebirthText.setFormat("Times New Roman", 48);
		add(rebirthText);
		rebirthTextCurrent = new FlxText(400, 60, 0, 'total rebirths: ${rebirthNumber - 1}', 48);
		rebirthTextCurrent.setFormat("Times New Roman", 48);
		add(rebirthTextCurrent);

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
		shopText = new FlxText(980, 0, 0, '+${shopNumberShit} multiplier\n${shopNumber} lobotomies', 48);
		shopText.setFormat("Times New Roman", 48);
		add(shopText);
		shopText2 = new FlxText(980, 120, 0, '+${shopNumberShit2} multiplier\n${shopNumber2} lobotomies', 48);
		shopText2.setFormat("Times New Roman", 48);
		add(shopText2);
		shopText3 = new FlxText(980, 240, 0, '+${shopNumberShit3} multiplier\n${shopNumber3} lobotomies', 48);
		shopText3.setFormat("Times New Roman", 48);
		add(shopText3);
		shopText4 = new FlxText(980, 360, 0, '+${shopNumberShit4} multiplier\n${shopNumber4} lobotomies', 48);
		shopText4.setFormat("Times New Roman", 48);
		add(shopText4);
		shopText5 = new FlxText(980, 480, 0, '+${shopNumberShit5} multiplier\n${shopNumber5} lobotomies', 48);
		shopText5.setFormat("Times New Roman", 48);
		add(shopText5);
		shopText6 = new FlxText(980, 600, 0, '+${shopNumberShit6} multiplier\n${shopNumber6} lobotomies', 48);
		shopText6.setFormat("Times New Roman", 48);
		add(shopText6);
		music = new FlxSprite();
		music.makeGraphic(100, 100, FlxColor.BLACK);
		music.alpha = 0.5;
		music.x = 0;
		music.y = 520;
		add(music);
		sfx = new FlxSprite();
		sfx.makeGraphic(100, 100, FlxColor.BLACK);
		sfx.alpha = 0.5;
		sfx.x = 0;
		sfx.y = 620;
		add(sfx);
		musicText = new FlxText(0, 520, 0, 'mute\nmusic', 24);
		musicText.setFormat("Times New Roman", 24);
		add(musicText);
		sfxText = new FlxText(0, 620, 0, 'mute\nsfx', 24);
		sfxText.setFormat("Times New Roman", 24);
		add(sfxText);
		playdaMusic();
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
				number += ((1 + numberMultiplier) * rebirthNumber);
				if (playSFX == true)
				{
					playdaSFX();
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
		if (FlxG.mouse.overlaps(music))
		{
			if (playMusic == true && FlxG.mouse.justPressed)
			{
				music.alpha = 0.1;
				playMusic = false;
				stopdaMusic();
				remove(musicText);
				musicText = new FlxText(0, 520, 0, 'unmute\nmusic', 24);
				musicText.setFormat("Times New Roman", 24);
				add(musicText);
			}
			else if (playMusic == false && FlxG.mouse.justPressed)
			{
				music.alpha = 0.1;
				playMusic = true;
				playdaMusic();
				remove(musicText);
				musicText = new FlxText(0, 520, 0, 'mute\nmusic', 24);
				musicText.setFormat("Times New Roman", 24);
				add(musicText);
			}
			if (FlxG.mouse.justReleased)
			{
				music.alpha = 0.5;
			}
		}
		if (FlxG.mouse.overlaps(sfx))
		{
			if (playSFX == true && FlxG.mouse.justPressed)
			{
				sfx.alpha = 0.1;
				playSFX = false;
				stopdaSFX();
				remove(sfxText);
				sfxText = new FlxText(0, 620, 0, 'unmute\nsfx', 24);
				sfxText.setFormat("Times New Roman", 24);
				add(sfxText);
			}
			else if (playSFX == false && FlxG.mouse.justPressed)
			{
				sfx.alpha = 0.1;
				playSFX = true;
				playdaSFX();
				remove(sfxText);
				sfxText = new FlxText(0, 620, 0, 'mute\nsfx', 24);
				sfxText.setFormat("Times New Roman", 24);
				add(sfxText);
			}
			if (FlxG.mouse.justReleased)
			{
				sfx.alpha = 0.5;
			}
		}
		if (FlxG.mouse.overlaps(rebirth))
		{
			if (FlxG.mouse.justPressed)
			{
				if (number >= rebirthMinimum)
				{
					number = 0;
					numberMultiplier = 0;
					rebirthNumber += 1;
					rebirthMinimum *= 3;
					rebirthMultiply *= 2;
					shopNumber = 15;
					shopNumber2 = 40;
					shopNumber3 = 70;
					shopNumber4 = 120;
					shopNumber5 = 200;
					shopNumber6 = 450;
					shopNumberShit *= 2;
					shopNumberShit2 *= 2;
					shopNumberShit3 *= 2;
					shopNumberShit4 *= 2;
					shopNumberShit5 *= 2;
					shopNumberShit6 *= 2;
					remove(lobotomies);
					lobotomies = new FlxText(0, 100, 0, '${number} lobotomies', 48);
					lobotomies.setFormat("Times New Roman", 48);
					add(lobotomies);
					remove(rebirthText);
					rebirthText = new FlxText(480, 600, 0, 'rebirth\n${rebirthMinimum} lobotomies', 48);
					rebirthText.setFormat("Times New Roman", 48);
					add(rebirthText);
					remove(rebirthTextCurrent);
					rebirthTextCurrent = new FlxText(400, 60, 0, 'total rebirths: ${rebirthNumber - 1}', 48);
					rebirthTextCurrent.setFormat("Times New Roman", 48);
					add(rebirthTextCurrent);
					remove(multiplierText);
					multiplierText = new FlxText(400, 0, 0, 'current multiplier: ${numberMultiplier + 1}', 48);
					multiplierText.setFormat("Times New Roman", 48);
					add(multiplierText);
					remove(shopText);
					shopText = new FlxText(980, 0, 0, '+${shopNumberShit} multiplier\n${shopNumber} lobotomies', 48);
					shopText.setFormat("Times New Roman", 48);
					add(shopText);
					remove(shopText2);
					shopText2 = new FlxText(980, 120, 0, '+${shopNumberShit2} multiplier\n${shopNumber2} lobotomies', 48);
					shopText2.setFormat("Times New Roman", 48);
					add(shopText2);
					remove(shopText3);
					shopText3 = new FlxText(980, 240, 0, '+${shopNumberShit3} multiplier\n${shopNumber3} lobotomies', 48);
					shopText3.setFormat("Times New Roman", 48);
					add(shopText3);
					remove(shopText4);
					shopText4 = new FlxText(980, 360, 0, '+${shopNumberShit4} multiplier\n${shopNumber4} lobotomies', 48);
					shopText4.setFormat("Times New Roman", 48);
					add(shopText4);
					remove(shopText5);
					shopText5 = new FlxText(980, 480, 0, '+${shopNumberShit5} multiplier\n${shopNumber5} lobotomies', 48);
					shopText5.setFormat("Times New Roman", 48);
					add(shopText5);
					remove(shopText6);
					shopText6 = new FlxText(980, 600, 0, '+${shopNumberShit6} multiplier\n${shopNumber6} lobotomies', 48);
					shopText6.setFormat("Times New Roman", 48);
					add(shopText6);
					rebirth.alpha = 0.1;
				}
			}
			if (FlxG.mouse.justReleased)
			{
				rebirth.alpha = 0.5;
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
						numberMultiplier += (1 * rebirthMultiply);
						shopNumber += (1 + shopNumberMultiplier);
						shop.alpha = 0.1;
						remove(shopText);
						shopText = new FlxText(980, 0, 0, '+${shopNumberShit} multiplier\n${shopNumber} lobotomies', 48);
						shopText.setFormat("Times New Roman", 48);
						add(shopText);
						updateMultiplier();
					}
				}
				else if (FlxG.mouse.overlaps(shop2))
				{
					if (number >= shopNumber2)
					{
						number -= shopNumber2;
						numberMultiplier += (2 * rebirthMultiply);
						shopNumber2 += (2 + shopNumberMultiplier2);
						shop2.alpha = 0.1;
						remove(shopText2);
						shopText2 = new FlxText(980, 120, 0, '+${shopNumberShit2} multiplier\n${shopNumber2} lobotomies', 48);
						shopText2.setFormat("Times New Roman", 48);
						add(shopText2);
						updateMultiplier();
					}
				}
				else if (FlxG.mouse.overlaps(shop3))
				{
					if (number >= shopNumber3)
					{
						number -= shopNumber3;
						numberMultiplier += (3 * rebirthMultiply);
						shopNumber3 += (3 + shopNumberMultiplier3);
						shop3.alpha = 0.1;
						remove(shopText3);
						shopText3 = new FlxText(980, 240, 0, '+${shopNumberShit3} multiplier\n${shopNumber3} lobotomies', 48);
						shopText3.setFormat("Times New Roman", 48);
						add(shopText3);
						updateMultiplier();
					}
				}
				remove(lobotomies);
				lobotomies = new FlxText(0, 100, 0, '${number} lobotomies', 48);
				lobotomies.setFormat("Times New Roman", 48);
				add(lobotomies);
				faceChange();
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
						numberMultiplier += (5 * rebirthMultiply);
						shopNumber4 += (5 + shopNumberMultiplier4);
						shop4.alpha = 0.1;
						remove(shopText4);
						shopText4 = new FlxText(980, 360, 0, '+${shopNumberShit4} multiplier\n${shopNumber4} lobotomies', 48);
						shopText4.setFormat("Times New Roman", 48);
						add(shopText4);
						updateMultiplier();
					}
				}
				else if (FlxG.mouse.overlaps(shop5))
				{
					if (number >= shopNumber5)
					{
						number -= shopNumber5;
						numberMultiplier += (8 * rebirthMultiply);
						shopNumber5 += (8 + shopNumberMultiplier5);
						shop5.alpha = 0.1;
						remove(shopText5);
						shopText5 = new FlxText(980, 480, 0, '+${shopNumberShit5} multiplier\n${shopNumber5} lobotomies', 48);
						shopText5.setFormat("Times New Roman", 48);
						add(shopText5);
						updateMultiplier();
					}
				}
				else if (FlxG.mouse.overlaps(shop6))
				{
					if (number >= shopNumber6)
					{
						number -= shopNumber6;
						numberMultiplier += (15 * rebirthMultiply);
						shopNumber6 += (15 + shopNumberMultiplier6);
						shop6.alpha = 0.1;
						remove(shopText6);
						shopText6 = new FlxText(980, 600, 0, '+${shopNumberShit6} multiplier\n${shopNumber6} lobotomies', 48);
						shopText6.setFormat("Times New Roman", 48);
						add(shopText6);
						updateMultiplier();
					}
				}
				remove(lobotomies);
				lobotomies = new FlxText(0, 100, 0, '${number} lobotomies', 48);
				lobotomies.setFormat("Times New Roman", 48);
				add(lobotomies);
				faceChange();
			}
			if (FlxG.mouse.justReleased)
			{
				shop4.alpha = 0.5;
				shop5.alpha = 0.5;
				shop6.alpha = 0.5;
			}
		}
		faceChange();
		if (number == 69)
		{
			if (FlxG.keys.pressed.A)
			{
				remove(bg);
				remove(face);
				remove(lobotomies);
				remove(rebirth);
				remove(rebirthText);
				remove(shop);
				remove(shop2);
				remove(shop3);
				remove(shop4);
				remove(shop5);
				remove(shop6);
				remove(shopText);
				remove(shopText2);
				remove(shopText3);
				remove(shopText4);
				remove(shopText5);
				remove(shopText6);
				remove(multiplierText);
				easteregg = new FlxSprite();
				easteregg.loadGraphic("assets/images/lobotomy.png");
				easteregg.screenCenter();
				add(easteregg);
			}
		}
		else if (number == 841 && FlxG.keys.pressed.K)
		{
			remove(bg);
			remove(face);
			remove(lobotomies);
			remove(rebirth);
			remove(rebirthText);
			remove(shop);
			remove(shop2);
			remove(shop3);
			remove(shop4);
			remove(shop5);
			remove(shop6);
			remove(shopText);
			remove(shopText2);
			remove(shopText3);
			remove(shopText4);
			remove(shopText5);
			remove(shopText6);
			remove(multiplierText);
			easteregg2 = new FlxSprite();
			easteregg2.loadGraphic("assets/images/umwhatthesigma.png");
			easteregg2.screenCenter();
			add(easteregg2);
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
	private function updateMultiplier()
	{
		remove(multiplierText);
		multiplierText = new FlxText(400, 0, 0, 'current multiplier: ${numberMultiplier + 1}', 48);
		multiplierText.setFormat("Times New Roman", 48);
		add(multiplierText);
	}

	private function faceChange()
	{
		remove(bg);
		bg = new FlxSprite();
		if (number < 15)
		{
			bg.makeGraphic(1280, 720, 0xFFC8C8C8);
		}
		else if (number >= 15 && number < 50)
		{
			bg.makeGraphic(1280, 720, 0xFFF0D060);
		}
		else if (number >= 50 && number < 150)
		{
			bg.makeGraphic(1280, 720, 0xFF00B0FF);
		}
		else if (number >= 150 && number < 500)
		{
			bg.makeGraphic(1280, 720, 0xFF00FF00);
		}
		else if (number >= 500 && number < 2500)
		{
			bg.makeGraphic(1280, 720, 0xFFFFD000);
		}
		else if (number >= 2500 && number < 15000)
		{
			bg.makeGraphic(1280, 720, 0xFFFF6000);
		}
		else if (number >= 15000 && number < 100000)
		{
			bg.makeGraphic(1280, 720, 0xFFFF70E0);
		}
		else if (number >= 100000 && number < 1000000)
		{
			bg.makeGraphic(1280, 720, 0xFF9A40FF);
		}
		else if (number >= 1000000 && number < 2500000)
		{
			bg.makeGraphic(1280, 720, 0xFFE030CA);
		}
		else if (number >= 2500000 && number < 5000000)
		{
			bg.makeGraphic(1280, 720, 0xFFFF3060);
		}
		else if (number >= 5000000 && number < 10000000)
		{
			bg.makeGraphic(1280, 720, 0xFFFF2020);
		}
		else if (number >= 10000000)
		{
			bg.makeGraphic(1280, 720, 0xFFC00000);
		}
		add(bg);
		remove(face);
		face = new FlxSprite();
		if (number < 15)
		{
			face.loadGraphic("assets/images/unrated.png");
		}
		else if (number >= 15 && number < 50)
		{
			face.loadGraphic("assets/images/auto.png");
		}
		else if (number >= 50 && number < 150)
		{
			face.loadGraphic("assets/images/easy.png");
		}
		else if (number >= 150 && number < 500)
		{
			face.loadGraphic("assets/images/normal.png");
		}
		else if (number >= 500 && number < 2500)
		{
			face.loadGraphic("assets/images/hard.png");
		}
		else if (number >= 2500 && number < 15000)
		{
			face.loadGraphic("assets/images/harder.png");
		}
		else if (number >= 15000 && number < 100000)
		{
			face.loadGraphic("assets/images/insane.png");
		}
		else if (number >= 100000 && number < 1000000)
		{
			face.loadGraphic("assets/images/easydemon.png");
		}
		else if (number >= 1000000 && number < 2500000)
		{
			face.loadGraphic("assets/images/mediumdemon.png");
		}
		else if (number >= 2500000 && number < 5000000)
		{
			face.loadGraphic("assets/images/harddemon.png");
		}
		else if (number >= 5000000 && number < 10000000)
		{
			face.loadGraphic("assets/images/insanedemon.png");
		}
		else if (number >= 10000000)
		{
			face.loadGraphic("assets/images/extremedemon.png");
		}
		face.scale.set(0.25, 0.25);
		face.updateHitbox();
		face.screenCenter();
		faceOverlap();
		add(face);
	}
	private function playdaMusic()
	{
		randomNumber = FlxG.random.int(0, 2);
		switch (randomNumber)
		{
			case 0:
				if (FlxG.sound.music == null)
				{
					FlxG.sound.playMusic("assets/music/stereomadness.ogg", 1, true);
				}
			case 1:
				if (FlxG.sound.music == null)
				{
					FlxG.sound.playMusic("assets/music/backontrack.ogg", 1, true);
				}
			case 2:
				if (FlxG.sound.music == null)
				{
					FlxG.sound.playMusic("assets/music/polargeist.ogg", 1, true);
				}
		}
		FlxG.sound.music.volume = 1;
	}

	private function stopdaMusic()
	{
		FlxG.sound.music.volume = 0;
	}
	private function playdaSFX()
	{
		if (number < 15)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/unrated.ogg");
		}
		else if (number >= 15 && number < 50)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/auto.ogg");
		}
		else if (number >= 50 && number < 150)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/easy.ogg");
		}
		else if (number >= 150 && number < 500)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/normal.ogg");
		}
		else if (number >= 500 && number < 2500)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/hard.ogg");
		}
		else if (number >= 2500 && number < 15000)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/harder.ogg");
		}
		else if (number >= 15000 && number < 100000)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/insane.ogg");
		}
		else if (number >= 100000 && number < 1000000)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/easydemon.ogg");
		}
		else if (number >= 1000000 && number < 2500000)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/mediumdemon.ogg");
		}
		else if (number >= 2500000 && number < 5000000)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/harddemon.ogg");
		}
		else if (number >= 5000000 && number < 10000000)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/insanedemon.ogg");
		}
		else if (number >= 10000000)
		{
			whattheSFX = FlxG.sound.load("assets/sounds/extremedemon.ogg");
		}
		whattheSFX.play();
		whattheSFX.volume = 1;
	}

	private function stopdaSFX()
	{
		whattheSFX.volume = 0;
	}
}
