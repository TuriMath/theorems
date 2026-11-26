import Theorems.InfinitudeOfPrimes.A
import Mathlib.Data.Set.Finite.Lattice

/-!
# Infinitude of primes: proof (Euler)

Euclid's argument with a factorial instead of a product: for any `n`, a prime factor `p` of
`n! + 1` satisfies `n < p`, since `p ≤ n` would give `p ∣ n!` and hence `p ∣ 1`.
Does not use `Nat.exists_infinite_primes` or `Nat.not_bddAbove_setOfPred_prime`.
-/

namespace TuriMath.InfinitudeOfPrimes

theorem main : A.Statement := by
  unfold A.Statement
  apply Set.infinite_of_not_bddAbove
  rintro ⟨n, hn⟩
  obtain ⟨p, hp, hpd⟩ := Nat.exists_prime_and_dvd (show n.factorial + 1 ≠ 1 by have := Nat.factorial_pos n; omega)
  have hle : p ≤ n := hn hp
  have h1 : p ∣ n.factorial := Nat.dvd_factorial hp.pos hle
  exact hp.one_lt.ne' (Nat.dvd_one.mp ((Nat.dvd_add_right h1).mp hpd))

end TuriMath.InfinitudeOfPrimes
