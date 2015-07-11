note
	description: "A board for the peg solitaire game."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	BOARD

inherit
	ANY
		redefine
			out, is_equal
		end

create
	make_default,
	make_easy,
	make_cross,
	make_plus,
	make_pyramid,
	make_arrow,
	make_diamond,
	make_skull

feature -- Constructor
	make_default
			-- Initialize a default board with all slots unavailable.
		do
			create imp.make_filled (unavailable_slot, 7, 7)
		ensure
			board_set:
				Current ~ bta.templates.default_board
		end

	make_easy
		do
			make_default
			set_status (1, 4, unoccupied_slot)
			set_status (4, 4, unoccupied_slot)
			set_status (6, 4, unoccupied_slot)

			set_statuses (2, 3, 4, 4, occupied_slot)
			set_status (5, 4, occupied_slot)
		ensure
			board_set:
				Current ~ bta.templates.easy_board
		end

	make_cross
		do
			create imp.make_filled (unoccupied_slot, 7, 7)

			set_statuses (1, 2, 1, 2, unavailable_slot)
			set_statuses (1, 2, 6, 7, unavailable_slot)
			set_statuses (6, 7, 1, 2, unavailable_slot)
			set_statuses (6, 7, 6, 7, unavailable_slot)

			set_statuses (2, 5, 4, 4, occupied_slot)
			set_status (3, 3, occupied_slot)
			set_status (3, 5, occupied_slot)

		ensure
			board_set:
				Current ~ bta.templates.cross_board
		end

	make_plus
		do
			create imp.make_filled (unoccupied_slot, 7, 7)

			set_statuses (1, 2, 1, 2, unavailable_slot)
			set_statuses (1, 2, 6, 7, unavailable_slot)
			set_statuses (6, 7, 1, 2, unavailable_slot)
			set_statuses (6, 7, 6, 7, unavailable_slot)

			set_statuses (2, 6, 4, 4, occupied_slot)
			set_statuses (4, 4, 2, 6, occupied_slot)


		ensure
			board_set:
				Current ~ bta.templates.plus_board
		end

	make_pyramid
		do
			create imp.make_filled (unoccupied_slot, 7, 7)

			set_statuses (1, 2, 1, 2, unavailable_slot)
			set_statuses (1, 2, 6, 7, unavailable_slot)
			set_statuses (6, 7, 1, 2, unavailable_slot)
			set_statuses (6, 7, 6, 7, unavailable_slot)

			set_statuses (5, 5, 1, 7, occupied_slot)
			set_statuses (4, 4, 2, 6, occupied_slot)
			set_statuses (3, 3, 3, 5, occupied_slot)
			set_statuses (2, 2, 4, 4, occupied_slot)


		ensure
			board_set:
				Current ~ bta.templates.pyramid_board
		end

	make_arrow

		do
			create imp.make_filled (unoccupied_slot, 7, 7)

			set_statuses (1, 2, 1, 2, unavailable_slot)
			set_statuses (1, 2, 6, 7, unavailable_slot)
			set_statuses (6, 7, 1, 2, unavailable_slot)
			set_statuses (6, 7, 6, 7, unavailable_slot)

			set_statuses (1, 5, 4, 4, occupied_slot)
			set_statuses (6, 7, 3, 5, occupied_slot)
			set_statuses (2, 3, 3, 5, occupied_slot)
			set_status (3, 2, occupied_slot)
			set_status (3, 6, occupied_slot)


		ensure
			board_set:
				Current ~ bta.templates.arrow_board
		end

	make_diamond
		do
			create imp.make_filled (occupied_slot, 7, 7)

			set_statuses (1, 2, 1, 2, unavailable_slot)
			set_statuses (1, 2, 6, 7, unavailable_slot)
			set_statuses (6, 7, 1, 2, unavailable_slot)
			set_statuses (6, 7, 6, 7, unavailable_slot)

			set_status (4, 4, unoccupied_slot)
			set_status (1, 3, unoccupied_slot)
			set_status (1, 5, unoccupied_slot)
			set_status (3, 1, unoccupied_slot)
			set_status (3, 7, unoccupied_slot)
			set_status (5, 1, unoccupied_slot)
			set_status (5, 7, unoccupied_slot)
			set_status (7, 3, unoccupied_slot)
			set_status (7, 5, unoccupied_slot)


		ensure
			board_set:
				Current ~ bta.templates.diamond_board
		end

	make_skull
		do
			create imp.make_filled (occupied_slot, 7, 7)

			set_statuses (1, 2, 1, 2, unavailable_slot)
			set_statuses (1, 2, 6, 7, unavailable_slot)
			set_statuses (6, 7, 1, 2, unavailable_slot)
			set_statuses (6, 7, 6, 7, unavailable_slot)

			set_status (4, 3, unoccupied_slot)
			set_status (4, 5, unoccupied_slot)
			set_statuses (3, 5, 1, 1, unoccupied_slot)
			set_statuses (3, 5, 7, 7, unoccupied_slot)

		ensure
			board_set:
				Current ~ bta.templates.skull_board
		end

