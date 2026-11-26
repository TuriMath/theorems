import Mathlib.NumberTheory.Real.Irrational

/-!
# Irrationality of √2: statement A (Noether)

Source (Freek Wiedijk, *Formalizing 100 Theorems*, item 1):
> The Irrationality of the Square Root of 2
-/

namespace TuriMath.IrrationalSqrtTwo.A

/-- The irrationality of the square root of 2.

Mapping from the source quote to Lean, one line each:
* "the Square Root" → `Real.sqrt`, Mathlib's principal (non-negative) square root on `ℝ`.
* "of 2"            → the real number `(2 : ℝ)`; the ambient field is `ℝ` because √2 is a real number.
* "Irrationality"   → Mathlib's `Irrational x`, i.e. `x ∉ Set.range ((↑) : ℚ → ℝ)`:
                      no rational number equals `x`.

Import note: only `Mathlib.NumberTheory.Real.Irrational` (it brings `Real.sqrt` and `Irrational`);
the narrow import changes nothing about the statement, it only keeps checking cheap.
-/
def Statement : Prop := Irrational (Real.sqrt 2)

/-! ## Sanity section

The statement has no hypotheses, so there is nothing to show jointly satisfiable.
Instead we check that the object we talk about is the intended one:
`Real.sqrt 2` is the non-negative real whose square is 2. -/

example : 0 ≤ Real.sqrt 2 ∧ Real.sqrt 2 ^ 2 = 2 :=
  ⟨Real.sqrt_nonneg 2, Real.sq_sqrt zero_le_two⟩

/-- `Irrational` unfolds to "not equal to any rational", as the source means. -/
example (x : ℝ) : Irrational x ↔ ∀ q : ℚ, (q : ℝ) ≠ x := by
  simp [Irrational, Set.mem_range]

end TuriMath.IrrationalSqrtTwo.A
