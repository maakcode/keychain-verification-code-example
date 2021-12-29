setup:
	@read -p "Apple Developer Team ID for Apple App Site Association: " TEAM_ID; \
	echo '{"webcredentials": {"apps": ["'$$TEAM_ID'.com.makeeyaf.Using-TOTP-Example"]}}' > apple-app-site-association.json
	
	bundle install && bundle exec pod install
