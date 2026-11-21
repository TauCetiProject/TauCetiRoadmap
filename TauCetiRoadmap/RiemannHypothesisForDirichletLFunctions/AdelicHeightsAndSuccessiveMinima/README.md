# Roadmap: adelic heights and successive minima

**Summary.** Let `K` be a number field of degree `d` and `A = (A_v)_v ∈ GL_n(𝔸_K)` an adelic matrix, integral and invertible at almost every finite place. Twisting the standard norms on `K^n` by `A` place by place gives a height on vectors and subspaces: the height `H_A` that DiophantineApproximationAndTranscendence §2.5 builds for the absolute Siegel lemma of Roy and Thunder. This roadmap writes that height out over every finite extension of `K` under two names and proves the elementary properties that §2.5 does not state, and it states Minkowski's second theorem over `K`, which SubspaceTheorem proves for its approximation bodies, for every body balanced over the completions, such as a product of Euclidean or Hermitian balls at the infinite places. Its headline theorems are these.

(1) For a subspace `U` of `L^n`, where `L` is a finite extension of `K`, let `H_A(U)` be the height of a Plücker vector of `U` for the exterior powers of the `A_v`, with Euclidean norms and exponent `mult(w)/[L:ℚ]` at the infinite places `w` of `L` and max norms and exponent `1/[L:ℚ]` at the finite places. Then for `A = 1` and `U` defined over `K`, `H_A(U)` is the subspace height of DiophantineApproximationAndTranscendence §2.5, and for every `L` the whole space `L^n` has height `|det A|_𝔸`.

(2) Let `Λ ⊆ K^n` be a finitely generated `𝓞 K`-module spanning `K^n` and `B ⊂ (K ⊗ ℝ)^n` a compact, convex, symmetric body. For every Haar measure, the successive minima `μ_0 ≤ ⋯ ≤ μ_{n−1}` of `Λ` over `K` with respect to `B`, in the sense of SubspaceTheorem, satisfy `(∏_l μ_l)^d · vol B ≤ 2^(dn) · covol Λ`. If moreover `0` is an interior point of `B` and `B` is stable under multiplication by every element of `K ⊗ ℝ` of norm at most `1` at each infinite place, then `c_K^(−dn) · 2^(dn)/(dn)! · covol Λ ≤ (∏_l μ_l)^d · vol B`, where `c_K` is the largest house of a member of a fixed integral basis of `𝓞 K`.

The heights are those of [DiophantineApproximationAndTranscendence](../../DiophantineApproximationAndTranscendence/README.md) §2.5, which also proves their invariance under finite extension and the dual-height identity `H_A(U) = |det A|_𝔸 · H_{A^(−t)}(U^⊥)`, `U^⊥` the annihilator of `U` for the dot product; the minima over `K` are those [SubspaceTheorem](../../SubspaceTheorem/README.md) §4.2 defines, and their bounds come from the two halves of the real Minkowski theorem in Tau Ceti through the proofs of SubspaceTheorem §4.2, which carry over. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) reads the degrees of sub-bundles of a Hermitian vector bundle as adelic subspace heights and obtains the successive minima of the bundle from (2).

Layer 2 below writes out the adelic heights of vectors and subspaces and proves the elementary properties that DiophantineApproximationAndTranscendence §2.5 does not state (2.5a); its number and the id 2.5a place it beside §2.5, whose height it names. Layer 3 proves, for every balanced body, the attainment of the minima over `K` by one family, their comparison with the real minima, and Minkowski's second theorem over `K` (3.1).

## Conventions

