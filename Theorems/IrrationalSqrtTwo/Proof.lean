import Theorems.IrrationalSqrtTwo.A

/-!
# Irrationality of √2: proof (Euler)

Classical argument: if √2 = n/d in lowest terms then n² = 2d², so 2 ∣ n, so 4 ∣ 2d²,
so 2 ∣ d, contradicting coprimality. Does not use `irrational_sqrt_two`.
-/

namespace TuriMath.IrrationalSqrtTwo

theorem main : A.Statement := by
  unfold A.Statement
  rintro ⟨r, hr⟩
  have hd : (r.den : ℝ) ≠ 0 := by exact_mod_cast r.den_nz
  have hq : (r : ℝ) = (r.num : ℝ) / r.den := by exact_mod_cast (Rat.num_div_den r).symm
  have h2 : (r.num : ℝ) ^ 2 = 2 * (r.den : ℝ) ^ 2 := by
    have hs : Real.sqrt 2 ^ 2 = 2 := Real.sq_sqrt (by norm_num)
    rw [← hr, hq, div_pow] at hs
    field_simp at hs
    linarith
  have h3 : r.num ^ 2 = 2 * (r.den : ℤ) ^ 2 := by exact_mod_cast h2
  have hn : (2 : ℤ) ∣ r.num := by
    have : (2 : ℤ) ∣ r.num ^ 2 := ⟨(r.den : ℤ) ^ 2, h3⟩
    exact Int.prime_two.dvd_of_dvd_pow this
  obtain ⟨k, hk⟩ := hn
  have h4 : (r.den : ℤ) ^ 2 = 2 * k ^ 2 := by
    rw [hk] at h3; nlinarith
  have hdd : (2 : ℤ) ∣ (r.den : ℤ) := by
    have : (2 : ℤ) ∣ (r.den : ℤ) ^ 2 := ⟨k ^ 2, h4⟩
    exact Int.prime_two.dvd_of_dvd_pow this
  have hcop := r.reduced
  have h2n : (2 : ℤ) ∣ (r.num.natAbs : ℤ) := by
    rw [Int.natCast_natAbs]; exact (Int.dvd_natAbs.mpr ⟨k, hk⟩ |> fun h => by simpa using h)
  have h2n' : 2 ∣ r.num.natAbs := by exact_mod_cast h2n
  have h2d : 2 ∣ r.den := by exact_mod_cast hdd
  have := Nat.eq_one_of_dvd_coprimes hcop h2n' h2d
  omega

end TuriMath.IrrationalSqrtTwo
