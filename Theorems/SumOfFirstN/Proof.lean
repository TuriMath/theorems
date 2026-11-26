import Theorems.SumOfFirstN.A
import Mathlib.Tactic.Ring

/-!
# Sum of the first n natural numbers: proof (Euler)

Induction on `n` for `2 * (1 + ⋯ + n) = n (n + 1)`, peeling off the top term with
`Finset.sum_Icc_succ_top`, then dividing by 2. Does not use `Finset.sum_range_id_mul_two`.
-/

namespace TuriMath.SumOfFirstN

open Finset

theorem main : A.Statement := by
  unfold A.Statement
  intro n
  have h : (∑ i ∈ Icc 1 n, i) * 2 = n * (n + 1) := by
    induction n with
    | zero => rfl
    | succ k ih =>
      rw [Finset.sum_Icc_succ_top (by omega : 1 ≤ k + 1), add_mul, ih]
      ring
  omega

end TuriMath.SumOfFirstN
