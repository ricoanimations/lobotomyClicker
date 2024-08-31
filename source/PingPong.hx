package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class PingPong extends FlxState
{
	var bg:FlxSprite;
	var face:FlxSprite;
	var opponent:FlxSprite;
	var player:FlxSprite;
	var oppscore:Int = 0;
	var playscore:Int = 0;
	var oppscoreText:FlxText;
	var playscoreText:FlxText;

	override public function create()
	{
		super.create();

		bg = new FlxSprite();
		bg.makeGraphic(1280, 720, 0xFFC8C8C8);
		add(bg);

		face = new FlxSprite();
		face.loadGraphic("assets/images/unrated.png");
		face.scale.set(0.1, 0.1);
		face.updateHitbox();
		face.x = 150;
		face.velocity.x = 500;
		face.y = FlxG.height / 2 - face.height / 2;
		add(face);

		opponent = new FlxSprite();
		opponent.makeGraphic(50, 150, FlxColor.WHITE);
		opponent.x = 100;
		opponent.y = FlxG.height / 2 - opponent.height / 2;
		opponent.velocity.y = 0;
		add(opponent);

		player = new FlxSprite();
		player.makeGraphic(50, 150, FlxColor.WHITE);
		player.x = FlxG.width - 100;
		player.y = FlxG.height / 2 - player.height / 2;
		add(player);

		oppscoreText = new FlxText();
		oppscoreText.text = Std.string(oppscore);
		oppscoreText.size = 48;
		oppscoreText.x = 100;
		add(oppscoreText);

		playscoreText = new FlxText();
		playscoreText.text = Std.string(playscore);
		playscoreText.size = 48;
		playscoreText.x = FlxG.width - 100;
		add(playscoreText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.overlap(face, player))
		{
			var randomNumber = FlxG.random.int(0, 3);
			switch (randomNumber)
			{
				case 0 | 1 | 2:
					opponent.velocity.y = 240;
					if (opponent.y > face.y)
					{
						opponent.y = face.y;
					}
				case 3:
					opponent.velocity.y = -240;
					if (opponent.y < 0)
					{
						opponent.y = 0;
					}
			}
			if (face.velocity.x > 0)
			{
				face.velocity.x *= -1;
			}
		}

		if (FlxG.overlap(face, opponent))
		{
			if (face.velocity.x < 0)
			{
				face.velocity.x *= -1;
			}
		}

		if (FlxG.keys.pressed.UP)
		{
			player.y -= 10;
		}

		if (FlxG.keys.pressed.DOWN)
		{
			player.y += 10;
		}

		if (face.x > FlxG.width)
		{
			face.x = FlxG.width;
			oppscore += 1;
			remove(oppscoreText);
			oppscoreText = new FlxText();
			oppscoreText.text = Std.string(oppscore);
			oppscoreText.size = 48;
			oppscoreText.x = 100;
			add(oppscoreText);
		}

		if (face.x < (0 - face.width))
		{
			face.x = (0 - face.width) + 1;
			playscore += 1;
			remove(playscoreText);
			playscoreText = new FlxText();
			playscoreText.text = Std.string(playscore);
			playscoreText.size = 48;
			playscoreText.x = FlxG.width - 100;
			add(playscoreText);
		}

		if (player.y > (FlxG.height - player.height))
		{
			player.y = FlxG.height - player.height;
		}

		if (player.y < 0)
		{
			player.y = 0;
		}
	}
}