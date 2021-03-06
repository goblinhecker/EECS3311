note
	description: "A bad player who loses many solitaire games."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BAD_PLAYER

inherit
	PLAYER

create
	make

feature -- Commands
	loses_easy_board
			-- Lose a cross board.
		require
			current_game_is_easy: game.out ~ "[
								Game is over: No
								Game is won : No
								Board Status:
								***.***
								***O***
								***O***
								***.***
								***O***
								***.***
								*******
								]"
		local
			assertion: BOOLEAN
		do
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			***.***
			***O***
			***O***
			***.***
			***O***
			***.***
			*******
			]"
			check assertion end

			game.move_up (3, 4)
			assertion := game.out ~ "[
			Game is over: Yes
			Game is won : No
			Board Status:
			***O***
			***.***
			***.***
			***.***
			***O***
			***.***
			*******
			]"
			check assertion end
		ensure
			finished_and_lost_game: game.is_over and not game.is_won
		end

	loses_pyramid_game
		require
			current_game_is_pyramid: game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**...**
									**.O.**
									..OOO..
									.OOOOO.
									OOOOOOO
									**...**
									**...**
									]"
		local
			assertion: BOOLEAN
		do
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**...**
			**.O.**
			..OOO..
			.OOOOO.
			OOOOOOO
			**...**
			**...**
			]"
			check assertion end

			game.move_up (3, 4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**...**
			..O.O..
			.OOOOO.
			OOOOOOO
			**...**
			**...**
			]"
			check assertion end

			game.move_up (4, 3)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**O..**
			....O..
			.O.OOO.
			OOOOOOO
			**...**
			**...**
			]"
			check assertion end

			game.move_up (4, 5)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**O.O**
			.......
			.O.O.O.
			OOOOOOO
			**...**
			**...**
			]"
			check assertion end

			game.move_up (5, 2)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**O.O**
			.O.....
			...O.O.
			O.OOOOO
			**...**
			**...**
			]"
			check assertion end

			game.move_up (5, 4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**O.O**
			.O.O...
			.....O.
			O.O.OOO
			**...**
			**...**
			]"
			check assertion end

			game.move_up (5, 6)
			assertion := game.out ~ "[
			Game is over: Yes
			Game is won : No
			Board Status:
			**.O.**
			**O.O**
			.O.O.O.
			.......
			O.O.O.O
			**...**
			**...**
			]"
			check assertion end

		ensure
			finished_and_lost_game: game.is_over and not game.is_won
		end

	loses_arrow_game
		require
			current_game_is_arrow: game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**.O.**
									**OOO**
									.OOOOO.
									...O...
									...O...
									**OOO**
									**OOO**
									]"
		local
			assertion: BOOLEAN
		do
			assertion := game.out ~ "[
						Game is over: No
						Game is won : No
						Board Status:
						**.O.**
						**OOO**
						.OOOOO.
						...O...
						...O...
						**OOO**
						**OOO**
						]"
			check assertion end

			game.move_right (3, 5)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**OOO**
			.OOO..O
			...O...
			...O...
			**OOO**
			**OOO**
			]"
			check assertion end

			game.move_left (3, 3)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**OOO**
			O..O..O
			...O...
			...O...
			**OOO**
			**OOO**
			]"
			check assertion end

			game.move_up (7, 3)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**OOO**
			O..O..O
			...O...
			..OO...
			**.OO**
			**.OO**
			]"
			check assertion end

			game.move_up (7, 5)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**OOO**
			O..O..O
			...O...
			..OOO..
			**.O.**
			**.O.**
			]"
			check assertion end

			game.move_left (5, 4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**OOO**
			O..O..O
			...O...
			.O..O..
			**.O.**
			**.O.**
			]"
			check assertion end

			game.move_down (3, 4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.O.**
			**OOO**
			O.....O
			.......
			.O.OO..
			**.O.**
			**.O.**
			]"
			check assertion end

			game.move_down (1, 4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**...**
			**O.O**
			O..O..O
			.......
			.O.OO..
			**.O.**
			**.O.**
			]"
			check assertion end

			game.move_up(6, 4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**...**
			**O.O**
			O..O..O
			...O...
			.O..O..
			**...**
			**.O.**
			]"
			check assertion end

			game.move_up(4, 4)
			assertion := game.out ~ "[
			Game is over: Yes
			Game is won : No
			Board Status:
			**...**
			**OOO**
			O.....O
			.......
			.O..O..
			**...**
			**.O.**
			]"
			check assertion end

		ensure
			finished_and_lost_game: game.is_over and not game.is_won
		end

	loses_diamond_game
		require
			current_game_is_diamond:  game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**.O.**
									**OOO**
									.OOOOO.
									OOO.OOO
									.OOOOO.
									**OOO**
									**.O.**
									]"
		local
			assertion: BOOLEAN
		do
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**.O.**
									**OOO**
									.OOOOO.
									OOO.OOO
									.OOOOO.
									**OOO**
									**.O.**
									]"
			check assertion end

			game.move_left(4, 6)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**.O.**
									**OOO**
									.OOOOO.
									OOOO..O
									.OOOOO.
									**OOO**
									**.O.**
									]"
			check assertion end

			game.move_right(4, 3)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**.O.**
									**OOO**
									.OOOOO.
									OO..O.O
									.OOOOO.
									**OOO**
									**.O.**
									]"
			check assertion end

			game.move_up(3, 5)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**.OO**
									**OO.**
									.OOO.O.
									OO..O.O
									.OOOOO.
									**OOO**
									**.O.**
									]"
			check assertion end

			game.move_up(3, 3)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**OOO**
									**.O.**
									.O.O.O.
									OO..O.O
									.OOOOO.
									**OOO**
									**.O.**
									]"
			check assertion end

			game.move_down(2, 4)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**OOO**
									**...**
									.O...O.
									OO.OO.O
									.OOOOO.
									**OOO**
									**.O.**
									]"
			check assertion end

			game.move_down(5, 5)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**OOO**
									**...**
									.O...O.
									OO.OO.O
									.OOO.O.
									**OO.**
									**.OO**
									]"
			check assertion end

			game.move_down(5, 3)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**OOO**
									**...**
									.O...O.
									OO.OO.O
									.O.O.O.
									**.O.**
									**OOO**
									]"
			check assertion end

			game.move_right(4, 1)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**OOO**
									**...**
									.O...O.
									..OOO.O
									.O.O.O.
									**.O.**
									**OOO**
									]"
			check assertion end

			game.move_left(4, 4)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**OOO**
									**...**
									.O...O.
									.O..O.O
									.O.O.O.
									**.O.**
									**OOO**
									]"
			check assertion end

			game.move_up(6, 4)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**OOO**
									**...**
									.O...O.
									.O.OO.O
									.O...O.
									**...**
									**OOO**
									]"
			check assertion end

			game.move_right(4, 4)
			assertion := game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**OOO**
									**...**
									.O...O.
									.O...OO
									.O...O.
									**...**
									**OOO**
									]"
			check assertion end

			game.move_left(4, 7)
			assertion := game.out ~ "[
									Game is over: Yes
									Game is won : No
									Board Status:
									**OOO**
									**...**
									.O...O.
									.O..O..
									.O...O.
									**...**
									**OOO**
									]"
			check assertion end

		ensure
			finished_and_lost_game:  game.is_over and not game.is_won
		end

	loses_skull_game
		require
			current_game_is_skull: game.out ~ "[
									Game is over: No
									Game is won : No
									Board Status:
									**OOO**
									**OOO**
									.OOOOO.
									.O.O.O.
									.OOOOO.
									**OOO**
									**OOO**
									]"
		local
			assertion: BOOLEAN
		do

			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OOO**
			.OOOOO.
			.O.O.O.
			.OOOOO.
			**OOO**
			**OOO**
			]"
			check assertion end

			game.move_down(2, 5)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OO.**
			.OOO.O.
			.O.OOO.
			.OOOOO.
			**OOO**
			**OOO**
			]"
			check assertion end

			game.move_up(6,3)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OO.**
			.OOO.O.
			.OOOOO.
			.O.OOO.
			**.OO**
			**OOO**
			]"
			check assertion end

			game.move_left(4,3)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OO.**
			.OOO.O.
			O..OOO.
			.O.OOO.
			**.OO**
			**OOO**
			]"
			check assertion end

			game.move_left(3,3)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OO.**
			O..O.O.
			O..OOO.
			.O.OOO.
			**.OO**
			**OOO**
			]"
			check assertion end

			game.move_right(5,5)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OO.**
			O..O.O.
			O..OOO.
			.O.O..O
			**.OO**
			**OOO**
			]"
			check assertion end

			game.move_down(3,6)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OO.**
			O..O...
			O..OO..
			.O.O.OO
			**.OO**
			**OOO**
			]"
			check assertion end

			game.move_up(7,5)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OO.**
			O..O...
			O..OO..
			.O.OOOO
			**.O.**
			**OO.**
			]"
			check assertion end

			game.move_down(3,1)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OO.**
			...O...
			...OO..
			OO.OOOO
			**.O.**
			**OO.**
			]"
			check assertion end

			game.move_right(5,1)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**OOO**
			**OO.**
			...O...
			...OO..
			..OOOOO
			**.O.**
			**OO.**
			]"
			check assertion end

			game.move_down(1,3)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.OO**
			**.O.**
			..OO...
			...OO..
			..OOOOO
			**.O.**
			**OO.**
			]"
			check assertion end

			game.move_right(4,4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.OO**
			**.O.**
			..OO...
			.....O.
			..OOOOO
			**.O.**
			**OO.**
			]"
			check assertion end

			game.move_down(2,4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.OO**
			**...**
			..O....
			...O.O.
			..OOOOO
			**.O.**
			**OO.**
			]"
			check assertion end

			game.move_left(5,4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.OO**
			**...**
			..O....
			...O.O.
			.O..OOO
			**.O.**
			**OO.**
			]"
			check assertion end

			game.move_up(5,6)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.OO**
			**...**
			..O..O.
			...O...
			.O..O.O
			**.O.**
			**OO.**
			]"
			check assertion end

			game.move_up(7,4)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.OO**
			**...**
			..O..O.
			...O...
			.O.OO.O
			**...**
			**O..**
			]"
			check assertion end

			game.move_left(5,5)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.OO**
			**...**
			..O..O.
			...O...
			.OO...O
			**...**
			**O..**
			]"
			check assertion end

			game.move_left(5,3)
			assertion := game.out ~ "[
			Game is over: No
			Game is won : No
			Board Status:
			**.OO**
			**...**
			..O..O.
			...O...
			O.....O
			**...**
			**O..**
			]"
			check assertion end

			game.move_left(1,5)
			assertion := game.out ~ "[
			Game is over: Yes
			Game is won : No
			Board Status:
			**O..**
			**...**
			..O..O.
			...O...
			O.....O
			**...**
			**O..**
			]"
			check assertion end

		ensure
			finished_and_lost_game: not game.is_won and game.is_over
		end
end
