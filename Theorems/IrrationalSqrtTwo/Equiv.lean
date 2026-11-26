import Theorems.IrrationalSqrtTwo.A
import Theorems.IrrationalSqrtTwo.B

/-!
# Irrationality of √2: A ↔ B (Euler)

Each direction takes the other statement as hypothesis and matches hypotheses to conclusions:
* A → B: a fraction `p / q` with `q > 0` is the image of the rational `(p : ℚ) / q`.
* B → A: a rational `r` is the fraction `r.num / r.den` with `r.den > 0`.
-/

namespace TuriMath.IrrationalSqrtTwo

theorem equiv : A.Statement ↔ B.Statement := by
  unfold A.Statement B.Statement
  constructor
  · intro h p q hq heq
    apply h
    refine ⟨(p : ℚ) / q, ?_⟩
    push_cast
    exact heq
  · intro h ⟨r, hr⟩
    apply h r.num r.den r.den_pos
    rw [← hr]
    exact_mod_cast (Rat.num_div_den r)

end TuriMath.IrrationalSqrtTwo