feature -- Auxiliary Commands
	set_status (r, c: INTEGER; status: SLOT_STATUS)
			-- Set the status of slot at row 'r' and column 'c' to 'status'.
		require
			valid_row:
				is_valid_row (r)
			valid_column:
				is_valid_column (c)
		do
			imp.put (status, r, c)
		ensure
			slot_set:
				imp.item (r, c).is_equal (status)

			slots_not_in_range_unchanged:
				matches_slots_except(old Current, r, r, c, c)
				-- Verify if correct result

		end

	set_statuses (r1, r2, c1, c2: INTEGER; status: SLOT_STATUS)
			-- Set the range of slots to 'status':
			-- intersection of rows 'r1' to 'r2' and
			-- columns 'c1' to 'c2'.
		require
			valid_rows: is_valid_row(r1) and is_valid_row(r2)
			valid_columns: is_valid_column(c1) and is_valid_column(c2)
			valid_row_range: r1 <= r2
			valid_column_range: c1 <= c2
		do

			across
				1 |..| 7 as i
			loop
				across
					1 |..| 7 as j
				loop
					if
						(i.item >= r1 and i.item <= r2) and
						(j.item >= c1 and j.item <= c2)
					then
						imp.put (status, i.item, j.item)
					end

				end
			end

		ensure
			slots_in_range_set:
				across
					1 |..| 7 as i
				all
					across 1 |..| 7 as j
					all
						(i.item >= r1 and j.item >= c1 and i.item <= r2 and j.item <= c2
						implies status_of(i.item, j.item) ~ status)
					end
				end
			slots_not_in_range_unchanged:
				matches_slots_except(old Current, r1, r2, c1, c2)
				-- check if correct answer... verify
		end

