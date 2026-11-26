import Mathlib.Analysis.SpecialFunctions.Sqrt

/-!
# Irrationality of √2 — statement B (Gauss)

Source (Freek Wiedijk, *Formalizing 100 Theorems*, item 1):
> The Irrationality of the Square Root of 2

Elementary phrasing: no fraction `p / q` of integers with positive denominator equals `√2`.

Mapping, one line per part of the source:
* "the Square Root of 2"  ↦ `Real.sqrt 2`, the non-negative real number whose square is 2
  (see the sanity checks `sqrt_two_nonneg`, `sqrt_two_sq` below).
* "Irrationality"         ↦ for every `p : ℤ` and `q : ℕ` with `0 < q`, `(p : ℝ) / q ≠ Real.sqrt 2`.
  Every rational number is such a fraction `p / q` with `q > 0`, so this says √2 is no rational.
-/

namespace TuriMath.IrrationalSqrtTwo.B

/-- No fraction `p / q` (integer `p`, positive natural `q`) equals the real square root of 2. -/
def Statement : Prop :=
  ∀ (p : ℤ) (q : ℕ), 0 < q → (p : ℝ) / (q : ℝ) ≠ Real.sqrt 2

/-! ## Sanity section -/

/-- The hypothesis can hold: `p = 1`, `q = 1` satisfies `0 < q`. -/
example : ∃ (_p : ℤ) (q : ℕ), 0 < q := ⟨1, 1, by decide⟩

/-- `Real.sqrt 2` is the non-negative root. -/
theorem sqrt_two_nonneg : 0 ≤ Real.sqrt 2 := Real.sqrt_nonneg 2

/-- `Real.sqrt 2` squares to 2. -/
theorem sqrt_two_sq : Real.sqrt 2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)

/-! ## Concrete cases -/

/-- p = 3, q = 2: (3/2)² = 9/4 ≠ 2, so 3/2 ≠ √2. -/
example : ((3 : ℤ) : ℝ) / ((2 : ℕ) : ℝ) ≠ Real.sqrt 2 := by
  intro h
  have := sqrt_two_sq
  rw [← h] at this
  norm_num at this

/-- p = 7, q = 5: (7/5)² = 49/25 ≠ 2 (close, but 49 ≠ 50). -/
example : ((7 : ℤ) : ℝ) / ((5 : ℕ) : ℝ) ≠ Real.sqrt 2 := by
  intro h
  have := sqrt_two_sq
  rw [← h] at this
  norm_num at this

/-- p = -1, q = 1: -1 < 0 ≤ √2, so the sign alone rules it out. -/
example : ((-1 : ℤ) : ℝ) / ((1 : ℕ) : ℝ) ≠ Real.sqrt 2 := by
  intro h
  have := sqrt_two_nonneg
  rw [← h] at this
  norm_num at this

/-- The arithmetic shadow: no `p, q ≤ 30` with `q > 0` has `p² = 2q²`. -/
example : ∀ p < 31, ∀ q < 31, 0 < q → p ^ 2 ≠ 2 * q ^ 2 := by decide

end TuriMath.IrrationalSqrtTwo.B
