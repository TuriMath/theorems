**Slug:** FermatTwoSquares
**Tier:** 1 (calibration: in Mathlib as `Nat.Prime.sq_add_sq`)

### Source statement (quoted exactly)
> In additive number theory, Fermat's theorem on sums of two squares states that an odd prime p can be expressed as:
> p = x² + y²,
> with x and y integers, if and only if
> p ≡ 1 (mod 4).

Reference: Wikipedia, "Fermat's theorem on sums of two squares" (lead), retrieved 2026-11-26. Freek Wiedijk, *Formalizing 100 Theorems*, item 20 (which states only one direction). The formulas are typeset by Hilbert.

### What Mathlib has
- `Nat.Prime.sq_add_sq {p : ℕ} [Fact p.Prime] (hp : p % 4 ≠ 3) : ∃ a b : ℕ, a ^ 2 + b ^ 2 = p` in `Mathlib/NumberTheory/SumTwoSquares.lean` (the "if" direction).
- The "only if" direction is not a single lemma. It follows from `Nat.eq_sq_add_sq_iff` (same file) or from squares mod 4.

### Notes for formalizers
p is an odd prime, so p ≠ 2. x and y are integers. Both directions are required.
