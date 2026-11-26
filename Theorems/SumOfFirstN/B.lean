import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Tactic.NormNum

/-!
# Sum of the first n natural numbers — statement B (Gauss)

Source (Wikipedia, "Triangular number", section "Formula", retrieved 2026-11-26;
Freek Wiedijk, *Formalizing 100 Theorems*, item 68):
> The triangular numbers are given by the following explicit formulas:
> T_n = n(n+1)/2

with, from the lead, T_n = 1 + 2 + 3 + ⋯ + (n − 1) + n.

Elementary phrasing: `T` is defined by the running-total recursion
`T 0 = 0`, `T (n + 1) = T n + (n + 1)` (no `Finset`), and the statement is the
closed formula with natural-number division.

Mapping, one line per part of the source:
* "T_n = 1 + 2 + ⋯ + (n − 1) + n" ↦ `T n`, where `T 0 = 0` (empty sum) and
  `T (n + 1) = T n + (n + 1)` (add the next term); so `T n = 1 + 2 + ⋯ + n`
  (checked against the literal sum in the concrete cases below).
* "n" (a natural number)          ↦ `n : ℕ`, universally quantified.
* "T_n = n(n+1)/2"                 ↦ `T n = n * (n + 1) / 2` in `ℕ`. The `/` is truncating
  division, which is exact here because `n * (n + 1)` is always even
  (checked for small `n` below).
-/

namespace TuriMath.SumOfFirstN.B

/-- The `n`-th triangular number as a running total: `T n = 1 + 2 + ⋯ + n`, `T 0 = 0`. -/
def T : ℕ → ℕ
  | 0 => 0
  | n + 1 => T n + (n + 1)

/-- For every natural number `n`, `T n = n(n+1)/2`. -/
def Statement : Prop :=
  ∀ n : ℕ, T n = n * (n + 1) / 2

/-! ## Sanity section -/

/-- No hypotheses beyond `n : ℕ`; the quantifier ranges over a nonempty type. -/
example : ∃ _n : ℕ, True := ⟨0, trivial⟩

/-- T 0 = 0: the empty sum. -/
example : T 0 = 0 := rfl

/-- T 4 = 1 + 2 + 3 + 4 = 10, literally. -/
example : T 4 = 1 + 2 + 3 + 4 := by decide

/-- `T` agrees with the literal sum `1 + ⋯ + n` (over `Icc 1 n`) for n ≤ 12. -/
example : ∀ n < 13, T n = ∑ i ∈ Finset.Icc 1 n, i := by decide

/-- The division is exact: n(n+1) is even, checked for n < 50. -/
example : ∀ n < 50, 2 ∣ n * (n + 1) := by decide

/-! ## Concrete cases -/

/-- n = 1: T 1 = 1 and 1·2/2 = 1. -/
example : T 1 = 1 * (1 + 1) / 2 := by decide

/-- n = 5: 1+2+3+4+5 = 15 and 5·6/2 = 15. -/
example : T 5 = 5 * (5 + 1) / 2 := by decide

/-- n = 100 (Gauss's schoolroom sum): 1+⋯+100 = 5050 = 100·101/2. -/
example : T 100 = 100 * (100 + 1) / 2 := by decide

/-- The statement holds for every n < 40. -/
example : ∀ n < 40, T n = n * (n + 1) / 2 := by decide

/-- A wrong formula is rejected: T 4 = 10 ≠ 4·5 = 20 (the /2 matters). -/
example : T 4 ≠ 4 * (4 + 1) := by decide

end TuriMath.SumOfFirstN.B
