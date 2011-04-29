begin
	DatabaseCleaner.orm = 'mongoid'
	DatabaseCleaner.strategy = :truncation
end