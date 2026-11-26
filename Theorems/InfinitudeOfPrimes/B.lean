import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.Finset.Basic
import Mathlib.Tactic.NormNum.Prime

/-!
# Infinitude of primes — statement B (Gauss)

Source (Wikipedia, "Euclid's theorem", lead sentence; Euclid, *Elements* IX.20):
> Euclid's theorem is a fundamental statement in number theory that asserts that there are
> infinitely many prime numbers.

Elementary phrasing, close to Euclid's own ("prime numbers are more than any assigned
multitude of prime numbers"): every finite collection of natural numbers misses some prime.

Mapping, one line per part of the source:
* "prime numbers"     ↦ natural numbers `p` with `Nat.Prime p` (2, 3, 5, 7, …).
* "infinitely many"   ↦ no finite set `S : Finset ℕ` contains them all: for every such `S`
  there is a prime `p` with `p ∉ S`. A set of naturals is infinite exactly when no finite
  set covers it.
-/

namespace TuriMath.InfinitudeOfPrimes.B

/-- Every finite set of natural numbers leaves out at least one prime. -/
def Statement : Prop :=
  ∀ S : Finset ℕ, ∃ p : ℕ, Nat.Prime p ∧ p ∉ S

/-! ## Sanity section -/

/-- The quantifier ranges over something: finite sets of naturals exist (e.g. `∅`, `{2, 3, 5}`). -/
example : ∃ _S : Finset ℕ, True := ⟨{2, 3, 5}, trivial⟩

/-- The shape has teeth: the same statement for *even* primes is false, since `{2}` covers them. -/
example : ¬ ∀ S : Finset ℕ, ∃ p : ℕ, (Nat.Prime p ∧ 2 ∣ p) ∧ p ∉ S := by
  intro h
  obtain ⟨p, ⟨hp, h2⟩, hS⟩ := h {2}
  have : p = 2 := ((Nat.Prime.eq_one_or_self_of_dvd hp 2 h2).resolve_left (by norm_num)).symm
  simp [this] at hS

/-- The primes are not trivially covered: 2, 3, 5 and 7 are all prime. -/
example : Nat.Prime 2 ∧ Nat.Prime 3 ∧ Nat.Prime 5 ∧ Nat.Prime 7 := by norm_num

/-! ## Concrete cases -/

/-- S = ∅: 2 is a prime not in it. -/
example : ∃ p : ℕ, Nat.Prime p ∧ p ∉ (∅ : Finset ℕ) := ⟨2, by norm_num, by simp⟩

/-- S = {2, 3, 5}: Euclid's number 2·3·5 + 1 = 31 is prime and not in S. -/
example : ∃ p : ℕ, Nat.Prime p ∧ p ∉ ({2, 3, 5} : Finset ℕ) := ⟨31, by norm_num, by decide⟩

/-- S = {2, 3, 5, 7, 11, 13}: 2·3·5·7·11·13 + 1 = 30031 = 59 · 509 is not prime,
but its factor 59 is a prime outside S. -/
example : ∃ p : ℕ, Nat.Prime p ∧ p ∉ ({2, 3, 5, 7, 11, 13} : Finset ℕ) :=
  ⟨59, by norm_num, by decide⟩

/-- S = {0, 1, …, 99}: 101 is a prime outside it. -/
example : ∃ p : ℕ, Nat.Prime p ∧ p ∉ Finset.range 100 := ⟨101, by norm_num, by simp⟩

end TuriMath.InfinitudeOfPrimes.B
