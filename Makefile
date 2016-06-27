all: simple

simple:
	crystal compile --release src/simple_query.cr -o simple_query

