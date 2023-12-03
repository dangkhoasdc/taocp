using Test

"""
Algorithm E (Euclid's Algorithm): Find their **greatest common divisor** of `m` and `n`
"""
function euclid_gcd(m, n)
  # E0: Ensure m >= n
  if m < n; m, n = n, m; end;
  @assert m >= n
  while true
    r = m % n             # E1: Find reminder.
    r == 0 && return n;   # E2: Is it 0?
    m, n = n, r           # E3: Reduce
  end
end

@testset "Examples" begin
  @test euclid_gcd(119, 544) == 17
end
