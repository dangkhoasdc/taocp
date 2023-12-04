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


function euclid_gcd_f(m, n)
  while true
    r = m % n
    r == 0 && return n;
    m = n % r
    m == 0 && return r;
    n = r % m
    n == 0 && return m;
  end
end

@testset "Examples" begin
  @test euclid_gcd(119, 544) == 17
  # 1.1 E6
  @test euclid_gcd(2166, 6099) == 57
end

@testset "1.1 E3" begin
  @test euclid_gcd_f(119, 544) == 17
  @test euclid_gcd_f(2166, 6099) == 57
end
