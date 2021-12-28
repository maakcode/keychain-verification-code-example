help:
	@echo "Usage:"
	@echo ""
	@echo "make install\tInstall the required packages."
	@echo "make run\tAPI Run the test API server."
	@echo "make help\tShow help message."

install:
	bundle install && bundle exec pod install

run:
	ruby api.rb
