@benches.each do |bench|
  json.partial! "api/benches/bench", bench: bench
end
