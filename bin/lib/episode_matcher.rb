def episode_match(filename)
  if matched = filename.match(/(s|S)(\d+)\s(\d+)/) then
    @season = matched[1].strip_leading_zeroes
    @episode = matched[2].strip_leading_zeroes
    return
  end
  if matched = filename.match(/(s|S)(\d+)x*(e|E)(\d+)/) then
    @season = matched[2].strip_leading_zeroes
    @episode = matched[4].strip_leading_zeroes
    return
  end
  if matched = filename.match(/ - (\d\d)(\d\d) - /) then
    @season = matched[1].strip_leading_zeroes
    @episode = matched[2].strip_leading_zeroes
    return
  end
  if matched = filename.match(/ - (\d)(\d\d) - /) then
    @season = matched[1]
    @episode = matched[2].strip_leading_zeroes
    return
  end

  basename = File.basename filename

  if matched = basename.match(/^(\d\d)(\d\d) /) then
    @season = matched[1].strip_leading_zeroes
    @episode = matched[2].strip_leading_zeroes
    return
  end
  if matched = basename.match(/^(\d)(\d\d)/) then
    @season = matched[1]
    @episode = matched[2].strip_leading_zeroes
    return
  end
  if matched = basename.match(/_(\d+)_/) then
    @season = "1" # NOTE: NO SEASON FOUND
    @episode = matched[1].strip_leading_zeroes
    return
  end
  
  return false
end
