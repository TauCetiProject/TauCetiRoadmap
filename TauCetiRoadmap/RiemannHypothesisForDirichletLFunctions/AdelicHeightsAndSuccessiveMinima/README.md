# Roadmap: adelic heights and successive minima

**Summary.** Let `K` be a number field of degree `d` and `A = (A_v)_v ∈ GL_n(𝔸_K)` an adelic matrix, integral and invertible at almost every finite place. Twisting the standard norms on `K^n` by `A` place by place gives a height on vectors and subspaces: the height `H_A` that DiophantineApproximationAndTranscendence §2.5 builds for the absolute Siegel lemma of Roy and Thunder. This roadmap gives that height a name and its elementary API, and it extends Minkowski's second theorem over `K` from the approximation bodies of SubspaceTheorem to every body balanced over the completions, such as a product of Euclidean or Hermitian balls at the infinite places. Its headline theorems are these.

(1) For a subspace `U` of `L^n`, where `L` is a finite extension of `K`, let `H_A(U)` be the height of a Plücker vector of `U` for the exterior powers of the `A_v`, with Euclidean norms and exponent `mult(w)/[L:ℚ]` at the infinite places `w` of `L` and max norms and exponent `1/[L:ℚ]` at the finite places. Then `H_A(U)` does not change when `L` is replaced by a finite extension; for `A = 1` and `U` defined over `K` it is the subspace height of DiophantineApproximationAndTranscendence §2.5; the whole space has height `|det A|_𝔸`; and `H_A(U) = |det A|_𝔸 · H_{A^(−t)}(U^⊥)`, where `U^⊥` is the annihilator of `U` for the dot product.

(2) Let `Λ ⊆ K^n` be a finitely generated `𝓞 K`-module spanning `K^n` and `B ⊂ (K ⊗ ℝ)^n` a compact, convex, symmetric body. For every Haar measure, the successive minima `μ_0 ≤ ⋯ ≤ μ_{n−1}` of `Λ` over `K` with respect to `B` satisfy `(∏_l μ_l)^d · vol B ≤ 2^(dn) · covol Λ`. If moreover `0` is an interior point of `B` and `B` is stable under multiplication by every element of `K ⊗ ℝ` of norm at most `1` at each infinite place, then `c_K^(−dn) · 2^(dn)/(dn)! · covol Λ ≤ (∏_l μ_l)^d · vol B`, where `c_K` is the largest house of a member of a fixed integral basis of `𝓞 K`.

The heights rest on the subspace heights and the adelic carrier of [DiophantineApproximationAndTranscendence](../../DiophantineApproximationAndTranscendence/README.md); the minima over `K` come from the real minima of [SuccessiveMinima](../../SuccessiveMinima/README.md) and Tau Ceti through the proofs of [SubspaceTheorem](../../SubspaceTheorem/README.md) §4.2, which carry over. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) reads the degrees of sub-bundles of a Hermitian vector bundle as adelic subspace heights and obtains the successive minima of the bundle from (2).

Layer 2 below defines the adelic heights of vectors and subspaces and proves their elementary API (2.5a); its number and the id 2.5a place it beside DiophantineApproximationAndTranscendence §2.5, whose height it names. Layer 3 proves the attainment of the minima over `K` by one family, their comparison with the real minima, and Minkowski's second theorem over `K` for balanced bodies (3.1).

## Conventions

`K` is a number field, `𝓞 K` its ring of integers and `d = [K:ℚ]`. The infinite places `v` of `K` are Mathlib's `NumberField.InfinitePlace`, with `mult(v) ∈ {1, 2}`; the finite places are the nonzero primes `𝔭`, with the ideal-normalised absolute value. `𝔸_K` is the adele ring of `K` and `GL_n(𝔸_K)` the group of its invertible `n × n` matrices; for `A ∈ GL_n(𝔸_K)`, `A_v` is the component at the place `v`, and `|det A|_𝔸 = ∏_v |det A_v|_v^(w_v)` with `w_v = mult(v)/[K:ℚ]` at the infinite and `w_v = 1/[K:ℚ]` at the finite places, that is the idele norm of `det A` raised to the power `1/d`. `L` is a finite extension of `K`, `w` runs over its places and `v(w)` is the place of `K` below `w`. A Plücker vector of a subspace of dimension `p` is the vector of the maximal minors of a basis, `Λ^p A` is the action of `A` on Plücker coordinates, `A^(−t)` is the inverse transpose and `U^⊥` the annihilator of `U` for the dot product.