`K` is a number field, `𝓞 K` its ring of integers and `d = [K:ℚ]`. The infinite places `v` of `K` are Mathlib's `NumberField.InfinitePlace`, with `mult(v) ∈ {1, 2}`; the finite places are the nonzero primes `𝔭`, with the ideal-normalised absolute value. `𝔸_K` is the adele ring of `K` and `GL_n(𝔸_K)` the group of its invertible `n × n` matrices; for `A ∈ GL_n(𝔸_K)`, `A_v` is the component at the place `v`, and `|det A|_𝔸 = ∏_v |det A_v|_v^(w_v)` with `w_v = mult(v)/[K:ℚ]` at the infinite and `w_v = 1/[K:ℚ]` at the finite places, that is the idele norm of `det A` raised to the power `1/d`. `L` is a finite extension of `K`, `w` runs over its places and `v(w)` is the place of `K` below `w`. A Plücker vector of a subspace of dimension `p` is the vector of the maximal minors of a basis, `Λ^p A` is the action of `A` on Plücker coordinates, `A^(−t)` is the inverse transpose and `U^⊥` the annihilator of `U` for the dot product.

`mixedSpace K` is Mathlib's `NumberField.mixedEmbedding.mixedSpace K`, the product of the completions of `K` at its infinite places, that is `K ⊗ ℝ`. `ι` is a finite index type and `n = card ι`. For a finitely generated `𝓞 K`-module `Λ ⊆ ι → K` spanning it, `Λ.mixedImage` is its image in `ι → mixedSpace K`, a full lattice (Tau Ceti `Submodule.mixedImage`), and `covol Λ` its covolume for a Haar measure on `ι → mixedSpace K`, the measure that also gives `vol`. Successive minima are indexed from `0`, as in SuccessiveMinima and SubspaceTheorem: `μ l` over `K` (3.1) and `λ l` over `ℝ` (Tau Ceti's `ZLattice.successiveMin` of `Λ.mixedImage`).

Notation and conventions not restated here are those of DiophantineApproximationAndTranscendence (its Conventions and §2.5) and of SubspaceTheorem (its standing hypotheses, pinned conventions and §§4.1–4.2).

## Layer 2: Adelic heights of vectors and subspaces

DiophantineApproximationAndTranscendence §2.5 builds the height `H_A` of vectors for `A ∈ GL_n(𝔸_K)` in its paragraph on adelic symmetric powers and absolute small vectors, under the name adelicSymmetricPowerHeight, with its subspace height through the exterior powers of `A`, its restricted product, its extension invariance and its local isometric reduction; it states the absolute Siegel lemma of Roy and Thunder and the dual-height identity in terms of it. This layer writes that height out over every finite extension `L` of `K`, as `adelicHeight` on vectors and `adelicSubspaceHeight` on subspaces, and proves the elementary properties that §2.5 does not state.

### 2.5a Adelic heights of vectors and subspaces

Let `n ≥ 1` and `A = (A_v)_v ∈ GL_n(𝔸_K)` with `A_𝔭 ∈ GL_n(𝓞_𝔭)` for all but finitely many finite places `𝔭`. For a
finite extension `L/K` and a nonzero `x ∈ L^n` put

```text
adelicHeight A x = ∏_{w | ∞} |A_{v(w)} x|_w^(mult(w)/[L:ℚ]) · ∏_{w ∤ ∞} ( max_i |(A_{v(w)} x)_i|_w )^(1/[L:ℚ]),
```

where `w` runs over the places of `L`, `v(w)` is the place of `K` below `w`, `A_{v(w)}` acts on `L_w^n` through
`K_{v(w)} ⊂ L_w`, `|·|_w` is the Euclidean (Hermitian) norm on `L_w^n` at infinite `w`, `mult(w) ∈ {1, 2}`, and the
absolute value of `L_w` is ideal-normalised at finite `w`. For an `L`-subspace `U ⊂ L^n` of dimension `p ≥ 1` put
`adelicSubspaceHeight A U = adelicHeight (Λ^p A) y` for a nonzero Plücker vector `y` of `U`, and
`adelicSubspaceHeight A 0 = 1`. These are this roadmap's names for the height `H_A` of DiophantineApproximationAndTranscendence §2.5, written out over every `L`. Provide:

- *Well defined*: `adelicHeight A (a·x) = adelicHeight A x` for `a ∈ L^×`, and `adelicSubspaceHeight A U` does not
  depend on the Plücker vector.
