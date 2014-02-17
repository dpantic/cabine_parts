json.array!(@spms) do |spm|
  json.extract! spm, :spm_ref, :bauteil
  json.url spm_url(spm, format: :json)
end