`mixedSpace K` is Mathlib's `NumberField.mixedEmbedding.mixedSpace K`, the product of the completions of `K` at its infinite places, that is `K ⊗ ℝ`. `ι` is a finite index type and `n = card ι`. For a finitely generated `𝓞 K`-module `Λ ⊆ ι → K` spanning it, `Λ.mixedImage` is its image in `ι → mixedSpace K`, a full lattice (Tau Ceti `Submodule.mixedImage`), and `covol Λ` its covolume for a Haar measure on `ι → mixedSpace K`, the measure that also gives `vol`. Successive minima are indexed from `0`, as in SuccessiveMinima and SubspaceTheorem: `μ l` over `K` (3.1) and `λ l` over `ℝ` (Tau Ceti's `ZLattice.successiveMin` of `Λ.mixedImage`).

Notation and conventions not restated here are those of DiophantineApproximationAndTranscendence (its Conventions and §2.5) and of SubspaceTheorem (its standing hypotheses, pinned conventions and §§4.1–4.2).

## Layer 2: Adelic heights of vectors and subspaces

DiophantineApproximationAndTranscendence §2.5 builds the height `H_A` inside its paragraph on adelic symmetric powers and absolute small vectors, and states the absolute Siegel lemma of Roy and Thunder and the dual-height identity in terms of it, without naming the height of a vector or of a subspace. This layer names both once and states their elementary API.

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
`adelicSubspaceHeight A 0 = 1`. This is the height `H_A` of DiophantineApproximationAndTranscendence §2.5. Provide:

- *Well defined*: `adelicHeight A (a·x) = adelicHeight A x` for `a ∈ L^×`; `adelicSubspaceHeight A U` does not depend on
  the Plücker vector; both are unchanged when `L` is replaced by a finite extension (the extension invariance of DiophantineApproximationAndTranscendence §2.5),
  so they are functions on `ℚ̄^n` and on `ℚ̄`-subspaces defined over a number field.
- *Standard data*: `adelicHeight 1 x = TauCeti.absoluteHeight2 x` (and `= height2 x` for `x ∈ K^n`), and
  `adelicSubspaceHeight 1 U = Submodule.subspaceHeight U` for `K`-subspaces `U`.
- *Change of basis*: for `g ∈ GL_n(K)`, `adelicHeight (A·g) (g^(−1) x) = adelicHeight A x` and
  `adelicSubspaceHeight (A·g) (g^(−1) U) = adelicSubspaceHeight A U`.
- *Extreme cases*: `adelicSubspaceHeight A (L^n) = |det A|_𝔸 = ∏_v |det A_v|_v^(w_v)` (`w_v = mult(v)/[K:ℚ]` at infinite and
  `1/[K:ℚ]` at finite places); `adelicSubspaceHeight A (L·x) = adelicHeight A x`; for `n = 1`,
  `adelicHeight A x = |det A|_𝔸` for every nonzero `x`.
- *The statements of DiophantineApproximationAndTranscendence §2.5 in these names*: `absoluteAdelicMinima` for the `ℚ̄`-infima `μ_i` of `adelicHeight A`, and the
  dual-height identity `adelicSubspaceHeight A U = |det A|_𝔸 · adelicSubspaceHeight (A^(−t)) U^⊥` (`U^⊥` the annihilator
  for the dot product, as in DiophantineApproximationAndTranscendence §2.5).