- *Standard data*: `adelicHeight 1 x = TauCeti.absoluteHeight2 x` (and `= height2 x` for `x ∈ K^n`), and
  `adelicSubspaceHeight 1 U = Submodule.subspaceHeight U` for `K`-subspaces `U`.
- *Change of basis*: for `g ∈ GL_n(K)`, `adelicHeight (A·g) (g^(−1) x) = adelicHeight A x` and
  `adelicSubspaceHeight (A·g) (g^(−1) U) = adelicSubspaceHeight A U`.
- *Extreme cases*: `adelicSubspaceHeight A (L^n) = |det A|_𝔸 = ∏_v |det A_v|_v^(w_v)` (`w_v = mult(v)/[K:ℚ]` at infinite and
  `1/[K:ℚ]` at finite places); `adelicSubspaceHeight A (L·x) = adelicHeight A x`; for `n = 1`,
  `adelicHeight A x = |det A|_𝔸` for every nonzero `x`.

DiophantineApproximationAndTranscendence §2.5 proves the following of this height, which 2.5a cites in these names
and does not prove again: both heights are unchanged when `L` is replaced by a finite extension, so they are functions
on `ℚ̄^n` and on the `ℚ̄`-subspaces defined over a number field; `absoluteAdelicMinima` bounds the product of the
`ℚ̄`-infima `μ_i` of `adelicHeight A`; and the dual-height identity reads
`adelicSubspaceHeight A U = |det A|_𝔸 · adelicSubspaceHeight (A^(−t)) U^⊥`, `U^⊥` the annihilator of `U` for the dot
product.