feature -- Auxiliary Queries
	matches_slots_except (
		other: BOARD; r1, r2, c1, c2: INTEGER)
	: BOOLEAN
			-- Do slots outside the intersection of
			-- rows 'r1' to 'r2' and columns 'c1' and 'c2'
			-- match in Current and 'other'.
		require
			consistent_row_number : Current.number_of_rows = other.number_of_rows
			consistent_column_number: Current.number_of_columns = other.number_of_columns

			valid_rows: is_valid_row(r1) and is_valid_row(r2)
			valid_columns: is_valid_column(c1) and is_valid_column(c2)
			valid_row_range: r1 <= r2
			valid_column_range: c1 <= c2

		do
			Result := true
			across
				1 |..| 7 as i
			loop
				across
				1 |..| 7 as j
				loop
					if
						(i.item < r1 or i.item > r2) or
						(j.item < c1 or j.item > c2)
					then
						Result := Result and
							Current.status_of (i.item, j.item).is_equal (other.status_of (i.item, j.item))
					end
				end
			end


		ensure
			correct_result:
				-- Your task.
				-- Hint: write two nested across expressions to
				-- iterate through all slots. Each slot is identified
				-- by its row and column numbers. If the slot location
				-- is not witin 'r1', 'r2', 'c1', and 'c2', then
				-- its value in 'Current' is equal to that in 'other'.
			across
				1 |..| 7 as i
			all
				across
					1 |..| 7 as j
				all

					-- if Result = True then every item outside the given range of the
					-- current board is equal to the other board
					(Result = True)
					implies
					((i.item < r1 or i.item > r2 or
					 j.item < c1 or j.item > c2)
					implies
					Current.status_of (i.item, j.item).is_equal (other.status_of (i.item, j.item)))

				end
			end
		end

	unavailable_slot: UNAVAILABLE_SLOT
			-- A slot not available for movement.
		do
			Result := ssa.unavailable_slot
		ensure
			Result = ssa.unavailable_slot
		end

	occupied_slot: OCCUPIED_SLOT
			-- A slot available for moment but currently occupied.
		do
			Result := ssa.occupied_slot
		ensure
			Result = ssa.occupied_slot
		end

	unoccupied_slot: UNOCCUPIED_SLOT
			-- A slot available for moment and currently unoccupied.
		do
			Result := ssa.unoccupied_slot
		ensure
			Result = ssa.unoccupied_slot
		end

feature -- Queries
	number_of_rows: INTEGER
			-- Number of rows in the board of game.
		do
			Result := imp.height
		ensure
			correct_result: Result = imp.height
		end

	number_of_columns: INTEGER
			-- Number of columns in the board of game.
		do
			Result := imp.width
		ensure
			correct_result: Result = imp.width
		end

	is_valid_row (r: INTEGER): BOOLEAN
			-- Is 'r' a valid row number?
		do
			Result := r >= 1 and r <= Current.number_of_rows
		ensure
			correct_result:
				(r >= 1 and r <= Current.number_of_rows) implies (Result = True)

		end

	is_valid_column (c: INTEGER): BOOLEAN
			-- Is 'x' a valid column number?
		do
			Result := c >= 1 and c <= Current.number_of_columns
		ensure
			correct_result:
				(c >= 1 and c <= Current.number_of_columns) implies (Result = True)
		end

	status_of (r, c: INTEGER): SLOT_STATUS
			-- Is the slot at row 'r' and column 'c'
			-- unavailable, occupied, or unoccupied?
		require
			valid_row: is_valid_row(r)
			valid_column: is_valid_column(c)
		do

			Result := imp.item (r, c)

		ensure
			correct_result:
				Result = imp.item (r, c)
		end

	number_of_occupied_slots: INTEGER
			-- Number of slots occupied by pegs on current board.
		do
			Result := 0
			across
				1 |..| 7 as i
			loop
				across
					1 |..| 7 as j
				loop
					if imp.item (i.item, j.item).is_equal(ssa.occupied_slot) then
						Result := Result + 1
					end
				end
			end
		end

feature -- Equality
	is_equal (other: like Current): BOOLEAN
			-- Is current board equal to 'other'?
		do
			Result := Current.out.is_equal (other.out)
		ensure then
			correct_result:
				Result = Current.out.is_equal (other.out)
		end

feature -- Output
	out: STRING
			-- String representation of current board.
		local
			string: STRING
		do
			create Result.make_empty
			create string.make_empty

			across
				1 |..| 7 as i
			loop

				across
					1 |..| 7 as j
				loop
					if
						imp.item (i.item, j.item).is_equal (ssa.occupied_slot)
					then
						string.append ("O")
					elseif
						imp.item (i.item, j.item).is_equal (ssa.unoccupied_slot)
					then
						string.append (".")
					else
						string.append ("*")
					end
				end

				if
					i.item < 7
				then
					string.append_character ('%N')
				end
			end

			Result := string
		end

feature {NONE} -- Implementation

	ssa:SLOT_STATUS_ACCESS
	bta: BOARD_TEMPLATES_ACCESS

	-- Note: ARRAY2 takes row (y) and then column (x)
	imp: ARRAY2[SLOT_STATUS]
end
