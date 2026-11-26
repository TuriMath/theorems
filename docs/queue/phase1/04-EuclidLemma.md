**Slug:** EuclidLemma
**Tier:** 0 (calibration: in Mathlib as `Nat.Prime.dvd_mul`, `Int.Prime.dvd_mul`)

### Source statement (quoted exactly)
> If a prime p divides the product ab of two integers a and b, then p must divide at least one of those integers a or b.

Reference: Wikipedia, "Euclid's lemma" (lead), retrieved 2026-11-26. Euclid, *Elements* VII.30.

### What Mathlib has
- `Nat.Prime.dvd_mul {p m n : ℕ} (pp : p.Prime) : p ∣ m * n ↔ p ∣ m ∨ p ∣ n` in `Mathlib/Data/Nat/Prime/Defs.lean`.
- `Int.Prime.dvd_mul {m n : ℤ} {p : ℕ} (hp : Nat.Prime p) (h : (p : ℤ) ∣ m * n) : p ∣ m.natAbs ∨ p ∣ n.natAbs` in `Mathlib/RingTheory/Int/Basic.lean`.
- `Prime.dvd_or_dvd` for the abstract `Prime` in any commutative monoid with zero.

### Notes for formalizers
a and b are integers, which can be negative or zero. p is a prime number (a natural-number prime 2, 3, 5, …), and "divides" is divisibility in the integers. "At least one" means the inclusive or.
