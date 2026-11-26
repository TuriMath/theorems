**Slug:** WilsonTheorem
**Tier:** 1 (calibration: in Mathlib as `Nat.prime_iff_fac_equiv_neg_one`)

### Source statement (quoted exactly)
> Wilson's theorem states that a natural number n > 1 is a prime number if and only if the product of all the positive integers less than n is one less than a multiple of n.
> … (n − 1)! ≡ −1 (mod n)

Reference: Wikipedia, "Wilson's theorem" (lead), retrieved 2026-11-26. Hardy & Wright, Thm 80. Freek Wiedijk, *Formalizing 100 Theorems*, item 51. The formulas are typeset by Hilbert.

### What Mathlib has
- `ZMod.wilsons_lemma : ((p - 1)! : ZMod p) = -1` for `[Fact p.Prime]` (the forward direction only), in `Mathlib/NumberTheory/Wilson.lean`.
- `Nat.prime_iff_fac_equiv_neg_one (h : n ≠ 1) : n.Prime ↔ ((n - 1)! : ZMod n) = -1` (both directions, same file).

### Notes for formalizers
"The product of all the positive integers less than n" is (n − 1)!. This is the "if and only if" statement, for natural numbers n > 1. Both directions are required.
