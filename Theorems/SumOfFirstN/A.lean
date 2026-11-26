import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Algebra.Ring.Parity

/-!
# Sum of the first n natural numbers: statement A (Noether)

Source (Wikipedia, "Triangular number", section "Formula", retrieved 2026-11-26;
Freek Wiedijk, *Formalizing 100 Theorems*, item 68):
> The triangular numbers are given by the following explicit formulas:
> T_n = n(n+1)/2

with, from the lead, T_n = 1 + 2 + 3 + ⋯ + (n − 1) + n.
-/

namespace TuriMath.SumOfFirstN.A

open Finset

/-- The `n`-th triangular number equals `n(n+1)/2`.

Mapping from the source quote to Lean, one line each:
* "T_n" (for every n)           → `∀ n : ℕ`; ℕ because n counts terms, and n = 0 is allowed
                                  (the empty sum, T_0 = 0).
* "T_n = 1 + 2 + ⋯ + (n−1) + n" → `∑ i ∈ Icc 1 n, i`: the sum over the integers 1 ≤ i ≤ n,
                                  taken in ℕ (all terms are natural numbers). `Icc 1 n`, not
                                  Mathlib's `range n`, so the summation range is the source's.
* "n(n+1)"                      → `n * (n + 1)` in ℕ.
* "/2"                          → ℕ division `/ 2`. It truncates in general, but `n * (n + 1)`
                                  is always even (checked in the sanity section), so here it is
                                  the exact division the source writes.
* "="                           → equality in ℕ.
-/
def Statement : Prop := ∀ n : ℕ, ∑ i ∈ Icc 1 n, i = n * (n + 1) / 2

/-! ## Sanity section

The statement has no hypotheses beyond `n : ℕ`, so there is nothing to show jointly
satisfiable. Instead we check that the objects are the intended ones. -/

/-- The division by 2 is exact: `n(n+1)` is even for every `n`. -/
example (n : ℕ) : 2 ∣ n * (n + 1) :=
  even_iff_two_dvd.mp (Nat.even_mul_succ_self n)

/-- `Icc 1 n` is exactly `{1, …, n}`. -/
example : Icc 1 4 = ({1, 2, 3, 4} : Finset ℕ) := by decide

/-- T_0 = 0 (empty sum) and T_4 = 1 + 2 + 3 + 4 = 10, on both sides. -/
example : ∑ i ∈ Icc 1 0, i = 0 ∧ 0 * (0 + 1) / 2 = 0 := by decide
example : ∑ i ∈ Icc 1 4, i = 1 + 2 + 3 + 4 ∧ 4 * (4 + 1) / 2 = 10 := by decide

end TuriMath.SumOfFirstN.A
