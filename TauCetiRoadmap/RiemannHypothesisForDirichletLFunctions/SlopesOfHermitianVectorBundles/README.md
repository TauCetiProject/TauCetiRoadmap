# Roadmap: slopes of Hermitian vector bundles

**Summary.** A Hermitian vector bundle `Ē` over the ring of integers `O_K` of a number field `K` is a finitely generated projective `O_K`-module with a Hermitian inner product at every complex embedding of `K`, compatible with complex conjugation. It has an Arakelov degree, and so has every saturated submodule with the restricted metrics. Dividing the degree by `[K:ℚ]` and by the rank gives the slope `μ̂(Ē)`, which does not change under finite extension of `K`. This roadmap builds the theory of slopes: the degree of a lattice glued place by place from images of other lattices; the maximal and minimal slopes `μ̂_max(Ē)` and `μ̂_min(Ē)`; the canonical filtration of Stuhler and Grayson (the Harder–Narasimhan filtration) with its slopes and polygon; Bost's slope inequality for a linear map, with heights at all places; the comparison of slopes with successive minima, and bounds for the maximal slopes of tensor and symmetric powers; the linear growth of the maximal slopes of lattices of sections of an ample line bundle, and an explicit lower bound for the slope of the lattice of sections of degree `T` of a graded system in terms of the height of its Chow form, also when the system is flat only on a subspace of its top degree; and a slope inequality for a family of maps whose images form a nearly tight frame at one archimedean place. Euclidean lattices are the case `K = ℚ`.

The headline theorems are these. (1) Every nonzero `Ē` has a unique filtration `0 = E_0 ⊊ E_1 ⊊ ⋯ ⊊ E_k = E` by saturated submodules whose subquotients are semistable with strictly decreasing slopes; its polygon is the least concave function above the points `(rk F, deĝ_n F̄)` of all sub-bundles, it commutes with finite extension of `K`, and `E_1` is the largest sub-bundle of slope `μ̂_max(Ē)`. (2) For a nonzero `K`-linear map `φ : E_K → F_K`, `μ̂_min(Ē) ≤ μ̂_max(F̄) + h(φ)`, where `h(φ)` is the normalised sum over all places of the logarithms of the operator norms of `φ`; if `φ` is injective, `μ̂_max(Ē) ≤ μ̂_max(F̄) + h(φ)`; and for a filtration of `E_K` with injective maps `φ_i` on its graded pieces, `deĝ_n(Ē) ≤ Σ_i rk(gr^i)(μ̂_max(Ḡ_i) + h(φ_i))`. (3) The successive minima `λ_0 ≤ ⋯ ≤ λ_{n−1}` of `Ē` satisfy `−log λ_j ≤ μ̂_{j+1}(Ē) ≤ −log λ_j + c(K, n)` with an explicit constant, and the absolute minima `μ^abs_1 ≤ ⋯ ≤ μ^abs_n` of `Ē` over `ℚ̄` satisfy `−μ̂_i(Ē) ≤ log μ^abs_i ≤ −μ̂_i(Ē) + (s_i(s_i − 1)/(2(s_i − i + 1)))·log 2` at every index, where `s_i ≤ n` is the dimension of the Harder–Narasimhan step of slope `μ̂_i(Ē)` (so the constant is at most `((n − 1)/2)·log 2` for the first minimum and at most `(n(n − 1)/2)·log 2` for every index); consequently `μ̂_max(Ē ⊗ F̄) ≤ μ̂_max(Ē) + μ̂_max(F̄) + ε(rk E·rk F)` with an explicit `ε`, and `μ̂_max(Sym^m Ē) ≤ m·(μ̂_max(Ē) + log n + (n(n − 1)/2)·log 2)` for every `m ≥ 0`. (4) Let `φ_i : E_{i,K} → F_K` (`i ∈ I`) be `K`-linear maps of heights at most `h_i`, none of which need be injective. Suppose that at one embedding `σ : K → ℂ` the maps lift to a finite-dimensional Hilbert space `ℋ` mapping onto `F_σ` with kernel of dimension at most `δ·dim ℋ`, where `0 ≤ δ < 1`, that the frame operator `Q = Σ γ_i φ̃_i φ̃_i^*` is nearly scalar, `tr Q² ≤ (1 + η)(tr Q)²/dim ℋ`, and that the operators `γ_i φ̃_i^* φ̃_i` are nearly the identity, with total squared Hilbert–Schmidt defect at most `e·Σ rk E_i` and `0 ≤ e < 1`; put `κ_e = 2/(1 − √e)` (so `κ_e ≤ 4` for `e ≤ 1/4`). If `s` is at most the rank-weighted mean of the numbers `μ̂(Ē_i) − h_i`, if `μ̂_max(Ē_i) − h_i ≤ s + u` for all `i` with `u ≥ 0`, and if `H ≥ max(0, s − μ̂_min(F̄))`, then for every `τ > 0` the Harder–Narasimhan step `F_{≥ s−τ}` of `F̄` has codimension at most `(1 − δ)⁻¹·(η + κ_e·(u/(u + τ) + √(e·u/(u + τ))))·rk F`, and integrating over `τ ∈ (0, H]` gives

```text
μ̂(F̄) ≥ s − (1 − δ)⁻¹ · ( κ_e·u·log(1 + H/u) + (η + κ_e·√e)·H ).
```

In words: if the images of sources that are nearly semistable of nearly equal slope fill the target robustly at one place, the slope of the target is at least the mean slope of the sources, less the heights.

The roadmap builds on [ArakelovGeometryAndAbelianHeights](../../ArakelovGeometryAndAbelianHeights/README.md), which supplies Hermitian vector bundles, their operations, the Arakelov degree, the slope and heights of points; on [DiophantineApproximationAndTranscendence](../../DiophantineApproximationAndTranscendence/README.md), whose adelic heights of vectors and subspaces are the heights of vectors and the degrees of sub-bundles read in coordinates, with their duality, their Northcott property and the absolute minima of Roy and Thunder, and whose coefficient heights of polynomials bound heights of multiforms from below; on [SubspaceTheorem](../../SubspaceTheorem/README.md), which supplies Minkowski's second theorem over `K`; and on [BanachSpaceTheory](../../BanachSpaceTheory/README.md) for John's theorem and the normalised spherical measure. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), the slope inequality for nearly tight frames, the gluing lemma and the explicit Hilbert–Samuel inequality feed the slope argument for chains of theta lifts, in [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md), [GluedTargetAndDivisionInequality](../GluedTargetAndDivisionInequality/README.md) and [ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties](../ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties/README.md) respectively; the attained maximal slope, the morphism inequality, the metric-rescaling law and a bound for the maximal slopes of symmetric powers that is linear in the power, with a constant depending only on the rank, are the slope statements used by Bost's proof of the period theorem in FaltingsFinitenessAndIsogenyTheoremsPartII.

Layer 1 reads the degree of a sub-bundle as an adelic subspace height and sets up the degree of a lattice glued place by place, heights of vectors and of linear maps, symmetric powers, the degree inequality along a map, supermodularity of the degree and finiteness of sub-bundles of large degree. Layer 2 defines `μ̂_max` and `μ̂_min` and proves Bost's slope inequality in its image, morphism, injective, surjective, quotient-term and filtered forms, with a slope bound for the image of an orthogonal idempotent. Layer 3 constructs the Harder–Narasimhan filtration, its slopes and its polygon, and proves its functoriality and, through Galois descent of subspaces, its invariance under finite extension. Layer 4 compares slopes with successive minima, over `K` and, at every index, over `ℚ̄`, and bounds the maximal slopes of tensor and symmetric powers. Layer 5 proves the slope inequality for nearly tight frames from a Hilbert-space frame lemma, a Markov count of Harder–Narasimhan slopes and a layer-cake integral. Layer 6 bounds the maximal slopes of lattices of sections of an ample line bundle linearly in the power and proves, with a form of Fekete's lemma with an error term, that the normalised maximal slopes converge; it then defines spherical heights of multiforms and proves, by a determinant divisible by a power of the Chow form, an explicit arithmetic Hilbert–Samuel inequality for graded systems, also with the heights taken relative to a Hermitian vector bundle on the space of coordinates, and with flatness required only on a subspace of the top degree at rational linear sections, the missing dimensions being paid for by short vectors of the top lattice.

## Conventions

