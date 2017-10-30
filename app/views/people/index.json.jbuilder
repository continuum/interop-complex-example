json.array!(@people) do |person|
    json.set! 'Hello World'
    json.persona do
    json.set! 'nombres' do
        person[:names].split(' ')
    end
    json.set! 'apellidos' do
        person[:surname].split(' ')
    end
  end
  json.extract! person, :id
  json.url person_url(person, format: :json)
end