*Route.* Scalar invariance and independence of the Plücker vector are the product formula for `L` (Mathlib
`NumberField.prod_abs_eq_one`), since two Plücker vectors differ by a nonzero scalar; extension invariance is DiophantineApproximationAndTranscendence §2.5's
(local degrees add up, and the norms at the places above `v` are those at `v`). At the finitely many places where
`A_𝔭 ∉ GL_n(𝓞_𝔭)` nothing changes; elsewhere `A_𝔭` preserves the max norm (DiophantineApproximationAndTranscendence §2.5's local isometric reduction), which
gives the finiteness of the product and the value at `A = 1`, where the definition is that of `height2` and, through
the Euclidean norm of the Plücker vector, of `subspaceHeight`. Change of basis: `(A·g)(g^(−1)x) = Ax` at every place,
and `Λ^p(g^(−1))` maps a Plücker vector of `U` to one of `g^(−1)U`. For `U = L^n` a Plücker vector is a single nonzero
coordinate times `e_1 ∧ ⋯ ∧ e_n`, `Λ^n A_v = det A_v`, and the product formula removes the coordinate; `n = 1` is the
same computation. The last item is a restatement.

`Suggested.lean` defines `adelicHeight` and `adelicSubspaceHeight` by these formulas for every adelic matrix, the
subspace height through the Plücker vector of one chosen basis of `U`, and its theorems take `A ∈ GL_n(𝔸_K)`, which
lies in `GL_n(𝓞_𝔭)` at almost every `𝔭`. It states the value at `A = 1` on `K`-subspaces
(`adelicSubspaceHeight_one`), the value on the whole space (`adelicSubspaceHeight_top`), the invariance of the
subspace height under replacing `L` by a finite extension (`adelicSubspaceHeight_span_image`) and the dual-height
identity (`adelicSubspaceHeight_eq_mul_euclideanDual`).

*Needs:* DiophantineApproximationAndTranscendence §2.5 (the adelic carrier with its restricted product, extension invariance and local isometric reduction;
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

DiophantineApproximationAndTranscendence §2.5 (the adelic carrier with its restricted product, extension invariance and local isometric reduction; `plucker`, `height2`, `absoluteHeight2`, `subspaceHeight`); Mathlib's product formula `NumberField.prod_abs_eq_one`.

## Layer 3: Minkowski's second theorem over number fields for balanced bodies

SubspaceTheorem §4.2 defines the successive minima over `K` and proves Minkowski's second theorem over `K` for the approximation bodies of its §4.1, cut out by linear forms with coefficients in `K`. The body attached to a Hermitian vector bundle of rank at least two, `{x : ‖x‖_σ ≤ 1 for all σ}`, is a product of Euclidean or Hermitian balls of dimension at least two defined by real or complex matrices, so it is not of that form. This layer proves the theorem for every compact convex symmetric body balanced over the completions; SubspaceTheorem §4.3 already proves its span statements in that generality.

### 3.1 Successive minima over `K` for balanced bodies

Let `B ⊂ ι → mixedSpace K` be compact, convex, symmetric, with `0` in its interior, and **balanced over the
completions**: if `x ∈ B` and `a ∈ mixedSpace K` has `‖a_v‖ ≤ 1` at every infinite place, then `a·x ∈ B`.
For a finitely generated `𝓞 K`-module `Λ ⊆ ι → K` spanning it, define the `K`-minimum `successiveMinimum Λ B l`
exactly as in SubspaceTheorem §4.2 (the infimum of the `t > 0` such that `Λ ∩ t • B` contains `l + 1` vectors linearly
independent over `K`, indexed from `0`, and `0` for `l ≥ card ι`). Prove, with the constant
`c_K = NumberField.integralBasisHouse K` of SubspaceTheorem §4.2 and `d = [K:ℚ]`, `n = card ι`:

- *Attainment by one family*: `card ι` vectors of `Λ`, linearly independent over `K`, the `l`-th in
  `successiveMinimum Λ B l • B`.
- *Comparison with the real minima* of `Λ.mixedImage` and `B`: `λ l ≤ μ l`, `μ l ≤ λ (d l)` and, using
  balancedness, `λ (d (l + 1) − 1) ≤ c_K · μ l`.
- *Minkowski's second theorem over `K`*, for any Haar measure:

```text
c_K^(−d·n) · 2^(d·n)/(d·n)! · covol Λ ≤ (∏_l μ l)^d · vol B ≤ 2^(d·n) · covol Λ.
```

The upper bound needs only compactness, convexity and symmetry; the lower bound uses balancedness through the
third comparison. The approximation bodies of SubspaceTheorem §4.1 are balanced (`NumberField.mul_mem_approxBody`), so SubspaceTheorem §4.2
is the instance `B = approxBody`.

*Route.* The proofs of SubspaceTheorem §4.2 apply verbatim: attainment uses that a dilate of a compact body contains
finitely many lattice points; the first two comparisons and the upper bound use the real Minkowski theorem
(Tau Ceti `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`) and DiophantineApproximationAndTranscendence §2.8's
`exists_linearIndependent_comp_finrank_mul`; the third comparison multiplies `l + 1` independent vectors of
`Λ ∩ tB` by the members `ω_j` of the integral basis, which keeps them in `c_K t·B` because `B` is balanced;
the lower bound is SuccessiveMinima's `minkowski_second_lower` combined with the third comparison.

`Suggested.lean` defines `successiveMinimum` for every set `B` and the predicate `IsBalancedOverCompletions`, and
states Minkowski's second theorem over `K` in two halves: the lower bound
`covolume_le_prod_successiveMinimum_pow_mul_measure`, under `IsBalancedOverCompletions B`, with `c_K` the largest
house of a member of an integral basis taken as an argument, and the upper bound
`prod_successiveMinimum_pow_mul_measure_le`, for every compact convex symmetric `B`.

*Needs:* SubspaceTheorem §§4.1–4.2; SuccessiveMinima §2.1; DiophantineApproximationAndTranscendence §2.8; Tau Ceti's upper
half of Minkowski's second theorem.

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

SubspaceTheorem §§4.1–4.2 (approximation bodies, mixed images, the minima over `K` and the proofs carried over); SuccessiveMinima §2.1 (`minkowski_second_lower`); DiophantineApproximationAndTranscendence §2.8 (`exists_linearIndependent_comp_finrank_mul`); Tau Ceti's upper half of Minkowski's second theorem, `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`. Layer 3 does not use Layer 2.

## Downstream consumers

In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) reads the degree of a sub-bundle of a Hermitian vector bundle as an adelic subspace height, and the heights of vectors and the absolute minima of the bundle through 2.5a, at SlopesOfHermitianVectorBundles §§1.1, 1.3, 1.6, 4.3 and 4.3a; it obtains the definition and attainment of the successive minima of a bundle of rank at least two, and their lower bound, from 3.1, at SlopesOfHermitianVectorBundles §4.1.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the adelic height `adelicHeight` of vectors and the adelic subspace height `adelicSubspaceHeight` for an adelic matrix, with their elementary API: independence of the scalar and of the Plücker vector, invariance under finite extension, the values at `A = 1`, change of basis and the extreme cases (2.5a); and, for every compact convex symmetric body balanced over the completions, the successive minima over `K`, their attainment by one family, their comparison with the real minima and Minkowski's second theorem over `K` (3.1).

Not owned here. The height `H_A` as a construction, with its adelic carrier, its restricted product, its extension invariance and its local isometric reduction, the subspace heights, the absolute Siegel lemma of Roy and Thunder (`absoluteAdelicMinima`) and the dual-height identity are [DiophantineApproximationAndTranscendence](../../DiophantineApproximationAndTranscendence/README.md) §2.5; 2.5a restates the last two in its names and adds nothing to them. The extraction lemma through field towers is DiophantineApproximationAndTranscendence §2.8. The approximation domains and bodies, pseudo-bases, mixed images and their covolumes are [SubspaceTheorem](../../SubspaceTheorem/README.md) §4.1; the successive minima over `K` for the approximation bodies are SubspaceTheorem §4.2, the instance `B = approxBody` of 3.1; the span statements for balanced bodies are SubspaceTheorem §4.3. The lower half of the real Minkowski theorem is [SuccessiveMinima](../../SuccessiveMinima/README.md) §2.1, and its upper half is in the Tau Ceti library.

Its consumer in the family is SlopesOfHermitianVectorBundles, as described under Downstream consumers above.

## Exact supplier contracts

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

§2.5: the adelic carrier, `A ∈ GL_n(𝔸_K)` integral and invertible at almost every finite place, with its restricted product; the extension invariance of the adelic height (local degrees add up, and the norms at the places above `v` are those at `v`); the local isometric reduction (at every finite place where `A_𝔭 ∈ GL_n(𝓞_𝔭)`, `A_𝔭` preserves the max norm); Tau Ceti's `TauCeti.plucker`, `TauCeti.height2`, `TauCeti.absoluteHeight2` and `Submodule.subspaceHeight`, the `[K:ℚ]`-th root of `Submodule.relativeSubspaceArakelovHeight`; `absoluteAdelicMinima`, for `n ≥ 2` the bounds `|det A|_𝔸 ≤ ∏ μ_i ≤ 2^(n(n−1)/2) |det A|_𝔸` for the infima of `H_A` over `ℚ̄^n`; and the dual-height identity `H_A(U) = |det A|_𝔸 · H_{A^(−t)}(U^⊥)`, the last two restated in 2.5a. §2.8: `exists_linearIndependent_comp_finrank_mul`, the extraction of `l + 1` vectors independent over `K` from `d (l + 1)` vectors independent over `ℝ` (3.1).

### From TauCetiRoadmap.SubspaceTheorem

§4.1: the approximation bodies `approxBody`, compact, convex, symmetric and balanced over the completions (`NumberField.mul_mem_approxBody`); the mixed image `Submodule.mixedImage` of a finitely generated `𝓞 K`-module spanning `ι → K`, a full lattice in `ι → mixedSpace K`. §4.2: the successive minima over `K` for the approximation bodies, read through `[DiscreteTopology Λ.mixedImage] [IsZLattice ℝ Λ.mixedImage]`; the constant `c_K = NumberField.integralBasisHouse K`, the largest house of a member of a fixed integral basis, with `1 ≤ c_K`; and the proofs of attainment, of the three comparisons with the real minima and of Minkowski's second theorem over `K`, which 3.1 applies to every balanced body.

### From TauCetiRoadmap.SuccessiveMinima

§2.1: `minkowski_second_lower`, the lower half of Minkowski's second theorem for a discrete full lattice in a finite-dimensional real vector space and a compact convex symmetric body with `0` in its interior.

### From Mathlib

`NumberField.prod_abs_eq_one` (the product formula); `NumberField.InfinitePlace` with `mult` and its completions `NumberField.InfinitePlace.Completion`; the adele ring `NumberField.AdeleRing` and the completions `IsDedekindDomain.HeightOneSpectrum.adicCompletion` with their ideal-normalised norms; `Matrix.GeneralLinearGroup`; `NumberField.mixedEmbedding.mixedSpace` and `NumberField.mixedEmbedding.normAtPlace`; `ZLattice.covolume`; `NumberField.house`.

### From Tau Ceti

`ZLattice.successiveMin` and `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` (the upper half of Minkowski's second theorem); `Submodule.mixedImage`; `TauCeti.plucker`, `TauCeti.height2`, `TauCeti.absoluteHeight2`, `Submodule.subspaceHeight` and `Submodule.euclideanDual`; the extension map of adele rings `NumberField.adeleExtension` and the idele norm `TauCeti.GlobalNumberFields.ideleNorm`, through which `Suggested.lean` reads the components of `A` above the places of `L` and `|det A|_𝔸`.

## References

- Damian Roy and Jeffrey Lin Thunder, An absolute Siegel's lemma, J. reine angew. Math. 476 (1996), 1–26: the absolute minima of the adelic height, restated in 2.5a through DiophantineApproximationAndTranscendence §2.5.
- Enrico Bombieri and Walter Gubler, Heights in Diophantine Geometry, Cambridge University Press, 2006, Appendix C.2: successive minima over a number field and the adelic form of Minkowski's second theorem (3.1, through SubspaceTheorem §4.2).
- Enrico Bombieri and Jeffrey D. Vaaler, On Siegel's lemma, Invent. Math. 73 (1983), 11–32: Minkowski's second theorem over a number field (3.1, through SubspaceTheorem §4.2).
