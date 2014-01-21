json.array!(@trainingsplans) do |trainingsplan|
  json.extract! trainingsplan, :id, :uebung, :saetze, :wiederholungen, :abgeschlossen
  json.url trainingsplan_url(trainingsplan, format: :json)
end
