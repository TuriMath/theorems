# Phase 1 calibration queue

Sai's direction is in TuriMath/theorems#2. Each file here is the body of one theorem issue, written to `mathlab/docs/theorem-issue.md`. All Mathlib names were checked against the pinned Mathlib (`fc4f59e`, v4.36.0) on 2026-11-26.

**When to open:** only after #1 (√2) is `verified`, which is the Phase 0 gate. After that, keep **at most 2 theorem issues open** until Sai says the VM is upgraded. Open them in the order below.

| # | Title | Slug | Tier | Mathlib (pinned) |
|---|---|---|---|---|
| 1 | Theorem: Infinitude of primes | InfinitudeOfPrimes | 0 | `Nat.exists_infinite_primes` |
| 2 | Theorem: Sum of the first n natural numbers | SumOfFirstN | 0 | `Finset.sum_range_id_mul_two` |
| 3 | Theorem: Bézout's identity | BezoutIdentity | 0 | `Int.gcd_eq_gcd_ab` |
| 4 | Theorem: Euclid's lemma | EuclidLemma | 0 | `Nat.Prime.dvd_mul` |
| 5 | Theorem: Fundamental theorem of arithmetic | FundamentalTheoremArithmetic | 0 | `Nat.primeFactorsList_unique` |
| 6 | Theorem: Pythagorean theorem | PythagoreanTheorem | 0 | `EuclideanGeometry.dist_sq_eq_dist_sq_add_dist_sq_iff_angle_eq_pi_div_two` |
| 7 | Theorem: Fermat's little theorem | FermatLittleTheorem | 1 | `ZMod.pow_card`, `ZMod.pow_card_sub_one_eq_one` |
| 8 | Theorem: Wilson's theorem | WilsonTheorem | 1 | `Nat.prime_iff_fac_equiv_neg_one` |
| 9 | Theorem: Binomial theorem | BinomialTheorem | 1 | `add_pow` |
| 10 | Theorem: Divergence of the harmonic series | HarmonicSeriesDiverges | 1 | `Real.tendsto_sum_range_one_div_nat_succ_atTop` |
| 11 | Theorem: Fermat's theorem on sums of two squares | FermatTwoSquares | 1 | `Nat.Prime.sq_add_sq` (one direction) |
| 12 | Theorem: Divergence of the sum of prime reciprocals | PrimeReciprocalsDiverge | 1 | `not_summable_one_div_on_primes` |
| 13 | Theorem: Basel problem (ζ(2) = π²/6) | BaselProblem | 1 | `hasSum_zeta_two` |
| 14 | Theorem: AM–GM inequality | AMGMInequality | 1 | `Real.geom_mean_le_arith_mean_weighted` (weighted) |

**Changes from Sai's list:**
- Euclid's lemma moves from 14th to 4th. It is Tier 0, and it comes before the fundamental theorem of arithmetic, which builds on it. That way all of Tier 0 is done before Tier 1.
- Item 3 formalizes Bézout's identity only. Euclid's algorithm is a procedure, not a statement.
- In Fermat's little theorem the quote is the a^p ≡ a form, for every integer a. Mathlib's `ZMod.pow_card` matches it, and `ZMod.pow_card_sub_one_eq_one` covers the a ∤ p variant.

**Where Mathlib has only part of the quote** (expect a harder equivalence step, a useful calibration signal): the "Moreover" half of Bézout, the "only if" direction of two squares, the unweighted AM–GM equality case, and the 1 + ⋯ + n index shift.

**Heavy imports** (careful on the 7 GB VM): Pythagorean (Euclidean geometry) and Basel (ZetaValues).

**How to open one:**
```sh
gh issue create -R TuriMath/theorems --title "Theorem: <name>" \
  --label theorem --label tier:<n> --label stage:formalize \
  --body-file docs/queue/phase1/<NN>-<Slug>.md
```
