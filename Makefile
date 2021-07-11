install:
	@echo "Installing Hugo..."
	snap install hugo --channel=extended

runserver:
	@echo "Running Hugo server..."
	hugo serve --debug --gc --disableFastRender
