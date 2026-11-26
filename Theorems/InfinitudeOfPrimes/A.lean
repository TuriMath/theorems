import Mathlib.Data.Nat.Prime.Infinite
import Mathlib.Data.Set.Finite.Basic

/-!
# Infinitude of primes: statement A (Noether)

Source (Wikipedia, "Euclid's theorem", lead sentence; Euclid, *Elements* IX.20;
Freek Wiedijk, *Formalizing 100 Theorems*, item 11):
> Euclid's theorem is a fundamental statement in number theory that asserts that there are
> infinitely many prime numbers.
-/

namespace TuriMath.InfinitudeOfPrimes.A

/-- There are infinitely many prime numbers.

Mapping from the source quote to Lean, one line each:
* "prime numbers"  → `{p : ℕ | p.Prime}`: ℕ not ℤ, because "prime numbers" in number theory are
                     the natural numbers 2, 3, 5, …; `Nat.Prime p` is Mathlib's irreducibility in ℕ
                     (so 0 and 1 are excluded).
* "there are"      → the statement is about the set of all such numbers, with no hypotheses.
* "infinitely many" → `Set.Infinite`, i.e. `¬ Set.Finite`: the set is not finite. Chosen over
                      "unbounded" or "∀ n, ∃ p ≥ n" because it is the literal meaning of the words.
-/
def Statement : Prop := {p : ℕ | p.Prime}.Infinite

/-! ## Sanity section

The statement has no hypotheses, so there is nothing to show jointly satisfiable.
Instead we check that the set is the intended one and that `Set.Infinite` means "not finite". -/

/-- The set contains 2 and 3 and excludes 0, 1 and 4. -/
example : 2 ∈ {p : ℕ | p.Prime} ∧ 3 ∈ {p : ℕ | p.Prime} ∧
    0 ∉ {p : ℕ | p.Prime} ∧ 1 ∉ {p : ℕ | p.Prime} ∧ 4 ∉ {p : ℕ | p.Prime} := by
  refine ⟨Nat.prime_two, Nat.prime_three, Nat.not_prime_zero, Nat.not_prime_one, ?_⟩
  show ¬ Nat.Prime 4
  decide

/-- `Set.Infinite` is literally "not finite". -/
example (s : Set ℕ) : s.Infinite ↔ ¬ s.Finite := Iff.rfl

/-- A finite set of naturals would not satisfy the analogous statement: e.g. `{2, 3}` is finite,
so `Set.Infinite` is not vacuous. -/
example : ¬ ({2, 3} : Set ℕ).Infinite := Set.not_infinite.mpr (Set.toFinite _)

end TuriMath.InfinitudeOfPrimes.A