*Route.* Scalar invariance and independence of the Plücker vector are the product formula for `L` (Mathlib
`NumberField.prod_abs_eq_one`), since two Plücker vectors differ by a nonzero scalar. At the finitely many places where
`A_𝔭 ∉ GL_n(𝓞_𝔭)` nothing changes; elsewhere `A_𝔭` preserves the max norm (DiophantineApproximationAndTranscendence §2.5's local isometric reduction), which
gives the finiteness of the product and the value at `A = 1`, where the definition is that of `height2` and, through
the Euclidean norm of the Plücker vector, of `subspaceHeight`. Change of basis: `(A·g)(g^(−1)x) = Ax` at every place,
and `Λ^p(g^(−1))` maps a Plücker vector of `U` to one of `g^(−1)U`. For `U = L^n` a Plücker vector is a single nonzero
coordinate times `e_1 ∧ ⋯ ∧ e_n`, `Λ^n A_v = det A_v`, and the product formula removes the coordinate; the factors
`|det A_v|_w` at the places `w` above `v` then multiply to `|det A_v|_v^(w_v)` because the local degrees above `v` add
up to `[L:K]`. `n = 1` is the same computation.

`Suggested.lean` defines `adelicHeight` and `adelicSubspaceHeight` by these formulas for every adelic matrix, the
subspace height through the Plücker vector of one chosen basis of `U`, and its theorems take `A ∈ GL_n(𝔸_K)`, which
lies in `GL_n(𝓞_𝔭)` at almost every `𝔭`. It states the value at `A = 1` on `K`-subspaces
(`adelicSubspaceHeight_one`) and the value on the whole space (`adelicSubspaceHeight_top`).

*Needs:* DiophantineApproximationAndTranscendence §2.5 (the height `H_A` with its adelic carrier, restricted product and local isometric reduction;
`plucker`, `height2`, `absoluteHeight2`, `subspaceHeight`); Mathlib `NumberField.prod_abs_eq_one`.

**Checks.**

- `K = ℚ`, `n = 2`, `A_∞ = diag(1, e^(−c))`, `A_p = 1`: `adelicHeight A e₂ = e^(−c)`, and
  `adelicSubspaceHeight A ℚ² = e^(−c) = |det A|_𝔸`.
- `K = ℚ(i)`, `A = 1`, `x = (1, 1)`: the complex place has `mult = 2`, so `adelicHeight 1 x = (√2)^(2/2) = √2`, the value
  over `ℚ`; giving the complex place exponent `1/[K:ℚ]` would give `2^(1/4)` and break the extension invariance.
- `K = ℚ`, `n = 1`, `A_∞ = 2`, `A_p = 1`: `adelicHeight A x = 2·|x|_∞·∏_p |x|_p = 2` for every `x ≠ 0`; the infinite
  place alone would give `2|x|`.

### Examples

The Checks of 2.5a work three instances. Over `ℚ` with `n = 2`, `A_∞ = diag(1, e^(−c))` and `A_p = 1`, the vector `e₂` has `adelicHeight A e₂ = e^(−c)`, and the whole space has `adelicSubspaceHeight A ℚ² = e^(−c) = |det A|_𝔸`. Over `ℚ(i)` with `A = 1`, the vector `(1, 1)` has height `√2`, its value over `ℚ`, because the complex place carries `mult = 2`. Over `ℚ` with `n = 1`, `A_∞ = 2` and `A_p = 1`, every nonzero `x` has height `2`, the product formula removing `|x|`.

### Dependencies

DiophantineApproximationAndTranscendence §2.5 (the height `H_A` with its adelic carrier, restricted product and local isometric reduction; `plucker`, `height2`, `absoluteHeight2`, `subspaceHeight`); Mathlib's product formula `NumberField.prod_abs_eq_one`.

## Layer 3: Minkowski's second theorem over number fields for balanced bodies

SubspaceTheorem §4.2 defines the successive minima over `K` of a module with respect to a body, and proves their attainment, their comparison with the real minima and Minkowski's second theorem over `K` for a body as in its §4.1, an approximation body, cut out by linear forms with coefficients in `K`. The body attached to a Hermitian vector bundle of rank at least two, `{x : ‖x‖_σ ≤ 1 for all σ}`, is a product of Euclidean or Hermitian balls of dimension at least two defined by real or complex matrices, so it is not of that form. This layer proves these statements, with §4.2's definition of the minima and its proofs, for every compact convex symmetric body balanced over the completions; SubspaceTheorem §4.3 already proves its span statements in that generality.

### 3.1 Successive minima over `K` for balanced bodies

Let `B ⊂ ι → mixedSpace K` be compact, convex, symmetric, with `0` in its interior, and **balanced over the
completions**: if `x ∈ B` and `a ∈ mixedSpace K` has `‖a_v‖ ≤ 1` at every infinite place, then `a·x ∈ B`.
For a finitely generated `𝓞 K`-module `Λ ⊆ ι → K` spanning it, `μ l` is the `K`-minimum of SubspaceTheorem §4.2:
the infimum of the `t > 0` such that `Λ ∩ t • B` contains `l + 1` vectors linearly independent over `K`, indexed from
`0`, and `0` for `l ≥ card ι`. The definition reads `B` only as a set, so it applies to these bodies unchanged. Prove,
with the constant `c_K ≥ 1` of SubspaceTheorem §4.2, the largest house of a member of a fixed integral basis of `𝓞 K`,
and `d = [K:ℚ]`, `n = card ι`:

- *Attainment by one family*: `card ι` vectors of `Λ`, linearly independent over `K`, the `l`-th in `μ l • B`.
- *Comparison with the real minima* of `Λ.mixedImage` and `B`: `λ l ≤ μ l`, `μ l ≤ λ (d l)` and, using
  balancedness, `λ (d (l + 1) − 1) ≤ c_K · μ l`.
- *Minkowski's second theorem over `K`*, for any Haar measure:

```text
c_K^(−d·n) · 2^(d·n)/(d·n)! · covol Λ ≤ (∏_l μ l)^d · vol B ≤ 2^(d·n) · covol Λ.
```

The upper bound needs only compactness, convexity and symmetry; the lower bound uses balancedness through the
third comparison. For a body that is a product over the infinite places, the upper bound has the shape of the adelic
upper bound of Bombieri and Vaaler, which assumes the factors open, bounded, convex and symmetric (Bombieri–Vaaler 1983,
Theorem 3, p. 18); their lower bound assumes in addition that the factor at each complex place is stable under
multiplication by complex numbers of modulus `1` (their condition (3.16)), which for a convex product body is
balancedness over the completions, and has other constants (Bombieri–Vaaler 1983, Theorem 6, p. 23). The constant
`c_K^(−d·n) · 2^(d·n)/(d·n)!` of the lower bound here is taken from no source: it is the real lower bound transported
by the third comparison, as in the route below.

The approximation bodies of SubspaceTheorem §4.1 are balanced (Tau Ceti `TauCeti.NumberField.mul_mem_approxBody`), and
for them the three statements above are SubspaceTheorem §4.2's. What 3.1 adds are the bodies that are not cut out by
linear forms with coefficients in `K`, such as the closed disc of the second Check, to which it carries §4.2's proofs
over.

*Route.* The proofs of SubspaceTheorem §4.2 apply verbatim: attainment uses that a dilate of a compact body contains
finitely many lattice points; the first two comparisons and the upper bound use the real Minkowski theorem
(Tau Ceti `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`) and Tau Ceti's extraction lemma
`TauCeti.exists_linearIndependent_comp_finrank_mul`; the third comparison multiplies `l + 1` independent vectors of
`Λ ∩ tB` by the members `ω_j` of the integral basis, which keeps them in `c_K t·B` because `B` is balanced;
the lower bound is the lower half of the real Minkowski theorem (Tau Ceti
`ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measureReal`) combined with the third
comparison.

`Suggested.lean` writes out the `K`-minimum of SubspaceTheorem §4.2 as `successiveMinimum`, for every set `B`, so
that the two halves can be stated, defines the predicate `IsBalancedOverCompletions`, and states Minkowski's second
theorem over `K` in two halves: the lower bound
`covolume_le_prod_successiveMinimum_pow_mul_measure_of_isBalancedOverCompletions`, under
`IsBalancedOverCompletions B`, with `c_K` the largest house of a member of an integral basis taken as an argument, and
the upper bound `prod_successiveMinimum_pow_mul_measure_le_of_convex`, for every compact convex symmetric `B`.

*Needs:* SubspaceTheorem §§4.1–4.2 (the minima over `K`, the constant `c_K` and the proofs carried over); Tau Ceti's
two halves of the real Minkowski theorem and its extraction lemma `TauCeti.exists_linearIndependent_comp_finrank_mul`.

**Checks.**

- `K = ℚ`, `Λ = ℤ`, `B = [−1, 1]`: `μ 0 = 1`, `c_ℚ = 1`, and both bounds are equalities, `2 ≤ 1·2 ≤ 2`.
- `K = ℚ`, `Λ = ℤ²`, `B` the closed unit disc of `ℝ²`: balanced, and not an approximation body (over `ℚ` the
  approximation bodies in two variables are parallelograms); `μ 0 = μ 1 = 1`, `covol Λ = 1`, `vol B = π`, and the
  two bounds read `2 ≤ π ≤ 4`.
- A symmetric convex body that is not balanced over the completions: for `K = ℚ(i)`, `Λ = ℤ[i]` and the
  rectangle `B = {|Re z| ≤ 1, |Im z| ≤ ε}` with `0 < ε < 1`, `μ 0 = 1` (the vector `1`) while the second real
  minimum is `1/ε` (the vector `i`), so `λ 1 ≤ c_K·μ 0` fails once `ε < 1/c_K` (`c_K = 1` for the integral basis
  `1, i`); and for `ε < 1/2` the lower bound of the theorem itself fails, since it would read `2 ≤ μ 0²·vol B = 4ε`.
  Balancedness is the hypothesis that the lower comparison and the lower bound use.

### Examples

The Checks of 3.1 work three instances over `ℚ` and `ℚ(i)`. For `Λ = ℤ` and `B = [−1, 1]`, `μ 0 = 1`, `c_ℚ = 1`, and both bounds are equalities, `2 ≤ 1·2 ≤ 2`. For `Λ = ℤ²` and the closed unit disc of `ℝ²`, a balanced body that is not an approximation body, `μ 0 = μ 1 = 1` and the bounds read `2 ≤ π ≤ 4`. For `Λ = ℤ[i]` and the rectangle `{|Re z| ≤ 1, |Im z| ≤ ε}` with `0 < ε < 1/2`, which is symmetric and convex but not balanced, `μ 0 = 1` and the lower bound fails, since it would read `2 ≤ 4ε`.

### Dependencies

SubspaceTheorem §§4.1–4.2 (approximation bodies, mixed images, the minima over `K` and the proofs carried over); Tau Ceti's two halves of the real Minkowski theorem, `ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measureReal` and `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`, and its extraction lemma `TauCeti.exists_linearIndependent_comp_finrank_mul`. Layer 3 does not use Layer 2.

## Downstream consumers

In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) reads the degree of a sub-bundle of a Hermitian vector bundle as an adelic subspace height, and the heights of vectors and the absolute minima of the bundle through 2.5a, at SlopesOfHermitianVectorBundles §§1.1, 1.3, 1.6, 4.3 and 4.3a; it obtains the attainment of the successive minima over `K` of a bundle of rank at least two, and their lower bound, from 3.1, at SlopesOfHermitianVectorBundles §4.1.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the names `adelicHeight` and `adelicSubspaceHeight` for the height `H_A` of DiophantineApproximationAndTranscendence §2.5, written out over every finite extension of `K`, with the elementary properties that §2.5 does not state: independence of the scalar and of the Plücker vector, the values at `A = 1`, change of basis, the whole space, lines and the case `n = 1` (2.5a); and, for every compact convex symmetric body with `0` in its interior that is balanced over the completions, the attainment of the successive minima over `K` by one family, their comparison with the real minima and Minkowski's second theorem over `K`, with its upper half for every compact convex symmetric body (3.1).

