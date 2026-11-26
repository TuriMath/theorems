**Slug:** BezoutIdentity
**Tier:** 0 (calibration: in Mathlib as `Int.gcd_eq_gcd_ab`)

### Source statement (quoted exactly)
> Let a and b be integers with greatest common divisor d. Then there exist integers x and y such that ax + by = d. Moreover, the integers of the form az + bt are exactly the multiples of d.

Reference: Wikipedia, "Bézout's identity" (the theorem stated in the lead), retrieved 2026-11-26. Mathlib's `docs/100.yaml` files this under Freek item 60 ("Bezout's Theorem").

### What Mathlib has
- `Int.gcd_eq_gcd_ab : ∀ x y : ℤ, (gcd x y : ℤ) = x * gcdA x y + y * gcdB x y` in `Mathlib/Data/Int/GCD.lean`. `Nat.gcd_eq_gcd_ab` is the version for naturals.
- `exists_gcd_eq_mul_add_mul` for any GCD domain with Bézout's property, in `Mathlib/RingTheory/PrincipalIdealDomain.lean`.
- The "Moreover" part (the set {az + bt} is exactly the multiples of d) does not appear under a single name. It follows from `Int.gcd_dvd_left` and friends.

### Notes for formalizers
Both sentences are part of the theorem: the existence of x, y, **and** the characterisation of {az + bt : z, t integers}. The greatest common divisor is the non-negative one, so gcd(0, 0) = 0. Sai's queue said "Bézout's identity / Euclid's algorithm". We formalize the identity; the algorithm is a procedure, not a statement.
