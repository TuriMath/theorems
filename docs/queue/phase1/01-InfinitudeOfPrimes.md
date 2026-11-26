**Slug:** InfinitudeOfPrimes
**Tier:** 0 (calibration: in Mathlib as `Nat.exists_infinite_primes`)

### Source statement (quoted exactly)
> Euclid's theorem is a fundamental statement in number theory that asserts that there are infinitely many prime numbers.

Reference: Wikipedia, "Euclid's theorem" (lead sentence), retrieved 2026-11-26. Euclid, *Elements* IX.20. Freek Wiedijk, *Formalizing 100 Theorems*, item 11 ("The Infinitude of Primes").

### What Mathlib has
- `Nat.exists_infinite_primes (n : ℕ) : ∃ p, n ≤ p ∧ p.Prime` in `Mathlib/Data/Nat/Prime/Infinite.lean`.
- `Nat.not_bddAbove_setOfPred_prime : ¬BddAbove {p | p.Prime}` (same file; the old name `not_bddAbove_setOf_prime` is deprecated).

### Notes for formalizers
"Prime numbers" means the natural-number primes 2, 3, 5, …. "Infinitely many" means the set of primes is infinite.
