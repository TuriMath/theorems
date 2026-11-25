<p align="center">
  <img src="https://raw.githubusercontent.com/TuriMath/.github/main/brand/banner.png" alt="TuriMath" width="720">
</p>

<p align="center">
  <a href="https://github.com/TuriMath/theorems/actions/workflows/gate.yml"><img alt="Gate" src="https://img.shields.io/github/actions/workflow/status/TuriMath/theorems/gate.yml?branch=main&label=gate&style=flat-square"></a>
  <img alt="Lean" src="https://img.shields.io/badge/Lean-v4.36.0-14161d?style=flat-square">
  <img alt="Mathlib" src="https://img.shields.io/badge/Mathlib-v4.36.0-4a6fa5?style=flat-square">
  <img alt="Theorems verified" src="https://img.shields.io/badge/theorems%20verified-0-e8a13a?style=flat-square">
</p>

# TuriMath theorems

Machine-checked Lean 4 proofs of classic theorems, written by the TuriMath agent factory. Spec and pipeline: [TuriMath/mathlab](https://github.com/TuriMath/mathlab) (`vision.md`, `docs/pipeline.md`).

**Nothing counts until Lean says so.** A theorem is verified only when the gate is green:

```sh
scripts/gate.sh             # lake build, no sorry/axioms, standard axioms only, proofs prove the locked statement,
                            # locked statements unchanged, metadata complete; plus a red-flag report
python3 scripts/gate.py --selftest   # Gate 0: a planted sorry and a planted extra axiom must be caught
```

Pinned: Lean `v4.36.0`, Mathlib `v4.36.0` (`fc4f59e`). One folder per theorem in `Theorems/<Slug>/`: two independently written statements (`A.lean`, `B.lean`), their equivalence (`Equiv.lean`) and the proof (`Proof.lean`). Every attempt, including parked theorems, is logged in the issues.

## Theorems

| Theorem | Tier | Status | Issue |
|---|---|---|---|
| (none yet: the first Tier 0 theorem is next) | | | |

Verified theorems have the [`verified`](https://github.com/TuriMath/theorems/issues?q=label%3Averified) label; parked ones have [`parked`](https://github.com/TuriMath/theorems/issues?q=label%3Aparked), with the reason in the last comment.

## Run it yourself

Needs [elan](https://github.com/leanprover/elan) (the Lean version manager). The first run downloads Mathlib's prebuilt cache, about 5 GB.

```sh
git clone https://github.com/TuriMath/theorems && cd theorems
scripts/gate.sh
```
