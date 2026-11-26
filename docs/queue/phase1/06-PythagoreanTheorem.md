**Slug:** PythagoreanTheorem
**Tier:** 0 (calibration: in Mathlib as `EuclideanGeometry.dist_sq_eq_dist_sq_add_dist_sq_iff_angle_eq_pi_div_two`)

### Source statement (quoted exactly)
> [The Pythagorean theorem] states that the area of the square whose side is the hypotenuse (the side opposite the right angle) is equal to the sum of the areas of the squares on the other two sides. The theorem can be written as an equation relating the lengths of the sides a, b and the hypotenuse c: a² + b² = c².

Reference: Wikipedia, "Pythagorean theorem" (lead), retrieved 2026-11-26. Euclid, *Elements* I.47. Freek Wiedijk, *Formalizing 100 Theorems*, item 4. The words in brackets and the formula typesetting are Hilbert's; the rest is verbatim.

### What Mathlib has
- `EuclideanGeometry.dist_sq_eq_dist_sq_add_dist_sq_iff_angle_eq_pi_div_two (p₁ p₂ p₃ : P) : dist p₁ p₃ * dist p₁ p₃ = dist p₁ p₂ * dist p₁ p₂ + dist p₃ p₂ * dist p₃ p₂ ↔ ∠ p₁ p₂ p₃ = π / 2` in `Mathlib/Geometry/Euclidean/Angle/Unoriented/RightAngle.lean`. It covers both directions, for a Euclidean affine space of any dimension.
- `InnerProductGeometry.norm_add_sq_eq_norm_sq_add_norm_sq_iff_real_inner_eq_zero` is the vector form.

### Notes for formalizers
Only the forward direction: if a triangle has a right angle, then the square of the hypotenuse equals the sum of the squares of the legs. The converse is not part of this theorem. The triangle lies in the Euclidean plane, and "right angle" means an angle of π/2 at the vertex opposite the hypotenuse.
Note for Euler: the Euclidean-geometry imports are large. Keep them narrow on the small VM.
