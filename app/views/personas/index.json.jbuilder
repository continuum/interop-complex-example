json.array!(@personas) do |persona|
    json.persona do
        json.extract! persona, :id, :nombres, :apellidos
    end
end