Not owned here. The height `H_A` as a construction (with its subspace height through exterior powers), its adelic carrier, its restricted product, its invariance under finite extension and its local isometric reduction, the subspace heights, the absolute Siegel lemma of Roy and Thunder (`absoluteAdelicMinima`) and the dual-height identity are [DiophantineApproximationAndTranscendence](../../DiophantineApproximationAndTranscendence/README.md) §2.5; 2.5a cites the extension invariance, `absoluteAdelicMinima` and the dual-height identity in its names and adds nothing to them. The extraction lemma through field towers is DiophantineApproximationAndTranscendence §2.8, already in the Tau Ceti library. The approximation domains and bodies, pseudo-bases, mixed images and their covolumes are [SubspaceTheorem](../../SubspaceTheorem/README.md) §4.1; the successive minima over `K` themselves, the constant `c_K`, and the attainment, the comparisons and Minkowski's second theorem over `K` for the approximation bodies are SubspaceTheorem §4.2; the span statements for balanced bodies are SubspaceTheorem §4.3. Both halves of the real Minkowski theorem are already in the Tau Ceti library; the lower half is the item `minkowski_second_lower` of [SuccessiveMinima](../../SuccessiveMinima/README.md) §2.1.

Its consumer in the family is SlopesOfHermitianVectorBundles, as described under Downstream consumers above.

