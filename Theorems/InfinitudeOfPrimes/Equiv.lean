import Theorems.InfinitudeOfPrimes.A
import Theorems.InfinitudeOfPrimes.B

namespace TuriMath.InfinitudeOfPrimes

/-- A says the set of primes is infinite; B says no finite set covers all primes.
Each direction uses the other statement as hypothesis. -/
theorem equiv : A.Statement ↔ B.Statement := by
  constructor
  · intro h S
    obtain ⟨p, hp, hS⟩ := h.exists_notMem_finset S
    exact ⟨p, hp, hS⟩
  · intro h hfin
    obtain ⟨p, hp, hS⟩ := h hfin.toFinset
    exact hS (hfin.mem_toFinset.mpr hp)

end TuriMath.InfinitudeOfPrimes
