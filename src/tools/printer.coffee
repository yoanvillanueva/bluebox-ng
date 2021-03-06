###

Copyright (C) 2013, Jesus Perez <jesusprubio gmail com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

###


# ---------------------- Requires --------------------------------

clc = require "cli-color"


# ----------------------- Class ----------------------------------

# This class includes all print functions needed in the rest of the app.
exports.Printer =
class Printer

	# Used colors.
	infoColor = 55
	infoHighColor = 63
	resultColor = 46
	errorColor = 9
	highLightColor = 202


	@normal = (note) ->
		process.stdout.write note


	@info = (note) ->
		data = clc.xterm(infoColor) "#{note}"
		process.stdout.write data


	@infoHigh = (note) ->
		data = clc.xterm(infoHighColor) "#{note}"
		process.stdout.write data


	@result = (result) ->
		data = clc.xterm(resultColor) "#{result}"
		process.stdout.write data


	@error = (error) ->
		data = clc.xterm(errorColor) "\nERROR: #{error}\n\n"
		process.stdout.write data


	@highlight = (string) ->
		data = clc.xterm(highLightColor) "#{string}"
		process.stdout.write data


	@bold = (string) ->
		data = clc.bold "#{string}"
		process.stdout.write data


	@clear = () ->
		process.stdout.write clc.reset


	# It moves the cursor to the init of the last line
	@removeCursor = () ->
		data = clc.bol -1
		process.stdout.write data


	@quit = () ->
		data = clc.bold "\nSee you! ;)\n"
		process.stdout.write data


	@welcome = () ->
		data = clc.bold "\n\tWelcome to Bluebox-ng (v. beta)\n\n"
		process.stdout.write data


	@configure = () ->
		data = clc.xterm(infoHighColor) "\n>> MODULE SETUP\n\n"
		process.stdout.write data


	@printEnum = (extension, auth) ->
		Printer.info "\nExtension found: "
		Printer.result "#{extension}"
		Printer.result " (#{auth})" if auth
		Printer.result "\n"