## Exact supplier contracts

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

§2.5: the height `H_A` of vectors for `A ∈ GL_n(𝔸_K)`, with its subspace height through the exterior powers of `A`, which `adelicHeight` and `adelicSubspaceHeight` write out over every finite extension of `K`; the adelic carrier, `A ∈ GL_n(𝔸_K)` integral and invertible at almost every finite place, with its restricted product; the extension invariance of the adelic height (local degrees add up, and the norms at the places above `v` are those at `v`); the local isometric reduction (at every finite place where `A_𝔭 ∈ GL_n(𝓞_𝔭)`, `A_𝔭` preserves the max norm); Tau Ceti's `TauCeti.plucker`, `TauCeti.height2`, `TauCeti.absoluteHeight2` and `Submodule.subspaceHeight`, the `[K:ℚ]`-th root of `Submodule.relativeSubspaceArakelovHeight`; `absoluteAdelicMinima`, for `n ≥ 2` the bounds `|det A|_𝔸 ≤ ∏ μ_i ≤ 2^(n(n−1)/2) |det A|_𝔸` for the infima of `H_A` over `ℚ̄^n`; and the dual-height identity `H_A(U) = |det A|_𝔸 · H_{A^(−t)}(U^⊥)`; 2.5a cites the extension invariance, `absoluteAdelicMinima` and the dual-height identity in its names.

