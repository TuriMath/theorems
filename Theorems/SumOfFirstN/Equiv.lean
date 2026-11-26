import Theorems.SumOfFirstN.A
import Theorems.SumOfFirstN.B
import Mathlib.Tactic.Ring

namespace TuriMath.SumOfFirstN

open Finset

/-- B's running total is A's literal sum over `Icc 1 n`. -/
theorem T_eq_sum (n : ℕ) : B.T n = ∑ i ∈ Icc 1 n, i := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [B.T, ih, Finset.sum_Icc_succ_top (by omega : 1 ≤ n + 1)]

/-- The two formulations of the statement correspond: the sums agree termwise,
and the right-hand sides are literally the same expression. -/
theorem equiv : A.Statement ↔ B.Statement := by
  constructor
  · intro h n
    rw [T_eq_sum]; exact h n
  · intro h n
    rw [← T_eq_sum]; exact h n

end TuriMath.SumOfFirstN
