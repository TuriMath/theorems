**Slug:** FundamentalTheoremArithmetic
**Tier:** 0 (calibration: in Mathlib as `Nat.primeFactorsList_unique` and friends)

### Source statement (quoted exactly)
> In mathematics, the fundamental theorem of arithmetic, also called the unique factorization theorem and prime factorization theorem, states that every integer greater than 1 is either prime or can be represented uniquely as a product of prime numbers, up to the order of the factors.

Reference: Wikipedia, "Fundamental theorem of arithmetic" (lead sentence), retrieved 2026-11-26. Freek Wiedijk, *Formalizing 100 Theorems*, item 80.

### What Mathlib has
- Existence: `Nat.prod_primeFactorsList : n ≠ 0 → (primeFactorsList n).prod = n` and `Nat.prime_of_mem_primeFactorsList`, in `Mathlib/Data/Nat/Factors.lean`.
- Uniqueness: `Nat.primeFactorsList_unique {n} {l : List ℕ} (h₁ : l.prod = n) (h₂ : ∀ p ∈ l, p.Prime) : l ~ primeFactorsList n` (same file). `~` is list permutation.
- `Nat.factorization_inj` and the general `UniqueFactorizationMonoid` API.

### Notes for formalizers
The theorem has two parts, both required. **Existence:** every integer n > 1 is a product of primes. **Uniqueness:** any two such products are equal up to the order of the factors; repeated primes count with multiplicity. "Either prime or …" means a prime counts as a product of one prime, so the claim covers every n > 1.
