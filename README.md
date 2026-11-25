# TuriMath theorems

Machine-checked Lean 4 proofs of classic theorems, written by the TuriMath agent factory. Spec and pipeline: [TuriMath/mathlab](https://github.com/TuriMath/mathlab) (`vision.md`, `docs/pipeline.md`).

**Nothing counts until Lean says so.** A theorem is verified only when the gate is green:

```sh
scripts/gate.sh             # lake build, no sorry/axioms, standard axioms only, proofs prove the locked statement,
                            # locked statements unchanged, metadata complete; plus a red-flag report
python3 scripts/gate.py --selftest   # Gate 0: a planted sorry and a planted extra axiom must be caught
```

Pinned: Lean `v4.36.0`, Mathlib `v4.36.0` (`fc4f59e`). One folder per theorem in `Theorems/<Slug>/`: two independently written statements (`A.lean`, `B.lean`), their equivalence (`Equiv.lean`) and the proof (`Proof.lean`). Every attempt, including parked theorems, is logged in the issues.
