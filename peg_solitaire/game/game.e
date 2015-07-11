note
	description: "A game of peg solitaire."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	GAME

inherit
	ANY
		redefine
			out
		end

create
	make_from_board,
	make_easy,
	make_cross,
	make_plus,
	make_pyramid,
	make_arrow,
	make_diamond,
	make_skull

feature -- Constructors
	make_from_board (new_board: BOARD)
			-- Initialize a game with 'new_board'.
		do
			board := new_board
		ensure
			board_set: board = new_board
		end

	make_easy
			-- Initialize a game with easy board.
		do
			create board.make_easy
		ensure
			board_set:
				board ~ bta.templates.easy_board
		end

	make_cross
			-- Initialize a game with Cross board.
		do
			create board.make_cross
		ensure
			board_set: board ~ bta.templates.cross_board
		end

	make_plus
			-- Initialize a game with Plus board.
		do
			create board.make_plus
		ensure
			board_set: board ~ bta.templates.plus_board
		end

	make_pyramid
			-- Initialize a game with Pyramid board.
		do
			create board.make_pyramid
		ensure
			board_set: board ~ bta.templates.pyramid_board
		end

	make_arrow
			-- Initialize a game with Arrow board.
		do
			create board.make_arrow
		ensure
			board_set: board ~ bta.templates.arrow_board
		end

	make_diamond
			-- Initialize a game with Diamond board.
		do
			create board.make_diamond
		ensure
			board_set: board ~ bta.templates.diamond_board
		end

	make_skull
			-- Initialize a game with Skull board.
		do
			create board.make_skull
		ensure
			board_set: board ~ bta.templates.skull_board
		end

feature -- Commands
	move_left (r, c: INTEGER)
		-- move left
		require
			from_slot_valid_row: r >= 1 and r <= board.number_of_rows
			from_slot_valid_column: c >= 1 and c <= board.number_of_columns

			middle_slot_valid_column: (c-1 >= 1) and (c-1 <= board.number_of_columns)

			to_slot_valid_column: (c-2 >= 1) and (c-2 <= board.number_of_columns)

			from_slot_occupied: board.status_of (r, c) ~ board.occupied_slot

			middle_slot_occupied: board.status_of (r, c-1) ~ board.occupied_slot

			to_slot_unoccupied: board.status_of (r, c-2) ~ board.unoccupied_slot

		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status (r, c-2, board.occupied_slot)
			board.set_status (r, c-1, board.unoccupied_slot)

		ensure
			slots_properly_set: board.status_of (r, c) ~ board.unoccupied_slot
								and board.status_of (r, c-1) ~ board.unoccupied_slot
								and board.status_of (r, c-2) ~ board.occupied_slot

			other_slots_unchanged:
				board.matches_slots_except (old board, r, r, c, c)
		end

	move_right (r, c: INTEGER)
		require
			from_slot_valid_row: r >= 1 and r <= board.number_of_rows

			from_slot_valid_column: c >= 1 and c <= board.number_of_columns

			middle_slot_valid_column: (c+1 >= 1) and (c+1 <= board.number_of_columns)

			to_slot_valid_column: (c+2 >= 1) and (c+2 <= board.number_of_columns)

			from_slot_occupied: board.status_of (r, c) ~ board.occupied_slot

			middle_slot_occupied: board.status_of (r, c+1) ~ board.occupied_slot

			to_slot_unoccupied:  board.status_of (r, c+2) ~ board.unoccupied_slot

		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status (r, c+2, board.occupied_slot)
			board.set_status (r, c+1, board.unoccupied_slot)

		ensure
			slots_properly_set: board.status_of (r, c) ~ board.unoccupied_slot
										and board.status_of (r, c+1) ~ board.unoccupied_slot
										and board.status_of (r, c+2) ~ board.occupied_slot
				-- Your task.
			other_slots_unchanged: board.matches_slots_except (old board, r, r, c, c)
		end

	move_up (r, c: INTEGER)
		require
			from_slot_valid_column: c >= 1 and c <= board.number_of_columns

			from_slot_valid_row: r >= 1 and r <= board.number_of_rows

			middle_slot_valid_row:(r-1 >= 1) and (r-1 <= board.number_of_rows)

			to_slot_valid_row: (r-2 >= 1) and (r-2 <= board.number_of_rows)

			from_slot_occupied: board.status_of (r, c) ~ board.occupied_slot

			middle_slot_occupied: board.status_of (r-1, c) ~ board.occupied_slot

			to_slot_unoccupied: board.status_of (r-2, c) ~ board.unoccupied_slot

		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status (r-2, c, board.occupied_slot)
			board.set_status (r-1, c, board.unoccupied_slot)

		ensure
			slots_properly_set: board.status_of (r, c) ~ board.unoccupied_slot
										and board.status_of (r-1, c) ~ board.unoccupied_slot
										and board.status_of (r-2, c) ~ board.occupied_slot

			other_slots_unchanged: board.matches_slots_except (old board, r, r, c, c)

		end

	move_down (r, c: INTEGER)
		require
			from_slot_valid_column: c >= 1 and c <= board.number_of_columns

			from_slot_valid_row: r >= 1 and r <= board.number_of_rows

			middle_slot_valid_row: (r+1 >= 1) and (r+1 <= board.number_of_rows)

			to_slot_valid_row: (r+2 >= 1) and (r+2 <= board.number_of_rows)

			from_slot_occupied: board.status_of (r, c) ~ board.occupied_slot

			middle_slot_occupied: board.status_of (r+1, c) ~ board.occupied_slot

			to_slot_unoccupied: board.status_of (r+2, c) ~ board.unoccupied_slot

		do
			board.set_status (r, c, board.unoccupied_slot)
			board.set_status (r+2, c, board.occupied_slot)
			board.set_status (r+1, c, board.unoccupied_slot)

		ensure
			slots_properly_set: board.status_of (r, c) ~ board.unoccupied_slot
										and board.status_of (r+1, c) ~ board.unoccupied_slot
										and board.status_of (r+2, c) ~ board.occupied_slot

			other_slots_unchanged: board.matches_slots_except (old board, r, r, c, c)
		end

