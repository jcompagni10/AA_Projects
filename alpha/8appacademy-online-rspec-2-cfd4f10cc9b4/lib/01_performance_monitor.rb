require "time"

def measure(times = 1, &prc)
  results = []
  (1..times).each do
    start_time = Time.now
    prc.call
    end_time = Time.now
    results << end_time - start_time
  end
  results.reduce(:+)/results.length
end
