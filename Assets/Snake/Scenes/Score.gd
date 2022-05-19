extends Node2D

func update_score(snake_length):
	$ScoreText.text = str(snake_length -2 )