### From TauCetiRoadmap.SubspaceTheorem

§4.1: the approximation bodies, compact, convex, symmetric and balanced over the completions (in the Tau Ceti library, below); the mixed image `Submodule.mixedImage` of a finitely generated `𝓞 K`-module spanning `ι → K`, a full lattice in `ι → mixedSpace K`. §4.2: the successive minima over `K`, read through `[DiscreteTopology Λ.mixedImage] [IsZLattice ℝ Λ.mixedImage]`, whose definition 3.1 uses for every body; the constant `c_K`, the largest house of a member of a fixed integral basis, with `1 ≤ c_K`; for the approximation bodies, the attainment, the three comparisons with the real minima and Minkowski's second theorem over `K`; and their proofs, which 3.1 carries over to every balanced body.

### From Mathlib

`NumberField.prod_abs_eq_one` (the product formula); `NumberField.InfinitePlace` with `mult` and its completions `NumberField.InfinitePlace.Completion`; the adele ring `NumberField.AdeleRing` and the completions `IsDedekindDomain.HeightOneSpectrum.adicCompletion` with their ideal-normalised norms; `Matrix.GeneralLinearGroup`; `NumberField.mixedEmbedding.mixedSpace` and `NumberField.mixedEmbedding.normAtPlace`; `ZLattice.covolume`; `NumberField.house`.

### From Tau Ceti

`ZLattice.successiveMin`, with the two halves of Minkowski's second theorem for a discrete full lattice in a finite-dimensional real normed space and a convex body symmetric about `0`: the lower half `ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measureReal`, for a body with `0` in its interior, and the upper half `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`; the extraction lemma `TauCeti.exists_linearIndependent_comp_finrank_mul`, which selects `l + 1` vectors independent over `K` from `d (l + 1)` vectors whose images are independent over `ℝ` (3.1); the approximation bodies `TauCeti.NumberField.approxBody` of SubspaceTheorem §4.1 and their balancedness `TauCeti.NumberField.mul_mem_approxBody`; `Submodule.mixedImage`; `TauCeti.plucker`, `TauCeti.height2`, `TauCeti.absoluteHeight2` and `Submodule.subspaceHeight`; the extension map of adele rings `NumberField.adeleExtension` and the idele norm `TauCeti.GlobalNumberFields.ideleNorm`, through which `Suggested.lean` reads the components of `A` above the places of `L` and `|det A|_𝔸`.

## References

- Damian Roy and Jeffrey Lin Thunder, An absolute Siegel's lemma, J. reine angew. Math. 476 (1996), 1–26: the absolute minima of the adelic height, cited in 2.5a through DiophantineApproximationAndTranscendence §2.5.
- Enrico Bombieri and Walter Gubler, Heights in Diophantine Geometry, Cambridge University Press, 2006, Appendix C.2: successive minima over a number field and the adelic form of Minkowski's second theorem (3.1, through SubspaceTheorem §4.2).
- Enrico Bombieri and Jeffrey D. Vaaler, On Siegel's lemma, Invent. Math. 73 (1983), 11–32: Minkowski's second theorem over a number field, the upper bound (Theorem 3, p. 18) and the lower bound under condition (3.16) (Theorem 6, p. 23), cited in 3.1 for product bodies.
