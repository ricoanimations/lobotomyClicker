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
	var oppText:FlxText;
	var playText:FlxText;

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
		opponent.makeGraphic(50, 150, FlxColor.RED);
		opponent.x = 100;
		opponent.y = FlxG.height / 2 - opponent.height / 2;
		opponent.velocity.y = 0;
		add(opponent);

		player = new FlxSprite();
		player.makeGraphic(50, 150, 0xFF0080FF);
		player.x = FlxG.width - 100;
		player.y = FlxG.height / 2 - player.height / 2;
		add(player);

		oppscoreText = new FlxText();
		oppscoreText.text = Std.string(oppscore);
		oppscoreText.size = 48;
		oppscoreText.color = FlxColor.RED;
		oppscoreText.x = 100;
		add(oppscoreText);

		oppText = new FlxText();
		oppText.text = 'OPPONENT';
		oppText.size = 48;
		oppText.color = FlxColor.RED;
		oppText.x = 100;
		oppText.y = 50;
		add(oppText);

		playscoreText = new FlxText();
		playscoreText.text = Std.string(playscore);
		playscoreText.size = 48;
		playscoreText.color = 0xFF0080FF;
		playscoreText.x = FlxG.width - 100;
		add(playscoreText);
		playText = new FlxText();
		playText.text = 'PLAYER';
		playText.size = 48;
		playText.color = 0xFF0080FF;
		playText.x = (FlxG.width - playText.width) - 100;
		playText.y = 50;
		add(playText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.overlap(face, player))
		{
			face.velocity.y = FlxG.random.int(-100, 100);
			var randomNumber = FlxG.random.int(0, 5);
			switch (randomNumber)
			{
				case 0 | 1 | 2 | 3 | 4:
					opponent.velocity.y = face.velocity.y;
				case 5:
					opponent.velocity.y = (face.velocity.y *= -1);
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

		if (FlxG.keys.anyPressed([UP, W]))
		{
			player.y -= 10;
		}

		if (FlxG.keys.anyPressed([DOWN, S]))
		{
			player.y += 10;
		}

		if (face.x > FlxG.width)
		{
			remove(face);
			face = new FlxSprite();
			face.loadGraphic("assets/images/unrated.png");
			face.scale.set(0.1, 0.1);
			face.updateHitbox();
			face.x = FlxG.width / 2 - face.width / 2;
			face.velocity.x = 500;
			face.y = FlxG.height / 2 - face.height / 2;
			add(face);
			opponent.y = FlxG.height / 2 - opponent.height / 2;
			oppscore += 1;
			oppscoreText.text = Std.string(oppscore);
		}

		if (face.x < (0 - face.width))
		{
			remove(face);
			face = new FlxSprite();
			face.loadGraphic("assets/images/unrated.png");
			face.scale.set(0.1, 0.1);
			face.updateHitbox();
			face.x = FlxG.width / 2 - face.width / 2;
			face.velocity.x = 500;
			face.y = FlxG.height / 2 - face.height / 2;
			add(face);
			opponent.y = FlxG.height / 2 - opponent.height / 2;
			playscore += 1;
			playscoreText.text = Std.string(playscore);
		}

		if (player.y > (FlxG.height - player.height))
		{
			player.y = FlxG.height - player.height;
		}

		if (player.y < 0)
		{
			player.y = 0;
		}
		if (face.y < 0)
		{
			face.velocity.y = 100;
		}
		else if (face.y > (FlxG.height - face.height))
		{
			face.velocity.y = -100;
		}

		if (opponent.y > (FlxG.height - opponent.height))
		{
			opponent.y = FlxG.height - opponent.height;
		}
		else if (opponent.y < 0)
		{
			opponent.y = 0;
		}
	}
}