feature -- Status Queries
	is_over: BOOLEAN
			-- Is the current game 'over'?
			-- i.e., no further movements are possible.
		local
			i: INTEGER
			j : INTEGER

		do

			-- check IF CORRECT IMPLEMENTATION

			Result := TRUE
			from
				i := 1
			until
				i > 7
			loop

				from
					j := 1
				until
					j > 7
				loop

					-- can move left?
					if ( (i >= 3 and then board.status_of(i, j) ~ board.occupied_slot)
						and board.status_of(i-2, j) ~ board.unoccupied_slot
						and board.status_of (i-1, j) ~ board.occupied_slot )
					then
						Result := FALSE
					end

					-- can move right?
					if ((i <= 5 and then board.status_of(i, j) ~ board.occupied_slot)
						and (board.status_of(i+2, j) ~ board.unoccupied_slot
						and board.status_of (i+1, j) ~ board.occupied_slot)) then
							Result := FALSE
						end

					-- can move down?
					if ((j <= 5 and board.status_of(i, j) ~ board.occupied_slot)
						and (board.status_of(i, j+2) ~ board.unoccupied_slot
						and board.status_of (i, j+1) ~ board.occupied_slot))
						then
							Result := FALSE
						end

					-- can move up?
					if ((j >= 3 and board.status_of(i, j) ~ board.occupied_slot)
						and (board.status_of(i, j-2) ~ board.unoccupied_slot
						and board.status_of (i, j-1) ~ board.occupied_slot))
						then
							Result := FALSE
						end

					j := j + 1

				end

				i := i + 1
			end

		ensure
			correct_result:

				-- Your task.
				-- Hint: write two nested across expressions to
				-- iterate through all slots. Each slot is identified
				-- by its row and column numbers. If there is any
				-- slot that is movable, then the result should be true.

				-- Typo? Shouldnt it be "If there is any
				-- slot that is movable, then the result should be true"
				-- i.e: if any slot movable, then !is_over then result = false

				across
					1 |..| 7 as k
				all
					across
						1 |..| 7 as l
					all

						(
							-- can move left
							((k.item >= 3 and then board.status_of(k.item, l.item) ~ board.occupied_slot)and
							board.status_of(k.item-2, l.item) ~ board.unoccupied_slot and
							board.status_of (k.item-1, l.item) ~ board.occupied_slot)

							or

							-- can move right?
							((k.item <= 5 and then board.status_of(k.item, l.item) ~ board.occupied_slot)and
							board.status_of(k.item+2, l.item) ~ board.unoccupied_slot and
							board.status_of (k.item+1, l.item) ~ board.occupied_slot)

							or

							-- can move down?
							((l.item <= 5 and board.status_of(k.item, l.item) ~ board.occupied_slot) and
							board.status_of(k.item, l.item+2) ~ board.unoccupied_slot and
							board.status_of (k.item, l.item+1) ~ board.occupied_slot)

							or

							-- can move up?
							((l.item >= 3 and board.status_of(k.item, l.item) ~ board.occupied_slot) and
							board.status_of(k.item, l.item-2) ~ board.unoccupied_slot and
							board.status_of (k.item, l.item-1) ~ board.occupied_slot)
						)
						implies (Result = False)


					end
				end


		end

	is_won: BOOLEAN
			-- Has the current game been won?
			-- i.e., there's only one occupied slot on the board.
		local
			q : INTEGER

		do
			Result := is_over and board.number_of_occupied_slots = 1

		ensure
			game_won_iff_one_occupied_slot_left:
				-- How to do this?
--				board.number_of_occupied_slots = 1
				(board.number_of_occupied_slots = 1) implies (Result = true) and
				not (board.number_of_occupied_slots = 1) implies (Result = false)


			winning_a_game_means_game_over:
				(Result = True) implies
				is_over
		end

feature -- Output
	out: STRING
		do
			create Result.make_empty
			Result.append ("Game is over: " + boolean_to_yes_no (is_over) + "%N")
			Result.append ("Game is won : " + boolean_to_yes_no (is_won) + "%N")
			Result.append ("Board Status:%N")
			Result.append (board.out)
		end

feature -- Auxiliary Routines
	boolean_to_yes_no (b: BOOLEAN): STRING
			-- 'Yes' or 'No' corresponding to 'b'.
		do
			if b then
				Result := "Yes"
			else
				Result := "No"
			end
		end

feature -- Board
	bta: BOARD_TEMPLATES_ACCESS
	board: BOARD
end