`K` is a number field, `O_K` its ring of integers, `d = [K:ℚ]`, `r₁` and `r₂` the numbers of real and complex places, `Σ_K` the set of field embeddings `σ : K → ℂ`. Sums over `Σ_K` count conjugate embeddings separately; equivalently they are sums over the infinite places `v` (Mathlib's `NumberField.InfinitePlace`) weighted by `mult(v) ∈ {1, 2}`. Finite places are the nonzero primes `𝔭`, with the ideal-normalised absolute value `|x|_𝔭 = N𝔭^(−v_𝔭(x))`. Logarithms are natural.

A Hermitian vector bundle `Ē = (E, (h_σ)_σ)` is that of ArakelovGeometryAndAbelianHeights §1.1, with the operations of §1.2 and the degree `deĝ(Ē)` of §1.3. Inner products are conjugate-linear in the first argument (Mathlib's convention). Write `E_K = E ⊗ K`, `E_σ = E ⊗_{O_K,σ} ℂ`, `‖x‖_σ` for the norm of `h_σ`, `E_𝔭 = E ⊗ O_𝔭` and, for `x ∈ E ⊗ K_𝔭`, `‖x‖_𝔭 = min{|a|_𝔭 : x ∈ a·E_𝔭}` (the lattice norm). The normalised degree is `deĝ_n(Ē) = deĝ(Ē)/d` and, for `rk E ≥ 1`, the **slope** is

```text
μ̂(Ē) = deĝ_n(Ē)/rk E = deĝ(Ē)/(d · rk E),
```

the slope of ArakelovGeometryAndAbelianHeights §1.3 in the normalisation of that roadmap's Conventions (the normalised degree divided by the rank). The quotient `deĝ(Ē)/rk E`, which equals `d·μ̂(Ē)` and changes under finite extension of `K`, is used nowhere. Heights of vectors and of linear maps (1.3) carry the same factor `1/d`, so `μ̂` and `h` are both invariant under finite extension of `K` and every statement here combines them with no field-dependent factor. A statement of this roadmap converts to the unnormalised slope `deĝ/rk` and the unnormalised height `d·h` by multiplying by `d` every slope, every height, every logarithm of a minimum (`log λ_j(Ē)` of 4.1, `log μ^abs_i(Ē)` of 4.3), the constants `c(Ē)` of 1.6, and every additive constant. The Check of 1.7 over `ℚ(i)` separates the two normalisations.

A **sub-bundle** is a saturated submodule (`E/F` torsion-free) with the restricted metrics; it is determined by the `K`-subspace `V = F_K`, and we write `Ē_V` for it. The **quotient** `Ē/V` is `E/(V ∩ E)` with the quotient metrics. `Ē(c)` is `Ē` with every norm multiplied by `e^(−c)`. Tensor products carry the tensor metrics, exterior powers the induced metrics, and symmetric powers the quotient metrics of 1.3a.

A bundle is **nonzero** if its rank is positive. Slopes, maximal and minimal slopes, Harder–Narasimhan slopes and polygons are defined for nonzero bundles only, and the height `h(φ)` for nonzero maps only; any junk values a formalisation assigns in the excluded cases are used by no statement. Harder–Narasimhan slopes are indexed `μ̂_1 ≥ ⋯ ≥ μ̂_n` from `1`; successive minima are indexed `λ_0 ≤ ⋯ ≤ λ_{n−1}` from `0`, as in SuccessiveMinima and SubspaceTheorem; the absolute minima `μ^abs_1 ≤ ⋯ ≤ μ^abs_n` of 4.3 are indexed from `1`, as in DiophantineApproximationAndTranscendence §2.5.

For linear maps between finite-dimensional inner-product spaces, `T^*` is the adjoint and `‖T‖²_HS = tr(T^*T)` the squared Hilbert–Schmidt norm. In Layer 5 the inner products at the chosen embedding are auxiliary data and need not be the metrics of the bundles.

Some sources normalise slopes as `2μ̂`, or measure heights of maps by `2h`; every statement here that is homogeneous in slopes and heights (the slope inequalities of Layers 2, 3 and 5) reads the same in that normalisation. Some measure the height of a map `φ` with `φ(E) ⊂ F` by its archimedean part `h_∞(φ) = (1/[K:ℚ])·Σ_σ log ‖φ‖_σ` alone, which is at least `h(φ)` (1.3), so a bound on `h_∞(φ)` is a bound on `h(φ)`; multiplication by `2` on `Ō_ℚ` has `h_∞ = log 2` and height `0`. Others use `2h_∞(φ)`, which is at least `2h(φ)` but need not be at least `h(φ)`, so a bound `2h_∞(φ) ≤ B` gives `h(φ) ≤ B/2`: for the identity map `Ō_ℚ → Ō_ℚ(t)` with `t > 0`, `h = h_∞ = −t` and `2h_∞ = −2t < h`.

## Layer 1: Degrees of sub-bundles and heights

Degrees of sub-bundles are adelic subspace heights in coordinates. This layer fixes that dictionary, computes degrees in arbitrary bases and for lattices glued place by place, defines heights of vectors and maps and the symmetric powers, proves that a map of height `h` changes degrees by at most `h` per rank, and derives supermodularity and finiteness, the two properties on which every construction of Layers 2–6 rests.

### 1.1 Adelic presentation and the degree of a sub-bundle

Let `Ē` be a Hermitian vector bundle of rank `n ≥ 1` over `O_K` and identify `E_K` with `K^n` by a `K`-basis. (i) For every finite place `𝔭` there is `A_𝔭 ∈ GL_n(K_𝔭)` with `E_𝔭 = A_𝔭^(−1)(O_𝔭^n)`, so that `‖x‖_𝔭 = max_i |(A_𝔭 x)_i|_𝔭`, and `A_𝔭 = 1` for all but finitely many `𝔭`; for every infinite place `v` there is `A_v ∈ GL_n(K_v)` with `‖x‖_σ = |A_v σ(x)|` (standard Hermitian norm) for an embedding `σ` inducing `v`, the conjugate embedding using the conjugate matrix. The family `A = (A_v)_v` is an element of `GL_n(𝔸_K)` of the kind used by DiophantineApproximationAndTranscendence §2.5 and AdelicHeightsAndSuccessiveMinima §2.5a (integral and invertible at almost every finite place), and conversely every such `A` defines a Hermitian vector bundle `Ē_A`. (ii) For every `K`-subspace `V ⊂ E_K`,

```text
deĝ(Ē_V) = −[K:ℚ] · log H_A(V),        deĝ_n(Ē_V) = −log H_A(V),
```

where `H_A(V) = adelicSubspaceHeight A V` is the adelic subspace height of AdelicHeightsAndSuccessiveMinima §2.5a: the height of a Plücker vector of `V` for the exterior powers of the `A_v`, with Euclidean norms and exponent `mult(v)/[K:ℚ]` at the infinite places and max norms and exponent `1/[K:ℚ]` at the finite places. In particular `deĝ_n(Ē) = −log |det A|_𝔸`, and for `Ē = Ō_K^n` (`A = 1`), `deĝ(Ē_V) = −log relativeSubspaceArakelovHeight(V)` and `deĝ_n(Ē_V) = −log subspaceHeight(V)`. (iii) `Ē^∨` is presented by `A^(−t)`, the annihilator `V^⊥ ⊂ E_K^∨` satisfies `(Ē^∨)_{V^⊥} ≅ (Ē/V)^∨` isometrically, and the dual-height identity `H_A(V) = |det A|_𝔸 · H_{A^(−t)}(V^⊥)` of the supplier is the identity `deĝ_n((Ē^∨)_{V^⊥}) = deĝ_n(Ē_V) − deĝ_n(Ē)`.

*Route.* (i) `E_𝔭` is free over the principal ideal domain `O_𝔭`, and `E` and `O_K^n` are commensurable, so they agree at almost every `𝔭`; at an infinite place take a square root of the positive definite Gram matrix of `h_σ`, the conjugation condition of ArakelovGeometryAndAbelianHeights §1.1 making the choice compatible with `σ̄` and real at real places. Conversely, let `A` be as in (i). Since `A_𝔭 ∈ GL_n(O_𝔭)` for almost all `𝔭`, the lattices `A_𝔭^(−1)(O_𝔭^n)` agree with the completions of the reference lattice `O_K^n` at almost every `𝔭`, so the completion form of HermitianFormsAndLattices §4.0 (g) (with `R = 𝒪 = O_K`) gives a unique lattice `E ⊂ K^n` with `E_𝔭 = A_𝔭^(−1)(O_𝔭^n)` for every `𝔭`; it is finitely generated and torsion-free, hence projective over the Dedekind domain `O_K`, its lattice norm at `𝔭` is `max_i |(A_𝔭 x)_i|_𝔭`, and the norms `|A_v σ(x)|` (the conjugate matrix at `σ̄`, a real matrix at a real place) are positive definite Hermitian forms compatible with conjugation; this is `Ē_A`. (ii) A Plücker vector `y` of `V` spans the line `Λ^p V`, and `det(Ē_V)` is the line `K·y ∩ Λ^p E` with the determinant metric. Because `V ∩ E` is saturated, `(V ∩ E)_𝔭` is a direct summand of `E_𝔭`, so the lattice norm of `y` in `det(Ē_V)` at `𝔭` is the max norm of `Λ^p A_𝔭 y`; at an infinite place the determinant norm of `y` is `|Λ^p A_v y|` by the Cauchy–Binet identity for Gram determinants. The adelic form of the degree of a line, `deĝ(L̄) = −Σ_𝔭 log‖t‖_𝔭 − Σ_σ log‖t‖_σ` for any nonzero `t ∈ L_K` (the generic-section formula of ArakelovGeometryAndAbelianHeights §1.3), then gives (ii); the sum over `Σ_K` is the sum over infinite places weighted by `mult(v)`, which is the supplier's exponent. (iii) is the supplier's identity with ArakelovGeometryAndAbelianHeights §1.2 for duals and §1.5 for exact sequences.

*Needs:* ArakelovGeometryAndAbelianHeights §§1.1–1.5; AdelicHeightsAndSuccessiveMinima §2.5a (`adelicHeight`, `adelicSubspaceHeight`, their value at `A = 1`, the dual-height identity in these names), §2.5 (`subspaceHeight`, `relativeSubspaceArakelovHeight`, the conjugate Cauchy–Binet identity); HermitianFormsAndLattices §4.0 (g) (completion form: the lattice with prescribed completions, for the converse in (i)).

**Checks.**

- `K = ℚ`, `Ē = ℤ²` with the standard metric, `V = ℚ·(1,1)`: `Ē_V = ℤ·(1,1)` has covolume `√2`, so `deĝ(Ē_V) = −½ log 2 = −log subspaceHeight(V)`.
- `K = ℚ(i)`, `Ē = Ō_K²`, `V = K·(1,1)`: `relativeSubspaceArakelovHeight(V) = (1 + 1)^(2/2) = 2` (one complex place of multiplicity 2), so `deĝ(Ē_V) = −log 2` and `deĝ_n(Ē_V) = −½ log 2`, the value over `ℚ`. Counting the complex place once would give `deĝ(Ē_V) = −½ log 2` and break the invariance of `deĝ_n` under extension (ArakelovGeometryAndAbelianHeights §1.6).
- The non-saturated submodule `ℤ·(2,2) ⊂ ℤ²` has degree `−log(2√2)`, below the degree `−½ log 2` of its saturation; `H_A` measures the saturation, matching the supplier's Check `subspaceHeight(ℚ·(2,2)) = √2`.
- `ℤ²` with Gram matrix `diag(1, e^(−2c))` is presented by `A_∞ = diag(1, e^(−c))`; the line `ℚe₂` has `H_A = e^(−c)` and degree `c`.

### 1.2 Sub-bundles, quotients and exact sequences

For `Ē` of rank `n`, `V ↦ Ē_V` is an order-preserving bijection from `K`-subspaces of `E_K` to sub-bundles, with inverse `F ↦ F_K`, and `rk Ē_V = dim V`. For `W ⊂ V` there are canonical isometries `(Ē_V)_W ≅ Ē_W`, `(Ē/W)_{V/W} ≅ Ē_V/W` and `(Ē/W)/(V/W) ≅ Ē/V`. The sub-bundle of `V ∩ W` is the intersection of the submodules, and the sub-bundle of `V + W` is the saturation of their sum. Base change commutes with both constructions: `(Ē_V)_{O_L} = (Ē_{O_L})_{V⊗L}` and `(Ē/V)_{O_L} = Ē_{O_L}/(V⊗L)`. Degrees are additive, `deĝ(Ē) = deĝ(Ē_V) + deĝ(Ē/V)`, and a submodule `F′ ⊂ E` with `F′_K = V` and the restricted metrics has `deĝ(F̄′) = deĝ(Ē_V) − log #((V ∩ E)/F′)`; in particular, if `F′` has full rank and `rk E ≥ 1`, `μ̂(F̄′) = μ̂(Ē) − log #(E/F′)/(d·rk E)`. For lattices `A, B` (finitely generated `O_K`-submodules spanning the same `K`-space) and a prime `𝔭`, the **local index** `idx_𝔭(A : B) = length_{O_𝔭}(A_𝔭/(A_𝔭 ∩ B_𝔭)) − length_{O_𝔭}(B_𝔭/(A_𝔭 ∩ B_𝔭))` is the index `idx(A_𝔭, B_𝔭)` of HermitianFormsAndLattices §4.0b over the discrete valuation ring `O_𝔭` (and `A_𝔭 ∩ B_𝔭 = (A ∩ B)_𝔭`, HermitianFormsAndLattices §4.0 (f)); it is additive along chains, `idx_𝔭(A : C) = idx_𝔭(A : B) + idx_𝔭(B : C)`, and zero for almost all `𝔭`. For every `K`-basis `e_1, …, e_n` of `E_K`,

```text
deĝ(Ē) = Σ_𝔭 idx_𝔭( E : ⊕_i O_K e_i )·log N𝔭 − ½ · Σ_{σ∈Σ_K} log det( h_σ(e_i, e_j) )_{i,j}        (Gram formula).
```

If the `e_i` lie in `E`, the first sum is `log #(E/⊕_i O_K e_i)`. For two bundles `Ē, Ē′` with `E_K = E′_K` and any `K`-basis `(e_i)` of `E_K`, the difference of two Gram formulas is

```text
deĝ(Ē′) − deĝ(Ē) = Σ_𝔭 idx_𝔭(E′ : E)·log N𝔭 − ½ · Σ_{σ∈Σ_K} log( det h′_σ(e_i, e_j) / det h_σ(e_i, e_j) )        (comparison formula).
```

*Route.* Over the Dedekind domain `O_K` a finitely generated torsion-free module is projective, so `E/(V ∩ E)` is a bundle; the isometries are those of orthogonal complements at each `σ`. Additivity is ArakelovGeometryAndAbelianHeights §1.5, the index formula is its `L ⊂ L′` statement applied to determinants, and base change is §1.2 (vi) with flatness of `O_L` over `O_K`. The Gram formula is the generic-section formula of §1.3 for `det Ē` with the section `t = e_1 ∧ ⋯ ∧ e_n`: its squared norm at `σ` is the Gram determinant, and `det E = 𝔟·t` for the fractional ideal `𝔟` with `−log N(𝔟) = Σ_𝔭 idx_𝔭(E : ⊕ O_K e_i)·log N𝔭`, because at each `𝔭` both sides are the valuation of the determinant of a local basis of `⊕ O_K e_i` written in a local basis of `E`. Additivity of `idx_𝔭` gives the comparison formula.

*Needs:* ArakelovGeometryAndAbelianHeights §§1.2, 1.3, 1.5, 1.6; HermitianFormsAndLattices §§4.0 (f), 4.0b (the index `idx` and its additivity).

**Checks.**

- `ℤ·(1,1) ⊂ ℤ²`: the quotient is `ℤ` with `‖[e₁]‖ = 1/√2`, of degree `½ log 2`, and `0 = deĝ(ℤ²) = −½ log 2 + ½ log 2`.
- The sum `ℤe₁ + ℤ(e₁ + 2e₂)` has index 2 in its saturation `ℤ²`; its degree is `−log 2`, not `0`.
- Gram formula for `ℤ²` with the basis `e₁ + e₂, e₁ − e₂`: index `2`, Gram determinant `4`, so `deĝ = log 2 − ½ log 4 = 0`; omitting the index term would give `−log 2`.
- Gram formula with a basis not in `E`: `Ē = ℤ` standard and `e = ½`: `idx_2(ℤ : ½ℤ) = −1` and the Gram determinant is `¼`, so `deĝ = −log 2 + log 2 = 0`.
- Comparison formula for `Ē = ℤ` (standard) and `Ē′ = ½ℤ` with the norm `2|·|`, basis `1`: the index term is `idx_2(½ℤ : ℤ)·log 2 = +log 2`, the metric term `−½ log 4`, and indeed both bundles have degree `0`; dropping either term gives `±log 2`.

### 1.2a The gluing lemma

Let `K` carry an involution `*` (a field automorphism with `** = 1`, possibly the identity), write `𝔭* = *(𝔭)` for a prime `𝔭` (so `v_𝔭(x^*) = v_{𝔭*}(x)` and `N𝔭* = N𝔭`), and call a `K`-basis of a `K`-space **local at `{𝔭, 𝔭*}`** for a lattice `L` if it is an `O_𝔭`-basis of `L_𝔭` and an `O_{𝔭*}`-basis of `L_{𝔭*}`. Such a basis exists for every lattice and every `𝔭`: the localisation of `O_K` at the complement of `𝔭 ∪ 𝔭*` is a Dedekind domain with finitely many primes, hence a principal ideal domain (Mathlib `IsPrincipalIdealRing.of_finite_primes`), so the corresponding localisation of `L` is free, and a basis of it is local at the pair; a fixed `K`-basis is local at `{𝔭, 𝔭*}` for almost every `𝔭`. **Hermitian metrics** on a `K`-space `U` are a family `(h_σ)_{σ∈Σ_K}` of Hermitian inner products on the spaces `U ⊗_{K,σ} ℂ`, compatible with complex conjugation as in ArakelovGeometryAndAbelianHeights §1.1, so that a lattice in `U` with them is a Hermitian vector bundle. For an isomorphism `φ : U → V` of `K`-spaces with Hermitian metrics `h` on `U` and `h′` on `V` and an embedding `σ`, put `dR(φ)(σ) = det h′_σ(φ b_i, φ b_j)/det h_σ(b_i, b_j)`, which does not depend on the `K`-basis `(b_i)`.

- (i) *Pair indices from one place.* Let `σ₀ ∈ Σ_K` satisfy `σ₀(x^*) = conj(σ₀(x))` for all `x ∈ K`, let `L, L′` be lattices in a `K`-space `V` with a Hermitian inner product `h` on `V_{σ₀}`, and let `b, b′` be bases local at `{𝔭, 𝔭*}` for `L`, `L′`. If `det h(b′_i, b′_j)/det h(b_i, b_j) = σ₀(γ)` with `γ ∈ K^×`, then `idx_𝔭(L′ : L) + idx_{𝔭*}(L′ : L) = −v_𝔭(γ)`.
- (ii) *Discriminant formula.* Let `K₀ ⊂ K` be a `*`-stable subfield with `σ(x^*) = conj(σ(x))` for all `x ∈ K₀` and all `σ ∈ Σ_K`, `ε` a `K`-basis of `V`, and `H` a square matrix over `K₀` of size `dim V` with `H_{ji} = H_{ij}^*`, such that a Hermitian vector bundle `L̄` with `L_K = V` has, at every `σ`, the Gram matrix `σ(H)` in the basis `ε`. For a prime `𝔭` put `jw_𝔭(L, H) = −( v_𝔭(det H) + v_𝔭(a) + v_{𝔭*}(a) )`, where `a` is the determinant in `ε` of a basis local at `{𝔭, 𝔭*}` for `L`. Then `jw_𝔭(L, H)` does not depend on that basis, vanishes for almost all `𝔭`, and

```text
deĝ(L̄) = ½ · Σ_𝔭 jw_𝔭(L, H)·log N𝔭.
```

- (iii) *Gluing.* Let `𝒯` be a finite set with an element `t₀`, and `𝔭 ↦ t(𝔭) ∈ 𝒯` a function on the primes with `t(𝔭*) = t(𝔭)` and `t(𝔭) = t₀` for almost all `𝔭`. Let `V` and `U` be `K`-spaces of dimension `D`, `V` with Hermitian metrics `h^E`, and for each `t ∈ 𝒯`: Hermitian metrics `h^t` on `U`, a lattice `Λ_t ⊂ U` and an isomorphism `ι_t : U → V`. For `j = 1, …, m` let `W_j` be a `K`-space with a basis `ε_j`, Hermitian metrics `h^{W,j}` and a lattice `M_j`, and for each `t`: Hermitian metrics `h^{j,t}` on `W_j`, a lattice `T_{j,t}` and `θ_{j,t} ∈ GL(W_j)`. (For `t ≠ t₀` only the values of `h^t` and `h^{j,t}` at `σ₀` enter.) Let `σ₀` and `K₀` be as in (i) and (ii), and suppose: `h^{j,t₀}` has at every `σ` the Gram matrix `σ(H_j)` in `ε_j` for a matrix `H_j = H_{j,t₀}` over `K₀` with `H_j^{*T} = H_j`, and for each `t`, `h^{j,t}` has at `σ₀` the Gram matrix `σ₀(H_{j,t})` for a matrix `H_{j,t}` over `K` with `H_{j,t}^{*T} = H_{j,t}`; there are reals `κ_σ > 0` with `κ_{σ̄} = κ_σ` and elements `ρ_t ∈ K^×` with `σ₀(ρ_t) > 0`, `ρ_{t₀} = 1` and `v_𝔭(ρ_{t(𝔭)}) = 0` for all `𝔭`, such that

```text
dR(ι_{t₀})(σ) = κ_σ^D · ∏_j dR(θ_{j,t₀})(σ)          for every σ ∈ Σ_K,
dR(ι_t)(σ₀) = (κ_{σ₀}·σ₀(ρ_t))^D · ∏_j dR(θ_{j,t})(σ₀)     for every t ∈ 𝒯,
```

(`ι_t` from `h^t` to `h^E`, `θ_{j,t}` from `h^{j,t}` to `h^{W,j}`); and let `G_t(𝔭) ∈ K^×` satisfy `σ₀(G_t(𝔭)) = det h^t_{σ₀}(e_i, e_j)` for a basis `(e_i)` local at `{𝔭, 𝔭*}` for `Λ_t`. Let `R ⊂ V` be the lattice with `R_𝔭 = (ι_{t(𝔭)}Λ_{t(𝔭)})_𝔭` for every `𝔭`, with the metrics `h^E` (it exists and is unique, by HermitianFormsAndLattices §4.0 (g) with `𝒪 = O_K`, since `t(𝔭) = t₀` for almost all `𝔭`; uniqueness is GeometryOfNumbersAndQuadraticArithmetic §2.2.4), and put `jw_𝔭(j, t) = −( v_𝔭(det H_{j,t}) + v_𝔭(a) + v_{𝔭*}(a) )` with `a` the determinant in `ε_j` of a basis local at `{𝔭, 𝔭*}` for `T_{j,t}`. Then

```text
deĝ(R̄) = Σ_j deĝ(M̄_j) − (D/2)·Σ_σ log κ_σ − ½·Σ_𝔭 ( v_𝔭(G_{t(𝔭)}(𝔭)) + Σ_j B_{j,𝔭} )·log N𝔭 + δ_{t₀},
B_{j,𝔭} = idx_𝔭(M_j : θ_{j,t(𝔭)}T_{j,t(𝔭)}) + idx_{𝔭*}(M_j : θ_{j,t(𝔭)}T_{j,t(𝔭)}) + jw_𝔭(j, t(𝔭)),
δ_{t₀} = deĝ(Λ̄_{t₀}) + ½·Σ_𝔭 v_𝔭(G_{t₀}(𝔭))·log N𝔭,
```

with `Λ̄_{t₀}` carrying the metrics `h^{t₀}`. In particular, if `deĝ(Λ̄_{t₀}) ≥ −½·Σ_𝔭 v_𝔭(G_{t₀}(𝔭))·log N𝔭` (an equality by (ii) when `h^{t₀}` is given at every `σ` by a Hermitian matrix over `K₀`), the identity without `δ_{t₀}` is a lower bound for `deĝ(R̄)`. The localisation at the pairs `{𝔭, 𝔭*}` is part of the statement: with bases local at `𝔭` only, (i)–(iii) are false (second Check).

*Route.* (i) Write `b′ = C·b` and `c = det C ∈ K^×`. The Gram ratio is `|σ₀(c)|² = σ₀(c c^*)`, so `γ = c c^*`; since both bases are local at `𝔭` and at `𝔭*`, `v_𝔭(c) = idx_𝔭(L : L′)` and `v_{𝔭*}(c) = idx_{𝔭*}(L : L′)`, and `v_𝔭(c^*) = v_{𝔭*}(c)`. (ii) Another basis local at the pair changes `a` by a factor that is a unit at `𝔭` and at `𝔭*`. The Gram formula (1.2) for the basis `ε` gives `deĝ(L̄) = Σ_𝔭 idx_𝔭(L : ⟨ε⟩)·log N𝔭 − ½·Σ_σ log σ(det H)`, where `σ(det H) > 0`; the product formula turns the second sum into `−½·Σ_𝔭 v_𝔭(det H)·log N𝔭`, and `idx_𝔭(L : ⟨ε⟩) = −v_𝔭(a)`, which, summed against `log N𝔭 = log N𝔭*`, is `−½(v_𝔭(a) + v_{𝔭*}(a))` summed. (iii) An identity, from the Gram formula, the product formula and one valuation: (1) the difference of the Gram formulas for `R̄` with the basis `ι_{t₀}(e)` and for `Λ̄_{t₀}` with `e` is `deĝ(R̄) − deĝ(Λ̄_{t₀}) = Σ_𝔭 idx_𝔭(R : ι_{t₀}Λ_{t₀})·log N𝔭 − ½·Σ_σ log dR(ι_{t₀})(σ)`; (2) by the first determinant identity, and for each `j` by the same difference for `M̄_j` and for `T_{j,t₀}` with the metrics `h^{j,t₀}` together with (ii) for the latter, `−½·Σ_σ log dR(ι_{t₀})(σ) = −(D/2)·Σ_σ log κ_σ + Σ_j ( deĝ(M̄_j) − ½·Σ_𝔭 B^{t₀}_{j,𝔭}·log N𝔭 )`, where `B^{t}_{j,𝔭}` is `B_{j,𝔭}` with `t` in place of `t(𝔭)`; (3) at a prime `𝔭` with `t = t(𝔭)`, divide the second identity by the first at `σ₀`, computing every `dR` with bases local at `{𝔭, 𝔭*}`: the metrics `h^E` and `h^{W,j}` cancel, and by the computation of (i) what remains is an identity between elements of `K`, whose `𝔭`-adic valuation (with `v_𝔭(ρ_t) = 0`) is `[idx_𝔭 + idx_{𝔭*}](ι_tΛ_t : ι_{t₀}Λ_{t₀}) = v_𝔭(G_{t₀}(𝔭)) − v_𝔭(G_t(𝔭)) − Σ_j (B^{t}_{j,𝔭} − B^{t₀}_{j,𝔭})`; (4) since `R_𝔭 = (ι_{t(𝔭)}Λ_{t(𝔭)})_𝔭`, `t(𝔭*) = t(𝔭)` and `N𝔭* = N𝔭`, the sum in (1) is half the sum over `𝔭` of the left side of (3) times `log N𝔭`; substituting (2) and (3) into (1), the terms `B^{t₀}_{j,𝔭}` cancel, which is the identity.

*Needs:* 1.2; ArakelovGeometryAndAbelianHeights §1.1; HermitianFormsAndLattices §4.0 (g) (existence of `R`); GeometryOfNumbersAndQuadraticArithmetic §2.2.4 (uniqueness of `R`); Mathlib `NumberField.prod_abs_eq_one`, `IsPrincipalIdealRing.of_finite_primes`.

**Checks.**

- (i) for `K = ℚ(i)`, `L = O_K`, `L′ = (2 + i)^(−1)O_K`, `𝔭 = (2 + i)`: `b = 1`, `b′ = (2 + i)^(−1)` (a unit at `𝔭* = (2 − i)`), `γ = 1/5`, and `idx_𝔭(L′ : L) + idx_{𝔭*}(L′ : L) = 1 + 0 = −v_𝔭(1/5)`.
- Pairs, not single primes: for `K = ℚ(i)`, `Λ = O_K` with the standard metric (`H = (1)`), the basis `1` is local at every pair and gives `G = 1`, `δ = 0`. The basis `(2 − i)^(−1)` is local at `(2 + i)` but not at `(2 − i)`; using it at `(2 + i)`, and `(2 + i)^(−1)` at `(2 − i)`, gives `G = 1/5` at both and `½·Σ_𝔭 v_𝔭(G)·log N𝔭 = −log 5`, so `δ` would be `−log 5` for the unimodular `Ō_K`.
- One type, no steps, `κ = 1`: the first identity says that `ι_{t₀}` preserves the determinant metrics (`dR(ι_{t₀})(σ) = 1` at every `σ`; `diag(2, ½)` in orthonormal bases does so without being an isometry), `R = ι_{t₀}Λ_{t₀}`, and (iii) reads `deĝ(R̄) = deĝ(Λ̄_{t₀})`.

### 1.3 Heights of vectors and of linear maps

For nonzero bundles `Ē, F̄` and a nonzero `K`-linear map `φ : E_K → F_K`, let `‖φ‖_𝔭` and `‖φ‖_σ` be the operator norms of `φ` for the lattice norms at `𝔭` and the Hermitian norms at `σ`. Then `‖φ‖_𝔭 = 1` for all but finitely many `𝔭`, and the **height** of `φ` is

```text
h(φ) = (1/[K:ℚ]) · ( Σ_𝔭 log ‖φ‖_𝔭 + Σ_{σ ∈ Σ_K} log ‖φ‖_σ ).
```

The height of a nonzero vector `x ∈ E_K` is `h_Ē(x) = h(1 ↦ x)` for the map `Ō_K → Ē`; in a presentation `A` (1.1), `h_Ē(x) = log adelicHeight A x` (AdelicHeightsAndSuccessiveMinima §2.5a). Provide: `h_{Ē_V}(x) = h_Ē(x)` for `x ∈ V ⊂ E_K`, `x ≠ 0`; `h(aφ) = h(φ)` for `a ∈ K^×`; `h(ψ ∘ φ) ≤ h(ψ) + h(φ)` when `ψ ∘ φ ≠ 0`; `h(φ^∨) = h(φ)`; `h(φ ⊗ 1_{O_L}) = h(φ)` for a finite extension `L/K`; for a subspace `V ⊂ E_K` with `φ|_V ≠ 0`, the restriction `Ē_V → F̄` has height `≤ h(φ)`; for subspaces `V′ ⊂ ker φ` and `W ⊃ φ(E_K)`, the induced map `Ē/V′ → F̄_W` has height `≤ h(φ)`; if `φ(E) ⊂ F` then `h(φ) ≤ (1/[K:ℚ]) Σ_σ log‖φ‖_σ`; rescaling gives `h_{Ē(c) → F̄(c′)}(φ) = h(φ) + c − c′`; and for `φ` viewed as an element of `Ē^∨ ⊗ F̄`, `h(φ) ≤ h_{Ē^∨ ⊗ F̄}(φ)`.

*Route.* In local bases the matrix of `φ` is integral with a unit entry at almost every `𝔭`. A sub-bundle has the restricted Hermitian norms and, being saturated, the restricted lattice norms (`(V ∩ E)_𝔭` is a direct summand of `E_𝔭`), which gives `h_{Ē_V} = h_Ē` on `V`. Invariance under `K^×` is the product formula. Submultiplicativity, the dual, restriction and induced maps are the corresponding facts for operator norms at each place (quotient norms are distances to a subspace). Base change: each `σ` has `[L:K]` extensions with the same operator norm, and the lattice norms at the primes of `L` above `𝔭` are those at `𝔭` with local degrees adding to `[L:K]`. The last inequality is "operator norm ≤ Hilbert–Schmidt norm" at the infinite places, and equality of the lattice norm of `Hom(E_𝔭, F_𝔭)` with the operator norm at the finite places.

*Needs:* 1.1, 1.2; ArakelovGeometryAndAbelianHeights §§1.2, 1.4, 1.6; AdelicHeightsAndSuccessiveMinima §2.5a (`adelicHeight`); Mathlib `NumberField.prod_abs_eq_one`.

**Checks.**

- Multiplication by `2` on `Ō_ℚ` has archimedean operator norm `2` and `2`-adic operator norm `1/2`, so `h = 0`; dropping the finite places would give `log 2`.
- In `ℤ²` with the standard metric, `h(1,1) = ½ log 2`, and `h(2,2) = ½ log 2` as well.
- The zero map has no height; the statements requiring `φ ≠ 0` keep that hypothesis.

### 1.3a Symmetric powers

For a Hermitian vector bundle `Ē` of rank `r ≥ 1` and `n ≥ 0`, the **symmetric power** `Sym^n Ē` is the `O_K`-module `Sym^n_{O_K} E` (Mathlib's `SymmetricPower`; `Sym^0 Ē = Ō_K`), the quotient of `E^{⊗n}` by the submodule generated by the differences `x − π·x` of permuted tensors, with the quotient metrics of `Ē^{⊗n}` at every `σ`. The module statements are in the Tau Ceti library and are used as they stand: functoriality `SymmetricPower.map` (with `map_id`, `map_comp`), the basis `Module.Basis.symmetricPower` of a free module with `SymmetricPower.free` and the rank `SymmetricPower.finrank_eq` (`Nat.multichoose r n = binom(n + r − 1, n)`), the symmetrisation `SymmetricPower.toTensorPower` (`[x] ↦ Σ_π π·x`) with `SymmetricPower.mk_comp_toTensorPower`, `SymmetricPower.toTensorPower_comp_map` and `SymmetricPower.toTensorPower_injective` when `n!` is a unit, extension of scalars `RingHom.extendScalarsSymmetricPowerIso` with its naturality, and `ModuleCat.symmetricPower.iso₀`, `iso₁`. Provide the Hermitian statements:

- (i) `Sym^n E` is projective of rank `binom(n + r − 1, n)` and the kernel of `E^{⊗n} → Sym^n E` is saturated, so the metric is the quotient metric of ArakelovGeometryAndAbelianHeights §1.2; `Sym^1 Ē = Ē`, and `Sym^n L̄ = L̄^{⊗n}` isometrically for a Hermitian line bundle `L̄`.
- (ii) At each `σ` the quotient norm of a class is the norm of the orthogonal projection of any lift onto the symmetric tensors: `(1/n!)·toTensorPower` is an isometry of `Sym^n E_σ` onto `(E_σ^{⊗n})^{S_n}`. For an orthonormal basis of `E_σ` the monomials `e^α` (`|α| = n`) are orthogonal with `‖e^α‖² = α!/n!`.
- (iii) For a nonzero `K`-linear `φ : E_K → F_K`, `Sym^n φ` is nonzero, `‖Sym^n φ‖_v ≤ ‖φ‖_v^n` at every place `v`, finite or infinite, and so `h(Sym^n φ) ≤ n·h(φ)`; if `φ` is injective, so is `Sym^n φ`.
- (iv) Base change: `(Sym^n Ē)_{O_L} ≅ Sym^n(Ē_{O_L})` isometrically for a finite extension `L/K`, compatibly with composite extensions; an isometry `Ē ≅ Ē′` induces an isometry `Sym^n Ē ≅ Sym^n Ē′`.
- (v) For an orthogonal sum `L̄_1 ⊕ ⋯ ⊕ L̄_r` of Hermitian line bundles, `Sym^n(⊕_j L̄_j) ≅ ⊕_{|α|=n} (⊗_j L̄_j^{⊗α_j})(½ log(n!/α!))` isometrically: an orthogonal sum of lines of slopes `Σ_j α_j μ̂(L̄_j) + ½ log(n!/α!)`, where `α! = ∏_j α_j!` and `Σ_{|α|=n} n!/α! = r^n`.

*Route.* (i) `Sym^n` commutes with localisation (`RingHom.extendScalarsSymmetricPowerIso`), and `E_𝔭` is free of rank `r`, so `Sym^n E_𝔭` is free of rank `binom(n + r − 1, n)` (`SymmetricPower.free`, `finrank_eq`); hence `Sym^n E` is projective of that rank and torsion-free, which is the saturation of the kernel. (ii) Permutations act unitarily on `E_σ^{⊗n}`, so the kernel, spanned by the `x − π·x`, is the orthogonal complement of the symmetric tensors, and `toTensorPower` composed with the quotient map is `Σ_π π`, `n!` times the orthogonal projection; the symmetrisation of `e_{i_1} ⊗ ⋯ ⊗ e_{i_n}` is the average of `n!/α!` orthonormal arrangements, of squared norm `α!/n!`. (iii) At `σ`, `Sym^n φ = SymmetricPower.map φ` is induced by `φ^{⊗n}`, of norm `‖φ‖_σ^n`, and the quotient norm is an infimum over lifts; at `𝔭`, if `φ(E_𝔭) ⊂ a·F_𝔭` then `Sym^n φ(Sym^n E_𝔭) ⊂ a^n·Sym^n F_𝔭`; injectivity follows from `toTensorPower_comp_map` and `toTensorPower_injective` over `K`, and non-vanishing from `Sym^n φ(x^n) = φ(x)^n`. (iv) The module isomorphism is `RingHom.extendScalarsSymmetricPowerIso`, and the metrics are defined place by place. (v) At the finite places `Sym^n` of a direct sum is the direct sum of the tensor products of symmetric powers of the summands; at `σ` apply (ii) to unit vectors of the lines; the multinomial identity gives the sum.

*Needs:* 1.2, 1.3; ArakelovGeometryAndAbelianHeights §§1.1, 1.2; Mathlib `SymmetricPower`; Tau Ceti `SymmetricPower.map`, `Module.Basis.symmetricPower`, `SymmetricPower.free`, `SymmetricPower.finrank_eq`, `SymmetricPower.toTensorPower` (with `mk_comp_toTensorPower`, `toTensorPower_comp_map`, `toTensorPower_injective`), `RingHom.extendScalarsSymmetricPowerIso`.

**Checks.**

- `Sym²(ℤ²)` with the standard metric: `e₁², e₁e₂, e₂²` are orthogonal of squared norms `1, ½, 1`; the shortest lift of `e₁e₂` is `(e₁⊗e₂ + e₂⊗e₁)/2`, not `e₁ ⊗ e₂`, which has norm `1`. Giving every monomial norm `1` is the wrong metric.
- (v) for two trivial lines and `n = 2`: the monomial lines have slopes `0, ½ log 2, 0`, and the largest is `½ log 2 ≤ (n/2)·log r = log 2`.

### 1.4 Degrees along a linear map

(i) For Hermitian line bundles `L̄, M̄` and a nonzero `K`-linear `ψ : L_K → M_K`, `deĝ_n(L̄) = deĝ_n(M̄) + h(ψ)`; in particular `deĝ_n(Ē_{Kx}) = −h_Ē(x)` for every nonzero `x ∈ E_K`. (ii) If `φ : E_K → F_K` is injective and `rk E = rk F = r ≥ 1`, then `deĝ_n(Ē) ≤ deĝ_n(F̄) + r·h(φ)`. (iii) For a nonzero `φ : E_K → F_K` with kernel `V` and image `W`, `deĝ_n(Ē/V) ≤ deĝ_n(F̄_W) + dim W · h(φ)`.

*Route.* (i) Write both degrees in the adelic form of 1.1 with the sections `t` and `ψ(t)`; in rank one `‖ψ(t)‖_v = ‖ψ‖_v ‖t‖_v` at every place. (ii) Apply (i) to `Λ^r φ : det Ē → det F̄`, using `‖Λ^r φ‖_v ≤ ‖φ‖_v^r` at every place: the Hadamard inequality (SuccessiveMinima §0.1) at the infinite places and the ultrametric bound on a determinant at the finite places. (iii) Apply (ii) to the induced isomorphism `Ē/V → F̄_W`, whose height is at most `h(φ)` by 1.3.

*Needs:* 1.1–1.3; SuccessiveMinima §0.1 (`orthonormal_coordinate_hadamard`).

**Checks.**

- `φ = 2·id` on `ℤ²`: `h(φ) = 0` and (ii) is the equality `0 ≤ 0`.
- `φ = diag(1, 2)` on `ℤ²`: `h(φ) = log 2` (archimedean norm `2`, all finite norms `1`), and (ii) gives `0 ≤ 2 log 2`, strict because `‖Λ²φ‖_∞ = 2 < ‖φ‖²_∞ = 4`.

### 1.5 Supermodularity of the degree

For subspaces `V, W ⊂ E_K`,

```text
deĝ(Ē_{V+W}) + deĝ(Ē_{V∩W}) ≥ deĝ(Ē_V) + deĝ(Ē_W),       dim(V+W) + dim(V∩W) = dim V + dim W.
```

Equivalently `H_A(V + W)·H_A(V ∩ W) ≤ H_A(V)·H_A(W)`; for `Ē = Ō_K^n` this is the Struppeck–Vaaler inequality of DiophantineApproximationAndTranscendence §2.5. Hence, for every `θ ∈ ℝ`, `g_θ(V) = deĝ_n(Ē_V) − θ·dim V` is a supermodular function on the lattice of subspaces of `E_K`.

*Route.* The inclusion `V ⊂ V + W` induces an isomorphism `V/(V ∩ W) → (V + W)/W`, that is an injective map `Ē_V/(V∩W) → Ē_{V+W}/W` between bundles of the same rank. Its operator norm is at most `1` at every place: at `σ` the quotient norm on the source is the distance to `(V∩W)_σ`, which is at least the distance to `W_σ`, and at `𝔭` the map is integral. So its height is `≤ 0`, and 1.4 (ii) with the additivity of 1.2 gives the inequality. If `V ⊂ W`, that map is `0 → 0` and has no height; then `V ∩ W = V`, `V + W = W`, and the inequality is an equality.

*Needs:* 1.2, 1.4; DiophantineApproximationAndTranscendence §2.5 (`subspaceHeight_inf_mul_sup_le`, for the comparison only).

**Checks.**

- In `ℤ²`, `V = ℚe₁`, `W = ℚ(1,1)`: `0 + 0 ≥ 0 − ½ log 2`, strictly.
- For an orthogonal sum `Ē = Ē₁ ⊕ Ē₂` and `V, W` the two summands, equality holds.

### 1.6 Sub-bundles of large degree

For every nonzero `Ē` there is `c(Ē) ∈ ℝ` with `deĝ_n(Ē_V) ≤ c(Ē)·dim V` for every subspace `V`, and for every `B ∈ ℝ` only finitely many subspaces `V ⊂ E_K` have `deĝ_n(Ē_V) ≥ B`. For a presentation `A`, one may take `c(Ē) = log C_A` with `C_A = ∏_v ‖A_v^(−1)‖_v^(w_v)`, `w_v = mult(v)/[K:ℚ]` at infinite and `1/[K:ℚ]` at finite places.

*Route.* `‖Λ^p A_v^(−1)‖_v ≤ ‖A_v^(−1)‖_v^p` at every place, so `subspaceHeight(V) ≤ C_A^(dim V) · H_A(V)`. Since `subspaceHeight ≥ 1`, 1.1 gives the bound on degrees, and a lower bound on `deĝ_n(Ē_V)` bounds `subspaceHeight(V)`, so the supplier's Northcott theorem for subspaces gives finiteness.

*Needs:* 1.1; DiophantineApproximationAndTranscendence §2.5 (`one_le_subspaceHeight`, `Submodule.finite_subspaceHeight_le`); AdelicHeightsAndSuccessiveMinima §2.5a (`adelicSubspaceHeight`).

**Checks.**

- For `Ō_K^n`, `c = 0`: every sub-bundle has degree `≤ 0`.
- In `ℤ²` exactly six subspaces have `deĝ_n ≥ −½ log 2`: `0`, `ℚ²` and the four lines `ℚe₁`, `ℚe₂`, `ℚ(1,1)`, `ℚ(1,−1)`; the line `ℚ(a, b)` with `a, b` coprime has degree `−½ log(a² + b²)`.

### 1.7 Slopes of the standard constructions

For nonzero `Ē, F̄` of ranks `r, s`: `μ̂(Ē^∨) = −μ̂(Ē)`; `μ̂(Ē ⊕ F̄) = (r μ̂(Ē) + s μ̂(F̄))/(r + s)`; `deĝ(Ē ⊗ F̄) = s·deĝ(Ē) + r·deĝ(F̄)`, so `μ̂(Ē ⊗ F̄) = μ̂(Ē) + μ̂(F̄)`, and `Hom(Ē, F̄) ≅ Ē^∨ ⊗ F̄` isometrically for the Hilbert–Schmidt metrics; `μ̂(Λ^p Ē) = p·μ̂(Ē)` for `1 ≤ p ≤ r`;

```text
μ̂(Sym^n Ē) = n·μ̂(Ē) + (1/(2N)) · Σ_{|α| = n} log(n!/α!),        N = binom(n + r − 1, n),
```

the sum running over multi-indices `α ∈ ℕ^r` with `α! = ∏ α_j!`; `μ̂(Ē(c)) = μ̂(Ē) + c`, and multiplying every archimedean squared norm by `c₀ > 0` changes `μ̂` by `−½ log c₀`; `μ̂(Ē_{O_L}) = μ̂(Ē)` for finite `L/K`.

*Route.* In adelic presentations (1.1), `Ē ⊗ F̄` is presented by `A ⊗ B`, `Λ^p Ē` by `Λ^p A`, and `Sym^n Ē` by `Sym^n A` at the finite places and at the infinite places by `Sym^n A_v` composed with the standard quotient metric, in which the monomials are orthogonal with `‖e^α‖² = α!/n!` (1.3a (ii)). The determinant identities `det(A ⊗ B) = det(A)^s det(B)^r`, `det Λ^p A = (det A)^binom(r−1, p−1)` and `det Sym^n A = (det A)^binom(n+r−1, r)` (the last from DiophantineApproximationAndTranscendence §2.5) give the degrees, and `binom(n+r−1, r)/N = n/r`. Duals, sums, rescaling and base change are ArakelovGeometryAndAbelianHeights §§1.3, 1.5, 1.6.

*Needs:* 1.1, 1.3a; ArakelovGeometryAndAbelianHeights §§1.2, 1.3, 1.5, 1.6; DiophantineApproximationAndTranscendence §2.5 (determinant of a symmetric power).

**Checks.**

- `Sym²(ℤ²)` with the quotient metric: `e₁², e₁e₂, e₂²` are orthogonal with squared norms `1, ½, 1`, the shortest lift of `e₁e₂` being `(e₁⊗e₂ + e₂⊗e₁)/2`; its degree is `½ log 2` and its slope `(log 2)/6`. Giving every monomial norm `1` would give slope `0`.
- `(ℤ, e^(−c)|·|) ⊗ (ℤ, e^(−c′)|·|)` has slope `c + c′`; `ℤ²(c)` has slope `c`; multiplying squared norms of the trivial line by `4` gives slope `−log 2` and the dual `+log 2`.
- Normalisation over `K = ℚ(i)` (`d = 2`, one complex place, counted twice): `(O_K, 2|·|)` has `deĝ = −2 log 2` and `μ̂ = −log 2`, and `Ō_K(c)` has `deĝ = 2c` and `μ̂ = c`, not `2c`. With these values Bost's inequality 2.4 (a) for the identity `Ō_K → (O_K, 2|·|)`, of height `log 2` (1.3), reads `0 ≤ −log 2 + log 2`; with the unnormalised quotient `deĝ/rk` in place of `μ̂` it would read `0 ≤ −2 log 2 + log 2`, which is false.

### 1.8 Euclidean lattices

For `K = ℚ`, a Hermitian vector bundle is a full lattice `Λ` in the real inner-product space `Λ ⊗ ℝ`, up to isometry, and `deĝ(Λ̄) = −log covol(Λ)` with Mathlib's `ZLattice.covolume` for the volume of the inner product. Sub-bundles are the primitive sublattices `Λ ∩ W` of the rational subspaces `W`, with their intrinsic covolume; quotients are the orthogonal projections of `Λ` to `W^⊥`, and additivity of degrees is the identity `covol(proj(Λ)) = covol(Λ)/covol(Λ ∩ W)`; the dual bundle is the dual lattice; the height of a primitive vector `x ∈ Λ` is `log ‖x‖`.

*Route.* ArakelovGeometryAndAbelianHeights §1.1 (lines over `ℚ`) and §1.3; Tau Ceti's `ZLattice.covolume_sq_eq_det_gram` for the degree; GeometryOfNumbersAndQuadraticArithmetic §0.3 (0.3.1 for projections, 0.3.2 for duals).

*Needs:* 1.2; ArakelovGeometryAndAbelianHeights §§1.1, 1.3; GeometryOfNumbersAndQuadraticArithmetic §0.3; Mathlib `ZLattice.covolume`; Tau Ceti `ZLattice.covolume_sq_eq_det_gram`, `ZLattice.covolume_dual`.

**Checks.**

- In `ℤ²`, the lines `ℚ(1,2)` and `ℚ(2,−1)` both have degree `−½ log 5`.
- The hexagonal lattice `A₂` spanned by `(1,0)` and `(½, √3/2)` has covolume `√3/2` and slope `½ log(2/√3) ≈ 0.0719`; every primitive vector has norm at least `1`.

### Examples

For `ℤ ⊕ (ℤ, e^(−c)|·|)` with `c > 0`, the sub-bundles of rank one are the lines `ℚ(a, b)` with `gcd(a, b) = 1`, of degree `−½ log(a² + e^(−2c) b²)`; the largest is `c`, at `ℚe₂`, and the whole bundle has slope `c/2`.

### Dependencies

ArakelovGeometryAndAbelianHeights §§1.1–1.6; DiophantineApproximationAndTranscendence §2.5 and AdelicHeightsAndSuccessiveMinima §2.5a; SuccessiveMinima §0.1; GeometryOfNumbersAndQuadraticArithmetic §§0.3, 2.2.4; HermitianFormsAndLattices §§4.0 (f)–(g), 4.0b (1.1, 1.2, 1.2a); Tau Ceti's symmetric powers of modules (1.3a); Mathlib's product formula.

## Layer 2: Maximal and minimal slopes and the slope inequality

### 2.1 Maximal and minimal slopes

For a nonzero `Ē`, `μ̂_max(Ē) = max{μ̂(Ē_V) : V ≠ 0}` and `μ̂_min(Ē) = min{μ̂(Ē/V) : V ≠ E_K}`, both attained. `Ē` is **semistable** if `μ̂_max(Ē) = μ̂(Ē)`. Provide: `μ̂_min(Ē) ≤ μ̂(Ē) ≤ μ̂_max(Ē)`, with equality throughout in rank one; `Ē` semistable iff `μ̂_min(Ē) = μ̂(Ē)`; `μ̂_max(Ē) ≤ θ` iff `deĝ_n(Ē_V) ≤ θ·dim V` for every `V`; `θ ≤ μ̂_min(Ē)` iff `deĝ_n(Ē_V) ≤ deĝ_n(Ē) − θ·(n − dim V)` for every `V`; there is a largest subspace `V_max` with `μ̂(Ē_{V_max}) = μ̂_max(Ē)`, the maximal destabilising sub-bundle; for a Hermitian line bundle `L̄`, the sub-bundles of `Ē ⊗ L̄` are the `Ē_V ⊗ L̄`, and `μ̂_max(Ē ⊗ L̄) = μ̂_max(Ē) + μ̂(L̄)`, `μ̂_min(Ē ⊗ L̄) = μ̂_min(Ē) + μ̂(L̄)`; in particular `μ̂_max(Ē(c)) = μ̂_max(Ē) + c` and `μ̂_min(Ē(c)) = μ̂_min(Ē) + c` (`Ē(c) = Ē ⊗ Ō_K(c)`), multiplying by a fractional ideal `𝔞` (the line `𝔞` with the standard metrics) lowers both by `log N𝔞/d`, multiplying the norms at each `σ` by `e^(−c_σ)` for constants with `c_σ̄ = c_σ` raises both by `(1/d)·Σ_σ c_σ`, and multiplying every archimedean squared norm by `c₀ > 0` changes both by `−½ log c₀`; `−h_Ē(x) ≤ μ̂_max(Ē)` for every nonzero `x ∈ E_K`; `μ̂_max(Ē) ≤ c(Ē)` of 1.6.

*Route.* By 1.6 only finitely many subspaces exceed any degree bound, and degrees are bounded above, so the maximum exists; minima over quotients exist by additivity (1.2) and the same finiteness in each rank. The characterisations are the definitions with 1.2. For `V_max`: `g = g_{μ̂_max}` of 1.5 is `≤ 0` everywhere, and its zero set is closed under `+` because `g(V + W) ≥ g(V) + g(W) − g(V ∩ W) ≥ 0`. Twisting: `V ↦ V ⊗ L_K` is a bijection onto the subspaces of `(E ⊗ L)_K`, with `(V ⊗ L_K) ∩ (E ⊗ L) = (V ∩ E) ⊗ L` because `L` is locally free of rank one, the restricted metrics are the tensor metrics, and 1.7 adds `dim V·deĝ_n(L̄)` to every degree; the three special cases are the lines `Ō_K(c)`, `𝔞` and `(O_K, (e^(−c_σ)|·|)_σ)`. The bound by heights is 1.4 (i).

*Needs:* 1.2, 1.4–1.7.

**Checks.**

- `ℤ ⊕ (ℤ, e^(−c)|·|)`, `c > 0`: `μ̂_max = c`, `μ̂_min = 0`, `μ̂ = c/2`, `V_max = ℚe₂`.
- `A₂` (1.8) is semistable: its lines have slope `≤ 0` and the whole lattice has slope `0.0719`. So `μ̂_max` is not the largest slope of a line: here the maximum is attained only in rank two.
- The trivial line over `ℤ` has `μ̂_max = 0` and `h(1) = 0`.

### 2.2 Duality, direct sums and extensions

`μ̂_max(Ē^∨) = −μ̂_min(Ē)` and `μ̂_min(Ē^∨) = −μ̂_max(Ē)`; `Ē` is semistable iff `Ē^∨` is. `μ̂_max(Ē ⊕ F̄) = max(μ̂_max(Ē), μ̂_max(F̄))` and `μ̂_min(Ē ⊕ F̄) = min(μ̂_min(Ē), μ̂_min(F̄))`. For a subspace `0 ≠ V ≠ E_K`: `μ̂_max(Ē_V) ≤ μ̂_max(Ē) ≤ max(μ̂_max(Ē_V), μ̂_max(Ē/V))` and `μ̂_min(Ē/V) ≥ μ̂_min(Ē) ≥ min(μ̂_min(Ē_V), μ̂_min(Ē/V))`.

*Route.* `V ↦ V^⊥` is an order-reversing bijection between subspaces of `E_K` and of `E_K^∨` with `(Ē^∨)_{V^⊥} ≅ (Ē/V)^∨` (1.1 (iii)), and 1.7 changes the sign of slopes. For the extension bound take `W ⊂ E_K`; additivity splits `deĝ_n(Ē_W)` into `deĝ_n(Ē_{W∩V})` and the degree of `Ē_W/(W∩V)`. The map of 1.5 sends `Ē_W/(W∩V)` to `(Ē/V)_{(W+V)/V}` by an integral contraction (operator norm `≤ 1` at every place) that is an isomorphism of `K`-spaces, though in general not of lattices (in `ℤ²` with `V = ℚe₁` and `W = ℚ(e₁ + 2e₂)`, the image of `ℤ(e₁ + 2e₂)` has index `2` in `(Ē/V)_{(W+V)/V} = ℤē₂`), so 1.4 (ii) and 2.1 bound that degree by `dim · μ̂_max(Ē/V)`; if `W ⊂ V` that piece is `0`, of degree `0`, and so is the piece `Ē_{W∩V}` if `W ∩ V = 0`. Direct sums are the extension bounds together with the two summands as sub-bundles and quotients.

*Needs:* 1.1, 1.2, 1.4, 1.5, 1.7, 2.1.

**Checks.**

- `Ē = ℤ ⊕ (ℤ, e^(−c)|·|)` with `c > 0` has `Ē^∨ = ℤ ⊕ (ℤ, e^c|·|)`, whose largest sub-bundle slope is `0` (the line of `e₁^∨`) and whose smallest quotient slope is `−c` (the quotient by that line): `μ̂_max(Ē^∨) = 0 = −μ̂_min(Ē)` and `μ̂_min(Ē^∨) = −c = −μ̂_max(Ē)`. So the definition `μ̂_min(Ē) = −μ̂_max(Ē^∨)` used by some sources agrees here with the definition by quotients.
- `ℤ(1,1) ⊂ ℤ²`: `μ̂_max(ℤ²) = 0 ≤ max(−½ log 2, ½ log 2)`.

### 2.3 The image form of the slope inequality

For nonzero bundles and a nonzero `φ : E_K → F_K` with image `W`, `μ̂_min(F̄_W) ≥ μ̂_min(Ē/ker φ) − h(φ) ≥ μ̂_min(Ē) − h(φ)`.

*Route.* For a subspace `W′ ⊊ W` let `V′ = φ^(−1)(W′)`. The induced isomorphism `Ē/V′ → F̄_W/W′` has height at most `h(φ)` (1.3), so 1.4 (ii) gives `μ̂(F̄_W/W′) ≥ μ̂(Ē/V′) − h(φ) ≥ μ̂_min(Ē/ker φ) − h(φ)`; minimise over `W′`. The second inequality is 2.2.

*Needs:* 1.2–1.4, 2.1, 2.2.

**Checks.**

- For `φ = id` both sides are `μ̂_min(Ē)`.
- The projection of `ℤ²` onto its first coordinate (height `0`) has image `ℤ`, of minimal slope `0 = μ̂_min(ℤ²)`.

### 2.4 Bost's slope inequality

Let `Ē, F̄` be nonzero and `φ : E_K → F_K` a nonzero `K`-linear map.

- (a) `μ̂_min(Ē) ≤ μ̂_max(F̄) + h(φ)`.
- (b) If `φ` is injective, `μ̂_max(Ē) ≤ μ̂_max(F̄) + h(φ)` and `deĝ_n(Ē) ≤ rk E · (μ̂_max(F̄) + h(φ))`.
- (c) If `φ` is surjective, `μ̂_min(Ē) ≤ μ̂_min(F̄) + h(φ)`.
- (d) If `μ̂_min(Ē) > μ̂_max(F̄)`, every nonzero `φ` has `h(φ) ≥ μ̂_min(Ē) − μ̂_max(F̄) > 0`; in particular no nonzero `φ` with `φ(E) ⊂ F` has archimedean operator norms all at most `1`.
- (e) If `φ` is injective, `rk E·(μ̂(Ē) − h(φ)) + (rk F − rk E)·μ̂_min(F̄) ≤ rk F·μ̂(F̄)`.

Because `h(φ)` contains the finite places, a map with `φ(E_𝔭) ⊂ 𝔭^(−a_𝔭)·F_𝔭` at every `𝔭` (`a_𝔭 ≥ 0`, almost all zero) has `h(φ) ≤ (1/d)·(Σ_σ log‖φ‖_σ + Σ_𝔭 a_𝔭·log N𝔭)`, and (a)–(e) hold with this bound in place of `h(φ)`.

*Route.* (a) 2.3 with `μ̂_min(F̄_W) ≤ μ̂(F̄_W) ≤ μ̂_max(F̄)`. (b) Apply 1.4 (ii) to the restriction of `φ` to the maximal destabilising sub-bundle of `Ē`, whose image is a sub-bundle of `F̄` of the same rank; the second form follows from `μ̂ ≤ μ̂_max`. (c) 2.3 with `W = F_K`. (d) is (a). (e) 1.4 (ii) for the isomorphism `Ē → F̄_W` onto the image `W = φ(E_K)`, of height `≤ h(φ)` (1.3), gives `rk E·(μ̂(Ē) − h(φ)) ≤ deĝ_n(F̄_W)`; additivity (1.2) and `μ̂(F̄/W) ≥ μ̂_min(F̄)` (2.1) for `W ≠ F_K` give the rest. The finite-place bound is the definition of the lattice norm: `‖φ‖_𝔭 ≤ N𝔭^(a_𝔭)`.

*Needs:* 1.2–1.4, 2.1–2.3.

**Checks.**

- Multiplication by `2` on the trivial line: `h = 0` and (a) is `0 ≤ 0`.
- (e) for the inclusion `ℤ(1,1) ⊂ ℤ²`, of height `0`: `−½ log 2 + 1·0 ≤ 2·0`; for an isomorphism `φ`, (e) is 1.4 (ii).
- Injectivity is needed in (b): the projection `p : ℤe₁ ⊕ ℤe₂ → ℤ`, `x ↦ x₂`, with `‖e₁‖ = e^(−c)`, `‖e₂‖ = 1`, `c > 0`, has `h(p) = 0` and `μ̂_max(Ē) = c > 0 = μ̂_max(ℤ)`, while (a) reads `0 ≤ 0`.

### 2.5 The filtered slope inequality

Let `Ē` be nonzero, `E_K = V^0 ⊇ V^1 ⊇ ⋯ ⊇ V^N ⊇ V^(N+1) = 0` a filtration by subspaces, and for each `i` let `Ḡ_i` be a nonzero bundle and `φ_i : V^i → G_{i,K}` a `K`-linear map with kernel `V^(i+1)`. Put `r_i = dim V^i/V^(i+1)` and let `h(φ_i)` be the height of `φ_i` on the sub-bundle `Ē_{V^i}`. Then

```text
deĝ_n(Ē) ≤ Σ_{i : r_i > 0} r_i · ( μ̂_max(Ḡ_i) + h(φ_i) ).
```

In particular, for an injective `φ : E_K → F_K` and a filtration `F_K = F^0 ⊇ ⋯ ⊇ F^(N+1) = 0`, with `V^i = φ^(−1)(F^i)` and, for `r_i > 0`, `Ḡ_i = F̄_{F^i}/F^(i+1)` (nonzero, as `φ` embeds `V^i/V^(i+1)` in `F^i/F^(i+1)`), `deĝ_n(Ē) ≤ Σ_{i : r_i > 0} r_i (μ̂_max(F̄_{F^i}/F^(i+1)) + h(φ))`.

*Route.* By additivity along the flag (1.2), `deĝ_n(Ē) = Σ_i deĝ_n(Ē_{V^i}/V^(i+1))`. Each `φ_i` induces an injective map `Ē_{V^i}/V^(i+1) → Ḡ_i` of height at most `h(φ_i)` (1.3), and 2.4 (b) bounds each term. In the special case the induced maps have height at most `h(φ)` by 1.3; for `r_i = 0`, any nonzero `Ḡ_i` with `φ_i = 0` will do.

*Needs:* 1.2, 1.3, 2.4.

**Checks.**

- `N = 0` is 2.4 (b), second form.
- `Ē = ℤ²`, `V^1 = ℚe₁`, `φ_0(x) = x₂` into `(ℤ, e^(−a)|·|)` and `φ_1 = id` into `ℤ`: `h(φ_0) = −a`, `μ̂_max = a`, `h(φ_1) = 0`, and the bound is the equality `0 ≤ 0`.

### 2.6 Orthogonal idempotents

Let `Ē` be nonzero, `e` a `K`-linear idempotent of `E_K` that is self-adjoint for `h_σ` at every `σ`, and `𝔤 ⊂ O_K` a nonzero ideal with `𝔤·e(E) ⊂ E`. Let `Ē_1 = Ē_{im e}` and `Ē_2 = Ē_{ker e}`, of ranks `r_1 + r_2 = rk E`, and `r_* = min(r_1, r_2)`. Then `E_1 ⊕ E_2 ⊂ E` is an orthogonal sum of index at most `N(𝔤)^(r_*)`, and

```text
deĝ_n(Ē_1) ≥ deĝ_n(Ē) − deĝ_n(Ē_2) − (r_*/d)·log N(𝔤) ≥ deĝ_n(Ē) − r_2·μ̂_max(Ē) − (r_*/d)·log N(𝔤).
```

Hence, if `r_1 ≥ 1`, `μ̂(Ē_1) ≥ μ̂(Ē) − (r_2/r_1)·( μ̂_max(Ē) − μ̂(Ē) ) − (r_*/(d·r_1))·log N(𝔤)`: a sub-bundle cut out by an orthogonal idempotent loses slope only in proportion to the rank of the complementary part. For an integer `g ≥ 1` with `g·e(E) ⊂ E` (`𝔤 = gO_K`, `N(𝔤) = g^d`) this reads `deĝ_n(Ē_1) ≥ deĝ_n(Ē) − deĝ_n(Ē_2) − r_*·log g` and `μ̂(Ē_1) ≥ μ̂(Ē) − (r_2/r_1)·( log g + μ̂_max(Ē) − μ̂(Ē) )`.

*Route.* `x ↦ (1 − e)x` maps `E` onto `(1 − e)E ⊂ ker e`, and an element `x` maps into `E_2 = E ∩ ker e` iff `ex = x − (1 − e)x ∈ E ∩ im e = E_1`; so `E/(E_1 ⊕ E_2) ≅ (1 − e)E/E_2`, and symmetrically `≅ eE/E_1`. Since `𝔤(1 − e)E ⊂ E ∩ ker e = E_2` and `𝔤eE ⊂ E ∩ im e = E_1`, the quotient is a quotient of `(1 − e)E/𝔤(1 − e)E` and of `eE/𝔤eE`, projective modules of ranks `r_2` and `r_1` modulo `𝔤`, of orders `N(𝔤)^(r_2)` and `N(𝔤)^(r_1)`. The metrics make `Ē_1 ⊕ Ē_2` an orthogonal sum because `e` is self-adjoint, so 1.2 (index formula and additivity) gives the first inequality, and `deĝ_n(Ē_2) ≤ r_2·μ̂_max(Ē)` the second: this is the characterisation of `μ̂_max(Ē)` by the degrees of all sub-bundles (2.1) for `V = ker e`, which holds also when `ker e = 0` (`e = 1`), where `Ē_2 = 0` has degree `0` and no maximal slope.

*Needs:* 1.2, 2.1.

**Checks.**

- `E = {(a, b) ∈ ℤ² : a ≡ b mod 2}` with the standard metric and `e` the first-coordinate projection: `g = 2`, `E_1 = 2ℤe₁`, `E_2 = 2ℤe₂`, `[E : E_1 ⊕ E_2] = 2 = g^(r_*)`, and the first inequality is the equality `−log 2 = −log 2 + log 2 − log 2`. The cruder index bound `g^(d·rk E) = 4` would lose `log 2` more.
- `𝔤 = O_K` (an idempotent preserving `E`): `E = E_1 ⊕ E_2` orthogonally and the first inequality is additivity.
- `K = ℚ(i)`, `E = {(a, b) ∈ O_K² : a ≡ b mod (1 + i)}` with the standard metrics, `e` the first-coordinate projection: `(1 + i)·e(E) ⊂ E` but `e(E) = O_K e₁ ⊄ E`; `E_1 ⊕ E_2 = (1 + i)O_K²` has index `2 = N(1 + i)` in `E`, as the ideal form allows, and with `deĝ_n(Ē) = deĝ_n(Ē_1) = deĝ_n(Ē_2) = −½ log 2` the first inequality is the equality `−½ log 2 = −½ log 2 + ½ log 2 − ½ log 2`; the integer form with `g = 2` charges `log 2` instead of `½ log 2`.

### Examples

For `ℤ ⊕ (ℤ, e^(−c)|·|)` with `c > 0`, `μ̂_max = c`, `μ̂_min = 0` and `μ̂ = c/2`, the maximal destabilising sub-bundle is `ℚe₂`, and the dual bundle `ℤ ⊕ (ℤ, e^c|·|)` has `μ̂_max = 0` and `μ̂_min = −c` (2.1, 2.2). The hexagonal lattice `A₂` of 1.8 is semistable: its lines have slope at most `0`, below its slope `½ log(2/√3)`, so its maximal slope is attained only in rank two. The projection `ℤe₁ ⊕ ℤe₂ → ℤ`, `x ↦ x₂`, with `‖e₁‖ = e^(−c)` and `‖e₂‖ = 1`, has height `0`, and `μ̂_max(Ē) = c > 0 = μ̂_max(ℤ)`: injectivity is needed in 2.4 (b).

### Dependencies

Layer 1.

## Layer 3: The canonical filtration

### 3.1 Harder–Narasimhan steps

For a nonzero `Ē` and `θ ∈ ℝ` there is a largest subspace `E_{≥θ} ⊂ E_K` such that `E_{≥θ} = 0` or `μ̂_min(Ē_{E≥θ}) ≥ θ`. It contains every subspace `V` with `μ̂_min(Ē_V) ≥ θ`; it is the largest maximiser of `g_θ(V) = deĝ_n(Ē_V) − θ·dim V`; for `E_{≥θ} ⊊ V`, `deĝ_n(Ē_V) − deĝ_n(Ē_{E≥θ}) < θ·(dim V − dim E_{≥θ})`; and if `μ̂_min(Ē_V) ≥ θ` and `μ̂_min(Ē_W) ≥ θ` then `μ̂_min(Ē_{V+W}) ≥ θ`. The map `θ ↦ E_{≥θ}` is non-increasing, equals `E_K` for `θ ≤ μ̂_min(Ē)` and `0` for `θ > μ̂_max(Ē)`.

*Route.* `g_θ` is supermodular (1.5) and attains its maximum (1.6), so its maximisers are closed under `+` and `∩` and have a largest element `M`. If `M = 0`, the statement holds through its alternative `E_{≥θ} = 0` (and `μ̂_min(Ē_M)` is not defined, Conventions). Otherwise, for `N ⊊ M`, `g_θ(N) ≤ g_θ(M)` is `μ̂(Ē_M/N) ≥ θ`, so `μ̂_min(Ē_M) ≥ θ`. If `μ̂_min(Ē_V) ≥ θ`, then `g_θ(V ∩ M) ≤ g_θ(V)`, so supermodularity makes `V + M` a maximiser and `V ⊂ M`. A maximiser strictly containing `M` cannot exist, which is the strict inequality. Closure under sums: `μ̂_min(Ē_V) ≥ θ` says that `V` maximises `g_θ` among its own subspaces, and two applications of supermodularity pass this to `V + W` (Stuhler; Grayson).

*Needs:* 1.5, 1.6, 2.1.

**Checks.**

- `ℤ ⊕ (ℤ, e^(−c)|·|)`, `c > 0`: `E_{≥θ}` is `ℚ²` for `θ ≤ 0`, `ℚe₂` for `0 < θ ≤ c` and `0` for `θ > c`.
- For a semistable `Ē` the only values are `E_K` (for `θ ≤ μ̂(Ē)`) and `0`.

### 3.2 The Harder–Narasimhan filtration

Every nonzero `Ē` has a unique flag `0 = V_0 ⊊ V_1 ⊊ ⋯ ⊊ V_k = E_K` such that each `Ē_{V_j}/V_(j−1)` is semistable, of slope `μ_j`, with `μ_1 > μ_2 > ⋯ > μ_k`. Its members are the distinct steps `E_{≥θ}`, with `E_{≥θ} = V_j` for `μ_(j+1) < θ ≤ μ_j`; `V_1` is the maximal destabilising sub-bundle, `μ_1 = μ̂_max(Ē)` and `μ_k = μ̂_min(Ē)`; the filtration of `Ē_{V_j}` is `V_0 ⊊ ⋯ ⊊ V_j` and that of `Ē/V_j` is the image of `V_j ⊊ ⋯ ⊊ V_k`.

*Route.* Existence: take the values of `θ` at which `E_{≥θ}` jumps; the extremal properties of 3.1 make each subquotient semistable of slope equal to the jump. Uniqueness: for a flag with these properties, induction on `j` with the extension bounds of 2.2 shows `μ̂_min(Ē_{V_j}) = μ_j` and that no subspace strictly containing `V_j` has minimal slope `≥ μ_j`, so `V_j = E_{≥μ_j}` (Stuhler 1976; Grayson 1984).

*Needs:* 2.1, 2.2, 3.1.

**Checks.**

- `Ē = (ℤ, e^(−c)|·|)² ⊕ ℤ` with `c > 0`: the flag is `0 ⊊ ℚe₁ ⊕ ℚe₂ ⊊ ℚ³` with slopes `c > 0`. The line `ℚe₁` also has slope `c` but is not a member: `V_1` is the largest sub-bundle of slope `μ̂_max`, here of rank two.
- `ℤ ⊕ (ℤ, e^(−c)|·|)`: the flag is `0 ⊊ ℚe₂ ⊊ ℚ²` with slopes `c > 0`.

### 3.3 Harder–Narasimhan slopes and the polygon

For a nonzero `Ē` of rank `n`, the Harder–Narasimhan slopes `μ̂_1(Ē) ≥ ⋯ ≥ μ̂_n(Ē)` list each `μ_j` of 3.2 with multiplicity `dim V_j/V_(j−1)`. Then (i) `#{j : μ̂_j(Ē) ≥ θ} = dim E_{≥θ}` for every `θ`; (ii) `Σ_j μ̂_j(Ē) = deĝ_n(Ē)`, `μ̂_1 = μ̂_max`, `μ̂_n = μ̂_min`; (iii) the polygon `P_Ē : [0, n] → ℝ`, linear on each `[j−1, j]` with slope `μ̂_j` and `P_Ē(0) = 0`, is concave, satisfies `deĝ_n(Ē_V) ≤ P_Ē(dim V)` for every `V` with equality on the members of the flag, and is the least concave function on `[0, n]` lying above all points `(dim V, deĝ_n(Ē_V))`; (iv) for every `a ∈ ℝ`,

```text
n·a − deĝ_n(Ē) ≤ Σ_j (a − μ̂_j(Ē))⁺ = ∫_0^∞ ( n − dim E_{≥ a−τ} ) dτ;
```

(v) `μ̂_j(Ē^∨) = −μ̂_(n+1−j)(Ē)`; for a Hermitian line bundle `L̄`, `μ̂_j(Ē ⊗ L̄) = μ̂_j(Ē) + μ̂(L̄)` and `(E ⊗ L)_{≥ θ + μ̂(L̄)} = E_{≥θ} ⊗ L_K` for every `θ`; in particular `μ̂_j(Ē(c)) = μ̂_j(Ē) + c`, and the same holds for fractional ideals and for constants rescaling the metric place by place, as in 2.1.

*Route.* (i)–(ii) from 3.2 and additivity. (iii) Concavity is the strict decrease of the `μ_j`. For `V`, filter by `V ∩ V_j`: the graded piece maps injectively, with norm `≤ 1`, into the semistable `Ē_{V_j}/V_(j−1)`, so by 1.4 and 2.1 its normalised degree is at most `μ_j` times its dimension, and the sum of these bounds is at most `P_Ē(dim V)` because the `μ_j` decrease. (iv) For each `j`, `(a − μ̂_j)⁺ = ∫_0^∞ 1[μ̂_j < a − τ] dτ`; sum over `j` and use (i). (v) The dual is 2.2, 1.7 and uniqueness in 3.2. For the twist, the bijection `V ↦ V ⊗ L_K` of 2.1 satisfies `g_{θ + μ̂(L̄)}(V ⊗ L_K) = g_θ(V)` for the functions of 1.5, so it carries the largest maximiser to the largest maximiser (3.1).

*Needs:* 1.2, 1.4, 2.1, 2.2, 3.1, 3.2.

**Checks.**

- `ℤ ⊕ (ℤ, e^(−c)|·|)`: slopes `(c, 0)`, polygon vertices `(0,0), (1,c), (2,c)`.
- `A₂` has both slopes `½ log(2/√3) ≈ 0.0719`, although it has a basis of vectors of norm `1`, whose lines have slope `0`: slopes read off a reduced basis would give `(0, 0.1438)`, which is not the polygon.

### 3.4 Functoriality of the steps

(i) Let `φ_i : E_{i,K} → F_K` (`i` in a finite set) be `K`-linear maps from nonzero bundles to a nonzero `F̄` and `θ ∈ ℝ`, and suppose `μ̂_min(Ē_i) − h(φ_i) ≥ θ` whenever `φ_i ≠ 0`. Then `Σ_i φ_i(E_{i,K}) ⊂ F_{≥θ}`; no bound on the sum map is needed. More generally `φ(E_{≥θ}) ⊂ F_{≥ θ − h(φ)}` for every nonzero `φ`. (ii) Every `E_{≥θ}` is stable under every endomorphism `φ` of `E_K` with `h(φ) ≤ 0`, in particular under every isometric automorphism of `Ē`. (iii) `(E ⊕ F)_{≥θ} = E_{≥θ} ⊕ F_{≥θ}`, and the slopes of `Ē ⊕ F̄` are the merged lists. (iv) `(E^∨)_{≥θ} = (E_{>−θ})^⊥`, where `E_{>t}` is the union of the `E_{≥θ′}` with `θ′ > t`. (v) If `F_K` is spanned by nonzero vectors `x` with `h_F̄(x) ≤ Λ`, then `μ̂_min(F̄) ≥ −Λ`. (vi) If `F′ ⊂ E` is a submodule of full rank with the restricted metrics, then `F′_{≥θ} ⊂ E_{≥θ}` for every `θ`, `μ̂_j(F̄′) ≤ μ̂_j(Ē)` for every `j`, and in particular `μ̂_max(F̄′) ≤ μ̂_max(Ē)` and `μ̂_min(F̄′) ≤ μ̂_min(Ē)`, while `μ̂(F̄′) = μ̂(Ē) − log #(E/F′)/(d·rk E)` (1.2).

*Route.* (i) 2.3 gives `μ̂_min(F̄_{φ_i(E_{i,K})}) ≥ θ`; maximality and closure under sums in 3.1 conclude, and the general form applies this to `φ` restricted to `Ē_{E≥θ}` (1.3). (ii) is (i). (iii) `⊇` by closure under sums; `⊆` by (i) for the two projections, of height `≤ 0`. (iv) 3.3 (v) with 2.2. (v) Apply (i) to the maps `Ō_K → F̄`, `1 ↦ x`, of height `h_F̄(x) ≤ Λ` from a bundle of minimal slope `0`, with `θ = −Λ`: their images span, so `F_{≥−Λ} = F_K`, which is `μ̂_min(F̄) ≥ −Λ` (3.1). (vi) The identity `F̄′ → Ē` is integral at every `𝔭` and isometric at every `σ`, so its height is `≤ 0`; (i) in its general form gives `F′_{≥θ} ⊂ E_{≥ θ − h} ⊂ E_{≥θ}`, and 3.3 (i) turns the inclusions into the inequalities of slopes.

*Needs:* 1.2, 1.3, 2.2, 2.3, 3.1, 3.3.

**Checks.**

- For the projection `p` of the Check of 2.4: `p(E_{≥c}) = p(ℚe₁) = 0 ⊂ ℤ_{≥c} = 0`.
- Multiplication by `a ∈ K^×` has height `0` and preserves every step.
- (v) for `ℤ ⊕ (ℤ, e^(−c)|·|)` with the spanning vectors `e₁, e₂`, of heights `0, −c`: `Λ = 0` and `μ̂_min = 0`, an equality. For `A₂` and its basis of norm-one vectors, `μ̂_min = 0.0719 ≥ 0`.
- (vi) for `2ℤ² ⊂ ℤ²`: the slopes drop from `(0, 0)` to `(−log 2, −log 2)`, and `μ̂(2ℤ²) = 0 − log 4/2`.

### 3.4a Galois descent of subspaces

Let `M/K` be a finite Galois extension with group `G`, `V` a `K`-vector space (of any dimension), and let `G` act on `V ⊗_K M` through the second factor. An `M`-subspace `U ⊂ V ⊗_K M` with `g(U) = U` for every `g ∈ G` is `W ⊗_K M` for a unique `K`-subspace `W ⊂ V`, namely `W = U ∩ (V ⊗ 1)`.

*Route.* The action of `G` on `U` is semilinear, so Tau Ceti's `TauCeti.GaloisDescent.span_invariants_eq_top` gives `U = M·U^G`. The invariants of `V ⊗_K M` are `V ⊗ 1`, by `TauCeti.GaloisDescent.range_eq_invariants_of_liftBaseChange_surjective` for `V → V ⊗_K M`, `x ↦ x ⊗ 1` (or coordinatewise in a `K`-basis of `V` from `IsGalois.fixedField_top`), so `U^G = W ⊗ 1` and `U = W ⊗_K M`; neither library statement needs `V` to be finite-dimensional. For finite-dimensional `V` an elementary alternative is the reduced row echelon basis of `U` with respect to a `K`-basis of `V`: it is unique, hence fixed by `G`, hence has coordinates in `M^G = K`. Uniqueness: `(W ⊗_K M) ∩ (V ⊗ 1) = W ⊗ 1`, computed in a `K`-basis of `V` extending one of `W`.

*Needs:* Tau Ceti `TauCeti.GaloisDescent.span_invariants_eq_top`, `TauCeti.GaloisDescent.range_eq_invariants_of_liftBaseChange_surjective`; Mathlib `IsGalois.fixedField_top`.

**Checks.**

- `K = ℚ`, `M = ℚ(i)`, `V = ℚ²`: the line `M·(1, i)` is moved by complex conjugation to `M·(1, −i)`, and it is not of the form `W ⊗ M`; the line `M·(1 + i, 1 + i) = M·(1, 1)` is stable and descends to `ℚ·(1, 1)`.

### 3.5 Base change

For a finite extension `L/K` and a nonzero `Ē`, `(E_{O_L})_{≥θ} = E_{≥θ} ⊗_K L` for every `θ`. Hence the Harder–Narasimhan filtration, slopes and polygon of `Ē_{O_L}` are those of `Ē`, and `μ̂_max(Ē_{O_L}) = μ̂_max(Ē)`, `μ̂_min(Ē_{O_L}) = μ̂_min(Ē)`. Consequently `−h_Ē(x) ≤ μ̂_max(Ē)` for every nonzero algebraic `x ∈ E ⊗ ℚ̄`, the height being computed in any number field containing the coordinates of `x`.

*Route.* First let `M/K` be Galois with group `G`. `G` acts semilinearly on `E_M`, preserves `E ⊗ O_M`, and permutes the metrics: `‖g x‖_τ = ‖x‖_{τ∘g}`. So it preserves the degree of every sub-bundle of `Ē_{O_M}`, hence the function `g_θ` of 1.5, hence its largest maximiser `(E_M)_{≥θ}` (3.1); by 3.4a, `(E_M)_{≥θ} = W ⊗_K M` for a `K`-subspace `W`. For `K`-subspaces `V`, `g_θ(V) = g_θ(V ⊗_K M)`, because base change commutes with sub-bundles (1.2) and preserves normalised degrees (ArakelovGeometryAndAbelianHeights §1.6). So `W` maximises `g_θ` over the `K`-subspaces, and every `K`-maximiser `V` has `V ⊗ M` a maximiser over `M`, so `V ⊗ M ⊂ W ⊗ M` and `V ⊂ W`: `W` is the largest maximiser, `W = E_{≥θ}`. For a general finite `L/K`, choose a Galois closure `M ⊃ L` of `L/K` and apply the Galois case to `M/K` and to `M/L` (the bundle `Ē_{O_L}`, with ArakelovGeometryAndAbelianHeights §1.2 for the composite base change): `(E_L)_{≥θ} ⊗_L M = E_{≥θ} ⊗_K M`, and `U ↦ U ⊗_L M` is injective on `L`-subspaces. The statements on `μ̂_max` and `μ̂_min` follow because `E_{≥θ} ≠ 0` iff `θ ≤ μ̂_max(Ē)` and `E_{≥θ} = E_K` iff `θ ≤ μ̂_min(Ē)` (3.1). The last statement is 1.4 (i) over a field of definition.

*Needs:* 1.2, 1.4, 1.5, 3.1–3.3, 3.4a; ArakelovGeometryAndAbelianHeights §§1.2, 1.6.

**Checks.**

- `ℤ²` over `ℚ(i)`: the line `ℚ(i)·(1, i)` has `relativeSubspaceArakelovHeight = (1 + 1)^(2/2) = 2`, so normalised degree `−½ log 2 < 0`; the bundle stays semistable of slope `0`.
- The Gaussian ideal `(1 + i)` with its standard metric has normalised degree `−½ log 2`; over a quadratic extension of `ℚ(i)` the value is unchanged.

### Examples

For `ℤ ⊕ (ℤ, e^(−c)|·|)` with `c > 0`, the step `E_{≥θ}` is `ℚ²` for `θ ≤ 0`, `ℚe₂` for `0 < θ ≤ c` and `0` for `θ > c`; the Harder–Narasimhan flag is `0 ⊊ ℚe₂ ⊊ ℚ²`, with slopes `(c, 0)` and polygon vertices `(0, 0)`, `(1, c)`, `(2, c)`. For `(ℤ, e^(−c)|·|)² ⊕ ℤ` the first member of the flag is `ℚe₁ ⊕ ℚe₂`, of rank two, although the line `ℚe₁` has the same slope `c`. The lattice `A₂` has both Harder–Narasimhan slopes equal to `½ log(2/√3)`, although it has a basis of vectors of norm `1` (3.3).

### Dependencies

Layers 1 and 2; ArakelovGeometryAndAbelianHeights §§1.2, 1.6 (3.5); Tau Ceti `TauCeti.GaloisDescent.span_invariants_eq_top` and `TauCeti.GaloisDescent.range_eq_invariants_of_liftBaseChange_surjective`, Mathlib `IsGalois.fixedField_top` (3.4a).

## Layer 4: Successive minima and tensor operations

### 4.1 Successive minima and Minkowski's theorem over K

Let `Ē` have rank `n ≥ 1`, with a presentation `A` (1.1) in a `K`-basis that identifies `E_K` with `K^n`. Then `E ⊂ K^n` is a finitely generated `O_K`-module spanning `K^n`, its mixed image is a lattice in `(mixedSpace K)^n` (SubspaceTheorem §4.1), and the **body** of `Ē` is

```text
B_Ē = { x ∈ (mixedSpace K)^n : |A_v x_v| ≤ 1 at every infinite place v },
```

with `x_v ∈ K_v^n` the component at `v` and `|·|` the standard Euclidean or Hermitian norm; it is the set `{‖x‖_σ ≤ 1 for all σ}` read in these coordinates. Volumes are those of `mixedSpace K` used by SubspaceTheorem, for which `covol(O_K) = 2^(−r₂)·|d_K|^(1/2)`.

- (i) `covol(E) = covol(O_K)^n · ∏_𝔭 |det A_𝔭|_𝔭` and `vol(B_Ē) = β_n(K) / ∏_v |det A_v|_v^(mult(v))`, with `β_n(K) := (π^(n/2)/Γ(n/2 + 1))^(r₁) · (π^n/n!)^(r₂)`; hence `vol(B_Ē)/covol(E) = β_n(K)·exp(deĝ(Ē))/covol(O_K)^n`.
- (ii) The successive minima `λ_l(Ē)`, `0 ≤ l < n`, are the `K`-minima of AdelicHeightsAndSuccessiveMinima §3.1 for `E` and `B_Ē`: `λ_l(Ē)` is the infimum of the `t > 0` such that `E ∩ t·B_Ē` contains `l + 1` vectors linearly independent over `K`; one `K`-independent family attains all of them.
- (iii) With `γ(K, n) = (n/d)·log covol(O_K) − (1/d)·log β_n(K)` and the constant `c_K ≥ 1` of SubspaceTheorem §4.2 (`c_ℚ = 1`),

```text
−deĝ_n(Ē) + γ(K,n) + n·log 2 − n·log c_K − (1/d)·log((dn)!)  ≤  Σ_{l<n} log λ_l(Ē)  ≤  −deĝ_n(Ē) + γ(K,n) + n·log 2.
```

In rank one `B_Ē` is an approximation body of SubspaceTheorem §4.1 (one coordinate form, with `Q^(c_v)` the radius `|A_v|^(−1)`), and SubspaceTheorem §4.2 applies as it stands. In rank `n ≥ 2` it is not (a product of Euclidean or Hermitian balls is not cut out by finitely many conditions `v(L(x)) ≤ Q^c`), and two things here rest on AdelicHeightsAndSuccessiveMinima §3.1: the definition of `λ_l(Ē)` with its attainment, and the lower bound of (iii), the only statement of this target that uses that `B_Ē` is balanced over the completions. The upper bound of (iii) is the half used in 4.2, 4.4 and 6.4.

*Route.* (i) The covolume of an `O_K`-module (SubspaceTheorem §4.1, `Submodule.covolume_mixedImage`) is `covol(O_K)^n` divided by the product over `𝔭` of the largest value of a determinant of `n` vectors of `E_𝔭 = A_𝔭^(−1)(O_𝔭^n)`, which is `|det A_𝔭|_𝔭^(−1)`. `B_Ē` is the product over `v` of the preimages of unit balls under `A_v`, and the change of variables at `v` divides the volume of the unit ball by `|det A_v|_v^(mult(v))` (the real determinant of a complex matrix is `|det|²`). The quotient is `exp(deĝ(Ē))·β_n(K)/covol(O_K)^n` because `deĝ(Ē) = −Σ_v mult(v)·log|det A_v|_v − Σ_𝔭 log|det A_𝔭|_𝔭` (1.1). The volume of a unit ball is classical (Mathlib). (ii)–(iii) AdelicHeightsAndSuccessiveMinima §3.1: `B_Ē` is compact, convex and symmetric with `0` in its interior, and balanced over the completions because multiplying `x_v` by `a ∈ K_v` with `|a| ≤ 1` does not increase `|A_v x_v|`. Take logarithms and divide by `d`.

*Needs:* 1.1, 1.7; SubspaceTheorem §§4.1, 4.2 and AdelicHeightsAndSuccessiveMinima §3.1; Mathlib `NumberField.mixedEmbedding.covolume_integerLattice` and the volume of Euclidean and Hermitian balls.

**Checks.**

- `K = ℚ`, `Ē = (ℤ, ρ|·|)`: `λ_0 = ρ`, `β_1(ℚ) = 2`, `γ = −log 2`, and both bounds equal `log ρ`.
- `K = ℚ(i)`, `Ē = Ō_K`: `λ_0 = 1`, `covol(O_K) = 1`, `β_1 = π`; the upper bound is `log(2/√π) ≥ 0`.
- `ℤ²` standard: `λ_0 = λ_1 = 1`, `β_2(ℚ) = π`; the bounds read `log(2/π) ≤ 0 ≤ log(4/π)`.

### 4.2 Successive minima and Harder–Narasimhan slopes

For nonzero `Ē` of rank `n` and `0 ≤ j < n`,

```text
−log λ_j(Ē) ≤ μ̂_(j+1)(Ē) ≤ −log λ_j(Ē) + c(K, n),      c(K, n) = max_{1≤r≤n} ( γ(K, r) + r·log 2 ).
```

Consequently `Σ_{j<k} (−log λ_j(Ē)) ≤ P_Ē(k)` for every `k`, and `μ̂_max(Ē) ≤ −log λ_0(Ē) + κ(K, n)` with `κ(K, n) = max_{1≤k≤n} (γ(K, k) + k·log 2)/k`, which satisfies `κ(K, n) ≤ ½·log(n + 2) + log 2 + (1/d)·log covol(O_K)`.

*Route.* Lower bound: let `F = E_{>μ̂_(j+1)}` (3.4 (iv)), of dimension `≤ j`. Among `j + 1` independent vectors of `E ∩ λ_j B_Ē` one is not in `F`; its image in `Ē/F` is integral of norm `≤ λ_j` at every `σ`, so the line it spans has normalised degree `≥ −log λ_j` (1.4 (i)), and `μ̂_max(Ē/F) = μ̂_(j+1)(Ē)` by 3.2. Upper bound: let `F = E_{≥μ̂_(j+1)}`, of dimension `r ≥ j + 1`, whose slopes are the first `r` slopes of `Ē` with `μ̂_r = μ̂_(j+1)`. The upper bound of 4.1 for `F̄`, with the lower bounds `log λ_l(F̄) ≥ −μ̂_(l+1)(F̄)` just proved for `l < r − 1`, gives `log λ_(r−1)(F̄) ≤ −μ̂_r(F̄) + γ(K, r) + r log 2`, and `λ_j(Ē) ≤ λ_j(F̄) ≤ λ_(r−1)(F̄)`. The bound with `κ` applies 4.1 to the maximal destabilising sub-bundle `D` of rank `k`, with `k log λ_0(D̄) ≤ Σ_l log λ_l(D̄)` and `λ_0(Ē) ≤ λ_0(D̄)`; the estimate of `κ` uses `Γ(k/2 + 1) ≤ (k/2 + 1)^(k/2)`, `k! ≤ k^k` and `r₁ + 2r₂ = d`.

*Needs:* 1.4, 2.2, 3.2–3.4, 4.1.

**Checks.**

- `ℤ ⊕ (ℤ, e^(−c)|·|)`: `λ_0 = e^(−c)`, `λ_1 = 1`, slopes `(c, 0)`: the lower bounds are equalities.
- `A₂`: `λ_0 = λ_1 = 1` while both slopes are `0.0719`, so minima and slopes differ even over `ℚ`; `c(ℚ, 2) = 2 log 2 − log π ≈ 0.24`.

### 4.3 Absolute minima

For nonzero `Ē` of rank `n` and `1 ≤ i ≤ n`, the **absolute minimum** `μ^abs_i(Ē)` is the infimum of the `λ > 0` such that `E ⊗ ℚ̄` contains `i` linearly independent vectors `x` with `exp h_Ē(x) ≤ λ`, the height being computed over any number field containing the coordinates (in a presentation `A`, the `ℚ̄`-infima of `adelicHeight A` of DiophantineApproximationAndTranscendence §2.5 and AdelicHeightsAndSuccessiveMinima §2.5a). Write `λ^abs(Ē) = μ^abs_1(Ē)` (notation only). Provide: `μ^abs_1(Ē) ≤ ⋯ ≤ μ^abs_n(Ē)`; `μ^abs_i(Ē(c)) = e^(−c)·μ^abs_i(Ē)`; `μ^abs_i(Ē) ≤ μ^abs_i(Ē_V)` for every subspace `V` and `i ≤ dim V`; `μ^abs_i(Ē_{O_L}) = μ^abs_i(Ē)` for finite `L/K`. With `s_i = dim E_{≥ μ̂_i(Ē)}` (so `i ≤ s_i ≤ n`, and `μ̂_l(Ē) = μ̂_i(Ē)` for `i ≤ l ≤ s_i`),

```text
−μ̂_i(Ē) ≤ log μ^abs_i(Ē) ≤ −μ̂_i(Ē) + ( s_i(s_i − 1) / (2(s_i − i + 1)) )·log 2 ≤ −μ̂_i(Ē) + (n(n − 1)/2)·log 2.
```

In particular (`i = 1`, where `s_1` is the rank of the maximal destabilising sub-bundle): `λ^abs(Ē) > 0` and

```text
μ̂_max(Ē) − ((s_1 − 1)/2)·log 2 ≤ −log λ^abs(Ē) ≤ μ̂_max(Ē),        s_1 ≤ n;
```

for `i = s_i` the constant is `(s_i(s_i − 1)/2)·log 2`.

*Route.* The API: independent vectors stay independent in larger families; `h_{Ē(c)} = h_Ē − c`; vectors of `V ⊗ ℚ̄` have the same height in `Ē_V` and in `Ē` (1.3); heights do not change under base change (1.3). Lower bound: for `λ > μ^abs_i(Ē)` take `i` independent vectors of height `≤ log λ` in `E_L`, `L/K` finite. The subspace `(E_L)_{>μ̂_i(Ē)} = E_{>μ̂_i(Ē)} ⊗ L` (3.5) has dimension at most `i − 1` (3.3 (i)), so one of the vectors, `x`, lies outside it; its image in the quotient by that subspace is nonzero, of height at most `h_Ē(x)` (1.3: the quotient map has norm `≤ 1`), and minus that height is at most the maximal slope of the quotient (2.1), which is `μ̂_i(Ē)` (3.2, 3.5). So `log λ ≥ −μ̂_i(Ē)`; for `i = 1` this gives `λ^abs(Ē) ≥ e^(−μ̂_max(Ē)) > 0`. Upper bound: `F = E_{≥ μ̂_i(Ē)}` has dimension `s = s_i`, and the Harder–Narasimhan slopes of `F̄ = Ē_F` are `μ̂_1(Ē), …, μ̂_s(Ē)` (3.2). For a presentation `A_F` of `F̄` (1.1), the absolute minima `ν_1 ≤ ⋯ ≤ ν_s` of `F̄` satisfy `∏_l ν_l ≤ 2^(s(s−1)/2)·|det A_F|_𝔸 = 2^(s(s−1)/2)·exp(−deĝ_n(F̄))` (`absoluteAdelicMinima` for `s ≥ 2`; for `s = 1` every nonzero vector has height `−deĝ_n(F̄)`, AdelicHeightsAndSuccessiveMinima §2.5a), so the numbers `x_l = log ν_l + μ̂_l(Ē)` have sum at most `(s(s − 1)/2)·log 2`, and each is `≥ 0` by the lower bound applied to `F̄`. For the `s − i + 1` indices `i ≤ l ≤ s`, `μ̂_l(Ē) = μ̂_i(Ē)` and `ν_l ≥ ν_i`, so `x_l ≥ x_i`; hence `(s − i + 1)·x_i ≤ (s(s − 1)/2)·log 2`. Since `μ^abs_i(Ē) ≤ μ^abs_i(F̄) = ν_i` (the API), this is the upper bound.

*Needs:* 1.1, 1.3, 2.1, 3.2, 3.3, 3.5; DiophantineApproximationAndTranscendence §2.5 (`absoluteAdelicMinima`); AdelicHeightsAndSuccessiveMinima §2.5a (`adelicHeight`, its invariance under extension, the case `n = 1`).

**Checks.**

- In rank one, `s_1 = 1` and both inequalities are equalities.
- `ℤ ⊕ (ℤ, e^(−c)|·|)`, `c > 0`: `μ^abs = (e^(−c), 1)`, attained at `e₂`, `e₁`, and the slopes are `(c, 0)` with `s_1 = 1`, `s_2 = 2`: the lower bounds are equalities, the upper bound for `i = 1` is the equality `−c ≤ −c + 0`, and for `i = 2` it allows `log 2`.
- `ℤ²` (standard): `μ^abs = (1, 1)`, both slopes `0`, `s_1 = s_2 = 2`; the upper bound allows `½ log 2` for `i = 1` and `log 2` for `i = 2`. Without the division by `s_i − i + 1` the first would be `log 2`. For `ℤ ⊕ (ℤ, e^(−c)|·|)` the constant at `i = 1` is `0` because `s_1 = 1`, where `((n − 1)/2)·log 2` would allow `½ log 2`.
- `Ō_K^n`: every `μ^abs_i = 1` and every slope is `0`.

### 4.3a Short bases over `ℚ̄`

For nonzero `Ē` of rank `n` and every `η > 0` there are a finite extension `L/K` and a basis `x_1, …, x_n` of `E_L` with `h_Ē(x_j) ≤ −μ̂_min(Ē) + (n(n − 1)/2)·log 2 + η` for all `j`; applied to `Ē^∨`, there is a basis `λ_1, …, λ_n` of `E_L^∨` with `h_{Ē^∨}(λ_j) ≤ μ̂_max(Ē) + (n(n − 1)/2)·log 2 + η`.

*Route.* 4.3 for `i = n` (where `s_n = n`), and the approximation of the infima within any factor `1 + η` by independent vectors in a finite extension (DiophantineApproximationAndTranscendence §2.5); for `Ē^∨` use `μ̂_min(Ē^∨) = −μ̂_max(Ē)` (2.2).

*Needs:* 2.2, 4.3; DiophantineApproximationAndTranscendence §2.5 (`absoluteAdelicMinima` with its approximation in finite extensions).

**Checks.**

- `ℤ ⊕ (ℤ, e^(−c)|·|)`: the basis `e₁, e₂` has heights `0, −c ≤ −μ̂_min + log 2 = log 2`.
- In rank one the bound is `h(x) = −μ̂(Ē)` for every nonzero `x`, an equality.

### 4.4 Maximal slopes of tensor products

(i) For nonzero `Ē, F̄` of ranks `a, b`,

```text
μ̂_max(Ē ⊗ F̄) ≤ μ̂_max(Ē) + μ̂_max(F̄) + ε_K(ab),     μ̂_min(Ē ⊗ F̄) ≥ μ̂_min(Ē) + μ̂_min(F̄) − ε_K(ab),
```

with `ε_K(m) = min( ((m − 1)/2)·log 2, κ(K, m) )`. (ii) For nonzero `Ē_1, …, Ē_m` of ranks `r_1, …, r_m`,

```text
μ̂_max(Ē_1 ⊗ ⋯ ⊗ Ē_m) ≤ Σ_i ( μ̂_max(Ē_i) + ½·log r_i + (r_i(r_i − 1)/2)·log 2 ),
μ̂_min(Ē_1 ⊗ ⋯ ⊗ Ē_m) ≥ Σ_i ( μ̂_min(Ē_i) − ½·log r_i − (r_i(r_i − 1)/2)·log 2 ).
```

For `m = 2`, (ii) is weaker than the first branch of (i) (because `ab − 1 ≤ a(a − 1) + b(b − 1)`); its point is that it is linear in the number of factors and independent of `K`, which iterating (i) does not give.

*Route.* (i) Let `D` be the maximal destabilising sub-bundle of `Ē ⊗ F̄`, and fix `η > 0`. By 4.3 (over `ℚ̄`) or by 4.2 (over `K`, using that a lattice vector `x ∈ E ⊗ F` of norm `≤ λ_0` at every `σ` has `h(x) ≤ log λ_0`), there are a finite extension `L` and a nonzero `x ∈ D ⊗ L`, both depending on `η`, with `−h(x) ≥ μ̂(D̄) − ε_K(ab) − η`. View `x` as a nonzero map `φ_x : E_L^∨ → F_L`; by 1.3, `h(φ_x) ≤ h(x)`. Bost's inequality 2.4 (a) over `L` with 3.5 gives `−μ̂_max(Ē) = μ̂_min(Ē^∨) ≤ μ̂_max(F̄) + h(φ_x) ≤ μ̂_max(F̄) − μ̂(D̄) + ε_K(ab) + η`; since `μ̂(D̄) = μ̂_max(Ē ⊗ F̄)`, letting `η → 0` gives the bound; the dual form is 2.2. (ii) Fix `η > 0`. By 4.3a there are a finite `L/K` and, for each `i`, a basis `(λ_{i,j})_j` of `E_{i,L}^∨` with `h(λ_{i,j}) ≤ μ̂_max(Ē_i) + (r_i(r_i − 1)/2)·log 2 + η`. The dual `M̄_{i,j}` of the line sub-bundle of `(Ē_i^∨)_{O_L}` spanned by `λ_{i,j}` has slope `h(λ_{i,j})` (1.4 (i), 1.7), and the dual of the inclusion is a map `Ē_{i,O_L} → M̄_{i,j}` of norm `≤ 1` at every place; together these give an injective `ι_i : Ē_{i,O_L} → ⊕_j M̄_{i,j}` (orthogonal sum) with `‖ι_i‖_𝔭 ≤ 1` and `‖ι_i‖_σ ≤ √r_i`, so `h(ι_i) ≤ ½ log r_i`. The tensor product `⊗_i ι_i` is injective into the orthogonal sum of the lines `⊗_i M̄_{i,j_i}`, of slopes `Σ_i h(λ_{i,j_i})`, and operator norms are multiplicative under tensor products at every place, so `h(⊗_i ι_i) ≤ ½ Σ_i log r_i`. Now 2.4 (b), 2.2 for the orthogonal sum and 3.5 give the bound for `μ̂_max` up to `mη`; let `η → 0`. The bound for `μ̂_min` is the bound for the duals, `(⊗ Ē_i)^∨ ≅ ⊗ Ē_i^∨`, with 2.2.

*Needs:* 1.3, 1.4, 1.7, 2.2, 2.4, 3.5, 4.2, 4.3, 4.3a; ArakelovGeometryAndAbelianHeights §1.2.

**Checks.**

- Lines: `μ̂_max(L̄ ⊗ M̄) = μ̂(L̄) + μ̂(M̄)` and `ε_K(1) = 0`, so the two-factor bound is an equality; (ii) with all `r_i = 1` is the equality `μ̂(⊗ L̄_i) = Σ μ̂(L̄_i)`.
- `ℤ² ⊗ ℤ²` (standard) is `ℤ⁴`, semistable of slope `0`, within the bound; `(ℤ²)^{⊗m}` is semistable of slope `0`, and (ii) allows `m·(3/2)·log 2`, while iterating the first branch of (i) allows `((4 − 1) + (8 − 1) + ⋯ + (2^m − 1))/2 · log 2`, exponential in `m`.

### 4.5 Symmetric powers

For nonzero `Ē` of rank `r` and `n ≥ 0` (with `Sym^0 Ē = Ō_K`, of maximal slope `0`):

- (a) for `n ≥ 1`, `μ̂_max(Sym^n Ē) ≤ μ̂_max(Ē^{⊗n}) + min( (r − 1)·ψ(n), log n! )`, where `ψ(n) = Σ_{p^k ≤ n} log p` is Chebyshev's function;
- (b1) for every finite extension `L/K` and every basis `λ_1, …, λ_r` of `E_L^∨`, `μ̂_max(Sym^n Ē) ≤ n·( max_i h_{Ē^∨}(λ_i) + log r )`;
- (b2) `μ̂_max(Sym^n Ē) ≤ n·( μ̂_max(Ē) + log r + (r(r − 1)/2)·log 2 )`; for `r ≤ 2` this reads `μ̂_max(Sym^n Ē) ≤ n·( μ̂_max(Ē) + 2·log r )`.

*Route.* (a) The map `(1/n!)·SymmetricPower.toTensorPower : Sym^n E_K → E_K^{⊗n}` of 1.3a (ii), sending a class to the orthogonal projection of any lift onto the symmetric tensors, is injective (`toTensorPower_injective`) and an isometry at every infinite place. At `𝔭` it sends the monomial `e^α` of a local basis to `T_α/m_α`, where `T_α` is the primitive sum of the `m_α = n!/α!` distinct arrangements, so its operator norm is `max_α |m_α|_𝔭^(−1)`. Legendre's formula gives `v_p(m_α) = Σ_{k ≥ 1} ( ⌊n/p^k⌋ − Σ_j ⌊α_j/p^k⌋ )`, each term between `0` and `min(r − 1, ⌊n/p^k⌋)`, hence `h ≤ min((r − 1)ψ(n), log n!)`, and 2.4 (b) concludes. (b1) The basis gives, as in the route of 4.4 (ii), an injective `ι : Ē_{O_L} → ⊕_i M̄_i` into an orthogonal sum of lines with `μ̂(M̄_i) = h_{Ē^∨}(λ_i)` and `h(ι) ≤ ½ log r`. By 1.3a (iii), `Sym^n ι` is injective with `h(Sym^n ι) ≤ (n/2)·log r`; by 1.3a (v), `Sym^n(⊕_i M̄_i)` is an orthogonal sum of lines of slopes `Σ_i α_i μ̂(M̄_i) + ½ log(n!/α!) ≤ n·max_i h_{Ē^∨}(λ_i) + (n/2)·log r`, because `n!/α! ≤ r^n`. Then 2.4 (b) with 2.2 bounds `μ̂_max(Sym^n(Ē_{O_L}))`, which is `μ̂_max(Sym^n Ē)` by 1.3a (iv) and 3.5. (b2) Insert into (b1) the basis of `E_L^∨` given by 4.3a, of heights `≤ μ̂_max(Ē) + (r(r − 1)/2)·log 2 + η`, and let `η → 0`; for `r ≤ 2`, `log r + (r(r − 1)/2)·log 2 = 2 log r`. For `n = 0` all three are `0 ≤ 0`.

*Needs:* 1.3, 1.3a, 1.4, 1.7, 2.2, 2.4, 3.5, 4.3a, 4.4; Mathlib `Nat.Prime.emultiplicity_factorial` (Legendre's formula); Tau Ceti `SymmetricPower.toTensorPower`, `SymmetricPower.toTensorPower_injective`.

**Checks.**

- `Sym²(ℤ²)`: `μ̂_max = ½ log 2 ≈ 0.347` (the line of `e₁e₂`); (b1) with the dual standard basis, of heights `0`, reads `0.347 ≤ 2 log 2 ≈ 1.39`; (b2) reads `0.347 ≤ 4 log 2 ≈ 2.77`; (a) reads `0.347 ≤ 0 + min(log 2, log 2)`.
- In rank one, `Sym^n L̄ = L̄^{⊗n}`, `μ̂_max = n μ̂(L̄)`, every nonzero `λ ∈ L_K^∨` has `h_{L̄^∨}(λ) = μ̂(L̄)`, and (a), (b1) and (b2) are equalities.
- `Sym³(ℤ³)`: the monomial lines have slopes `½ log(3!/α!)`, the largest `½ log 6 ≈ 0.90` at `α = (1, 1, 1)`; (b1) with the dual standard basis allows `3 log 3 ≈ 3.30`, and (b2) allows `3(log 3 + 3 log 2) ≈ 9.53`.

### Examples

For `ℤ ⊕ (ℤ, e^(−c)|·|)` with `c > 0`, `λ_0 = e^(−c)`, `λ_1 = 1` and `μ^abs = (e^(−c), 1)`, and the lower bounds of 4.2 and 4.3 are equalities. For `A₂`, `λ_0 = λ_1 = 1` while both Harder–Narasimhan slopes are `½ log(2/√3) ≈ 0.0719`, so minima and slopes differ even over `ℚ`. For `Sym²(ℤ²)` with the quotient metric, `μ̂_max = ½ log 2`, attained at the line of `e₁e₂` (4.5).

### Dependencies

Layers 1–3; SubspaceTheorem §§4.1, 4.2 and AdelicHeightsAndSuccessiveMinima §3.1; DiophantineApproximationAndTranscendence §2.5 and AdelicHeightsAndSuccessiveMinima §2.5a; Tau Ceti's symmetrisation `SymmetricPower.toTensorPower` (4.5 (a)).

## Layer 5: The slope inequality for a nearly tight frame

Throughout this layer, `K` is a number field, `I` a nonempty finite set, `Ē_i` (`i ∈ I`) and `F̄` nonzero Hermitian vector bundles over `O_K`, `d_i = rk E_i`, `R = Σ_i d_i`, `n = rk F`, and `φ_i : E_{i,K} → F_K` are `K`-linear maps with real numbers `h_i` such that `h(φ_i) ≤ h_i` whenever `φ_i ≠ 0`. **Archimedean frame data** at an embedding `σ : K → ℂ` consist of: a complex inner-product space `ℋ` of finite dimension `D` with a surjective `ℂ`-linear map `π : ℋ → F_σ` and `δ ∈ [0, 1)` with `D − n ≤ δ·D`; for each `i` an inner product on `E_{i,σ}` and a `ℂ`-linear map `φ̃_i : E_{i,σ} → ℋ` with `π ∘ φ̃_i = φ_{i,σ}`; weights `γ_i > 0`; and reals `e ∈ [0, 1)`, `η ≥ 0` with

```text
Σ_i ‖γ_i φ̃_i^* φ̃_i − 1‖²_HS ≤ e·R,          tr(Q²) ≤ (1 + η)·(tr Q)²/D,     where Q = Σ_i γ_i φ̃_i φ̃_i^*.
```

Write `κ_e = 2/(1 − √e)`; then `2 ≤ κ_e`, and `κ_e ≤ 4` for `e ≤ 1/4`.

None of the inner products is required to be a metric of the bundles, no `φ_i` is required to be injective, and no condition is imposed at the other places.

### 5.1 Counting Harder–Narasimhan slopes below a level

(a) Let `x_1, …, x_R` be reals, `s ∈ ℝ` and `u ≥ 0` with `Σ_k x_k ≥ R·s` and `x_k ≤ s + u` for all `k`. Then `#{k : x_k < s − τ} ≤ R·u/(u + τ)` for every `τ > 0`. (b) In the setting above, if `R·s ≤ Σ_i d_i(μ̂(Ē_i) − h_i)` and `μ̂_max(Ē_i) − h_i ≤ s + u` for all `i`, then for every `τ > 0`

```text
Σ_i ( d_i − dim (E_i)_{≥ s − τ + h_i} ) ≤ R·u/(u + τ).
```

*Route.* (a) With `b` the count, `R s ≤ Σ x_k ≤ (s − τ) b + (s + u)(R − b)`. (b) Apply (a) to the `R` numbers `μ̂_j(Ē_i) − h_i`, whose mean is `Σ_i d_i(μ̂(Ē_i) − h_i)/R` and whose maximum for each `i` is `μ̂_max(Ē_i) − h_i` (3.3 (ii)), and count with 3.3 (i).

*Needs:* 3.3.

**Checks.**

- `u = 0`: no number lies below `s − τ`; for bundles, every `Ē_i` is semistable of slope `s + h_i`, as the mean condition forces.
- `x = (0, 2)`, `s = 1`, `u = 1`, `τ = 1/2`: the count is `1 ≤ 2·1/(3/2) = 4/3`.

### 5.2 Slopes from the coranks of the steps

Let `Ḡ` be nonzero of rank `n`, `a ∈ ℝ`, `H ≥ 0` with `μ̂_min(Ḡ) ≥ a − H`, and `w : (0, H] → [0, ∞)` integrable with `n − dim G_{≥ a−τ} ≤ w(τ)·n` for every `τ ∈ (0, H]`. Then `μ̂(Ḡ) ≥ a − ∫_0^H min(1, w(τ)) dτ`.

*Route.* 3.3 (iv); the integrand vanishes for `τ > H` because then `a − τ < μ̂_min(Ḡ)`, and it is at most `n·min(1, w(τ))`.

*Needs:* 3.3.

**Checks.**

- `w ≡ 0` gives `μ̂(Ḡ) ≥ a`; `w ≡ 1` gives `μ̂(Ḡ) ≥ a − H`, which already follows from `μ̂ ≥ μ̂_min`.

### 5.3 A frame lemma

Let `V_i` (`i ∈ I`) and `ℋ` be finite-dimensional inner-product spaces over `ℝ` or `ℂ`, of dimensions `d_i` and `D ≥ 1`, with `R = Σ d_i ≥ 1`; let `B_i : V_i → ℋ` be linear, `γ_i > 0`, `e ∈ [0, 1)` and `η ≥ 0` with `Σ_i ‖γ_i B_i^* B_i − 1‖²_HS ≤ e·R` and `tr(Q²) ≤ (1 + η)(tr Q)²/D` for `Q = Σ_i γ_i B_i B_i^*`. If subspaces `W_i ⊂ V_i` satisfy `Σ_i (d_i − dim W_i) ≤ ε·R` with `ε ≥ 0`, then

```text
dim ( Σ_i B_i(W_i) )^⊥ ≤ ( η + 2·(ε + √(ε·e))/(1 − √e) ) · D,
```

and in particular, for `e ≤ 1/4`, `dim ( Σ_i B_i(W_i) )^⊥ ≤ ( η + 4ε + 4√(ε·e) ) · D`.

*Route.* Put `t = tr Q`, `K_i = γ_i B_i^* B_i`, `𝒲 = (Σ_i B_i(W_i))^⊥` and `w = dim 𝒲`. (1) `t = Σ_i tr K_i ≥ R − Σ_i √d_i ‖K_i − 1‖_HS ≥ R(1 − √e) > 0` by Cauchy–Schwarz. (2) `A = Q − (t/D)·1` has `‖A‖²_HS = tr Q² − t²/D ≤ η t²/D`. (3) For an orthonormal basis `(g_l)` of `𝒲`, `Σ_l ⟨g_l, Q g_l⟩ ≥ (t/D)·w − √w·‖A‖_HS`. (4) For `g ∈ 𝒲`, `B_i^* g ⊥ W_i`, so with `c_i = d_i − dim W_i` and `P_i` the projection onto `W_i^⊥`, `Σ_l ⟨g_l, Q g_l⟩ ≤ Σ_i tr(P_i K_i P_i) ≤ Σ_i (c_i + √c_i ‖K_i − 1‖_HS) ≤ R(ε + √(εe))`. (5) Combine, divide by `t/D` and use `R ≤ t/(1 − √e)`: `x − √(ηx) ≤ (ε + √(εe))/(1 − √e)` for `x = w/D`, and `√(ηx) ≤ (η + x)/2`. For `e ≤ 1/4`, `1/(1 − √e) ≤ 2`.

*Needs:* Mathlib inner-product spaces, adjoints, traces and the Hilbert–Schmidt (Frobenius) norm.

**Checks.**

- `ℋ = ℂ^D`, the `B_i` the inclusions of the coordinate lines, `γ_i = 1`: `e = η = 0`, and deleting `εD` lines leaves an orthogonal complement of dimension exactly `εD ≤ 2εD`, the bound for `e = 0`.
- Three unit vectors at angles `2π/3` in `ℝ²`, as maps `ℝ → ℝ²`, with `γ_i = 1`: `B_i^* B_i = 1`, so `e = 0`, and `Q = (3/2)·1` is scalar, so `η = 0`, although no `B_i` is close to a map onto `ℋ`; deleting one (`ε = 1/3`) leaves two vectors that span `ℝ²`, and the bound is `(2/3)·2 = 4/3`. The hypothesis is that `Q` is nearly scalar, not that it is nearly the identity.

### 5.4 Rank of a sum of images at one place

In the setting of this layer with archimedean frame data at `σ`, let `N_i ⊂ E_{i,K}` be `K`-subspaces with `Σ_i (d_i − dim N_i) ≤ ε·R`. Then

```text
n − dim_K ( Σ_i φ_i(N_i) ) ≤ (1 − δ)⁻¹ · ( η + κ_e·(ε + √(ε·e)) ) · n,
```

which for `e ≤ 1/4` implies the bound `(1 − δ)⁻¹·(η + 4ε + 4√(ε·e))·n`.

*Route.* Complexification at `σ` preserves dimensions, and `(Σ φ_i(N_i)) ⊗_σ ℂ = π(S)` with `S = Σ_i φ̃_i(N_i ⊗_σ ℂ)`. Since `dim ker π = D − n`, `dim π(S) ≥ dim S − (D − n) = n − dim S^⊥`. Apply 5.3 to `S^⊥` and use `D ≤ n/(1 − δ)`.

*Needs:* 5.3.

**Checks.**

- `K = ℚ`, `F̄ = ℤ²`, three sources `ℤ` mapped to `e₁`, `e₂` and `−e₁ − e₂`; `ℋ = F_σ` with the inner product in which these three vectors are unit vectors at angles `2π/3`, `π = id`, `δ = 0`, and inner products on the sources making `|φ̃_i(1)| = 1`, `γ_i = 1`. Then `e = 0` and `Q = (3/2)·1`, so `η = 0`. Deleting one source (`N_3 = 0`, `ε = 1/3`) leaves `φ_1(ℚ) + φ_2(ℚ) = ℚ²`, of codimension `0 ≤ κ_0·(1/3)·2 = 4/3`.

### 5.5 The slope inequality for a nearly tight frame

In the setting of this layer, with archimedean frame data at some embedding `σ`, let `s, u, H` be reals with

```text
R·s ≤ Σ_i d_i·( μ̂(Ē_i) − h_i ),      u ≥ 0 and μ̂_max(Ē_i) − h_i ≤ s + u for every i,      H ≥ max( 0, s − μ̂_min(F̄) ).
```

Then (i) for every `τ > 0` the Harder–Narasimhan step `F_{≥ s−τ}` satisfies

```text
n − dim F_{≥ s−τ} ≤ (1 − δ)⁻¹ · ( η + κ_e·( u/(u + τ) + √(e·u/(u + τ)) ) ) · n;
```

and (ii)

```text
μ̂(F̄) ≥ s − (1 − δ)⁻¹ · ( η·H + κ_e·( u·log(1 + H/u) + 2√(e·u)·(√(u + H) − √u) ) )
      ≥ s − (1 − δ)⁻¹ · ( κ_e·u·log(1 + H/u) + (η + κ_e·√e)·H ),
```

where the terms in `u` are `0` when `u = 0`. For `e ≤ 1/4`, `κ_e ≤ 4` gives the bounds with `4` in place of `κ_e`: `n − dim F_{≥ s−τ} ≤ (1 − δ)⁻¹(η + 4u/(u + τ) + 4√(e·u/(u + τ)))·n` and `μ̂(F̄) ≥ s − (1 − δ)⁻¹(η·H + 4u·log(1 + H/u) + 8√(e·u)·(√(u + H) − √u)) ≥ s − (1 − δ)⁻¹(4u·log(1 + H/u) + (η + 4√e)·H)`. Since `√(u + H) − √u ≤ √H`, the middle bound of (ii) also implies `μ̂(F̄) ≥ s − (1 − δ)⁻¹ (η·H + κ_e·u·log(1 + H/u) + 2κ_e·√(e·u·H))`. For `u = 0` it reads `μ̂(F̄) ≥ s − (1 − δ)⁻¹·η·H`: for sources that are semistable of one slope the bound does not involve `e`, and of the defect hypothesis only its consequence `tr Q > 0` (5.3, step (1)) is used, since with `ε = 0` Cauchy–Schwarz on the eigenvalues of `Q` gives `D − rk Q ≤ η·D/(1 + η)` when `tr Q > 0`. Positive trace cannot be dropped: the zero map from a line of slope `1` to a line of slope `0`, with the zero lift (`Q = 0`), meets every other hypothesis with `s = H = 1` and `u = η = δ = 0`, and the conclusion `0 ≥ 1` is false. The hypothesis `H ≥ 0` cannot be dropped (fifth Check below). The condition `η ≥ 0` is no restriction, since `tr(Q²) ≥ (tr Q)²/D` always.

*Route.* Fix `τ > 0` and let `N_i = (E_i)_{≥ s−τ+h_i}`. By 5.1 (b), `Σ_i (d_i − dim N_i) ≤ ε(τ)·R` with `ε(τ) = u/(u + τ)`. For each `i` with `φ_i|_{N_i} ≠ 0`, `μ̂_min(Ē_{i,N_i}) ≥ s − τ + h_i` (3.1) and the restriction has height `≤ h_i` (1.3), so 3.4 (i) gives `Σ_i φ_i(N_i) ⊂ F_{≥ s−τ}`, with no bound needed on the sum map. 5.4 now gives (i). For (ii) apply 5.2 with `a = s`, the given `H ≥ 0` (so that `μ̂_min(F̄) ≥ s − H`) and `w(τ)` the bound of (i), and integrate: `∫_0^H κ_e·u/(u + τ) dτ = κ_e·u log(1 + H/u)` and `∫_0^H κ_e·√(eu)(u + τ)^(−1/2) dτ = 2κ_e·√(eu)(√(u + H) − √u) ≤ κ_e·√e·H`, because `2√u·(√(u + H) − √u) ≤ H`. The term `κ_e·u log(1 + H/u)` is the price of the sources not being semistable of a common slope; `η H` and the `e`-term are the proportion of the target the frame may miss, charged at the largest possible deficit `H`; `(1 − δ)⁻¹` converts proportions of `ℋ` into proportions of `F_σ`. The argument bounds the whole polygon of `F̄` from below, so it bounds the mean `μ̂(F̄)` of its slopes.

*Needs:* 1.3, 3.1, 3.3, 3.4, 5.1, 5.2, 5.4.

**Checks.**

- **One isometry.** `I = {1}`, `φ = φ_1 : E_K → F_K` an isomorphism, `h_1 = h(φ)`, `ℋ = F_σ` with any inner product, `π = id`, `δ = 0`, the inner product on `E_σ` pulled back by `φ_σ`, `γ = 1`: then `e = 0`, `Q = 1`, `η = 0`, and with `s = μ̂(Ē) − h(φ)`, (ii) reads `μ̂(F̄) ≥ μ̂(Ē) − h(φ) − 2u log(1 + H/u)` (`κ_0 = 2`). For semistable `Ē` (`u = 0`) this is 1.4 (ii); otherwise it is weaker by the stated price.
- **An orthogonal sum of isometric embeddings.** `F̄ = ⊕_i Ē_i` orthogonally, `φ_i` the inclusions (`h(φ_i) = 0 = h_i`), `ℋ = F_σ` with the sum metric, `π = id`, `φ̃_i` the inclusions, `γ_i = 1`: `φ̃_i^* φ̃_i = 1`, `Q = Σ_i` (orthogonal projections) `= 1`, so `e = η = δ = 0`, and `s = Σ_i d_i μ̂(Ē_i)/R = μ̂(F̄)`. If all `Ē_i` are semistable of one slope, `u = 0` and (ii) is the equality `μ̂(F̄) ≥ μ̂(F̄)`.
- **Rank one.** Let every `Ē_i` and `F̄` be lines and every `φ_i ≠ 0`. By 1.4 (i), `μ̂(Ē_i) − h(φ_i) = μ̂(F̄)` for every `i`, so `max_i(μ̂(Ē_i) − h_i) ≤ μ̂(F̄)` for any admissible `h_i`, which is stronger than (ii); with `h_i = h(φ_i)` one may take `s = μ̂(F̄)`, `u = 0`, `H = 0`, and (ii) is an equality for any frame data. With `ℋ = F_σ`, inner products making `|φ_{i,σ}| = 1` and `γ_i = 1`, `Q = |I|·1`, so `e = η = 0` for every number of copies: a redundant family of copies of one line is a tight frame. For copies of one map of height `h > 0` with these frame data, a version with `+h_i` in place of `−h_i` in the definition of `s` would allow `s = μ̂(F̄) + 2h`, `u = 0`, `H = 2h`, and claim `μ̂(F̄) ≥ μ̂(F̄) + 2h`, which is false; for maps of different heights it would claim `μ̂(F̄)` plus twice the rank-weighted mean of the `h(φ_i)`, less the terms in `u`.
- **The term `η·H` is sharp up to the factor `d/(d + 1)`.** `F̄ = Ē ⊕ L̄` orthogonally, with `Ē` semistable of rank `d` and `L̄` a line with `μ̂(L̄) < μ̂(Ē)`; one source `Ē`, included isometrically (`h = 0`), `ℋ = F_σ` with the sum metric, `π = id`, `γ = 1`. Then `Q` is the projection onto `E_σ`, of rank `d` in dimension `d + 1`, so `η = 1/d`, `e = δ = u = 0`, `s = μ̂(Ē)`, and `H = μ̂(Ē) − μ̂(L̄)`. (ii) gives `μ̂(F̄) ≥ μ̂(Ē) − H/d`, while `μ̂(F̄) = μ̂(Ē) − H/(d + 1)`. Without the term `η·H` the conclusion `μ̂(F̄) ≥ μ̂(Ē)` would be false.
- **Non-example: `H` must be nonnegative.** Let `F̄` be semistable of rank `4` and `Ē ⊂ F̄` a sub-bundle of rank one with `μ̂(Ē) < μ̂(F̄)`, for instance `F̄ = ℤ⁴` and `Ē = ℤ·(1,1,0,0)` of slope `−½ log 2`; take the inclusion (`h = 0`), `ℋ = F_σ` with the metric of `F̄`, `π = id`, `γ = 1`. Then `e = δ = u = 0` and `η = 3` (a projection of rank one in dimension four), `s = μ̂(Ē)`, and `s − μ̂_min(F̄) = μ̂(Ē) − μ̂(F̄) < 0`. With `H = s − μ̂_min(F̄)` in place of `max(0, ·)`, (ii) would read `μ̂(F̄) ≥ s − 3H = μ̂(F̄) + 2(μ̂(F̄) − μ̂(Ē)) > μ̂(F̄)`, which is false; with `H = 0` it reads `μ̂(F̄) ≥ μ̂(Ē)`, which is true. The layer-cake step 5.2 is where `H ≥ 0` is used.

### 5.6 Pairwise Gram bounds

In the setting of this layer, replace the two frame inequalities by the following: reals `D* > 0`, `ϖ > 0`, `η₀ ≥ −1`, `η₁ ≥ 0` and `e₀ ∈ [0, 1)` with

```text
‖√(γ_i γ_j) φ̃_i^* φ̃_j‖²_HS ≤ (1 + η₀)·d_i d_j/D*  (i ≠ j),     ‖γ_i φ̃_i^* φ̃_i − 1‖²_HS ≤ e₀·d_i,     D ≤ (1 + η₁)·D*,     R ≥ D*/ϖ.
```

Then the frame inequalities hold with `e = e₀` and

```text
η = max( 0, (1 + η₁)·(1 + η₀ + (1 + √e₀)²·ϖ)/(1 − √e₀)² − 1 ).
```

In particular, for `0 < ϖ ≤ 1/4` and `η₀, η₁, √e₀ ≤ ϖ/2`, one may take `η = 5ϖ`.

*Route.* `tr(Q²) = Σ_{i,j} ‖√(γ_iγ_j) φ̃_i^* φ̃_j‖²_HS`; bound the off-diagonal terms by the first hypothesis and the diagonal ones by `‖γ_i φ̃_i^* φ̃_i‖_HS ≤ (1 + √e₀)√d_i`, so `tr Q² ≤ (1 + η₀)R²/D* + (1 + √e₀)² R`. With `tr Q ≥ R(1 − √e₀)` (5.3, step (1)) and `D ≤ (1 + η₁)D*`, `R ≥ D*/ϖ`, divide. For the special case, the formula is increasing in `η₀`, `η₁` and `e₀`, so put `η₀ = η₁ = √e₀ = ϖ/2` and expand: the claim `η ≤ 5ϖ` becomes `(1 + 5ϖ)(1 − ϖ/2)² − (1 + ϖ/2)(1 + 3ϖ/2 + ϖ² + ϖ³/4) = ϖ·(2 − 6.5ϖ + 0.5ϖ² − 0.125ϖ³) ≥ 0`, true on `(0, 1/4]`.

*Remark.* For `e₀ = 0` the maps `√γ_i φ̃_i` are isometries, and the left side of the first hypothesis is `tr(P_i P_j)` for the orthogonal projections `P_i` onto their images. With `η₀ = 0` and `D* = D` its right side is the Haar expectation: for orthogonal projections `P, P′` of ranks `d, d′` on a space of dimension `D`, the mean of `tr(P U P′ U^*)` over the unitary group is `dd′/D`. A single pair of subspaces in general position need not take that value (two lines of `ℂ²` at angle `π/6` have `tr(PP′) = 3/4`, against the mean `1/2`), and the hypothesis bounds every pair by `(1 + η₀)·D/D*` times the Haar mean, a factor at most `(1 + η₀)(1 + η₁)` that exceeds `1` exactly when `D* < (1 + η₀)·D`; so it may allow pairs more aligned than random subspaces are on average. It is not near-orthogonality, and the conclusion comes from redundancy, `R ≥ D*/ϖ`: the diagonal terms of `tr Q²` enter the formula through `ϖ ≥ D*/R`, so it is `D*`, not `D`, that `R` has to exceed by a large factor; `D ≤ (1 + η₁)·D*` bounds `D*` from below only, and with `R` comparable to `D` the ratio `D*/R`, hence `ϖ`, can be large (one isometry of lines, `R = D = 1`, satisfies the hypotheses with `D* = ϖ = M` for every `M ≥ 1` and `η₀ = −1`, there being no pair `i ≠ j`, and the formula gives `η = M − 1`, while `Q = 1` satisfies the frame inequality with `η = 0`). For `R = D*` the hypothesis `R ≥ D*/ϖ` forces `ϖ ≥ 1`, and with `η₁ = e₀ = 0` the formula gives `η = η₀ + ϖ`: `η = 1` for `η₀ = 0` and the choice `ϖ = 1`, and `η = 0` for orthogonal images (`η₀ = −1`, `ϖ = 1`; the first Check). The codimension bound of 5.3, which is at least `η·D`, is vacuous once `η ≥ 1`; the frame inequality itself still says something, `rk Q ≥ D/(1 + η)` by Cauchy–Schwarz on the eigenvalues of `Q` (`rk Q ≥ D/2` for `η = 1`).

*Needs:* 5.3.

**Checks.**

- The two coordinate lines of `ℂ²` with `γ = 1`, `D* = 2`, `ϖ = 1`, `e₀ = η₁ = 0`: the cross term vanishes, so `η₀ = −1` is allowed, and the formula gives `η = 0`, the exact value (`Q = 1`).
- `ϖ = 1/4`, `η₀ = η₁ = √e₀ = 1/8`: the formula gives `η ≈ 1.12 ≤ 5/4`.

### 5.7 Compression to subspaces

Let `B_i : V_i → ℋ` satisfy the hypotheses of 5.3 with constants `e, η`, and let `U_i ⊂ V_i` be subspaces with `Σ_i (d_i − dim U_i) ≤ ϑ·R`, `0 ≤ ϑ < 1`, such that `κ = (ϑ + √(ϑ e))/(1 − √e) < 1` and `e/(1 − ϑ) < 1`. Then the restrictions `B_i|_{U_i}`, with the restricted inner products and the same weights, satisfy the hypotheses of 5.3 with `R′ = Σ_i dim U_i`, `e′ = e/(1 − ϑ)` and `η′ = (1 + η)/(1 − κ)² − 1`.

In particular, if `η ≤ 5ϖ` and `√e ≤ ϖ/2` for some `0 < ϖ ≤ 1/20` (the situation of the special case of 5.6) and `ϑ ≤ 1/4`, the restrictions satisfy the hypotheses of 5.3, and the frame inequalities of this layer, with `e′ ≤ (4/3)·e ≤ 2e` and `η′ ≤ 5ϖ + 2.6·√ϑ`.

*Route.* With `Q′` the new frame operator, `0 ≤ Q′ ≤ Q` in the Loewner order, so `tr Q′² ≤ tr Q²`. The trace drops by `Σ_i tr(P_i K_i P_i) ≤ R(ϑ + √(ϑe))` (5.3, step (4)), so `tr Q′ ≥ (1 − κ) tr Q` using `R ≤ tr Q/(1 − √e)`. The compressions `K′_i − 1` of `K_i − 1` have no larger Hilbert–Schmidt norm, and `R′ ≥ (1 − ϑ) R`. For the special case put `x = √ϑ ≤ 1/2`; since `√e ≤ 1/40`, `κ = x(x + √e)/(1 − √e) ≤ (40/39)·x(x + 0.025) ≤ 0.539·x ≤ 0.27`; then `(1 − κ)^(−2) − 1 ≤ 2κ/(1 − κ)² ≤ 3.76·κ`, and `η′ = η + (1 + η)((1 − κ)^(−2) − 1) ≤ 5ϖ + 1.25 · 3.76 · 0.539·x ≤ 5ϖ + 2.6·√ϑ`, using that `η′` increases with `η` and `1 + η ≤ 1.25`. Finally `e′ = e/(1 − ϑ) ≤ (4/3)·e ≤ 1/4 < 1`, as the frame data of this layer require.

*Needs:* 5.3.

**Checks.**

- `ϑ = 0` gives back `e′ = e`, `η′ = η`.
- `ϖ = 1/20`, `ϑ = 1/4`, `η = 5ϖ`, `√e = ϖ/2`: `κ ≈ 0.269`, and the exact formula gives `η′ ≈ 1.34`, below `5ϖ + 2.6·√ϑ = 1.55`.

### Examples

Three unit vectors at angles `2π/3` in `ℝ²`, as maps `ℝ → ℝ²` with weights `1`, satisfy the frame inequalities with `e = η = 0`, although no one of them is close to a map onto `ℝ²` (5.3); over `ℚ`, the three sources `ℤ` mapped to `e₁`, `e₂` and `−e₁ − e₂` in `ℤ²` give frame data with `e = η = δ = 0`, for the inner product in which their images are unit vectors at angles `2π/3` (5.4). For an orthogonal sum `F̄ = ⊕_i Ē_i` of semistable bundles of one slope, with the inclusions as maps, 5.5 (ii) is the equality `μ̂(F̄) ≥ μ̂(F̄)`; for `F̄ = Ē ⊕ L̄`, with one semistable source `Ē` of rank `d` and a line `L̄` of smaller slope, the term `η·H` of 5.5 is sharp up to the factor `d/(d + 1)`.

### Dependencies

Layers 1–3; Mathlib finite-dimensional inner-product spaces.

## Layer 6: Lattices of sections

In 6.2–6.5, `𝒳 → Spec O_K` is projective and flat with `𝒳` integral, `X = 𝒳_K` of dimension `d_X`, `ℒ` a line bundle on `𝒳` whose generic fibre `L` is ample (some power `L^a`, `a ≥ 1`, is the restriction of `O(1)` along a closed immersion `X ↪ ℙ^N_K`), and `‖·‖` a continuous conjugation-invariant metric on `ℒ_ℂ`, as in ArakelovGeometryAndAbelianHeights §1.12. `h_ℒ̄` is the height of algebraic points defined there.

### 6.1 Hermitian norms close to a given norm

Every norm `‖·‖` on a complex vector space `V` of finite dimension `N ≥ 1` admits a Hermitian norm `‖·‖_H` with `‖x‖_H ≤ ‖x‖ ≤ √N·‖x‖_H`; if a conjugate-linear involution `c` of `V` preserves `‖·‖`, `‖·‖_H` may be chosen with `‖c(x)‖_H = ‖x‖_H`.

*Route.* John's theorem for the closed unit ball of `‖·‖` over `ℂ` (BanachSpaceTheory B7) gives the Banach–Mazur bound `d(V, ℓ²_N) ≤ √N`, attained by the maximal ellipsoid: a `ℂ`-linear isomorphism `T : ℓ²_N → V` with `‖T‖·‖T^(−1)‖ ≤ √N`; put `‖x‖_H = |T^(−1)x|/‖T^(−1)‖`. For invariance, `h′(x, y) = conj(h(c x, c y))` is again a Hermitian form, with `h′(x, x) = ‖c(x)‖²_H`, and since `‖c(x)‖ = ‖x‖` both bounds hold for `h′` and so for `½(h + h′)`.

*Needs:* BanachSpaceTheory B7 (John's theorem over `ℂ`, `d(E, ℓ²_n) ≤ √n`).

**Checks.**

- `ℓ^∞` on `ℂ^N`: `‖·‖_H = N^(−1/2)·ℓ²`, with `N^(−1/2)|x|_2 ≤ |x|_∞ ≤ |x|_2`.
- `ℓ¹` on `ℂ^N`: `‖·‖_H = ℓ²`, with `|x|_2 ≤ |x|_1 ≤ √N·|x|_2`; the factor `√N` is attained at `(1, …, 1)`.

### 6.2 Interpolation sets of bounded height

There is `C ≥ 1` and, for every `n ≥ 1`, a finite set `S_n ⊂ X(ℚ̄)` with `#S_n ≤ C(n + 1)^(d_X)` and `h_ℒ̄(P) ≤ C` for every `P ∈ S_n`, such that the only section of `L^n` over `X_ℚ̄` vanishing at every point of `S_n` is `0`. In particular `dim H⁰(X, L^n) ≤ C(n + 1)^(d_X)`.

*Route.* Generic projection (SchemeAndStackFoundations §4.18, `generic_projection`, for the integral, hence pure `d_X`-dimensional, `X ⊂ ℙ^N_K` embedded by `L^a`): linear forms `y_0, …, y_(d_X)` whose common zero set misses `X` define a finite surjective `p : X → ℙ^(d_X)` with `p^*O(1) ≅ L^a`. Since the centre misses `X`, the graded algebra `S/(y_0, …, y_(d_X))S`, `S` the homogeneous coordinate ring of `X`, is killed by a power of the irrelevant ideal, hence finite-dimensional, and by the graded Nakayama lemma `S` is generated as a `K[y_0, …, y_(d_X)]`-module by finitely many homogeneous elements; let `δ_p` be their number. Over each point `g ∈ ℙ^(d_X)` the fibre of `p` (over `K̄`) is the spectrum of an algebra spanned by `δ_p` elements, so it has at most `δ_p` points, and for every irreducible component `Y` of `X_ℚ̄` (all of dimension `d_X`, and `p|_Y` surjective) the function field `ℚ̄(Y)` is spanned by `δ_p` elements over `ℚ̄(ℙ^(d_X))`, so `[ℚ̄(Y) : ℚ̄(ℙ^(d_X))] ≤ δ_p`. Let `S_n` be the preimage of the grid `{[1 : ζ_1 : ⋯ : ζ_(d_X)] : ζ_k^m = 1}`, `m = nδ_p + 1`, so `#S_n ≤ δ_p·m^(d_X)`. A nonzero section `s` of `L^n` over `X_ℚ̄` (a reduced scheme, since `K` has characteristic zero) is nonzero on some component `Y`. Put `t_i = s^a/p^*y_i^n`, a rational function on `Y` regular on `p^(−1)(D_+(y_i)) ∩ Y`; that open set is affine and finite over `D_+(y_i) = Spec R_i`, `R_i = ℚ̄[y_0/y_i, …, y_(d_X)/y_i]`, so `t_i` is integral over `R_i`, and as `R_i` is integrally closed the minimal polynomial of `t_i` over `ℚ̄(ℙ^(d_X))`, of degree `k ≤ δ_p`, has coefficients `c_{i,1}, …, c_{i,k}` in `R_i`. Since `t_i = t_0·(y_0/y_i)^n`, the fractions `C_l = c_{0,l}·y_0^(nl) = c_{i,l}·y_i^(nl)` are homogeneous of degree `nl` and lie in `ℚ̄[y]_{y_i}` for every `i`, so they are forms (a homogeneous fraction whose denominator is a power of every `y_i` is a polynomial). The constant term `C_k` is a nonzero form of degree `nk ≤ nδ_p`, and if `s` vanishes at `Q ∈ Y` with `p(Q) ∈ D_+(y_i)`, evaluating the minimal equation of `t_i` at `Q` gives `C_k(p(Q)) = 0`. A nonzero form of degree `< m` does not vanish on the whole grid (dehomogenise at `y_0 = 1` and induct on the number of variables: a nonzero polynomial in one variable of degree `< m` has fewer than `m` roots), so `C_k` is nonzero at some grid point, and `s` vanishes at no point of `Y` above it; such points exist because `p|_Y` is surjective. Every coordinate of a grid point is `1` or a root of unity, whose absolute values are all `1`, so grid points have absolute height `0` (DiophantineApproximationAndTranscendence §0.2), and `h_ℒ̄ ≤ (1/a)(h ∘ p + C′) ≤ C′/a` on `S_n`, by the functoriality of Weil heights and the boundedness of the difference between representatives (ArakelovGeometryAndAbelianHeights §§1.12–1.13). The dimension bound follows because evaluation on `S_n` is injective.

*Needs:* ArakelovGeometryAndAbelianHeights §§1.12–1.13; SchemeAndStackFoundations §4.18 (`generic_projection`); DiophantineApproximationAndTranscendence §0.2 (absolute heights); JacobianChallenge C.2 (flat base change of `H⁰` along `K → ℚ̄`).

**Checks.**

- `𝒳 = ℙ^1_ℤ`, `ℒ = O(1)` with the sup metric `‖s‖(x) = |s(x)|/max(|x_0|, |x_1|)`: `S_n` is the set of points `[1 : ζ]` with `ζ^(n+1) = 1`, of height `0`, and a form of degree `n` vanishing at `n + 1` distinct points is `0`. For the Fubini–Study metric `|s(x)|/(|x_0|² + |x_1|²)^{1/2}` the same points have height `½ log 2` (every conjugate of `(1, ζ)` has Euclidean norm `√2`), still bounded.

### 6.3 Section lattices and linear growth of the maximal slope

For `n ≥ 0`, `M_n = H⁰(𝒳, ℒ^{⊗n})` is a finitely generated projective `O_K`-module with `M_n ⊗ K = H⁰(X, L^n)` and `M_n ⊗_σ ℂ = H⁰(X_σ, L_σ^n)`; each element has a finite sup norm `‖s‖_{sup,σ}`. A family of conjugation-compatible Hermitian norms `‖·‖_{n,σ}` on the `M_n ⊗_σ ℂ` is **sup-comparable with defects** `ε_n ≥ 0` if `‖s‖_{n,σ} ≤ ‖s‖_{sup,σ} ≤ e^(ε_n)·‖s‖_{n,σ}`, and `M̄_n` denotes the resulting Hermitian vector bundle. By 6.1 such families exist with `ε_n = ½·log max(1, rk M_n)` (when `M_n = 0`, which can happen for small `n ≥ 1`, there is nothing to choose and any `ε_n ≥ 0` will do). For every such family, with `C` as in 6.2 and every `n ≥ 1` with `M_n ≠ 0`,

```text
μ̂_max(M̄_n) ≤ C·n + ½·log( C(n + 1)^(d_X) ) + ε_n.
```

*Route.* Finiteness of `M_n` is JacobianChallenge C.1, projectivity follows from flatness and integrality of `𝒳`, and the base-change identities are JacobianChallenge C.2. Let `K′` be a finite extension over which every point of `S_n` is rational, each extending to `Spec O_{K′} → 𝒳` by properness. Evaluation `M_n ⊗ O_{K′} → ⊕_{P ∈ S_n} P^*ℒ^{⊗n}` is injective (6.2); its target is an orthogonal sum of Hermitian lines of slopes `n·h_ℒ̄(P) ≤ nC`; its finite operator norms are `≤ 1` (integral sections evaluate integrally), and its archimedean ones are `≤ √(#S_n)·e^(ε_n)`. Bost's inequality 2.4 (b) and the invariance of `μ̂_max` under extension (3.5) give the bound.

*Needs:* 2.2, 2.4, 3.5, 6.1, 6.2; JacobianChallenge C.1–C.2; ArakelovGeometryAndAbelianHeights §1.12.

**Checks.**

- `ℙ^1_ℤ`, `O(1)` with the Fubini–Study metric `|s(x)|/|x|` and `L²` norms for the Fubini–Study probability measure: the monomials `x_0^(n−k) x_1^k` are orthogonal with squared norms `k!(n − k)!/(n + 1)!`, so `M̄_n` is an orthogonal sum of lines of slopes `½ log((n + 1)·binom(n, k))` and `μ̂_max(M̄_n) = ½ log((n + 1)·binom(n, ⌊n/2⌋)) ≤ (n/2) log 2 + ½ log(n + 1)`.

### 6.3a Fekete's lemma with an error term

Let `n_0 ≥ 1`, let `f : ℕ → [0, ∞)` be nondecreasing with `Σ_{k≥1} f(k)/k² < ∞`, and let `(a_n)_{n ≥ n_0}` be real numbers with

```text
a_(n+m) ≥ a_n + a_m − f(n + m)      whenever n, m ≥ n_0 and n/2 ≤ m ≤ 2n.
```

Then `a_n/n` converges in `(−∞, +∞]`, and its limit is real if `a_n/n` is bounded above.

*Route.* Since `f` is nondecreasing, `Σ_j f(2^j)/2^j ≤ 4·Σ_k f(k)/k² < ∞`, so `δ(m) = 4·Σ_{j : 2^j > m} f(2^(j+1))/2^(j+1)` tends to `0`. Fix `m ≥ n_0`, let `N` be large and write `N = (q − 1)·m + p_0` with `m ≤ p_0 < 2m`. Combine `q − 1` copies of `m` and one extra piece `p_0` along a binary tree: a node holding `j ≥ 2` copies splits into `⌈j/2⌉` and `⌊j/2⌋` copies; a node holding `j ≥ 3` copies and the extra piece splits into `⌈j/2⌉` copies and `⌊j/2⌋` copies with the extra piece; a node holding one copy, or at most two copies with the extra piece, is a leaf. Every split is admissible (`n/2 ≤ m′ ≤ 2n` for the two parts), the extra leaf has size `p ∈ [m, 4m)`, and a node that splits at depth `i` has size at most `2N/2^i` with `N/2^i ≥ m`; as there are at most `2^i` nodes at depth `i`, and each dyadic interval contains exactly one of the numbers `N/2^i`, the losses add up to at most `N·δ(m)`. Hence `a_N ≥ (q − 1 − j)·a_m + a_p − N·δ(m)` with `j ≤ 2` and `m ≤ p < 4m`. Dividing by `N` and letting `N → ∞` with `m` fixed gives `liminf_N a_N/N ≥ a_m/m − δ(m)` for every `m ≥ n_0`; so the liminf is not `−∞`, and letting `m` run through a sequence along which `a_m/m` tends to the limsup gives `liminf ≥ limsup`.

*Needs:* Mathlib real sequences (`Filter.Tendsto`, `liminf`, `limsup`); compare Fekete's lemma `Subadditive.tendsto_lim`, whose hypothesis (all pairs, no error) is stronger.

**Checks.**

- `f = 0`: the route has no losses (`δ(m) = 0`) and gives `liminf_N a_N/N ≥ a_m/m` for every `m ≥ n_0`, so `a_n/n` tends to `sup_{n≥n_0} a_n/n`. The hypothesis is then superadditivity for comparable pairs only, so Fekete's lemma (Mathlib's `Subadditive.tendsto_lim` for `−a`) does not apply as it stands: `a_n = ⌊n/3⌋` for `n ≠ 4` and `a_4 = 0` satisfies the hypothesis with `f = 0` and `n_0 = 1`, while `a_4 < a_1 + a_3`; its limit is `1/3 = sup_n a_n/n`.
- `a_n = n·μ + C·log(n + 1)` with `C > 0` is not superadditive, satisfies the hypothesis with `f(k) = C·log(k + 1)` (because `(n + 1)(m + 1) ≤ (n + m + 1)²`), and `a_n/n → μ`; `a_n = −n·log n` needs `f(k) ≥ k·log 2` on balanced splits, for which `Σ f(k)/k²` diverges, and indeed `a_n/n → −∞`.

### 6.4 The asymptotic maximal slope

Assume that `H⁰(X, L^n) ≠ 0` for every `n ≥ n_0` (as holds for ample `L`), and let `(‖·‖_n)` be sup-comparable with defects `ε_n ≤ c·log(n + 2)`. Then `μ̂_max(M̄_n)/n` converges, as `n → ∞`, to a real number `μ̂^asy_max(ℒ̄)` that does not depend on the family.

*Route.* Let `D_n ⊂ M_n` be the maximal destabilising sub-bundle, so `μ̂_min(D̄_n) = μ̂_max(M̄_n)`. Multiplication `D_n ⊗ D_m → M_(n+m)` is nonzero because `𝒳` is integral; it is integral at the finite places, and for orthonormal bases `(s_k), (t_l)` and a tensor `Σ c_kl s_k ⊗ t_l`, `‖Σ c_kl s_k t_l‖_{n+m} ≤ ‖·‖_sup ≤ ‖c‖_HS·√(r_n r_m)·e^(ε_n + ε_m)` with `r_n = rk M_n`. The image form 2.3 and the tensor bound 4.4 (i) then give, for all `n, m ≥ n_0`, `μ̂_max(M̄_(n+m)) ≥ μ̂_max(M̄_n) + μ̂_max(M̄_m) − f(n + m)` with `f(k) = 2c·log(k + 2) + log R_k + ε_K(R_k²)`, `R_k = ⌊C(k + 1)^(d_X)⌋` (so `r_n, r_m ≤ R_k` by 6.2), which is nondecreasing and `O(log k)` by the estimate of `κ` in 4.2. Fekete's lemma with an error term, 6.3a, gives a limit in `(−∞, +∞]`, finite by 6.3. Two such families differ at each `n` by an identity map of height `≤ ε_n + ε′_n` in either direction, so 2.4 (b) shows that the limits agree.

*Needs:* 2.3, 2.4, 4.2, 4.4, 6.2, 6.3, 6.3a.

**Checks.**

- The example of 6.3 gives `μ̂^asy_max = ½ log 2`, by Stirling's formula for `binom(n, ⌊n/2⌋)`.
- Replacing the metric by `e^(−c)‖·‖` adds `c` to the limit.

### 6.5 L² norms and Bergman densities

For each `σ` let `ν_σ` be a probability measure on `X_σ(ℂ)`, with `ν_σ̄` the image of `ν_σ` under complex conjugation, such that no nonzero section of `L_σ^n` vanishes `ν_σ`-almost everywhere (for instance a smooth positive volume form when `X_σ` is smooth), and let `‖s‖²_{L²,n,σ} = ∫ ‖s(x)‖² dν_σ(x)` on `M_n ⊗_σ ℂ`. For an `L²`-orthonormal basis `(s_k)` of `M_n ⊗_σ ℂ`, the **Bergman density** `B_{n,σ}(x) = Σ_k ‖s_k(x)‖²` does not depend on the basis. If `b_n ≥ 1` bounds `B_{n,σ}` on `X_σ(ℂ)` for every `σ`, the `L²` norms are sup-comparable with defects `ε_n = ½·log b_n ≥ 0`, and `b_n ≥ rk M_n` when `M_n ≠ 0`. Hence 6.3 applies to them, and 6.4 applies whenever `b_n ≤ C′(n + 1)^A` for constants `C′, A` and all large `n`.

*Route.* `‖s‖_{L²} ≤ ‖s‖_sup` because `ν_σ` is a probability measure. For `s = Σ_k c_k s_k`, the Cauchy–Schwarz inequality in each fibre gives `‖s(x)‖² ≤ B_{n,σ}(x)·Σ_k |c_k|² ≤ b_n·‖s‖²_{L²}`. Integrating `B_{n,σ}` against `ν_σ` gives `rk M_n`, so `b_n ≥ rk M_n`; the hypothesis `b_n ≥ 1` makes `ε_n ≥ 0` also when `M_n = 0`, where `B_{n,σ} = 0`. The norms are conjugation-compatible because the measures are, and positive definite by the hypothesis on `ν_σ`. For 6.4, `½ log b_n ≤ c·log(n + 2)` for a suitable `c` and all `n`.

*Needs:* 6.3, 6.4.

**Checks.**

- `ℙ^1` with the Fubini–Study metric and measure: the Bergman density is the constant `n + 1 = r_n` (homogeneity), so `b_n = r_n`, the defect is `½ log r_n`, and 6.4 applies.
- A measure concentrated at one point of `X_σ(ℂ)` gives no norm as soon as `rk M_n ≥ 2`: a nonzero section vanishing at that point has `L²` norm `0`.

### 6.6 Spherical heights of multiforms

In 6.6 and 6.7, `N ≥ 1` is the number of variables in each group of variables (so the multiforms live on products of `ℙ^{N−1}`), and no arithmetic scheme occurs. Let `D ≥ 0`, and let `P ∈ K[s_0, …, s_D]` be a nonzero polynomial in `D + 1` groups `s_i = (s_{i,1}, …, s_{i,N})` of `N` variables, homogeneous of degree `e_i` in the group `s_i`. Put

```text
|P|_𝔭 = max of the |coefficient|_𝔭 (Gauss norm),        m_σ(P) = ∫_{S^{D+1}} log |σ(P)(u_0, …, u_D)| dν(u_0)⋯dν(u_D),
ht(P) = (1/[K:ℚ]) · ( Σ_𝔭 log |P|_𝔭 + Σ_{σ∈Σ_K} m_σ(P) ),
```

where `S ⊂ ℂ^N` is the unit sphere of the standard Hermitian norm and `ν` the normalised spherical measure on it: Mathlib's `MeasureTheory.Measure.toSphere` of the Lebesgue measure of `ℂ^N ≅ ℝ^{2N}`, divided by its total mass `2N·vol(unit ball)`. This is the normalised rotation-invariant measure of BanachSpaceTheory B7 on the unit sphere of `ℝ^{2N}`; in particular it is invariant under the unitary group. The Gauss norm `|P|_𝔭` is Mathlib's `MvPowerSeries.gaussNorm` of `P`, viewed as a power series, for the absolute value `|·|_𝔭` and the weights `c = 1`. Write `H_{N−1} = Σ_{k=1}^{N−1} 1/k` and `c_N = ½(log N + H_{N−1})`. Provide:

- (i) `log |σ(P)|` is integrable on `S^{D+1}` for the product measure `ν^{⊗(D+1)}`, so that `m_σ(P)` is the integral of an integrable function; `ht(aP) = ht(P)` for `a ∈ K^×`, and `ht(P)` does not change when `K` is replaced by a finite extension.
- (ii) `ht(PQ) = ht(P) + ht(Q)`.
- (iii) For `P` homogeneous of degree `e` in one group (`D = 0`) and `u ∈ S`, `|σ(P)(u)| ≤ exp(m_σ(P) + (e/2)·H_{N−1})`, with equality for `σ(P)(x) = (Σ_k ū_k x_k)^e`; in general `sup_{S^{D+1}} |σ(P)| ≤ exp(m_σ(P) + ½·H_{N−1}·Σ_i e_i)`.
- (iv) `ht(P) ≥ −c_N·Σ_i e_i`.
- (v) *Hadamard bound.* Let `Ē` be a Hermitian vector bundle of rank `r ≥ 1`, `b` a `K`-basis of `E_K`, and `c_1, …, c_r` polynomial vectors (elements of `E ⊗ K[s_0, …, s_D]` whose coefficients lie in `E`), each homogeneous in every group, with `Δ = det_b(c_1, …, c_r) ≠ 0`. Then

```text
deĝ_n(Ē) ≥ ht(Δ) − (1/[K:ℚ]) · Σ_k Σ_σ log sup_{u ∈ S^{D+1}} ‖c_k(u)‖_σ.
```

- (vi) *Disintegration along a unit vector.* Let `N ≥ 2` and `u ∈ S`, and write `x = ξ(x)·u + x′` with `ξ(x) = Σ_k ū_k x_k` and `x′ ⊥ u`. Under `ν`, the three quantities `t = |ξ(x)|²`, the phase `ξ(x)/|ξ(x)|` and `ω = x′/|x′|` (defined almost everywhere) are independent; `t` has the law `Beta(1, N − 1)`, of density `(N − 1)(1 − t)^{N−2}` on `[0, 1]`, the phase is uniform on the unit circle, and `ω` has the normalised spherical measure of the unit sphere of `u^⊥ ≅ ℂ^{N−1}`. In particular `E log t = −H_{N−1}`.

*Route.* (vi) Write `x = G/|G|` for a standard complex Gaussian vector `G = G_1·u + G′` (`G_1 ∈ ℂ`, `G′ ⊥ u`), the Gaussian model of BanachSpaceTheory B7 in `ℝ^{2N}`, whose direction `G/|G|` has the law `ν` and is independent of `|G|`. The coordinates `G_1` and `G′` are independent, `|G_1|²` and `|G′|²` have Gamma laws of shapes `1` and `N − 1`, and the phase of `G_1` and the direction of `G′` are independent of them (B7's radial and directional independence, in `ℂ` and in `u^⊥`); so `t = |G_1|²/(|G_1|² + |G′|²)` has the law `Beta(1, N − 1)` and is independent of the phase and of `ω = G′/|G′|`, and `E log t = ψ(1) − ψ(N) = −H_{N−1}`. (iii) For a unit vector `ω ⊥ u`, `g(λ) = σ(P)(u + λω)` is a polynomial in `λ` with `g(0) = σ(P)(u)`; factoring it and using Mathlib's `circleAverage_log_norm_sub_const_eq_posLog` (rescaled to radius `R`) gives `log |g(0)| ≤` the circle average of `log |g|` on `|λ| = R`, for every `R > 0`. Average over `R`, the angle `θ` and `ω`, with `t = 1/(1 + R²)` of law `Beta(1, N − 1)`, `θ` uniform and `ω` uniform on the unit sphere of `u^⊥`, independent: by (vi) the point `(u + Re^{iθ}ω)/√(1 + R²)` is then distributed as `ν` up to a phase, which `|σ(P)|` does not see, `|σ(P)(u + Re^{iθ}ω)| = (1 + R²)^{e/2}·|σ(P)((u + Re^{iθ}ω)/√(1 + R²))|`, and `E log(1 + R²) = −E log t = H_{N−1}`. This gives `log |σ(P)(u)| ≤ m_σ(P) + (e/2)·H_{N−1}` where `σ(P)(u) ≠ 0`, which is (iii) after exponentiation; where `σ(P)(u) = 0` there is nothing to prove. For the power of the linear form the integrand is `e·log |ξ(x)|` and `E log |ξ(x)|² = −H_{N−1}` by (vi). For `N = 1`, `|σ(P)|` is constant on `S` and (iii) is an equality. Several groups: one group at a time (Fubini–Tonelli for functions bounded above). (i) Integrability: `log |σ(P)|` is bounded above on the compact `S^{D+1}`, and the averaging in the route of (iii), at a point where `σ(P) ≠ 0`, bounds the integral of its negative part (Tonelli for nonnegative functions). Scaling: `m_σ(aP) = log |σ(a)| + m_σ(P)` and the product formula (Mathlib `NumberField.prod_abs_eq_one`). Extension: each `σ` has `[L:K]` extensions, and the Gauss norms at the primes of `L` above `𝔭` are those at `𝔭` with local degrees adding up to `[L:K]`. (ii) The Gauss norm is multiplicative: Mathlib's `MvPowerSeries.gaussNorm_mul_eq_mul`, whose dominance hypothesis holds at the lexicographically least exponents at which `P` and `Q` attain their Gauss norms (or `Polynomial.gaussNorm_mul` after a Kronecker substitution into one variable); and `log |PQ| = log |P| + log |Q|`, both terms being integrable by (i). (iv) A coefficient `a_γ` of `σ(P)` is the average of `σ(P)(t)·t̄^γ` over the torus `|t_{i,k}| = 1`, and the torus is `√N` times a subset of `S^{D+1}` in each group, so `|a_γ| ≤ N^{(Σ e_i)/2}·sup_{S^{D+1}} |σ(P)|`; with (iii), `log max_γ |σ(a_γ)| ≤ m_σ(P) + c_N·Σ_i e_i`. Hence `ht(P) ≥ (1/[K:ℚ])·h(P) − c_N·Σ_i e_i`, where `h(P) ≥ 0` is the projective coefficient height (`MvPolynomial.logHeight`) of DiophantineApproximationAndTranscendence §1.3. (v) For `u ∈ S^{D+1}`, `|σ(Δ)(u)| ≤ ‖det_b‖_σ·∏_k ‖c_k(u)‖_σ` by Hadamard's inequality in an orthonormal basis (SuccessiveMinima §0.1), with `‖det_b‖_σ = ‖b_1 ∧ ⋯ ∧ b_r‖_σ^(−1)`; integrate the logarithm. At `𝔭` each coefficient of `Δ` is a sum of values `det_b(v_1, …, v_r)` with `v_k ∈ E`, so `log |Δ|_𝔭 ≤ −log ‖b_1 ∧ ⋯ ∧ b_r‖_𝔭`. Summing, `[K:ℚ]·ht(Δ) ≤ −Σ_v log ‖b_1 ∧ ⋯ ∧ b_r‖_v + Σ_k Σ_σ log sup ‖c_k‖_σ`, and the first sum is `deĝ(Ē)` by the generic-section formula of ArakelovGeometryAndAbelianHeights §1.3 for `det Ē`.

*Needs:* 1.2; ArakelovGeometryAndAbelianHeights §1.3; DiophantineApproximationAndTranscendence §1.3 (`MvPolynomial.logHeight` and `h(P) ≥ 0`); SuccessiveMinima §0.1 (`orthonormal_coordinate_hadamard`); BanachSpaceTheory B7 (the normalised spherical measure with its rotation invariance; the Gaussian model with its radial and directional independence and the spherical law of the direction); Mathlib `MeasureTheory.Measure.toSphere`, `MvPowerSeries.gaussNorm`, `MvPowerSeries.gaussNorm_mul_eq_mul`, `circleAverage_log_norm_sub_const_eq_posLog`, `Polynomial.gaussNorm_mul`, `NumberField.prod_abs_eq_one`.

**Checks.**

- `N = 2`, `P = ⟨x, s_0⟩ = s_{0,1} + s_{0,2}` over `ℚ` (`x = (1, 1)`): `m(P) = log |x| − ½H_1 = ½ log 2 − ½`, so `ht(P) = ½ log 2 − ½`; (iii) at `u = x/√2` is the equality `|P(u)| = √2 = exp((½ log 2 − ½) + ½)`.
- The sphere, not the torus: for `Ē = ℤ` and the single column `c = s_{0,1}s_{0,2}·1` (`N = 2`, one group), `sup_S |c| = ½` and `m(s_{0,1}s_{0,2}) = −1`, so (v) reads `0 ≥ −1 + log 2`; with the torus average of `log |s_{0,1}s_{0,2}|`, which is `0`, in place of `m` it would read `0 ≥ log 2`, which is false.
- `N = 2`, `D = 1`, `P = det(s_0, s_1)`: `|P(u_0, u_1)|² = 1 − |⟨u_0, u_1⟩|²` with `|⟨u_0, u_1⟩|²` uniform on `[0, 1]` (by (vi)), so `ht(P) = m(P) = −½`, and (iv) reads `−½ ≥ −2c_2 = −(log 2 + 1)`.
- (v) for `Ē = ℤ` and the single column `c = s_{0,1}·1`: `Δ = s_{0,1}`, `ht(Δ) = −½H_1 = −½`, the column bound is `1`, and (v) reads `0 ≥ −½`.

### 6.7 An explicit arithmetic Hilbert–Samuel inequality for graded systems with a Chow form

Let `N ≥ 1`, `D ≥ 1`, `T ≥ D + 1` and `δ ≥ 1` be integers. A **graded system** of degree `T` consists of Hermitian vector bundles `M̄_0, …, M̄_T` over `O_K`, with `V_j = M_{j,K}`, and `K`-linear maps `x_1, …, x_N : V_j → V_{j+1}` (`0 ≤ j < T`) that commute (`x_k x_l = x_l x_k` on each `V_j`), map `M_j` into `M_{j+1}`, and satisfy, for a real `β > 0`, `‖x(u)v‖_σ ≤ √β·|u|·‖v‖_σ` for all `σ`, `j`, `u ∈ ℂ^N` and `v ∈ V_{j,σ}`, where `x(u) = Σ_k u_k x_k` and `|u|` is the Euclidean norm. Suppose:

- (a) `V_0` and `V_D` are spanned over `K` by vectors of `M_0`, resp. `M_D`, of norm at most `Λ_0`, resp. `Λ_D`, at every `σ`;
- (b) `f ∈ K[s_0, …, s_D]` is homogeneous of degree `δ` in each of the `D + 1` groups `s_i` of `N` variables and **primitive in the last group**: as a polynomial in the variables `s_D` over the factorial ring `A = K[s_0, …, s_{D−1}]`, its coefficients have no common divisor outside `K^×` (this holds for irreducible `f`, and for every product of irreducible forms each of positive degree in `s_D`);
- (c) (flatness at the generic linear section) over an algebraic closure `Ω` of `K(s_0, …, s_{D−1})`, with `l_i = x(s_i)` for `i < D`, `l^α = l_0^{α_0}⋯l_{D−1}^{α_{D−1}}` for `α ∈ ℕ^D` and `U(a) = Σ_{|α|=a} l^α(V_{T−a} ⊗ Ω) ⊂ V_T ⊗ Ω` for `0 ≤ a ≤ T`: there are `c ∈ Ω^×`, points `y_1, …, y_δ ∈ Ω^N` with `f(s_0, …, s_{D−1}, z) = c·∏_p ⟨y_p, z⟩` in `Ω[z]` (`⟨y, z⟩ = Σ_k y_k z_k`), and `Ω`-linear maps `ev_p : V_j ⊗ Ω → Ω` (`0 ≤ j ≤ T`) with `ev_p(x_k v) = y_{p,k}·ev_p(v)`, such that `(ev_p)_p : V_0 ⊗ Ω → Ω^δ` is onto and, for `0 ≤ a < T − D`, the rule `Σ_{|α|=a} l^α v_α ↦ (ev_p(v_α))_{α,p}` (`v_α ∈ V_{T−a} ⊗ Ω`) is a well-defined linear map on `U(a)` with kernel `U(a + 1)`. That map is then onto `Ω^{{|α| = a} × {1, …, δ}}` (route, step (1)); ontoness is a consequence, not a hypothesis.

Put `r_T = rk M_T`, `N_0 = δ·binom(T − 1, D)`, `z = 1 − N_0/r_T`, `e_T = Σ_{a<T−D} binom(a + D − 1, D − 1)·(T − a) = binom(T − 1, D)·(T + D(D + 1))/(D + 1)`, `h = ht(f)/((D + 1)δ)` and `c_N = ½(log N + H_{N−1})` (6.6). Then `0 ≤ z < 1`, `z·r_T·(T − D) ≥ D(D + 1)(1 − z)·r_T`, and

```text
deĝ_n(M̄_T) ≥ e_T·ht(f) − c_N·( z·r_T·(T − D) − D(D + 1)(1 − z)·r_T ) − (1 − z)·r_T·( (T/2)·log β + log Λ_0 ) − z·r_T·( ((T − D)/2)·log β + log Λ_D ).
```

Since `e_T·ht(f) = (1 − z)·r_T·(T + D(D + 1))·h`, dividing by `r_T`, and since `h ≥ −c_N` by 6.6 (iv) for `f`:

```text
μ̂(M̄_T) ≥ (1 − z)·( (T + D(D + 1))·h + D(D + 1)·c_N − (T/2)·log β − log Λ_0 ) − z·( (T − D)·(c_N + ½·log β) + log Λ_D )
        ≥ (1 − z)·( T·h − (T/2)·log β − log Λ_0 ) − z·( (T − D)·(c_N + ½·log β) + log Λ_D ).
```

The number `1 − z` is the proportion of the rank carried by the `δ` points through the first `T − D` layers of the filtration, and `(1 − z)·T·h` is the contribution of the height of `f`. It need not be the leading term: the terms proportional to `T` add up to `T·((1 − z)·h − ½·log β − z·c_N)`, and `z` may depend on `T`. In the first Check below, with the quotient metrics of 1.3a on the binary forms (`β = 1`) multiplied by `2^j` on `M_j` (so `β = 4`, sharp, `Λ_0 = 1`, `Λ_D = 2`, `h = −¼` and `z = 2/(T + 1)`), both lines hold, the right side divided by `T` tends to `−¼ − log 2`, and the slope divided by `T` to `¼ − log 2`. The spanning terms `(1 − z)·log Λ_0 + z·log Λ_D` carry the overall scale of the norms of the `M̄_j`, which nothing else in the bound sees: multiplying every norm of every `M̄_j` by `e^A`, with the same `x_k`, keeps `β`, `h` and `z`, raises `log Λ_0` and `log Λ_D` by `A` and lowers `μ̂(M̄_T)` by exactly `A`, so both sides of each slope line drop by `A`. An application of 6.7 (or 6.7a) therefore has to bound `log Λ_0` and `log Λ_D` themselves.

In the geometric situation `X ⊂ ℙ^{N−1}` is an irreducible subvariety of dimension `D` and degree `δ`, `f` is its Chow form (of degree `δ = deg X` in each group), the `y_p` are the `δ` points of `X` on the generic linear subspace `l_0 = ⋯ = l_{D−1} = 0`, `ev_p` is evaluation at them, and (c) is a vanishing statement for the graded system. If the graded system lives on a variety `Y` mapped onto `X` by a base-point-free linear system, this reading needs `Y → X` of generic degree one: then `δ` is also the degree of the linear system, and `ev_p` evaluates at the point of `Y` above `y_p`. For generic degree `k` the linear system has degree `kδ`; evaluation at its `kδ` points on the generic section repeats each `y_p` `k` times, so with these `ev_p` hypotheses (b) and (c) can hold only for the Chow form `f^k` of the pushforward cycle `k·[X]`, with `kδ` in place of `δ`, and not for `f`: the system `u², v²` on `ℙ^1` has degree `2` and image `ℙ^1`, whose Chow form `det(s_0, s_1)` has degree `1` in each group, and with `V_j` the binary forms of degree `2j + 1` in `(u, v)`, (b) and (c) hold for `det(s_0, s_1)²` with `δ = 2` (`Δ = ±det(s_0, s_1)^{2e_T}`, `deg g = 0`).

The `δ` points of (c) are the **moving** points of the generic section: every `y_p` is nonzero (route, step (1)), and at level `0` (c) says that the forms of `V_T ⊗ Ω` killed by the `δ` evaluations are exactly `U(1) = Σ_{i<D} l_i·(V_{T−1} ⊗ Ω)`, the forms generated by the section. Whether (c) holds in the presence of a fixed part of the linear system depends on the spaces `V_j`. If the linear system on `Y` has a base locus `B`, the section vanishes on `B` too and every form of `U(1)` vanishes there; so if some form of `V_T ⊗ Ω` vanishes at the `δ` moving points but not on all of `B`, it lies in the kernel of the evaluations and not in `U(1)`, and (c) fails at level `0`, even though `Y → X` is birational and the relevant higher cohomology vanishes. Two examples. The system `u², uv` on `ℙ^1` has the base point `u = 0` and maps `ℙ^1` isomorphically onto `ℙ^1` (`f = det(s_0, s_1)`, `δ = 1`); with `V_j` the binary forms of degree `2j + 1`, the forms of `V_T` vanishing at the moving zero of `s_{0,1}u + s_{0,2}v` form a space of dimension `2T + 1` (it contains `v^{2T}·(s_{0,1}u + s_{0,2}v)`, which does not vanish at `u = 0`), while `U(1) = l_0·V_{T−1}`, `l_0 = u·(s_{0,1}u + s_{0,2}v)`, has dimension `2T`. On a smooth plane quartic `C` (genus `3`) with a point `P` and `L = K_C(P)`, every section of `L` vanishes at `P`, the map is the canonical embedding (degree `4`), and `V_j = H⁰(C, K_C ⊗ L^{j+2})` has no higher cohomology; yet a generic section `l` of `L` has `4` moving zeros while `dim V_T/l·V_{T−1} = deg L = 5`. A base locus does not by itself exclude (c), however: the same system `u², uv` with `V_j = u^j·K[u, v]_j` (the forms of degree `2j` divisible by `u^j`, and `ev_1(v)` the value of `v/u^j` at the point `(u, v) = y_1 = (−s_{0,2}, s_{0,1})`) satisfies (c) at every level, since division by `u^j` identifies `V_j` with the binary forms of degree `j` and the two multiplications with those by `u` and `v`, which is the first Check below. So when the linear system has a base locus, (c) is a statement about the actual `V_j` that has to be proved for them: birationality with the vanishing theorems does not give it, and the base locus does not refute it. Neither the verification of (c) nor the comparison of `h` with the normalised height of `X` is part of this target (Scope and ownership).

*Remark (a fixed divisor of a nef line bundle excludes (c)).* When the `V_j` are the complete spaces of adjoint forms of the powers of a nef and big line bundle whose linear system has a nonzero fixed divisor, (c) fails as soon as `T ≥ 2D`; the nefness of the undivided bundle cannot be dropped (end of this remark). Precisely: let `R` be a smooth projective variety of dimension `D` over `K`, `A` and `ℳ` nef and big line bundles on `R`, `Φ ≠ 0` an effective divisor such that `ℒ = ℳ(−Φ)` is generated by its global sections, `1_Φ` the canonical section of `O(Φ)`, and `J ⊂ H⁰(R, ℒ)` a subspace that generates `ℒ`, with a basis `u_1, …, u_N`; let `V_j = H⁰(R, K_R ⊗ A ⊗ ℳ^j)` (`0 ≤ j ≤ T`) with `x_k v = u_k·1_Φ·v`, and suppose `V_D ≠ 0`. For `a ≥ 0` let `G(a) = 1_Φ^a·H⁰(R, K_R ⊗ A ⊗ ℳ^D ⊗ ℒ^a) ⊂ V_{D+a}`, the forms of `V_{D+a}` divisible by `1_Φ^a`, and `Q_Φ(a) = dim V_{D+a} − dim G(a)`. Then `Q_Φ(a) ≥ 1` for every `a ≥ D`. Consequently, if `T ≥ 2D`, then over every extension `E` of `K` all vectors `x(w_1)⋯x(w_T)·m` (`w_i ∈ E^N`, `m ∈ V_0 ⊗ E`) and all vectors of `x(w_1)⋯x(w_{T−D})(V_D ⊗ E)` lie in the proper subspace `G(T − D) ⊗ E` of `V_T ⊗ E`, and (c) fails for `(V_j)` with every `f`, `δ`, `y_p` and `ev_p`: under (c), step (1) of the route below makes `U(a)` the sum of `U(a + 1)` and the vectors `l^α·x(w)^{T−a}·m` (`|α| = a`, `m ∈ V_0 ⊗ Ω`) for `a < T − D`, so `V_T ⊗ Ω = U(0)` would be spanned by such vectors and by `U(T − D) = Σ_{|α|=T−D} l^α(V_D ⊗ Ω)`, all of which lie in `G(T − D) ⊗ Ω`. *Proof.* For `a ≥ 0` the bundles `A ⊗ ℳ^{D+a}` and `A ⊗ ℳ^D ⊗ ℒ^a` are nef and big, so by Kawamata–Viehweg vanishing `dim V_{D+a}` and `dim G(a)` are Euler characteristics, and `Q_Φ` agrees on the integers `a ≥ 0` with a polynomial of degree at most `D`. `Q_Φ` is nondecreasing: for `t ∈ H⁰(R, ℒ)` vanishing identically on no component of `Φ`, multiplication by `t·1_Φ` maps `V_{D+a}` to `V_{D+a+1}` and `G(a)` into `G(a + 1)`, and if `t·1_Φ·φ` is divisible by `1_Φ^{a+1}` then `φ` is divisible by `1_Φ^a` (compare the orders of vanishing along the components of `Φ`; `R` is smooth), so the induced map `V_{D+a}/G(a) → V_{D+a+1}/G(a + 1)` is injective. `Q_Φ` is not identically zero: by Kodaira's lemma `ℳ^{k_0} ≅ O(H + E′)` with `H` ample, `E′ ≥ 0` and `k_0 ≥ 1`; for a component `Γ` of `Φ` of multiplicity `m_Γ`, a nonzero `φ_0 ∈ V_D` and an integer `n` with `(n + 1)k_0·m_Γ > ord_Γ(E′) + ord_Γ(φ_0)`, choose `j ≥ 1` such that `ℳ^{jnk_0}(jH)` is generated by its global sections and a section `τ` of it that does not vanish identically on `Γ`; then `φ_0·τ·1_{E′}^j` lies in `V_{D+a}` for `a = j(n + 1)k_0` and has order `ord_Γ(φ_0) + j·ord_Γ(E′) < a·m_Γ` along `Γ`, so it is not in `G(a)`. A nonzero polynomial of degree at most `D` that is nonnegative and nondecreasing on the integers `≥ 0` cannot vanish at an integer `a_0 ≥ D`, since it would vanish at `0, 1, …, a_0`. Finally `x(w_1)⋯x(w_T)·m = w_1⋯w_T·m·1_Φ^T` and `x(w_1)⋯x(w_{T−D})·v = w_1⋯w_{T−D}·v·1_Φ^{T−D}` (writing `w_i` also for `Σ_k w_{i,k}u_k`) are divisible by `1_Φ^{T−D}`, and `T − D ≥ D`. For `D = 1` Riemann–Roch gives `Q_Φ(a) = a·deg Φ`. The two examples above are of this kind: `u², uv` on `ℙ^1` with `V_j` the forms of degree `2j + 1` is the case `ℳ = O(2)`, `Φ` the point `u = 0`, `ℒ = O(1)`, `A = O(3)`, with `Q_Φ(a) = (2a + 4) − (a + 4) = a`; the plane quartic is the case `ℳ = K_C(P)`, `Φ = P`, `ℒ = K_C`, `A = ℳ²`, with `Q_Φ(a) = (17 + 5a) − (17 + 4a) = a`. The system `u², uv` with `V_j = u^j·K[u, v]_j` is not of this kind: its `V_j` are the forms of degree `2j` divisible by `1_Φ^j`, not all of them. Without a fixed divisor (`Φ = 0`) (c) can hold, as in the first Check below. Nor can the nefness of `ℳ` be dropped, although `ℒ` is nef (it is generated by its sections): on the blow-up `R` of `ℙ²` at a point, with `H` the pullback of a line and `E` the exceptional curve, take `A = 3H`, `ℳ = H + E` (big, and not nef: `ℳ·E = −1`), `Φ = E` (every section of `ℳ` is `1_E` times a section of `H`), `ℒ = H` and `J = H⁰(R, H)`. Since `K_R = −3H + E` and every section of `jH + kE` with `k ≥ 0` is `1_E^k` times a section of `jH`, `V_j = H⁰(R, jH + (j + 1)E) = 1_E^{j+1}·H⁰(R, jH)` and `G(a) = V_{D+a}`, so `Q_Φ = 0`; division by `1_E^{j+1}` identifies the system with the ternary forms of degree `j` and the multiplications by the coordinates, which satisfy (c) at every `T` (`D = 2`, `δ = 1`, `f = det(s_0, s_1, s_2)`, `ev_1` the evaluation at the point `l_0 = l_1 = 0`: `U(a)` consists of the forms vanishing there to order at least `a`, and the symbol of level `a` reads off their part of order exactly `a`). The proof above uses the nefness of `ℳ` twice: in Kawamata–Viehweg vanishing for `A ⊗ ℳ^{D+a}`, and in the ampleness of `ℳ^{jnk_0}(jH)`.

The proof rests on an identity among the `K`-linear data alone, on which 6.7a (iv) rests as well. In (d) only the finite-dimensional `K`-vector spaces `V_j`, the commuting `K`-linear maps `x_1, …, x_N`, and (b) and (c) are assumed: no lattice, no metric, no operator bound and not (a).

- (d) *The determinant identity.* Let `m_1, …, m_δ ∈ V_0` be such that the matrix `(ev_{p′}(m_p))_{p′,p}` is invertible (every family spanning `V_0` over `K` contains such vectors, by (c)), let `F_D ⊂ V_D` be a finite family spanning `V_D` over `K`, and put `l_D = x(s_D)`. Then `0 ≤ z < 1`, and there are `z·r_T` pairs `(γ, m′)` with `γ ∈ ℕ^D`, `|γ| = T − D` and `m′ ∈ F_D` such that the `r_T` polynomial vectors `l^α·l_D^{T−a}·m_p` (`0 ≤ a < T − D`, `|α| = a`, `1 ≤ p ≤ δ`) and `l^γ·m′` have, in a `K`-basis of `V_T`, a determinant of the form `Δ = g·f^{e_T}` with `0 ≠ g ∈ K[s_0, …, s_{D−1}]`, homogeneous in each group and of total degree `z·r_T·(T − D) − D(D + 1)(1 − z)·r_T ≥ 0`.

*Route.* Steps (1)–(4) prove (d): they use the vectors chosen in step (2) only through the invertibility of `(ev_{p′}(m_p))` and the spanning of `V_D`, so any `m_p` and any spanning family as in (d) will do. Steps (5) and (6) apply (d) to the vectors of (a). (1) The symbol map of level `a` is onto: the `y_p` are nonzero because `f(s_0, …, s_{D−1}, ·) ≠ 0`, so there is `w ∈ Ω^N` with `⟨y_p, w⟩ ≠ 0` for every `p`; for `|α| = a` and `m ∈ V_0 ⊗ Ω` the vector `l^α·x(w)^{T−a}·m ∈ U(a)` has the symbol `([α′ = α]·⟨y_p, w⟩^{T−a}·ev_p(m))_{α′,p}` (from `ev_p(x(w)v) = ⟨y_p, w⟩·ev_p(v)`), and as `m` varies these fill the block of `α`, because `(ev_p)_p` is onto `Ω^δ` and the factors `⟨y_p, w⟩^{T−a}` are nonzero. So the filtration of (c) gives `dim V_T = Σ_{a<T−D} binom(a + D − 1, D − 1)·δ + dim U(T − D) = N_0 + dim U(T − D)`, hence `z·r_T = dim U(T − D) ≥ 0` and `N_0 ≥ δ ≥ 1`. (2) Columns: by (a) and (c) choose `m_1, …, m_δ ∈ M_0` of norm `≤ Λ_0` with `(ev_{p′}(m_p))_{p′,p}` invertible, and take, for `a < T − D`, `|α| = a` and `p ≤ δ`, the column `l^α·l_D^{T−a}·m_p` with `l_D = x(s_D)`; and choose `z·r_T` vectors `l^γ·m′` with `γ ∈ ℕ^D`, `|γ| = T − D`, and `m′` in a basis of `V_D` by vectors of `M_D` of norm `≤ Λ_D`, that form an `Ω`-basis of `U(T − D)` (these products span it). The `r_T` columns are polynomial vectors in `s` with coefficients in `M_T`, homogeneous in each group; let `Δ ∈ K[s]` be their determinant in a `K`-basis of `V_T`. (3) In an `Ω`-basis adapted to `U(0) ⊃ U(1) ⊃ ⋯ ⊃ U(T − D) ⊃ 0` the matrix is block lower triangular: a column of level `a` lies in `U(a)`, and its image in `U(a)/U(a + 1) ≅ Ω^{{|α|=a}×{1,…,δ}}` has entries `[α = α′]·⟨y_{p′}, s_D⟩^{T−a}·ev_{p′}(m_p)`, while the last `z·r_T` columns form a basis of `U(T − D)`. Hence `Δ = c_0·∏_p ⟨y_p, s_D⟩^{e_T}` with `c_0 ∈ Ω^×`, that is `Δ = c_0 c^{−e_T}·f^{e_T}` in `Ω[s_D]`; so `q = Δ/f^{e_T}` lies in `Ω ∩ K(s_0, …, s_D) = K(s_0, …, s_{D−1}) = Frac A`. Since `f` is primitive in `s_D` over `A`, so is `f^{e_T}` (Gauss), and Gauss's lemma (Mathlib `Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map`, in one variable after a Kronecker substitution in the `N` variables of `s_D`, which keeps the set of coefficients) gives `q = g ∈ A`: `Δ = g·f^{e_T}` with `0 ≠ g ∈ K[s_0, …, s_{D−1}]`. (4) Degrees: in each group `s_i`, `i < D`, the level-`0` columns contribute `δ·Σ_{a<T−D} (a/D)·binom(a + D − 1, D − 1) = δ·binom(T − 1, D + 1)` and the other columns `z·r_T·(T − D)` in all `D` groups together; subtracting the degree `D·δ·e_T` of `f^{e_T}` in these groups, `g` has total degree `z·r_T·(T − D) − D(D + 1)(1 − z)·r_T ≥ 0`, using `e_T − binom(T − 1, D + 1) = (D + 1)·binom(T − 1, D)`. The two expressions for `e_T` agree by `Σ_{a≤m} binom(a + D − 1, D − 1) = binom(m + D, D)` and `Σ_{a≤m} a·binom(a + D − 1, D − 1) = D·binom(m + D, D + 1)`. (5) Heights: by 6.6 (ii) and (iv), `ht(Δ) = e_T·ht(f) + ht(g) ≥ e_T·ht(f) − c_N·deg g`; by 6.6 (v), with the column bounds `β^{T/2}·Λ_0` and `β^{(T−D)/2}·Λ_D` on the unit spheres (`T`, resp. `T − D`, applications of some `x(u)` with `|u| = 1`), `deĝ_n(M̄_T) ≥ ht(Δ) − (1 − z)·r_T·((T/2)·log β + log Λ_0) − z·r_T·(((T − D)/2)·log β + log Λ_D)`. (6) The second line of the slope bound: 6.6 (iv) for `f`, of degree `δ` in each of `D + 1` groups, gives `ht(f) ≥ −c_N·(D + 1)δ`, that is `h ≥ −c_N`, so `D(D + 1)·(h + c_N) ≥ 0`, and `1 − z > 0`.

*Needs:* 6.6; Mathlib `Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map`.

**Checks.**

- `ℙ^1`: `N = 2`, `D = 1`, `δ = 1`, `V_j` the binary forms of degree `j` with the multiplications by `x_1, x_2`, `f = det(s_0, s_1)`, `ev_1` the evaluation at the point `y_1 = (−s_{0,2}, s_{0,1})` of the line `l_0 = 0`. Here `r_T = T + 1`, `N_0 = T − 1`, `z·r_T = 2`, `deg g = 2(T − 1) − 2(T − 1) = 0`, and `Δ = ±f^{e_T}` with `e_T = (T − 1)(T + 2)/2`; for `T = 3`, `e_T = 5`. Over `ℚ`, `ht(f) = −½` (6.6, third Check), so `h = −¼ ≥ −c_2 = −½(log 2 + 1)`, and the first line of the slope bound exceeds the second by `(1 − z)·2(h + c_2) ≈ 1.19·(1 − z)`.
- A conic: `X = {x_1x_3 = x_2²} ⊂ ℙ²` (`N = 3`, `D = 1`, `δ = 2`) with `V_j` the binary forms of degree `2j + 2` in `(u, v)` and `x_1, x_2, x_3 = u², uv, v²`, `f` the resultant of the two binary quadratics `⟨s_0, (u², uv, v²)⟩` and `⟨s_1, (u², uv, v²)⟩`: `r_T = 2T + 3`, `N_0 = 2(T − 1)`, `z·r_T = 5`, `deg g = T − 1`. With `V_j` the forms of degree `2j` instead, `V_0` is one-dimensional and cannot map onto `Ω²`: the hypothesis on `V_0` in (c) fails, as it must for `δ > dim V_0`.
- `ℙ²` (`N = 3`, `D = 2`, `δ = 1`, `f = det(s_0, s_1, s_2)`), `T = 4`: `r_T = 15`, `N_0 = 3`, `z·r_T = 12`, `e_T = 10`, `deg g = 12·2 − 6·3 = 6`.
- Exponent: in the last group `Δ` has degree `δ·e_T`, while `f^{T·binom(T−1,D)}` has degree `δ·T·binom(T − 1, D)`; since `e_T = T·binom(T − 1, D)` exactly when `T = D + 1` and `e_T < T·binom(T − 1, D)` for `T ≥ D + 2`, the cruder exponent `T·binom(T − 1, D)` does not divide `Δ` as soon as `T ≥ D + 2` (for `ℙ^1` and `T = 3`: `6 > 5`).

### 6.7a The explicit Hilbert–Samuel inequality over a Hermitian coordinate bundle

Let `J̄ = (M_J, (h^J_σ)_σ)` be a Hermitian vector bundle of rank `N ≥ 1` over `O_K`, the **coordinate bundle**, and `J = M_J ⊗ K`; the standard structure of 6.6 and 6.7 is `J̄ = Ō_K^N`. For `D ≥ 0`, a **multiform on `J`** of multidegree `(e_0, …, e_D)` is a polynomial function `P` on `J^{D+1}` that is homogeneous of degree `e_i ≥ 0` in the `i`-th argument (an element of `⊗_i Sym^{e_i}(J^∨)`); in the coordinates of a `K`-basis of `J` it is a polynomial as in 6.6. For `P ≠ 0` put

```text
|P|_{J̄,𝔭} = Gauss norm of P in the coordinates of an O_𝔭-basis of M_J ⊗ O_𝔭,
m_{J̄,σ}(P) = ∫_{S_σ^{D+1}} log |P_σ(u_0, …, u_D)| dν_σ(u_0)⋯dν_σ(u_D),
ht_J̄(P) = (1/[K:ℚ]) · ( Σ_𝔭 log |P|_{J̄,𝔭} + Σ_{σ∈Σ_K} m_{J̄,σ}(P) ),
```

where `P_σ` is the extension of `P` to `J_σ`, `S_σ ⊂ J_σ` is the unit sphere of `h^J_σ`, and `ν_σ` is the image of the measure `ν` of 6.6 under an isometry `ℂ^N → J_σ`. A real number `c` is a **floor** for `J̄` if `ht_J̄(P) ≥ −c·Σ_i e_i` for every `D ≥ 0` and every nonzero multiform `P` on `J`. Provide:

- (i) *Heights relative to `J̄`, and floors.* `|P|_{J̄,𝔭}` does not depend on the local basis, nor `ν_σ` on the isometry; `|P|_{J̄,𝔭} = 1` for all but finitely many `𝔭`, so the sum over `𝔭` is finite; `log |P_σ|` is integrable for `ν_σ^{⊗(D+1)}`, and `sup_{S_σ^{D+1}} |P_σ| ≤ exp(m_{J̄,σ}(P) + ½H_{N−1}·Σ_i e_i)`. Moreover `ht_J̄(PQ) = ht_J̄(P) + ht_J̄(Q)`; `ht_J̄(aP) = ht_J̄(P)` for `a ∈ K^×`; `ht_{J̄_{O_L}}(P) = ht_J̄(P)` for every finite extension `L/K`, where `J̄_{O_L}` is the base change of `J̄` and `P` is read as a multiform on `J ⊗_K L`; `ht_{J̄′}(P ∘ φ^{−1}) = ht_J̄(P)` for an isometry `φ : J̄ → J̄′`; `ht_{J̄(t)}(P) = ht_J̄(P) + t·Σ_i e_i`; for `J̄ = Ō_K^N`, `ht_J̄` is the height `ht` of 6.6; and for a `K`-basis `b` of `J`, the determinant `det_b` (a multiform of multidegree `(1, …, 1)` in `N` arguments) has `ht_J̄(det_b) = ht(det) + deĝ_n(J̄)`, where `ht(det)` is the height (6.6) of the `N × N` determinant (`−½` for `N = 2`, 6.6, third Check). For floors: if `c` is a floor for `J̄`, so is every `c′ ≥ c`; `c` is a floor for `J̄` if and only if `c − t` is a floor for `J̄(t)`; for every finite extension `L/K`, `c` is a floor for `J̄` if and only if it is a floor for `J̄_{O_L}`, although a floor for `J̄` is tested on the multiforms over `K` only; an isometry `J̄ → J̄′` carries the floors of `J̄` to those of `J̄′`; `c_N` is a floor for `Ō_K^N`; and every `J̄` has a floor ((ii)).
- (ii) *Floors from spanning families.* If `u_1, …, u_n ∈ M_J` span `J` over `K` and `‖Σ_k y_k u_k‖_σ ≤ ω_σ·|y|` for all `σ` and `y ∈ ℂ^n`, then `½·log n + ½·H_{N−1} + (1/[K:ℚ])·Σ_σ log ω_σ` is a floor for `J̄`. In particular, if `‖u_k‖_σ ≤ Λ` for all `k` and `σ`, then `log(nΛ) + ½·H_{N−1}` and the larger `log(nΛ) + ½·(log n + 1)` are floors; and for `Ō_K^N` and its standard basis the floor is `c_N` (6.6 (iv)).
- (iii) *Hadamard bound.* Let `Ē` be a Hermitian vector bundle of rank `r ≥ 1`, `b` a `K`-basis of `E_K`, and `c_1, …, c_r : J^{D+1} → E_K` polynomial maps, each homogeneous in every argument, whose coefficients in the coordinates of an `O_𝔭`-basis of `M_J ⊗ O_𝔭` lie in `E ⊗ O_𝔭` for every `𝔭`, with `Δ = det_b(c_1, …, c_r) ≠ 0`. Then

```text
deĝ_n(Ē) ≥ ht_J̄(Δ) − (1/[K:ℚ]) · Σ_k Σ_σ log sup_{u ∈ S_σ^{D+1}} ‖c_k(u)‖_σ.
```

- (iv) *The inequality.* Let `D ≥ 1`, `T ≥ D + 1` and `δ ≥ 1` be integers. A **graded system over `J̄`** of degree `T` consists of Hermitian vector bundles `M̄_0, …, M̄_T` with `V_j = M_{j,K}` and `K`-bilinear maps `J × V_j → V_{j+1}`, `(u, v) ↦ x(u)v` (`0 ≤ j < T`), such that `x(u)x(u′) = x(u′)x(u)`, `x(u)(M_j) ⊂ M_{j+1}` for every `u ∈ M_J` (equivalently, for every `u` in a family generating `M_J` over `O_K`; the inclusion for a family that only spans `J` over `K` does not suffice: on `M_J = ℤ²` and `M_j = Sym^j ℤ²`, the maps `x(u)v = uv/2` preserve the lattices for `u = 2e_1, 2e_2` and not for `u = e_1`), and, for a real `β > 0`, `‖x(u)v‖_σ ≤ √β·‖u‖_σ·‖v‖_σ` for all `σ`, `j`, `u ∈ J_σ` and `v ∈ V_{j,σ}`, the norm of `u` being that of `J̄`. In the coordinates of a `K`-basis `b_1, …, b_N` of `J`, with `x_k = x(b_k)`, this is a graded system as in 6.7 except for the integrality of the `x_k` and the operator bound. Let `f` be a multiform on `J` of degree `δ` in each of its `D + 1` arguments such that the system and `f` satisfy (a)–(c) of 6.7 in these coordinates ((a) is a condition on the system, (b) on `f`, (c) on both); the conditions do not depend on the basis (in (c), `K(s_0, …, s_{D−1})` is the function field of `J^D`, `y_p ∈ J^∨ ⊗ Ω` is a linear form with `⟨y_p, z⟩ = y_p(z)`, and `ev_p(x(u)v) = y_p(u)·ev_p(v)` for `u ∈ J`). With `r_T`, `N_0`, `z` and `e_T` as in 6.7, `h_J̄ = ht_J̄(f)/((D + 1)δ)` and any floor `c_J̄` for `J̄`: `0 ≤ z < 1`, `z·r_T·(T − D) ≥ D(D + 1)(1 − z)·r_T`, `h_J̄ ≥ −c_J̄`, and

```text
deĝ_n(M̄_T) ≥ e_T·ht_J̄(f) − c_J̄·( z·r_T·(T − D) − D(D + 1)(1 − z)·r_T ) − (1 − z)·r_T·( (T/2)·log β + log Λ_0 ) − z·r_T·( ((T − D)/2)·log β + log Λ_D ),
μ̂(M̄_T) ≥ (1 − z)·( (T + D(D + 1))·h_J̄ + D(D + 1)·c_J̄ − (T/2)·log β − log Λ_0 ) − z·( (T − D)·(c_J̄ + ½·log β) + log Λ_D )
        ≥ (1 − z)·( T·h_J̄ − (T/2)·log β − log Λ_0 ) − z·( (T − D)·(c_J̄ + ½·log β) + log Λ_D ).
```

For `J̄ = Ō_K^N` and `c_J̄ = c_N`, (iv) is 6.7. Both rest on the determinant identity 6.7 (d), which concerns the `K`-linear data alone, so the algebraic part of the argument is the same for both. The coordinate bundle enters (iv) three times: through the height `ht_J̄(f)`, which carries the height term `(1 − z)·T·h_J̄`; through `β`, since the operator bound is taken in the norm of `J̄`, which carries `(T/2)·log β` in the part weighted by `1 − z` and `((T − D)/2)·log β` in the part weighted by `z`; and through the floor, which multiplies the degree of the cofactor and so enters only the part weighted by `z` and the bounded term `D(D + 1)(1 − z)·c_J̄`. Only the floor is confined to the cofactor. Besides these, the spanning hypothesis (a) enters through the two short-spanning costs `(1 − z)·log Λ_0 + z·log Λ_D` (times `r_T` in the first display), and no other term of (iv) can absorb them: multiplying every norm of every `M̄_j` by `e^A`, with `J̄` and the multiplications fixed, keeps `β`, `z`, `h_J̄` and the floors, raises `log Λ_0` and `log Λ_D` by `A` and lowers `μ̂(M̄_T)` by exactly `A` (as in 6.7). Translating a graded system over `J̄` into 6.7 through a basis of `J` in `M_J` never gives a better bound than (iv) with the floor of (ii) for that basis, and for the projective space of the coordinates (`M̄_j = Sym^j J̄`, `f` the determinant) it costs a multiple of `(1 − z)·T` in the slope bound unless `J̄` is a rescaled `Ō_K^N` (fourth Check). Translating through `n > N` generators of `M_J` with their quotient norm costs `½·(H_{n−1} − H_{N−1})·((1 − z)·T + z·(T − D))` (sixth Check).

*Route.* (i) A change of `O_𝔭`-basis substitutes a matrix of `GL_N(O_𝔭)`, which does not increase the Gauss norm, and neither does its inverse; `ν` is invariant under the unitary group (BanachSpaceTheory B7). An `O_𝔭`-basis of `M_J ⊗ O_𝔭` can be chosen in `J`, so in its coordinates `P` is a polynomial over `K`; at `σ`, `P_σ` composed with an isometry `ℂ^N → J_σ` is a complex polynomial. For a `K`-basis `b` of `J` in `M_J`, `⊕_k O_K b_k` has finite index in `M_J`, so `b` is an `O_𝔭`-basis of `M_J ⊗ O_𝔭` for every `𝔭` prime to that index, and the finitely many nonzero coefficients of `P` in the coordinates of `b` are `𝔭`-adic units for almost all `𝔭`. The routes of the integrability in 6.6 (i), of 6.6 (iii) and of the multiplicativity of the Gauss norm in 6.6 (ii) concern one polynomial at one place, so they apply here and give integrability, the bound on the supremum and multiplicativity (Mathlib `MvPowerSeries.gaussNorm_mul_eq_mul` at each `𝔭`; at `σ` the logarithm of a product). Invariance under `K^×` is the product formula. Invariance under a finite extension `L/K` is as in 6.6 (i): an `O_𝔭`-basis of `M_J ⊗ O_𝔭` is an `O_𝔓`-basis of `(M_J ⊗ O_L) ⊗ O_𝔓` for every `𝔓 | 𝔭`, the local degrees adding up to `[L:K]`, and each `σ` has `[L:K]` extensions `τ`, at which the base change (ArakelovGeometryAndAbelianHeights §1.2) carries the metric `h^J_σ`. An isometry carries local bases to local bases and unit spheres to unit spheres; the unit spheres of `J̄(t)` are the `e^t·S_σ`; for `Ō_K^N` the standard basis is local at every `𝔭` and orthonormal at every `σ`. For `det_b`: in an orthonormal basis of `J_σ`, `det_b` is the determinant divided by the determinant of `b`, so `m_{J̄,σ}(det_b) = m_σ(det) − log ‖b_1 ∧ ⋯ ∧ b_N‖_σ`; at `𝔭`, `|det_b|_{J̄,𝔭} = ‖b_1 ∧ ⋯ ∧ b_N‖_𝔭^{−1}`; and the generic-section formula of ArakelovGeometryAndAbelianHeights §1.3 for `det J̄` sums the correction terms to `deĝ_n(J̄)`. Floors: upward closed because `Σ_i e_i ≥ 0`; the rescaling law moves every bound `ht_J̄(P) ≥ −c·Σ_i e_i` to `ht_{J̄(t)}(P) ≥ −(c − t)·Σ_i e_i`, and back; a floor for `J̄_{O_L}` is one for `J̄` by the invariance under extension, and conversely, for a nonzero multiform `P` on `J ⊗_K L` of multidegree `(e_i)`, let `M/K` be a finite Galois extension containing `L` and let `G = Gal(M/K)` act on the coefficients of multiforms in a `K`-basis of `J`: `Q = ∏_{g∈G} gP` is `G`-invariant, hence a nonzero multiform on `J` of multidegree `([M:K]·e_i)`, and `ht_J̄(Q) = [M:K]·ht_{J̄_{O_L}}(P)` by the invariance under extension, multiplicativity over `M`, and `ht_{J̄_{O_M}}(gP) = ht_{J̄_{O_M}}(P)` (`g` maps `M_J ⊗ O_M` to itself, `|gP|_{J̄_{O_M},𝔓} = |P|_{J̄_{O_M},g^{−1}𝔓}`, and `m_{J̄_{O_M},τ}(gP) = m_{J̄_{O_M},τ∘g}(P)`, where `τ` and `τ ∘ g` extend the same `σ`), so the bound `ht_J̄(Q) ≥ −c·[M:K]·Σ_i e_i`, divided by `[M:K]`, is the bound for `P`; `P ↦ P ∘ φ^{−1}` is a bijection between the multiforms on `J` and on `J′` that keeps the multidegree and the height; `c_N` by 6.6 (iv), since `ht_{Ō_K^N} = ht`. (ii) Let `W : K^n → J`, `y ↦ Σ_k y_k u_k`. It is onto, so `P^W = P ∘ W^{D+1}` is a nonzero polynomial over `K` in `D + 1` groups of `n` variables, and its projective coefficient height is `≥ 0` (DiophantineApproximationAndTranscendence §1.3). At `𝔭` the matrix of `W` in an `O_𝔭`-basis of `M_J ⊗ O_𝔭` is integral, so the Gauss norm of `P^W` is at most `|P|_{J̄,𝔭}`. At `σ`, each coefficient of `σ(P^W)` is at most `n^{(Σ_i e_i)/2}` times the supremum of `|σ(P^W)|` on the product of the unit spheres of `ℂ^n` (the torus average of the route of 6.6 (iv)), which by homogeneity is at most `ω_σ^{Σ_i e_i}·sup_{S_σ^{D+1}} |P_σ|`, and (i) bounds this supremum, on the spheres of `J_σ`: this is why the floor carries `H_{N−1}`, with the rank `N`, and not `H_{n−1}`. Adding the logarithms over all places gives `0 ≤ ht_J̄(P) + (½·log n + ½·H_{N−1} + (1/[K:ℚ])·Σ_σ log ω_σ)·Σ_i e_i`. For `‖u_k‖_σ ≤ Λ`, `‖Σ_k y_k u_k‖_σ ≤ Λ·Σ_k |y_k| ≤ √n·Λ·|y|`; `H_{N−1} ≤ 1 + log n` because `N ≤ n`; and `n = N`, `ω_σ = 1` gives `c_N`. When `J̄` carries the quotient norm of `W` and the `u_k` generate `M_J ⊗ O_𝔭` at every `𝔭`, the same floor (with `ω_σ = 1`) also follows through the spherical mean on the spheres of `ℂ^n`, with no loss: the sixth Check gives `ht(P^W) = ht_J̄(P) − ½·(H_{n−1} − H_{N−1})·Σ_i e_i`, 6.6 (iv) gives `ht(P^W) ≥ −c_n·Σ_i e_i`, and `c_n − ½·(H_{n−1} − H_{N−1}) = ½·log n + ½·H_{N−1}`. The loss computed in the sixth Check arises only when 6.7 as a whole is applied through `W`: its Hadamard bound 6.6 (v) on the spheres of `ℂ^n` meets the spherical mean of the determinant of the columns composed with `W`, which is lower by `½·(H_{n−1} − H_{N−1})` per unit of degree, against the same column bounds. (iii) As 6.6 (v): on `S_σ^{D+1}`, `|Δ_σ(u)| ≤ ‖det_b‖_σ·∏_k ‖c_k(u)‖_σ` by Hadamard's inequality in an orthonormal basis of `E_σ` (SuccessiveMinima §0.1), with `‖det_b‖_σ = ‖b_1 ∧ ⋯ ∧ b_r‖_σ^{−1}`; at `𝔭` every coefficient of `Δ` in the coordinates of an `O_𝔭`-basis of `M_J ⊗ O_𝔭` is a sum of values `det_b(v_1, …, v_r)` with `v_k ∈ E ⊗ O_𝔭`, so `log |Δ|_{J̄,𝔭} ≤ −log ‖b_1 ∧ ⋯ ∧ b_r‖_𝔭`; the generic-section formula for `det Ē` sums the local bounds. (iv) The route of 6.7, in the coordinates of a `K`-basis of `J`, in which the maps `x_k = x(b_k)`, (b) and (c) are as in 6.7 (d). By (a) and (c) choose `m_1, …, m_δ ∈ M_0` of norm `≤ Λ_0` with `(ev_{p′}(m_p))` invertible, and take the vectors of `M_D` of norm `≤ Λ_D` of (a) as the family spanning `V_D`: 6.7 (d) gives `0 ≤ z < 1`, the `r_T` columns, and `Δ = g·f^{e_T}` with `0 ≠ g` a multiform on `J` in the first `D` arguments of total degree `deg g = z·r_T·(T − D) − D(D + 1)(1 − z)·r_T ≥ 0`. Neither the lattice nor the metrics of `J̄` enter (d), and the vectors of (a) enter it only through the invertibility and the spanning. Step (5) of 6.7's route with this target: `ht_J̄(Δ) = e_T·ht_J̄(f) + ht_J̄(g) ≥ e_T·ht_J̄(f) − c_J̄·deg g` by (i) and the floor; the columns satisfy the integrality hypothesis of (iii), because in an `O_𝔭`-basis `(ε_k)` of `M_J ⊗ O_𝔭` their coefficients are sums of vectors `x(ε_{k_1})⋯x(ε_{k_T})·m` and `x(ε_{k_1})⋯x(ε_{k_{T−D}})·m′` with `m ∈ M_0`, `m′ ∈ M_D`, which lie in `M_T ⊗ O_𝔭` since `x(M_J)·M_j ⊂ M_{j+1}`; and on `S_σ^{D+1}` the columns have norms at most `β^{T/2}·Λ_0`, resp. `β^{(T−D)/2}·Λ_D`, by the operator bound in the norm of `J̄`. Then (iii) gives the first display. Step (6): the floor for `f`, of degree `δ` in each of `D + 1` arguments, gives `h_J̄ ≥ −c_J̄`, so `D(D + 1)(h_J̄ + c_J̄) ≥ 0`, and `1 − z > 0`.

*Needs:* 6.6, 6.7 (d) (with the notation and the hypotheses (a)–(c) of 6.7); ArakelovGeometryAndAbelianHeights §§1.2–1.3; DiophantineApproximationAndTranscendence §1.3 (`MvPolynomial.logHeight` and `h(P) ≥ 0`); SuccessiveMinima §0.1 (`orthonormal_coordinate_hadamard`); BanachSpaceTheory B7 (unitary invariance of `ν`); Mathlib `MvPowerSeries.gaussNorm_mul_eq_mul`, `NumberField.prod_abs_eq_one`.

**Checks.**

- *Standard structure and rescaling.* For `Ō_K^N` with its standard basis, (ii) gives `c_N` and (iv) is 6.7 word for word. Replacing `J̄` by `J̄(t)` (same lattices and multiplications) raises `h_J̄` by `t` (i), turns an admissible `β` into `β·e^{2t}` and the floor of (ii) into that floor minus `t`; both displays of (iv) are unchanged, as they must be. So (iv) for `Ō_K^N(t)` is again 6.7; the opposite sign of the frame term in `ht_J̄` or in the floor would break this invariance.
- *Rank one.* `J̄ = (O_K, ‖1‖_σ = a_σ)` and `P(u) = u^e` (one argument): the unit sphere of `J_σ` is `|u| = 1/a_σ`, so `ht_J̄(P) = −(e/[K:ℚ])·Σ_σ log a_σ`, and the floor of (ii) for `u_1 = 1` (`n = N = 1`, `ω_σ = a_σ`) is attained.
- *`ℙ^1` with a frame that is not orthonormal.* `K = ℚ`, `J̄ = ℤx_1 ⊕ ℤx_2` with `x_1 ⊥ x_2`, `‖x_1‖ = 1`, `‖x_2‖ = a`; `M̄_j = Sym^j J̄` with the quotient metrics of 1.3a and `x(u)v = uv`, so `β = 1` (the quotient norm of `uv` is at most `‖u ⊗ ṽ‖ = ‖u‖·‖ṽ‖` for every lift `ṽ` of `v`); `f` the determinant, `D = δ = 1`; `Λ_0 = 1`, `Λ_D = max(1, a)` (the spanning family `x_1, x_2` of `V_1 = J`); the floor `c_2 + log max(1, a)` of (ii) for `x_1, x_2`. By (i), `ht_J̄(f) = −½ + deĝ_n(J̄) = −½ − log a`, and by 1.3a (ii) the monomials `x_1^{T−k}x_2^k` are orthogonal of squared norms `a^{2k}/binom(T, k)`, so `deĝ_n(M̄_T) = ½·Σ_k log binom(T, k) − (T(T + 1)/2)·log a`. As in 6.7, `r_T = T + 1`, `z·r_T = 2`, `deg g = 0` and `e_T = (T − 1)(T + 2)/2`; the first display of (iv) reads `deĝ_n(M̄_T) ≥ e_T·(−½ − log a) − 2·log max(1, a)`, with slack exactly `|log a| + ½·Σ_k log binom(T, k) + e_T/2`: the frame term `−e_T·log a` reproduces the coefficient `−T(T + 1)/2` of `log a` up to `|log a|`. For `a = 2`, `T = 3`: `−6 log 2 + log 3 ≈ −3.06 ≥ −5/2 − 7 log 2 ≈ −7.35`; with the opposite sign (`ht_J̄(f) = −½ + log a`) the right side would be `−5/2 + 3 log 2 ≈ −0.42`, and the inequality would be false. The floor enters only the second line of the slope form: here `deg g = 0`, so it cancels in the first display and in the first slope line (`(1 − z)·D(D + 1) = z·(T − D)`), and the second line uses it as `h_J̄ ≥ −c_J̄`: `μ̂(M̄_3) ≈ −0.77 ≥ ½·3h_J̄ − ½·(2c_J̄ + log 2) ≈ −2.78`.
- *Translating into 6.7 by coordinates.* For a `K`-basis `b ⊂ M_J` of `J` with coordinate maps `B_σ : ℂ^N → J_σ`, a graded system over `J̄` is a graded system of 6.7 with `x_k = x(b_k)` and `β·max_σ ‖B_σ‖²` in place of `β`, and 6.7 applies with the standard height `ht(f ∘ B)` of `f` in these coordinates. This never gains. First, `ht(f ∘ B) ≤ ht_J̄(f) + (D + 1)δ·(1/[K:ℚ])·Σ_σ log ‖B_σ‖`: at `𝔭` an integral substitution does not increase the Gauss norm; at `σ`, write `B_σ = ‖B_σ‖·Q·diag(t)·R` with `Q : ℂ^N → J_σ` an isometry, `R` unitary and `t ∈ (0, 1]^N`; by the unitary invariance of `ν` it suffices that `φ(t) = ∫ log |f_σ(Q·diag(t)·u_0, …, Q·diag(t)·u_D)| dν(u_0)⋯dν(u_D)` is at most `m_{J̄,σ}(f)` on the closed polydisc, and it is, because `φ` is plurisubharmonic in `t ∈ ℂ^N` and equal to `m_{J̄,σ}(f)` on the torus `|t_k| = 1` (maximum principle, one variable at a time). Then, with `deg g` from 6.7 (d) and `e_T·(D + 1)δ = (1 − z)·r_T·(T + D(D + 1))`, the first display of (iv) with the floor `c_N + (1/[K:ℚ])·Σ_σ log ‖B_σ‖` of (ii) for `b` exceeds the first display of 6.7 through `b` by at least `((1 − z)·T + z·(T − D))·r_T·(max_σ log ‖B_σ‖ − (1/[K:ℚ])·Σ_σ log ‖B_σ‖) ≥ 0`, and each slope line by at least that amount divided by `r_T`. For `M̄_j = Sym^j J̄` and `f = det_b` (the projective space of the coordinates itself) the loss is strict unless `J̄` is a rescaled `Ō_K^N`: `ht(f ∘ B) = ht(det)`, while `h_J̄ = ht(det)/N + μ̂(J̄)` by (i); so the part `(1 − z)·T·(h_J̄ − ½·log β)` of the slope bound becomes `(1 − z)·T·(h_J̄ − ½·log β − μ̂(J̄) − max_σ log ‖B_σ‖)`. By the Gram formula (1.2) for `b`, `deĝ(J̄) = Σ_𝔭 idx_𝔭(M_J : ⊕_k O_K b_k)·log N𝔭 − Σ_σ log |det B_σ| ≥ −N·Σ_σ log ‖B_σ‖`, so the loss `μ̂(J̄) + max_σ log ‖B_σ‖` is `≥ 0`, and it vanishes only if `b` is an `O_K`-basis of `M_J` that is orthonormal up to one common factor at every `σ`, that is, only if `J̄ ≅ Ō_K^N(t)`. In the previous Check (`a = 2`, coordinates `x_1, x_2`, so `β = 4`), 6.7 gives `−5/2 − 12 log 2 ≈ −10.82`, worse than (iv) by `e_T·log 2`.
- *A cofactor of positive degree: the conic.* The conic of 6.7's second Check (`K = ℚ`, `N = 3`, `D = 1`, `δ = 2`; `V_j` the binary forms of degree `2j + 2` in `(u, v)` with the quotient metrics of 1.3a and `M_j` the integral ones; `J` the binary quadratics, with the coordinates `(s_1, s_2, s_3)` of `s_1u² + s_2uv + s_3v²`, and `x(w)v = wv`), with `T = 2`: `r_T = 7`, `e_T = 2`, `deg g = 1`. Hypothesis (c) holds with `ev_p` the evaluation at the two zeros of `l_0 = s_{0,1}u² + s_{0,2}uv + s_{0,3}v²` (a form vanishing at both is a multiple of `l_0`), and `f` is the resultant of `l_0` and `l_1`. The columns `l_1²·u²`, `l_1²·v²` and `l_0·m′` for the five quartic monomials `m′` have determinant `Δ = ±s_{0,2}·f²` in the monomial basis of `V_2` (for `T = 3`, `Δ = ±s_{0,2}²·f⁵`), so `g = ±s_{0,2}`, which vanishes where `u²` and `v²` take proportional values at the two zeros of `l_0`. For the standard structure, `ht(g) = −½·H_2 = −¾ ≥ −c_3 ≈ −1.30`. For `M_J = ℤu² ⊕ ℤuv ⊕ ℤ(u² + 2v²)`, of index `2` in the integral quadratics, with the Gram matrix `G = [[2, 1, 0], [1, 3, 1], [0, 1, 5]]` in the monomial coordinates: `s_2` is a coordinate of that basis, so `|g|_{J̄,p} = 1` for every prime `p`, and `m_{J̄,σ}(g)` is the logarithm of the dual norm `((G^{−1})_{22})^{1/2}` of `s_2` minus `½·H_2` (as in 6.6, first Check); hence `ht_J̄(g) = ½·log (G^{−1})_{22} − ¾ = ½·log(10/23) − ¾ ≈ −1.17`. The Gram matrix of the basis `u², uv, u² + 2v²` has largest eigenvalue `≈ 22.68`, so the floor of (ii) for that basis is `½·log 3 + ¾ + ½·log 22.68 ≈ 2.86`, and `ht_J̄(g) ≈ −1.17 ≥ −2.86·deg g`. With `Λ_0 = Λ_D = 1` (the monomials), the admissible `β ≈ 0.67` (the largest value of the squared quotient norm on the `G`-unit sphere of `J`) and `ht_J̄(f) ≈ −4.18` (`f` has content `2` in that basis; the archimedean integral is computed numerically), the first display reads `deĝ_n(M̄_2) = ½·Σ_k log binom(6, k) ≈ 6.00 ≥ 2·ht_J̄(f) − 2.86 − (9/2)·log β ≈ −9.42`.
- *Redundant generators.* Let `u_1, …, u_n ∈ M_J` span `J` with `n > N`, put `W(y) = Σ_k y_k u_k`, and let `J̄` carry at every `σ` the quotient norm of `W_σ : ℂ^n → J_σ` (`‖v‖_σ = min{|y| : W_σ y = v}`), so that `W_σ` maps `(ker W_σ)^⊥` isometrically onto `J_σ` and `‖W_σ‖ = 1`. For `x` uniform on the unit sphere of `ℂ^n`, the squared length `t` of the projection of `x` onto `(ker W_σ)^⊥` has the law `Beta(N, n − N)` and is independent of the direction of that projection, which is uniform (the Gaussian model, as in the route of 6.6 (vi)), and `E log t = ψ(N) − ψ(n) = −(H_{n−1} − H_{N−1})`. Hence, for a multiform `P` on `J` of total degree `e = Σ_i e_i`, the spherical mean of 6.6 in `n` variables per group satisfies `m_σ(P ∘ W) = m_{J̄,σ}(P) − (e/2)·(H_{n−1} − H_{N−1})`. If moreover the `u_k` generate `M_J ⊗ O_𝔭` for every `𝔭`, then `W` has an integral right inverse at every `𝔭`, the Gauss norms of `P ∘ W` and `P` agree, and `ht(P ∘ W) = ht_J̄(P) − (e/2)·(H_{n−1} − H_{N−1})`. For the projection `ℤ³ → ℤ²` (`J̄ = ℤ²`, standard) and `P = det(s_0, s_1)`: `ht(P ∘ W) = −½ − (H_2 − H_1) = −1`, against `ht(det) = −½`. So 6.7 applied to a graded system over such a `J̄` with the `n` generators as coordinates (same `β`, since `‖W_σ‖ = 1`) gives the slope lines of (iv) with `h_J̄ − ½·(H_{n−1} − H_{N−1})` in place of `h_J̄` and its floor `c_n = ½·log n + ½·H_{n−1}` in place of the floor `½·log n + ½·H_{N−1}` of (ii): its slope bound is lower by `½·(H_{n−1} − H_{N−1})·((1 − z)·T + z·(T − D))`, a loss that reaches, through `h_J̄`, the part weighted by `(1 − z)·T`. For `ℙ^1` with `M_J = ℤ²`, the generators `e_1, e_2, e_1 + e_2` and their quotient norm (`M̄_j = Sym^j J̄` with the quotient metrics of 1.3a, `β = 1`), the loss is `5/8` at `T = 3` and `27/11` at `T = 10`.

### 6.7b The inequality with flatness on a subspace along rational sections

Hypothesis (c) of 6.7 asks that the whole of `V_T` be filtered by the generic linear section. When the `V_j` are the complete spaces of adjoint forms of the powers of a nef and big line bundle whose linear system has a nonzero fixed divisor, this fails as soon as `T ≥ 2D` (the remark in 6.7, which states the precise hypotheses and shows that the nefness of the undivided bundle cannot be dropped). What survives is a filtration, at rational linear sections, of a subspace of `V_T` that contains the vectors the route of 6.7 uses. This target bounds the slope under that hypothesis; the dimensions of `V_T` outside the filtered subspace are paid for by short vectors of `M_T`.

Let `J̄`, `D ≥ 1`, `T ≥ D + 1`, `δ ≥ 1`, a graded system `M̄_0, …, M̄_T` over `J̄` with its constant `β > 0`, and a multiform `f` on `J` of degree `δ` in each of its `D + 1` arguments be as in 6.7a (iv): the maps `x(u)` commute, `x(u)(M_j) ⊂ M_{j+1}` for every `u ∈ M_J` (equivalently, for every `u` in a family generating `M_J` over `O_K`), and `‖x(u)v‖_σ ≤ √β·‖u‖_σ·‖v‖_σ` for all `σ`, `j`, `u ∈ J_σ` and `v ∈ V_{j,σ}`; and `f` satisfies (b) of 6.7 (primitive in the last argument; for instance irreducible). For `s = (s_0, …, s_{D−1})` in `J^D` or in `(J ⊗ E)^D` and `α ∈ ℕ^D` write `x(s)^α = x(s_0)^{α_0}⋯x(s_{D−1})^{α_{D−1}}`. The system is **flat on a subspace at** `s ∈ J^D` if there are a field extension `E/K`, `c ∈ E^×`, nonzero linear forms `y_1, …, y_δ ∈ J^∨ ⊗ E` with `f(s_0, …, s_{D−1}, z) = c·∏_p y_p(z)` for `z ∈ J ⊗ E`, an `E`-linear map `res : V_0 ⊗ E → E^δ` onto `E^δ`, subspaces `U(0) ⊇ U(1) ⊇ ⋯ ⊇ U(T − D)` of `V_T ⊗ E`, and `E`-linear maps `sym_a : U(a) → E^{{|α|=a}×{1,…,δ}}` with kernel `U(a + 1)` (`0 ≤ a < T − D`), such that:

- for `m ∈ V_0 ⊗ E`, `α ∈ ℕ^D` with `|α| = a < T − D`, and `l_1, …, l_{T−a} ∈ J ⊗ E`, the vector `x(s)^α·x(l_1)⋯x(l_{T−a})·m` lies in `U(a)`, and `sym_a` maps it to `([α′ = α]·∏_q y_p(l_q)·res(m)_p)_{α′,p}`;
- `U(T − D) = Σ_{|α|=T−D} x(s)^α(V_D ⊗ E)`.

Nothing else is asked of the `U(a)`: `U(0)` need not be `V_T ⊗ E`, and `x(s)^α·v` need not lie in `U(a)` for a general `v ∈ V_{T−a}`. Suppose:

- (a′) `V_0`, `V_D` and `V_T` are spanned over `K` by vectors of `M_0`, `M_D`, resp. `M_T`, of norm at most `Λ_0`, `Λ_D`, resp. `Λ_T` at every `σ` (for instance by bases of such vectors);
- (c′) (*flatness on a subspace along rational sections*) there is a nonzero polynomial function `Q` on `J^D` such that the system is flat on a subspace at every `s ∈ J^D` with `Q(s) ≠ 0`.

Put `r_T = rk M_T`, `N_0 = δ·binom(T − 1, D)`, `e_T` as in 6.7, `ϱ = max{dim_K Σ_{|α|=T−D} x(s)^α(V_D) : s ∈ J^D, Q(s) ≠ 0}` (the deep rank), `w = r_T − N_0 − ϱ`, `z = 1 − N_0/r_T` and `h_J̄ = ht_J̄(f)/((D + 1)δ)`. Then:

- (d′) *The determinant.* `w ≥ 0` and `0 ≤ z < 1`, and there are `m_1, …, m_δ` among the vectors of (a′) in `V_0`, `ϱ` pairs `(γ, m′)` with `γ ∈ ℕ^D`, `|γ| = T − D` and `m′` among the vectors of (a′) in `V_D`, and `w` of the vectors of (a′) in `V_T`, such that the `r_T` polynomial maps `J^{D+1} → V_T` given by `x(s)^α·x(s_D)^{T−a}·m_p` (`0 ≤ a < T − D`, `|α| = a`, `1 ≤ p ≤ δ`), by `x(s)^γ·m′` and by the `w` constant vectors have, in a `K`-basis of `V_T`, a determinant `Δ = g·f^{e_T}`, where `g ≠ 0` is a multiform in the first `D` arguments of total degree `ϱ(T − D) − N_0·D(D + 1) ≥ 0`.
- (e′) *The degree.* For every floor `c` of `J̄` (6.7a (i)):

```text
deĝ_n(M̄_T) ≥ e_T·ht_J̄(f) − c·( ϱ(T − D) − N_0·D(D + 1) ) − N_0·( (T/2)·log β + log Λ_0 ) − ϱ·( ((T − D)/2)·log β + log Λ_D ) − w·log Λ_T.
```

- (f′) *The slope.* If moreover `c ≥ 0`, `β ≥ 1`, `Λ_D ≥ 1` and `Λ_T ≥ 1`, then

```text
μ̂(M̄_T) ≥ (1 − z)·( T·h_J̄ − D(D + 1)·c − log Λ_0 − (T/2)·log β ) − z·( T·c + (T/2)·log β + log Λ_D + log Λ_T ).
```

  In particular, if `u_1, …, u_n ∈ M_J` span `J` over `K` with `‖u_k‖_σ ≤ Λ` for all `k` and `σ`, and `Λ ≥ 1` (a *frame bound*), then `cst = log(nΛ) + ½·(log n + 1)` is a floor for `J̄` (6.7a (ii)) and `cst ≥ ½`, so (f′) holds with `c = cst` whenever `β`, `Λ_D` and `Λ_T` are at least `1`. Spanning suffices for this floor; the integrality of the multiplications is a condition on all of `M_J`, which a family checks only if it generates `M_J` over `O_K` (6.7a (iv)).

The columns of (d′) are those of 6.7 (d) with constant columns added: `N_0` columns carrying the `δ` points through the levels `a < T − D`, `ϱ` columns spanning the deepest step, and `w` constant columns completing them to a basis of `V_T`, each of which costs `log Λ_T`. If the system also satisfies (c) of 6.7, then `ϱ = r_T − N_0`: by step (1) of 6.7's route the map `(v_γ)_γ ↦ Σ_{|γ|=T−D} x(s)^γ v_γ` on copies of `V_D` has rank `r_T − N_0` at the generic point, and that rank is attained at the rational points off a hypersurface; so `w = 0`, `ϱ = z·r_T`, and (e′) is the first display of 6.7a (iv). For a system as in the remark in 6.7 (`A` and `ℳ` nef and big, `Φ ≠ 0`) with `T ≥ 2D`, (c) fails, and `w ≥ Q_Φ(T − D) ≥ 1`, because the `N_0 + ϱ` columns of step (1) of the route below, taken at one point, are independent vectors of `G(T − D) ⊗ E`; for such systems only 6.7b applies. Against the second line of 6.7a (iv), the display of (f′) carries `D(D + 1)·c` in the part weighted by `1 − z`, `T` in place of `T − D`, and `log Λ_T`. The four conditions of (f′) enter through one identity: with `r_T(1 − z) = N_0`, `r_T·z = ϱ + w` and `e_T·ht_J̄(f) = N_0·(T + D(D + 1))·h_J̄`, the right side of (e′) minus `r_T` times the right side of (f′) is

```text
N_0·D(D + 1)·(h_J̄ + c) + c·( N_0·D(D + 1) + w·T + ϱ·D ) + ½·log β·( w·T + ϱ·D ) + w·log Λ_D + ϱ·log Λ_T,
```

and `h_J̄ ≥ −c` because `c` is a floor. So `Λ_0` needs no lower bound, `Λ_D ≥ 1` is used only when `w > 0`, and `Λ_T ≥ 1` only when `ϱ > 0`. The conditions concern the constants, not the system: floors are upward closed, and a larger constant is again admissible in the operator bound and in (a′), so (f′) applies with `max(0, c)`, `max(1, β)`, `max(1, Λ_D)` and `max(1, Λ_T)`; what can fail is the display taken with an admissible `β < 1` (third Check) or, in the form with `w = 0`, which needs no lower bound on `Λ_D`, with `Λ_T < 1` (fourth Check).

*Route.* (1) *Columns, and a point where they are independent.* As `Q ≠ 0` and `K` is infinite, choose `s* ∈ J^D` with `Q(s*) ≠ 0` and `dim_K Σ_{|α|=T−D} x(s*)^α(V_D) = ϱ`, the data of flatness at `s*` over `E`, and `l ∈ J ⊗ E` with `y_p(l) ≠ 0` for every `p` (the `y_p` are nonzero and `E` is infinite). Since `res` is onto and the vectors of (a′) span `V_0`, choose `m_1, …, m_δ` among them with `(res(m_p)_{p′})_{p′,p}` invertible. For `|α| = a < T − D` the `δ` vectors `x(s*)^α·x(l)^{T−a}·m_p` lie in `U(a)`, and `sym_a` maps them into the block of `α` by the invertible matrix `diag_{p′}(y_{p′}(l)^{T−a})·(res(m_p)_{p′})`; so the `N_0 = Σ_{a<T−D} binom(a + D − 1, D − 1)·δ` vectors of all levels are independent modulo `U(T − D)` (apply `sym_a` at the lowest level of a relation). The vectors `x(s*)^γ·m′` (`|γ| = T − D`, `m′` among the vectors of (a′) in `V_D`) span `U(T − D)`, of dimension `ϱ`: choose `ϱ` of them forming a basis, and complete the `N_0 + ϱ` independent vectors by `w = r_T − N_0 − ϱ ≥ 0` of the vectors of (a′) in `V_T`. The `r_T` columns of (d′) are polynomial maps, homogeneous in each argument, and their determinant `Δ` does not vanish at `(s*, l)`; `N_0 ≥ δ ≥ 1` gives `0 ≤ z < 1`. (2) *Specialisations.* At every `s ∈ J^D` with `Q(s) ≠ 0`, with the data of flatness at `s` over `E`, there is `κ_s ∈ E` with `Δ(s, z) = κ_s·∏_p y_p(z)^{e_T}` for all `z ∈ J ⊗ E`. Indeed the columns `x(s)^γ·m′` lie in `U(T − D)`, of dimension at most `ϱ`, and the other non-constant columns in `U(0)`, where `dim U(0)/U(T − D) ≤ N_0` because each `sym_a` is injective on `U(a)/U(a + 1)`. If the columns `x(s)^γ·m′` are dependent, or `dim U(0)/U(T − D) < N_0`, or the constant columns are dependent modulo `U(0)`, the columns span less than `V_T ⊗ E` and `Δ(s, ·) = 0`. Otherwise `V_T ⊗ E = U(0) ⊕ (span of the constant columns)`, the `x(s)^γ·m′` form a basis of `U(T − D)`, every `sym_a` induces an isomorphism `U(a)/U(a + 1) → E^{{|α|=a}×{1,…,δ}}`, and in a basis adapted to this splitting and filtration the matrix of the columns is block lower triangular, with the identity for the constant columns and for the columns `x(s)^γ·m′` and the block `diag_{p′}(y_{p′}(z)^{T−a})·(res(m_p)_{p′})` for each `(a, α)`; its determinant is a constant times `∏_p y_p(z)^{e_T}`, since `Σ_{a<T−D} binom(a + D − 1, D − 1)·(T − a) = e_T`. (3) *Divisibility.* Let `π` be an irreducible factor of `f`, of multiplicity `μ`; by (b) it has positive degree `e_π` in the last argument. Suppose `Δ = π^k·Δ_1` with `π ∤ Δ_1` and `k < μ·e_T`. After a linear change of coordinates in the last argument, the coefficient of `x^{e_π}` in `π`, for one coordinate `x` of the last argument, is a nonzero polynomial `a_π` in the first `D` arguments. Over the polynomial ring `A′` in all the other coordinates, `π` is primitive and irreducible in `A′[x]`, hence irreducible in `Frac(A′)[x]` and coprime there to `Δ_1` (Gauss's lemma), so `A·π + B·Δ_1 = r` with `A, B ∈ A′[x]` and `0 ≠ r ∈ A′`. Choose `s ∈ J^D` with `Q(s)·a_π(s) ≠ 0` and `r(s, ·) ≠ 0`. By step (2), and since `f(s, ·) = c·∏_p y_p ≠ 0`, `π(s, ·)^k·Δ_1(s, ·) = κ_s·c^{−e_T}·f(s, ·)^{e_T}` in the polynomial ring `E[z]`, so `π(s, ·)` divides `Δ_1(s, ·)`, hence `r(s, ·)`, which does not involve `x`; but `π(s, ·)` has degree `e_π ≥ 1` in `x` with the nonzero leading coefficient `a_π(s)`, a contradiction. So `π^{μ·e_T}` divides `Δ` for every irreducible factor `π`, and `f^{e_T}` divides `Δ`, which is nonzero by step (1). In the last argument `Δ` has degree `δ·e_T`, that of `f^{e_T}`, so `g = Δ/f^{e_T}` involves the first `D` arguments only, and its total degree is `N_0·T + ϱ(T − D) − e_T·(D + 1)δ = ϱ(T − D) − N_0·D(D + 1)`, by `(D + 1)·e_T = binom(T − 1, D)·(T + D(D + 1))` (6.7). (4) *The degree.* `ht_J̄(Δ) = e_T·ht_J̄(f) + ht_J̄(g) ≥ e_T·ht_J̄(f) − c·deg g` by 6.7a (i) and the floor. The columns satisfy the integrality hypothesis of 6.7a (iii): in an `O_𝔭`-basis `(ε_k)` of `M_J ⊗ O_𝔭` the coefficients of the non-constant columns are sums, with integer multiplicities, of iterated products `x(ε_{k_1})⋯x(ε_{k_T})·m_p`, resp. `x(ε_{k_1})⋯x(ε_{k_{T−D}})·m′` (writing `s_0 = Σ_k s_{0,k}ε_k`, the coefficient of `s_{0,1}s_{0,2}` in `x(s_0)²·m` is `2·x(ε_1)x(ε_2)·m`, the maps commuting), and those of the constant columns are vectors of `M_T`; every such product lies in `M_T ⊗ O_𝔭`, because `x(u)(M_j ⊗ O_𝔭) ⊂ M_{j+1} ⊗ O_𝔭` for `u ∈ M_J ⊗ O_𝔭` (from `x(M_J)·M_j ⊂ M_{j+1}` by `O_𝔭`-linearity), and so does every sum of them, `M_T ⊗ O_𝔭` being closed under addition; and on the unit spheres of `J̄` their norms are at most `β^{T/2}·Λ_0`, `β^{(T−D)/2}·Λ_D` and `Λ_T`. 6.7a (iii) gives (e′). (5) *The slope.* The identity displayed above follows from `r_T(1 − z) = N_0`, `r_T·z = ϱ + w` and `e_T·(D + 1)δ = N_0·(T + D(D + 1))` by expanding both sides; under the conditions of (f′) and `h_J̄ ≥ −c` (the floor applied to `f`) each of its five terms is `≥ 0`, and dividing by `r_T` gives (f′). For the frame bound, 6.7a (ii) and `log(nΛ) + ½·(log n + 1) ≥ ½` for `n ≥ 1`, `Λ ≥ 1`.

*Needs:* 6.6; 6.7 ((b), `e_T` and its closed form); 6.7a ((i)–(iii), and the graded systems over `J̄` of (iv)); Mathlib `Polynomial.IsPrimitive.irreducible_iff_irreducible_map_fraction_map`, `Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map`, `Irreducible.coprime_iff_not_dvd`.

**Checks.**

- *A fixed base point: `u², uv` on `ℙ^1`.* `K = ℚ`, `J̄ = ℤu ⊕ ℤv` with `u`, `v` orthonormal, `V_j` the binary forms of degree `2j + 1` with `M_j` the integral ones and the quotient metrics of 1.3a, `x(w)φ = w·u·φ` for `w ∈ J` (so `β = 1`: the quotient norm of `w·u·φ` is at most `‖w‖·‖u‖·‖φ‖`), `f = det(s_0, s_1)` (`N = 2`, `D = δ = 1`), the monomials as the vectors of (a′) (`Λ_0 = Λ_D = Λ_T = 1`), and `Q(s_0) = s_{0,2}`. By the remark in 6.7, (c) of 6.7 fails for every `T ≥ 2`. At `s_0` with `s_{0,2} ≠ 0`, let `λ = s_{0,1}u + s_{0,2}v`, whose zero `y_1 = (−s_{0,2}, s_{0,1})` is the moving zero of `x(s_0)`. The system is flat on a subspace at `s_0` with `E = ℚ`, `c = 1`, `y_1(z) = z(y_1)`, `res(m) = m(y_1)`, `U(a)` the forms of `W = u^T·ℚ[u, v]_{T+1} + x(s_0)^{T−1}(V_1)` vanishing to order at least `a` at `y_1`, and `sym_a(φ) = (φ/λ^a)(y_1)/u(y_1)^T`: here `dim W = T + 3`, each step of the filtration has codimension `1`, and `U(T − 1) = x(s_0)^{T−1}(V_1)`. So `r_T = 2T + 2`, `N_0 = T − 1`, `ϱ = 4`, `w = T − 1`, `e_T = (T − 1)(T + 2)/2` and `deg g = 2(T − 1)`. For `T = 3`, with `m_1 = v`, the four cubic monomials as the `m′` and the constant columns `uv⁶`, `v⁷`, the determinant in the monomial basis is `Δ = ±s_{0,1}²·s_{0,2}²·f⁵` (`g` vanishes where `res(m_1) = s_{0,1}` does and on `Q = 0`), and `ht(g) = −2 ≥ −4c_2`. With the floor `c_2 = ½(log 2 + 1) ≈ 0.8466`, (e′) reads `deĝ_n(M̄_3) = ½·Σ_k log binom(7, k) ≈ 8.546 ≥ −5/2 − 4c_2 ≈ −5.886`, and (f′), with `z = ¾` and `h_J̄ = −¼`, reads `μ̂(M̄_3) ≈ 1.068 ≥ ¼·(−¾ − 2c_2) − ¾·3c_2 ≈ −2.516`; with the frame floor `cst = log 2 + ½·(log 2 + 1) ≈ 1.540` of the two vectors `u`, `v` (`n = 2`, `Λ = 1`) the right sides are `≈ −8.659` and `≈ −4.422`.
- *No constant column.* For `ℙ^1` with `V_j` the binary forms of degree `j` (6.7, first Check) the system is flat on a subspace at every `s_0 ≠ 0`, with `U(0) = V_T ⊗ E`; `ϱ = 2`, `w = 0`, `Δ = ±f^{e_T}`, and (e′) is the first display of 6.7a (iv) for `Ō_ℚ^2`.
- *The condition `β ≥ 1` of (f′).* `K = ℚ`, `J̄ = ℤ²` standard, `D = δ = 1`, `T = 2`, `f = det`; `M_0 = ℤ` and `M_j = Sym^j ℤ² ⊕ ℤa_j` (`j = 1, 2`), with the quotient norms of 1.3a on `Sym^j` multiplied by `e^{−Aj}`, `‖a_1‖ = 1`, `‖a_2‖ = e^{−A}` and the lines orthogonal to the forms; `x(u)` multiplies forms by `u`, and `x(u)a_1 = u_1·a_2`. For `A ≥ 0` the monomials and the `a_j` have norms at most `1`, so `Λ_0 = Λ_D = Λ_T = 1`; the constant `β = e^{−2A}` is admissible (multiplication by a unit vector of `J` is `e^{−A}` times a contraction); and at every `s_0` with `s_{0,1} ≠ 0` the system is flat on a subspace with `U(0) = V_2 ⊗ E`, `U(1) = x(s_0)(V_1 ⊗ E)` of dimension `3`, `sym_0` the value of the form part at `y_1 = (−s_{0,2}, s_{0,1})` and `res` the identity of `V_0 = ℚ`: `N_0 = 1`, `ϱ = 3`, `w = 0`, `z = ¾`, `h_J̄ = −¼`. With the floor `c = log 2 + ½·(log 2 + 1) ≈ 1.540`, every condition of (f′) except `β ≥ 1` holds for the constant `β = e^{−2A}`; the slope is `7A/4 + (log 2)/8`, and the display with that constant is `2A − 2c − 1/8`, which exceeds the slope exactly when `A > 8c + ½ + ½·log 2 = 9/2 + (25/2)·log 2 = 13.16433975…` (at `A = 20`: `36.796` against `35.087`), while (e′) holds (`deĝ_n(M̄_2) ≈ 140.35 ≥ 97.46` at `A = 20`), and so does (f′) with the admissible constant `β = 1`.
- *The condition `Λ_T ≥ 1`, in the form with `w = 0`.* The third Check of 6.7a (`‖x_2‖ = 2`, `T = 3`, `β = 1`, flat on a subspace with `U(0) = V_3 ⊗ E`, `w = 0`, `z = ½`) with every norm of every `M̄_j` multiplied by `e^{−A}`: the monomials give `Λ_0 = e^{−A}`, `Λ_D = 2e^{−A}`, `Λ_T = 8e^{−A}`, and the slope is `≈ −0.765 + A`. Since `w = 0`, the identity after (f′) gives the display for every `Λ_D > 0` when `c ≥ 0`, `β ≥ 1` and `Λ_T ≥ 1`; this Check shows that `Λ_T ≥ 1` cannot be dropped from that form. With the floor `c = cst = log 4 + ½·(log 2 + 1)` of the columns `x_1`, `x_2` (`Λ = 2`), at `A = 20` the display with these constants is `≈ 22.137`, above the slope `≈ 19.235`; with `max(1, 8e^{−A})` in place of `Λ_T` (and `Λ_0`, `Λ_D` unchanged) it stays below the slope for every integer `A` in `[−20, 100]`, by at least `6.05`. At `A = 20` the constants violate `Λ_D ≥ 1` as well, and with `max(1, 2e^{−A})` in place of `Λ_D` (and `Λ_0`, `Λ_T` unchanged) the display is `≈ 12.483`, below the slope, and stays below it for every integer `A` in `[−20, 100]`, by at least `6.75`: for (f′) as stated, with its condition `Λ_D ≥ 1`, this Check does not isolate `Λ_T ≥ 1`.

### Examples

For `𝒳 = ℙ^1_ℤ` and `ℒ = O(1)` with the Fubini–Study metric and the `L²` norms of the Fubini–Study probability measure, the monomials `x_0^(n−k) x_1^k` are orthogonal with squared norms `k!(n − k)!/(n + 1)!`, the Bergman density is the constant `n + 1`, `μ̂_max(M̄_n) = ½ log((n + 1)·binom(n, ⌊n/2⌋))` and `μ̂^asy_max = ½ log 2` (6.3–6.5). For `N = 2` the determinant `det(s_0, s_1)` has spherical height `−½` (6.6). For `ℙ^1`, with the binary forms of degree `j` as the graded system and `f = det(s_0, s_1)`, the determinant of 6.7 (d) is `±f^{e_T}` with `e_T = (T − 1)(T + 2)/2`.

### Dependencies

Layers 1–4; ArakelovGeometryAndAbelianHeights §§1.2–1.3, 1.12–1.13; SchemeAndStackFoundations §4.18; JacobianChallenge C.1–C.2; BanachSpaceTheory B7; DiophantineApproximationAndTranscendence §§0.2, 1.3; SuccessiveMinima §0.1.

## Downstream consumers

The theta-chain roadmaps of the family RiemannHypothesisForDirichletLFunctions consume this roadmap as follows. ThetaChainsAndFrobeniusPrimeSums §9.6 applies 5.5, through the pairwise form 5.6 and the compression 5.7, to the family of maps from lattices of algebraic automorphic forms on definite unitary groups to a target lattice, with Bessel–Poincaré series as the lifts at one archimedean place; the Gram bounds come from BesselPoincareSeriesAndGramBounds §5.20 and BesselPoincareSeriesAndGramBounds §5.21, the heights of the maps from GluedTargetAndDivisionInequality §8.9, and their integrality from GluedTargetAndDivisionInequality §7.14 (each map sends its divided source lattice of GluedTargetAndDivisionInequality §7.13, built on the lattice of forms of ThetaChainsOnDefiniteUnitaryGroups §3.8, into the dual of the target lattice). For the slope of the target, GluedTargetAndDivisionInequality §8.21 uses the gluing lemma 1.2a (the target is glued place by place from images of lattices of forms under a chain of similitudes, with determinant identities at every embedding for the base type and at one embedding for the twisted types, and local bases at the pairs of conjugate primes), and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties uses the explicit arithmetic Hilbert–Samuel inequality over a Hermitian coordinate bundle (the lattice of integral forms of the weight that defines the projective embedding, with its Petersson metrics) in its form 6.7b, with flatness on a subspace along rational sections ((d′) for the lower rank bound, (f′) for the slope), for the lattices of forms of large weight on deep covers of the step varieties of the chain (ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties §8.18e); with it, the spherical heights of 6.6, the heights relative to a coordinate bundle, the floor of a short spanning family and the Hadamard bound of 6.7a (i)–(iii), and the integrality condition that 6.7a (iv) and 6.7b put on the multiplications. It does not use the inequalities of 6.7 and 6.7a (iv); it cites the remark in 6.7 for why their hypothesis (c) is not available for its systems. Read as adjoint spaces on a resolution of a toroidal compactification, on which the cusp forms of the embedding weight have a fixed divisor along the boundary when the Shimura variety is not compact, its spaces of all cusp forms are of the kind of that remark when, in addition, the pullback of the line of the embedding weight and the twisting line are nef and big. These are hypotheses of the remark, not consequences of the fixed divisor (the blow-up of `ℙ²` at the end of the remark has a fixed divisor and satisfies (c)), and they, with the identification of the spaces of cusp forms with adjoint spaces, are for ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties to prove. The other slope inputs of these roadmaps are the Gram formula, the comparison formula and the index formula of 1.2, the slope formulas of 1.7, the heights of linear maps with their finite-place terms and the quotient and dual metrics (1.3), the degree inequality 1.4 (iii), maximal and minimal slopes with duality and passage to sub-bundles (2.1, 2.2), Bost's slope inequality for injective and for surjective maps (2.4 (b), (c)), the Harder–Narasimhan filtration (3.2), and successive minima over `K` with Minkowski's theorem (4.1, 4.2) for lattices of theta series.

FaltingsFinitenessAndIsogenyTheoremsPartII uses, for Bost's proof of the period theorem, the attained maximal slope with its invariance under finite extension and the bound `−h_Ē(e) ≤ μ̂_max(Ē)` (2.1, 3.5), the morphism inequality `μ̂_min(Ē) ≤ μ̂_max(F̄) + h(φ)` (2.4 (a)), the metric-rescaling law (2.1, 1.7), a bound for the maximal slopes of symmetric powers linear in the power with a constant depending only on the rank (4.5 (b2)), and the isometric base change of symmetric powers (1.3a (iv)).

Bost's semistability of the `L²`-metrised bundles of theta functions on an abelian variety with a cubist model (the bundles `π_*ℒ^{⊗n}`) rests on the invariance of the Harder–Narasimhan filtration under isometries (3.4 (ii)) and on the theta-group action; its owner consumes 3.4. The filtered slope inequality 2.5 with the section lattices of Layer 6 is the slope method of transcendence and of the arithmetic theory of algebraic leaves; HeightsRationalPointsAndObstructions §§5.10c and 5.17e–5.17f, which work with section lattices and small sections directly, can state their slope consequences on this roadmap; the Bost–Gillet–Soulé comparison of the Fubini–Study height of a projective cycle with the spherical height 6.6 of its Chow form, which turns 6.7 into a bound in terms of the height of a projective variety, belongs to HeightsRationalPointsAndObstructions as well, and so does its form over a Hermitian coordinate bundle `J̄` (the height of a cycle in `ℙ(J^∨)` for the Fubini–Study metrics of `J̄`, compared with the height `ht_J̄` of 6.7a (i) of its Chow form), which does the same for 6.7a.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns, for Hermitian vector bundles over rings of integers of number fields: the reading of degrees of sub-bundles as adelic subspace heights; the heights of vectors and linear maps; symmetric powers with the quotient metrics and their Hermitian API; the Gram and comparison formulas for degrees, for arbitrary bases; the gluing lemma for lattices glued place by place, with the pair indices and the discriminant formula it rests on; the degree inequality along a map; supermodularity of the degree and finiteness of sub-bundles of large degree; `μ̂_max`, `μ̂_min` and semistability, with their behaviour under twisting by Hermitian line bundles and under passage to submodules of finite index; the Harder–Narasimhan steps, filtration, slopes and polygon, with their functoriality and, through Galois descent of subspaces, their invariance under finite extension; Bost's slope inequality in its image, morphism, injective, surjective, quotient-term and filtered forms; the slope bound for orthogonal idempotents; the comparison of slopes with successive minima over `K` and with the absolute minima over `ℚ̄` at every index; bounds for maximal slopes of tensor and symmetric powers; the frame lemma and the slope inequality for nearly tight frames, with its pairwise and compressed forms; the Hermitian approximation of norms (a corollary of John's theorem); interpolation sets of bounded height; Fekete's lemma with an error term; the linear growth and the convergence of the normalised maximal slopes of section lattices, with the comparison of `L²` and sup norms through a bound on Bergman densities; spherical heights of multiforms with their lower bound and the Hadamard bound for determinants of polynomial vectors, and the disintegration of the normalised spherical measure along a unit vector; the explicit arithmetic Hilbert–Samuel inequality for graded systems with a Chow form, with the determinant identity it rests on (6.7), and its form over a Hermitian coordinate bundle with the heights of multiforms relative to that bundle and their floors (6.7a), and its form with flatness on a subspace along rational linear sections, where the dimensions outside the filtered subspace are paid for by short vectors of the top lattice (6.7b); and the slope formulas of 1.7 for tensor, exterior and symmetric powers.

Not owned here. Hermitian vector bundles, their operations, the Arakelov degree, the normalised degree and the slope, the additivity, base change and rescaling of the degree, and heights of algebraic points for metrised line bundles are ArakelovGeometryAndAbelianHeights Layer 1. That roadmap's Conventions divide the normalised degree by the rank, while its §1.3 states the slope as `deĝ(Ē)/rank Ē`; this roadmap uses the slope `μ̂ = deĝ_n/rk` of Conventions above, the form that is invariant under finite extension of `K`. The symmetric powers of modules (functoriality, bases and rank, symmetrisation, extension of scalars) are in the Tau Ceti library; coefficient heights of polynomials are DiophantineApproximationAndTranscendence §1.3. Subspace heights, their duality, Struppeck–Vaaler inequality and Northcott property, the adelic heights of vectors and subspaces with their absolute minima (the absolute Siegel lemma of Roy and Thunder), and Siegel's lemma over a fixed field are DiophantineApproximationAndTranscendence §§0.2, 2.5, 2.8 and AdelicHeightsAndSuccessiveMinima §2.5a. Minkowski's second theorem over `K` and the covolume of an `O_K`-module are SubspaceTheorem §§4.1–4.2 and AdelicHeightsAndSuccessiveMinima §3.1; the index of two lattices over a discrete valuation ring and the lattice with prescribed localisations are HermitianFormsAndLattices §§4.0b and 4.0 (g); real successive minima and the Hadamard inequality are SuccessiveMinima; covolumes of projections and duals of Euclidean lattices are GeometryOfNumbersAndQuadraticArithmetic §0.3; John's theorem, the Banach–Mazur distance to `ℓ²`, the normalised spherical measure and the Gaussian model are BanachSpaceTheory B7; Galois descent for semilinear representations is in the Tau Ceti library. Arithmetic intersection numbers, the asymptotic arithmetic Hilbert–Samuel formula for section lattices, arithmetic volumes, the comparison of arithmetic volumes with heights ("volume `≤` height"), successive minima of heights on varieties and heights of cycles are HeightsRationalPointsAndObstructions §§5.9b, 5.17 and ArakelovGeometryAndAbelianHeightsPartII; the explicit inequality 6.7 is a statement about one graded system with a given form `f`, and its geometric instance (Chow forms of varieties, the generic linear section, and the vanishing theorems that give the flatness hypothesis (c) for a linear system without base locus, 6.7) is not stated here: verifying the hypotheses (a)–(c) of 6.7 (or of 6.7a), or (a′), (b) and (c′) of 6.7b, for a given graded system is the business of whoever applies 6.7, 6.7a or 6.7b to that system. The remark on fixed divisors in 6.7 uses Kawamata–Viehweg vanishing, Kodaira's lemma, Riemann–Roch for curves and the polynomiality of Euler characteristics, which are not stated here. The asymptotics of Bergman kernels, which give admissible bounds `b_n` in 6.5 for smooth positive metrics on smooth `X_σ(ℂ)` and smooth positive measures `ν_σ` (bounds `b_n ≤ C·rk M_n` for large `n`, with `C` depending on the measure: any `C` above the largest value of the ratio of the normalised curvature volume form to `ν_σ`), are not stated here either. Harder–Narasimhan theory for vector bundles on curves over finite fields is AutomorphicLFunctionsAndLocalFactors AL.3.10.5, for Higgs bundles AutomorphicSpectralTheory §6.22c, and for `φ`-modules FiniteFlatGroupsAndIntegralPadicHodgeTheory. Abelian-variety statements (tangent metrics, cubist models and the semistability of theta bundles) belong to the abelian-height roadmaps that consume this one. Of the theta-chain roadmaps of this family, BesselPoincareSeriesAndGramBounds owns the automorphic Gram bounds that verify the hypotheses of 5.5, RowTowerAndRallisIdentities the chain of similitudes and its determinant identities that feed 1.2a, and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties the graded systems of automorphic forms to which 6.7b is applied, with the verification of its hypotheses for them and of the hypotheses of the remark in 6.7 where that remark is cited for them (the identification with spaces of adjoint forms, the nefness and bigness of the line bundles).

## Exact supplier contracts

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

§1.1: the Hermitian vector bundle `Ē = (E, (h_σ)_{σ∈Σ_K})`, a finitely generated projective `O_K`-module with positive definite Hermitian forms compatible with conjugation, isometries, `Ō_K`, fractional ideals with metrics, and the rescaling `Ē(c)`. §1.2: orthogonal sums, tensor products, duals with `Ē^∨∨ ≅ Ē`, exterior powers and determinants, restricted metrics on saturated submodules and quotient metrics on quotients with `det Ē ≅ det F̄ ⊗ det Q̄` isometrically, and base change along `O_K → O_L` with its functoriality. §1.3: `deĝ(L̄) = log #(L/O_K s) − Σ_σ log ‖s‖_σ`, the generic-section formula `deĝ(L̄) = −log N(𝔟) − Σ_σ log ‖t‖_σ` for `L = 𝔟·t`, `deĝ(Ē) = deĝ(det Ē)`, the normalised degree `deĝ_n(Ē) = deĝ(Ē)/[K:ℚ]`, the rescaling law (a rank-`r` bundle gains `r[K:ℚ]c`), and the slope for positive rank in the normalisation of that roadmap's Conventions, `μ̂(Ē) = deĝ_n(Ē)/rank Ē` (the normalised degree divided by the rank; §1.3 itself writes the slope as `deĝ(Ē)/rank Ē`, and that quotient is not used here). §1.4: independence of the section. §1.5: additivity for orthogonal sums and for `0 → F̄ → Ē → Q̄ → 0` with restricted and quotient metrics, and `deĝ(L̄′) = deĝ(L̄) + log #(L′/L)`. §1.6: `deĝ(Ē_{O_L}) = [L:K]·deĝ(Ē)`. §1.12: for projective flat `𝒳` over `O_K` and a continuous conjugation-invariant metric, `h_ℒ̄(x) = deĝ(x̄^*ℒ̄)/[K′:ℚ]` on `X(ℚ̄)`, with the pullback, tensor, metric-change (`≤ sup|log(‖·‖′/‖·‖)|`) and model-change (bounded) properties. §1.13: the Weil height class of a line bundle on a projective variety over `K`, additive and compatible with pullback, with `h_{O(1)}` the class of the absolute height on projective space and `h_ℒ̄` a representative.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

§0.2: Tau Ceti's `TauCeti.absoluteProjectiveTupleHeight`, invariant under field extension. §1.3: Tau Ceti's `MvPolynomial.logHeight`, the projective height of the coefficient vector of a multivariate polynomial over a number field, `Σ_{w|∞} m_w log max_μ |P_μ|_w + Σ_{v finite} log max_μ |P_μ|_v`, with `h(P) ≥ 0` and `h(cP) = h(P)` for `c ≠ 0`. §2.5: `Submodule.relativeSubspaceArakelovHeight` and `Submodule.subspaceHeight` (the `[K:ℚ]`-th root), built from Plücker coordinates with Euclidean norms and exponent `mult(v)` at infinite places and max norms at finite places; `one_le_subspaceHeight`; `Submodule.finite_subspaceHeight_le` (finitely many subspaces of `K^n` of height `≤ B`); the Struppeck–Vaaler inequality `subspaceHeight(T₁ ⊓ T₂)·subspaceHeight(T₁ ⊔ T₂) ≤ subspaceHeight(T₁)·subspaceHeight(T₂)`; the conjugate Cauchy–Binet identity `TauCeti.det_mul_conjTranspose_eq_sum_plucker_mul_star`; the adelic height `H_A` of `A ∈ GL_n(𝔸_K)`, integral and invertible at almost every finite place, built in its paragraph on adelic symmetric powers, with its invariance under finite extension and the determinant identity `det(Sym^r A) = (det A)^binom(r+n−1, n)`; the dual-height identity `H_A(U) = |det A|_𝔸·H_{A^(−t)}(U^⊥)`; and `absoluteAdelicMinima`: for `n ≥ 2`, the absolute infima `μ_i` of `H_A` over `ℚ̄^n` satisfy `|det A|_𝔸 ≤ ∏ μ_i ≤ 2^(n(n−1)/2)·|det A|_𝔸`, with independent vectors in a finite extension within any factor `1 + η`.

### From TauCetiRoadmap.SubspaceTheorem

§4.1: pseudo-bases `Submodule.exists_pseudoBasis`, the mixed image `Submodule.mixedImage` of a finitely generated spanning `O_K`-module as a lattice in `ι → mixedSpace K`, and its covolume `Submodule.covolume_mixedImage`. §4.2: the `K`-minima `NumberField.successiveMinimum` for the approximation bodies of §4.1 (the case used in rank one), with the constant `c_K = NumberField.integralBasisHouse K`.

### From AdelicHeightsAndSuccessiveMinima, a sub-roadmap of this family

AdelicHeightsAndSuccessiveMinima §2.5a, on the height `H_A` of DiophantineApproximationAndTranscendence §2.5: the names `adelicHeight A x` and `adelicSubspaceHeight A U` for that height of vectors and of subspaces (through exterior powers), for every `n ≥ 1`, with Euclidean norms and exponent `mult(v)/[L:ℚ]` at the infinite and max norms and exponent `1/[L:ℚ]` at the finite places of any finite `L/K`; invariance under scaling, under the choice of Plücker vector and under finite extension; `adelicHeight 1 = absoluteHeight2` (`height2` on `K^n`) and `adelicSubspaceHeight 1 = subspaceHeight`; the change of `K`-basis; `adelicSubspaceHeight A (L^n) = |det A|_𝔸`; for `n = 1`, `adelicHeight A x = |det A|_𝔸` for every nonzero `x`; and `absoluteAdelicMinima` and the dual-height identity stated in these names. AdelicHeightsAndSuccessiveMinima §3.1: for every compact convex symmetric body `B ⊂ ι → mixedSpace K` with `0` in its interior and balanced over the completions, the `K`-minima `NumberField.successiveMinimum Λ B l`, their attainment by one independent family, and Minkowski's second theorem over `K`, `c_K^(−d·n)·2^(d·n)/(d·n)!·covol Λ ≤ (∏_l μ_l)^d·vol B ≤ 2^(d·n)·covol Λ`, the lower bound being the half that uses balancedness.

### From TauCetiRoadmap.SuccessiveMinima

§0.1: `orthonormal_coordinate_hadamard`, `‖det_b(v)‖ ≤ ∏_i ‖v_i‖` for an orthonormal basis `b` over `ℝ` or `ℂ`, and `hermitian_gram_hadamard` (used in 1.4, 6.6 (v) and 6.7a (iii)).

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

§0.3: `covolume_projection` (0.3.1), `covol(P) = covol(Δ)/covol(L)` for the projection of a full lattice `Δ` along a rational subspace with primitive part `L`, intrinsic volumes; the reciprocal dual covolume (0.3.2) in lower rank. §2.2.4: `IntegralQuadraticLattice.mem_iff_local`, a full lattice over a Dedekind domain is the intersection of its localisations (used in 1.2a for the uniqueness of the glued lattice).

### From HermitianFormsAndLattices, a sub-roadmap of this family

HermitianFormsAndLattices §4.0 (f): over a Dedekind domain `R` with fraction field `K`, localisation at a maximal ideal commutes with sums and intersections of lattices in a finite-dimensional `K`-space. HermitianFormsAndLattices §4.0 (g): for an `R`-subalgebra `𝒪 ⊆ End_K(V)`, an `𝒪`-stable lattice `L` and `𝒪`-stable `R_(𝔭)`-lattices `M_𝔭` with `M_𝔭 = L_(𝔭)` for almost all `𝔭`, `M = ⋂_𝔭 M_𝔭` is the unique lattice with `M_(𝔭) = M_𝔭` for every `𝔭` (used with `R = 𝒪 = O_K` in 1.2a); and the same with completions in place of localisations: over a number field, for a lattice `L` and lattices `M_𝔭 ⊂ V ⊗_K K_𝔭` with `M_𝔭 = L_𝔭` for almost all `𝔭`, there is a unique lattice with completions `M_𝔭` (used with the reference lattice `O_K^n` in 1.1 (i)). HermitianFormsAndLattices §4.0b: over a discrete valuation ring, the index `idx(A, B) = length(A/(A ∩ B)) − length(B/(A ∩ B))` of two lattices, equal to `length(A/B)` when `B ⊆ A` and additive along chains (the local index `idx_𝔭` of 1.2).

### From TauCetiRoadmap.SchemeAndStackFoundations

§4.18: `generic_projection`, for a pure `d`-dimensional projective `X ⊆ ℙ^N_k` over an infinite field, a linear projection with centre disjoint from `X`, defined by linear forms, giving a finite morphism `π : X → ℙ^d_k`, which is surjective (its image is closed of dimension `d`; the route of §4.18 proves it).

### From TauCetiRoadmap.JacobianChallenge

C.1: for proper `f : X → Spec A` with `A` Noetherian and `F` coherent, `H^q(X, F)` is a finite `A`-module. C.2: flat base change of cohomology along a flat `A → A′`.

### From TauCetiRoadmap.BanachSpaceTheory

B7: John's theorem for the closed unit ball of a norm on a finite-dimensional inner-product space over `𝕜 ∈ {ℝ, ℂ}` (a maximal-volume `𝕜`-ellipsoid inside the ball, with its contact-point decomposition), and the consequence `d(E, ℓ²_n) ≤ √n` for the Banach–Mazur distance over `𝕜` (6.1); the normalised spherical measure on `S^{n−1}`, in the normalisation of Mathlib's `Measure.toSphere`, with its rotation invariance, and the finite Gaussian model with its radial and directional independence and the spherical law of the normalised direction (6.6, the measure `ν` and (vi); 6.7a, the measures `ν_σ` on the unit spheres of a Hermitian coordinate bundle).

### From Mathlib

`NumberField.RingOfIntegers`, `NumberField.InfinitePlace` with `mult`, `NumberField.FinitePlace`, `NumberField.prod_abs_eq_one`, `FractionalIdeal.absNorm`; `NumberField.mixedEmbedding.covolume_integerLattice` (`covol(O_K) = 2^(−r₂)·√|d_K|`); `ZLattice.covolume`; exterior powers and `SymmetricPower`; `Nat.Prime.emultiplicity_factorial` (Legendre's formula, 4.5 (a)); `IsGalois.fixedField_top` (3.4a); `Subadditive.tendsto_lim` (Fekete's lemma, compared with 6.3a in its first Check); `IsPrincipalIdealRing.of_finite_primes` (bases local at a pair of primes, 1.2a); `MeasureTheory.Measure.toSphere` (the measure on the unit sphere of a finite-dimensional real normed space induced by a Haar measure, of total mass `dim·vol(unit ball)`), `MvPowerSeries.gaussNorm` with `MvPowerSeries.gaussNorm_mul_eq_mul`, `circleAverage_log_norm_sub_const_eq_posLog` (Jensen's formula for a linear factor), `Polynomial.gaussNorm_mul` and `Polynomial.IsPrimitive.dvd_iff_fraction_map_dvd_fraction_map` (Gauss's lemma) (6.6, 6.7, 6.7a, 6.7b); `Polynomial.IsPrimitive.irreducible_iff_irreducible_map_fraction_map` and `Irreducible.coprime_iff_not_dvd` (6.7b); inner-product spaces, adjoints, traces, the Frobenius norm and the Loewner order on positive operators.

### From Tau Ceti

`ZLattice.covolume_sq_eq_det_gram` and `ZLattice.covolume_dual` (1.8); `SymmetricPower.map`, `Module.Basis.symmetricPower`, `SymmetricPower.free`, `SymmetricPower.finrank_eq`, `SymmetricPower.toTensorPower` with `mk_comp_toTensorPower`, `toTensorPower_comp_map`, `toTensorPower_injective`, and `RingHom.extendScalarsSymmetricPowerIso` (1.3a, 4.5 (a)); `TauCeti.GaloisDescent.span_invariants_eq_top` and `TauCeti.GaloisDescent.range_eq_invariants_of_liftBaseChange_surjective` (3.4a).

## References

- Ulrich Stuhler, Eine Bemerkung zur Reduktionstheorie quadratischer Formen, 1976: the canonical filtration of a Euclidean lattice (3.1–3.2).
- Daniel R. Grayson, Reduction theory using semistability, 1984: the canonical filtration and polygon (3.1–3.3).
- Jean-Benoît Bost, Périodes et isogénies des variétés abéliennes sur les corps de nombres (d'après D. Masser et G. Wüstholz), Séminaire Bourbaki 795, 1996: slopes, the slope inequality and its filtered form, tensor and symmetric powers (2.1–2.5, 4.4–4.5).
- Jean-Benoît Bost, Algebraic leaves of algebraic foliations over number fields, 2001: the slope inequality with heights at all places and the slope method (2.4–2.5, 6.3).
- Jean-Benoît Bost and Klaus Künnemann, Hermitian vector bundles and extension groups on arithmetic schemes I: geometry of numbers, 2010: slopes, minima and tensor products (4.1–4.4).
- Huayi Chen, Convergence des polygones de Harder–Narasimhan, 2010: asymptotic maximal slopes of section lattices (6.4).
- Éric Gaudron, Pentes des fibrés vectoriels adéliques sur un corps global, 2008: adelic slopes and minima (1.1, 4.1–4.3a).
- Éric Gaudron and Gaël Rémond, Théorème des périodes et degrés minimaux d'isogénies, 2014: slopes of symmetric powers and minima (4.2, 4.5).
- Thomas Struppeck and Jeffrey D. Vaaler, Inequalities for heights of algebraic subspaces and the Thue–Siegel principle, 1990: supermodularity of subspace heights (1.5, through the supplier).
- Damian Roy and Jeffrey Lin Thunder, An absolute Siegel's lemma, 1996, with its addendum and erratum (4.3, 4.3a, through the supplier).
- Thomas Borek, Successive minima and slopes of Hermitian vector bundles over number fields, 2005 (4.2).
- Nicolaas G. de Bruijn and Paul Erdős, Some linear and some quadratic recursion formulas II, 1952: Fekete's lemma with an error term (6.3a).
- Fritz John, Extremum problems with inequalities as subsidiary conditions, 1948: the maximal ellipsoid (6.1, through the supplier).
- Patrice Philippon, Sur des hauteurs alternatives I, 1991: heights of forms through spherical Mahler measures (6.6).
- Jean-Benoît Bost, Henri Gillet and Christophe Soulé, Heights of projective varieties and positive Green forms, J. Amer. Math. Soc. 7, 1994: the comparison of the Fubini–Study height of a projective cycle with the spherical height of its Chow form (Downstream consumers; the normalisation of 6.6).
- [FormalProof] The Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. Its slope inequality for families of maps is the source of 5.3–5.7, its lattice lemma is the source of 1.2a (iii), and its explicit arithmetic Hilbert–Samuel bound, with heights relative to a lattice and metrics on the space of coordinates, is the source of 6.7, 6.7a and 6.7b.
- [Announcement] The announcement of that proof by its author, 20 November 2026: <https://alpo.ge/remark.pdf>.
