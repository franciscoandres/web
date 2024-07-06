# How to use:
# make install
install:
	@echo "Installing Hugo..."
	snap install hugo --channel=extended

# How to use:
# make createpost title="post's title"
createpost:
	@echo "Creating post..."
	hugo new posts/$(title).md

# How to use:
# make createproject title="project's title"
createproject:
	@echo "Creating project..."
	hugo new projects/$(title).md
	
# How to use:
# make gitpush
gitpush:
	git status
	git add .
	git commit -m "Changes"
	git push

# How to use:
# make runserver
runserver:
	@echo "Running Hugo server..."
	rm -r public; hugo serve --logLevel debug --gc --disableFastRender
