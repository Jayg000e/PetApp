require "openai"
require 'dotenv/load'

OpenAI.configure do |config|
  config.access_token = ENV["OPENAI_ACCESS_TOKEN"]
end

client = OpenAI::Client.new

conversation = [
  {"role": "system", "content": "Return the answer as a JSON object."},
  {"role": "user", "content": "Ask me problems of Golden Retriever. Return an array of questions in a JSON object."},
]
response = client.chat(
  parameters: {
      model: "gpt-3.5-turbo",
      messages: conversation,
  })
puts response.dig("choices", 0, "message", "content")
