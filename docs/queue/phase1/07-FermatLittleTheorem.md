**Slug:** FermatLittleTheorem
**Tier:** 1 (calibration: in Mathlib as `ZMod.pow_card`)

### Source statement (quoted exactly)
> In number theory, Fermat's little theorem states that if p is a prime number, then for any integer a, the number a^p − a is an integer multiple of p. In the notation of modular arithmetic, this is expressed as a^p ≡ a (mod p).

Reference: Wikipedia, "Fermat's little theorem" (lead), retrieved 2026-11-26. Hardy & Wright, *An Introduction to the Theory of Numbers*, Thm 70/71. The formulas are typeset by Hilbert; the words are verbatim. (Freek's list has only Euler's generalisation, item 10.)

### What Mathlib has
- `ZMod.pow_card (x : ZMod p) : x ^ p = x` (this form) and `ZMod.pow_card_sub_one_eq_one {a : ZMod p} (ha : a ≠ 0) : a ^ (p - 1) = 1` (the p ∤ a form), in `Mathlib/FieldTheory/Finite/Basic.lean`, for `[Fact p.Prime]`.
- `Int.ModEq.pow_card_sub_one_eq_one` and `Nat.ModEq.pow_totient` (Euler's generalisation).

### Notes for formalizers
This is the a^p ≡ a form, for **every** integer a, including negative a and multiples of p. It is not the a^(p−1) ≡ 1 form, which needs p ∤ a. "Prime number" means a natural-number prime, and the congruence is mod p in the integers.
