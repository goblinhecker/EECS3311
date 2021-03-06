note
	description: "Singleton access to board templates."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

expanded class
	BOARD_TEMPLATES_ACCESS

feature -- Access to board templates
	templates: BOARD_TEMPLATES
		once
			create Result.make
		end

invariant
	singleton_templates:
		-- Your task.
		templates = templates

end
