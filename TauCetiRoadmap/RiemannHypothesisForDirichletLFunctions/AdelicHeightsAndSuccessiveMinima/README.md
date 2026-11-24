# Roadmap: adelic heights and successive minima

**Summary.** Let `K` be a number field of degree `d` and `A = (A_v)_v ∈ GL_n(𝔸_K)` an adelic matrix, integral and invertible at almost every finite place. Twisting the standard norms on `K^n` by `A` place by place gives a height on vectors and subspaces: the height `H_A` that DiophantineApproximationAndTranscendence §2.5 builds for the absolute Siegel lemma of Roy and Thunder, and whose elementary properties over every finite extension of `K` DiophantineApproximationAndTranscendence §2.5a proves. This roadmap states the form of the subspace height that [FormalProof] has, for the adelic matrix of a lattice and a frame over a CM field written without adeles, and it states Minkowski's second theorem over `K`, which SubspaceTheorem proves for its approximation bodies, for every body balanced over the completions, such as a product of Euclidean or Hermitian balls at the infinite places. Its headline theorems are these.

(1) Let `E` be a CM field with a CM type `Φ`, `Λ ⊂ E^n` a lattice and `F = (F_τ)_{τ ∈ Φ}` a frame, an invertible complex matrix at each `τ ∈ Φ`. For an `E`-subspace `U ⊆ E^n` of dimension `p` and `p` vectors `z_i ∈ Λ ∩ U` linearly independent over `E`, the quotient of `∏_{τ ∈ Φ} Gram(F_τ⁻¹τ(z_1), …, F_τ⁻¹τ(z_p))` by the index `[Λ ∩ U : 𝓞 E z_1 + ⋯ + 𝓞 E z_p]` does not depend on the `z_i`, and it does not change when an automorphism of `Λ` is applied to the frame and to `U` together. Written with adeles, it is the subspace height `H_A(U)` of DiophantineApproximationAndTranscendence §2.5a, raised to the power `[E:ℚ]`, for an adelic matrix `A` of `Λ` and `F`, that is `A_τ = F_τ⁻¹` at the infinite places and `A_𝔭` carrying the completion of `Λ` at `𝔭` onto `𝓞_𝔭^n` at the finite places (2.5a).

(2) Let `Λ ⊆ K^n` be a finitely generated `𝓞 K`-module spanning `K^n` and `B ⊂ (K ⊗ ℝ)^n` a compact, convex, symmetric body. For every Haar measure, the successive minima `μ_0 ≤ ⋯ ≤ μ_{n−1}` of `Λ` over `K` with respect to `B`, in the sense of SubspaceTheorem, satisfy `(∏_l μ_l)^d · vol B ≤ 2^(dn) · covol Λ`. If moreover `0` is an interior point of `B` and `B` is stable under multiplication by every element of `K ⊗ ℝ` of norm at most `1` at each infinite place, then `c_K^(−dn) · 2^(dn)/(dn)! · covol Λ ≤ (∏_l μ_l)^d · vol B`, where `c_K` is the largest house of a member of a fixed integral basis of `𝓞 K`.

The heights are those of [DiophantineApproximationAndTranscendence](../../DiophantineApproximationAndTranscendence/README.md) §2.5, which also proves their invariance under finite extension and the dual-height identity `H_A(U) = |det A|_𝔸 · H_{A^(−t)}(U^⊥)`, `U^⊥` the annihilator of `U` for the dot product; DiophantineApproximationAndTranscendence §2.5a proves their elementary properties; the minima over `K` are those [SubspaceTheorem](../../SubspaceTheorem/README.md) §4.2 defines, and their bounds come from the two halves of the real Minkowski theorem in Tau Ceti through the proofs of SubspaceTheorem §4.2, which carry over. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) reads the degrees of sub-bundles of a Hermitian vector bundle as the adelic subspace heights of DiophantineApproximationAndTranscendence §2.5a and obtains the successive minima of the bundle from (2).

Layer 2 below states the subspace height of a lattice with a frame over a CM field as Gram determinants over a lattice index, with its independence of the lattice vectors and its invariance under automorphisms of the lattice, a corollary of DiophantineApproximationAndTranscendence §2.5a (2.5a); its number places it beside DiophantineApproximationAndTranscendence §§2.5–2.5a, whose height it specialises. Layer 3 proves, for every balanced body, the attainment of the minima over `K` by one family, their comparison with the real minima, and Minkowski's second theorem over `K` (3.1).

## Conventions

`K` is a number field, `𝓞 K` its ring of integers and `d = [K:ℚ]`. The infinite places `v` of `K` are Mathlib's `NumberField.InfinitePlace`, with `mult(v) ∈ {1, 2}`; the finite places are the nonzero primes `𝔭`, with the ideal-normalised absolute value. `𝔸_K` is the adele ring of `K` and `GL_n(𝔸_K)` the group of its invertible `n × n` matrices; for `A ∈ GL_n(𝔸_K)`, `A_v` is the component at the place `v`, and `|det A|_𝔸 = ∏_v |det A_v|_v^(w_v)` with `w_v = mult(v)/[K:ℚ]` at the infinite and `w_v = 1/[K:ℚ]` at the finite places, that is the idele norm of `det A` raised to the power `1/d`. `L` is a finite extension of `K`, `w` runs over its places and `v(w)` is the place of `K` below `w`. A Plücker vector of a subspace of dimension `p` is the vector of the maximal minors of a basis, `Λ^p A` is the action of `A` on Plücker coordinates, `A^(−t)` is the inverse transpose and `U^⊥` the annihilator of `U` for the dot product.

`mixedSpace K` is Mathlib's `NumberField.mixedEmbedding.mixedSpace K`, the product of the completions of `K` at its infinite places, that is `K ⊗ ℝ`. `ι` is a finite index type and `n = card ι`. For a finitely generated `𝓞 K`-module `Λ ⊆ ι → K` spanning it, `Λ.mixedImage` is its image in `ι → mixedSpace K`, a full lattice (Tau Ceti `Submodule.mixedImage`), and `covol Λ` its covolume for a Haar measure on `ι → mixedSpace K`, the measure that also gives `vol`. Successive minima are indexed from `0`, as in SuccessiveMinima and SubspaceTheorem: `μ l` over `K` (3.1) and `λ l` over `ℝ` (Tau Ceti's `ZLattice.successiveMin` of `Λ.mixedImage`).

Notation and conventions not restated here are those of DiophantineApproximationAndTranscendence (its Conventions and §2.5) and of SubspaceTheorem (its standing hypotheses, pinned conventions and §§4.1–4.2).

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and
`*Method of the formal proof:*` how [FormalProof] proves it. The statement of 3.1 adapts a published theorem, cited
with it, to every body balanced over the completions; of it, [FormalProof] has only the case `K = ℚ` of the upper
bound and of the attainment. The comparisons in the remark of 2.5a are this roadmap's own formulation.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary of:*`,
which names a general theorem and the roadmap section that states it, and the clauses it covers when it does not cover
the whole section. As long as that general theorem is not in the library, what the line covers is proved as
[FormalProof] proves it: the `*Method of the formal proof:*` label says how, and for which form of the statement when
that proof has a narrower one; the route given with the section is that proof's unless the label says that it differs.
Once the general theorem is in the library, the proof of what the line covers is replaced by the deduction from it, and
the lemmas that only the first proof uses are removed. The statement does not change.

## Layer 2: The subspace height of a lattice with a frame

DiophantineApproximationAndTranscendence §2.5 builds the height `H_A` of vectors for `A ∈ GL_n(𝔸_K)` in its paragraph on adelic symmetric powers and absolute small vectors, under the name adelicSymmetricPowerHeight, with its subspace height through the exterior powers of `A`, its restricted product, its extension invariance and its local isometric reduction; it states the absolute Siegel lemma of Roy and Thunder and the dual-height identity in terms of it. DiophantineApproximationAndTranscendence §2.5a writes that height out over every finite extension of `K` and proves its elementary properties. This layer states the form of the subspace height that [FormalProof] has: for the adelic matrix of a lattice and a frame over a CM field, written without adeles as Gram determinants over a lattice index.

### 2.5a The subspace height of a lattice with a frame over a CM field

*Origin:* adapted from Roy and Thunder (1996): the adelic subspace height `H_A(U)` over every finite extension, with
its independence of the Plücker vector, and the change of basis of the height of vectors, which passes to subspaces
through the exterior power (DiophantineApproximationAndTranscendence §2.5a); here for the adelic matrix of a lattice
and a frame over a CM field, written without adeles as Gram determinants over a lattice index, with the change of
basis for the automorphisms of the lattice; the comparisons in the remark are this roadmap's own formulation.

*Method of the formal proof:* the height of a subspace is a product of Gram determinants at the embeddings of a CM
type divided by a lattice index; it does not depend on the chosen lattice vectors because an integral change of the
family by a matrix `T` multiplies numerator and index by the same number `|N_{E/ℚ}(det T)|`, and it is invariant
under an automorphism of the lattice applied to frame and subspace together.

*Corollary of:* DiophantineApproximationAndTranscendence §2.5a (the adelic subspace heights `H_A(U)` are well defined
and invariant under the change of basis `H_{A·g}(g^(−1)U) = H_A(U)`).

Let `E` be a CM field with a CM type `Φ`, a set of embeddings `τ : E → ℂ` containing exactly one of each pair of
complex conjugate embeddings; `τ` is applied to vectors and matrices entrywise. Let `n ≥ 1`, `Λ ⊂ E^n` a lattice,
that is a finitely generated `𝓞 E`-submodule spanning `E^n`, and `F = (F_τ)_{τ ∈ Φ}` a frame, an invertible matrix
`F_τ ∈ GL_n(ℂ)` at each `τ ∈ Φ`. For an `E`-subspace `U ⊆ E^n` of dimension `p ≥ 1` and vectors
`z_1, …, z_p ∈ Λ ∩ U` linearly independent over `E` put

```text
h_{Λ,F}(U) = ∏_{τ ∈ Φ} Gram(F_τ⁻¹τ(z_1), …, F_τ⁻¹τ(z_p)) / [Λ ∩ U : 𝓞 E z_1 + ⋯ + 𝓞 E z_p],
```

where `Gram(v_1, …, v_p) = det(⟨v_i, v_j⟩)_{i,j}` for the standard Hermitian product of `ℂ^n`, and the index is that
of abelian groups. For `U = 0` put `h_{Λ,F}(0) = 1`, the value of the formula for the empty family. Provide:

- *Well defined*: `h_{Λ,F}(U)` does not depend on the choice of `z_1, …, z_p`.
- *Automorphisms of the lattice*: for an `E`-linear automorphism `g` of `E^n` with `g(Λ) = Λ`, applying `g` to the
  frame and to the subspace together does not change the height: `h_{Λ,G}(g(U)) = h_{Λ,F}(U)` for the frame
  `G_τ = τ(g)·F_τ`.

In [FormalProof] the height is given by `GlobalTheory.SubspaceHeight.exists_height`, with
`GlobalTheory.T.gramDet_div_index_eq_of_span_eq`. For the automorphisms of `Λ` that preserve a nondegenerate Hermitian
form on `E^n`, [FormalProof] has the second statement in the form
`GlobalTheory.T.heightSup_invariant_under_hermitianLattice_aut`: for every real `δ`, the supremum of
`h_{Λ,F}(U)^(−δ)` over the subspaces `U` of each dimension does not change when `F` is replaced by `G`; its argument
uses only `g(Λ) = Λ`.

The heights `H_A` of vectors and subspaces over every finite extension of `K`, with their independence of the scalar
and of the Plücker vector, their values at `A = 1`, their change of basis under `GL_n(K)`, the height of the whole
space, of a line and the case `n = 1`, are DiophantineApproximationAndTranscendence §2.5a's.

**Remark.** This paragraph and the next are not part of the statement. For `A ∈ GL_n(𝔸_K)` and nonzero `x ∈ K^n`,
`log H_A(x)` is the height `h_ℒ̄(x)` of ArakelovGeometryAndAbelianHeights §1.12 for `O(1)` on the space of lines of the
lattice `{y : A_𝔭 y ∈ 𝓞_𝔭^n for all 𝔭}` with the Fubini–Study metrics of the norms `|A_v ·|`, and for `A = 1` this is
the Fubini–Study degree of ArakelovGeometryAndAbelianHeights §1.14 divided by `[K:ℚ]`. The change of basis of
DiophantineApproximationAndTranscendence §2.5a is the analogue, with Euclidean norms at the infinite places, of the
change of variables that DiophantineApproximationAndTranscendence §2.5 states for `TauCeti.twistedHeight`, and when every `A_v` has entries in `K` the
value `|det A|_𝔸` is its determinant product `TauCeti.deltaL` of `v ↦ A_v`.

The invariance of the heights `H_A` under finite extension, `absoluteAdelicMinima` and the dual-height identity are
DiophantineApproximationAndTranscendence §2.5's (its paragraphs on adelic symmetric powers and absolute small vectors
and on absolute adelic minima). `absoluteAdelicMinima` bounds the product
of the `n` absolute minima; for the first one it gives `inf_x H_A(x) ≤ 2^((n−1)/2)·|det A|_𝔸^(1/n)`, whose
constant is exponential in `n`. The bound for a single vector with a constant polynomial in `n`, namely for every
`ε > 0` a finite extension `L/K` and a nonzero `x ∈ L^n` with `H_A(x) ≤ e^ε·√n·|det A|_𝔸^(1/n)`, is not a
consequence of it for `n ≥ 3`.

*Route.* Let `z′_j = Σ_i T_{ij} z_i` with `T` a `p × p` matrix over `𝓞 E` of nonzero determinant. Each Gram
determinant is multiplied by `|τ(det T)|²`, so the numerator by `∏_{τ ∈ Φ} |τ(det T)|² = |N_{E/ℚ}(det T)|`, the
embeddings of `E` being the `τ ∈ Φ` and their complex conjugates and `N_{E/ℚ}` the norm; the index is multiplied by
`[𝓞 E^p : T·𝓞 E^p] = |N_{E/ℚ}(det T)|`. Two families `z` and `z″` in `Λ ∩ U` spanning `U` have a common integral
refinement: for a nonzero `c ∈ 𝓞 E` with every `c·z″_j` in the `𝓞 E`-span of the `z_i`, the family `c·z″` is an
integral change of `z` and of `z″`. For an automorphism `g`, `G_τ⁻¹τ(g z_i) = F_τ⁻¹τ(z_i)`, and
`g` maps `Λ ∩ U` onto `Λ ∩ g(U)` and the `𝓞 E`-span of the `z_i` onto that of the `g z_i`.

Written with adeles: call `A ∈ GL_n(𝔸_E)` an adelic matrix of `Λ` and `F` if `A_τ = F_τ⁻¹` at the infinite place of
each `τ ∈ Φ` and `A_𝔭(Λ ⊗ 𝓞_𝔭) = 𝓞_𝔭^n` at every finite place `𝔭` of `E`. Such an `A` presents, in the sense of
ArakelovGeometryAndAbelianHeights §1.5b (i), the Hermitian vector bundle over `𝓞 E` with module `Λ` and norm
`x ↦ |F_τ⁻¹τ(x)|` at each `τ ∈ Φ`, the conjugate norm at the conjugate embedding. For its sub-bundle of `U`, the Gram
formula of ArakelovGeometryAndAbelianHeights §1.5a in the basis `z_1, …, z_p` gives the degree `−log h_{Λ,F}(U)`, an
embedding and its conjugate having the same Gram determinant, and ArakelovGeometryAndAbelianHeights §1.5b (ii) gives
the degree `−[E:ℚ]·log H_A(U)`. So `h_{Λ,F}(U) = H_A(U)^[E:ℚ]` for the subspace height `H_A` of
DiophantineApproximationAndTranscendence §2.5a over `E`. The two statements are then the independence of the Plücker
vector and the change of basis of DiophantineApproximationAndTranscendence §2.5a, the latter at `g^(−1)`: `A·g^(−1)`
is an adelic matrix of `Λ` and `G`.

*Needs:* DiophantineApproximationAndTranscendence §2.5a (the subspace height `H_A` over `E`, its independence of the
Plücker vector and its change of basis, for the deduction; the heights `H_A` cited above) and §2.5 (for the remark:
the extension invariance, `absoluteAdelicMinima`, the dual-height identity, `TauCeti.twistedHeight` with its change of
variables and `TauCeti.deltaL`); ArakelovGeometryAndAbelianHeights §§1.5a and 1.5b (the Gram formula and the degree of
a sub-bundle in an adelic presentation, for the deduction) and §§1.12 and 1.14 (for the comparison in the remark
only); Mathlib's norm `Algebra.norm` and the index `AddSubgroup.index`.

**Checks.**

- `E = ℚ(i)`, `Φ` the inclusion `ℚ(i) ⊂ ℂ`, `n = 1`, `Λ = ℤ[i]`, `F_τ = 1`, `U = E`: `z_1 = 1` gives the Gram
  determinant `1` and the index `1`; `z_1 = 1 + i` gives `|1 + i|² = 2` and `[ℤ[i] : (1 + i)ℤ[i]] = 2`, the same
  height `1`. Without the index the value would depend on the lattice vector.
- The same with `F_τ = 2`: the Gram determinant of `2⁻¹·1` is `1/4`, so `h_{Λ,F}(E) = 1/4`. The adelic matrix with
  `A_τ = 1/2` and `A_𝔭 = 1` has `H_A(E^1) = |det A|_𝔸 = 1/2` (DiophantineApproximationAndTranscendence §2.5a), and
  `(1/2)^[E:ℚ] = 1/4`.

### Examples

The Checks of 2.5a work two instances over `ℚ(i)`, with `n = 1` and `Λ = ℤ[i]`. With the frame `F_τ = 1`, the lattice vectors `1` and `1 + i` give the Gram determinants `1` and `2` and the indices `1` and `2`, so the same height `1`. With `F_τ = 2` the height of `E` is `1/4`, the square of the adelic height `H_A(E^1) = 1/2` of DiophantineApproximationAndTranscendence §2.5a for `A_τ = 1/2`, since `[ℚ(i):ℚ] = 2`.

### Dependencies

DiophantineApproximationAndTranscendence §2.5a (the heights `H_A` written out over every finite extension, their independence of the Plücker vector and their change of basis) and §2.5 (the height `H_A` with its adelic carrier, the extension invariance, `absoluteAdelicMinima`, the dual-height identity, `TauCeti.twistedHeight` and `TauCeti.deltaL`, for the remark); ArakelovGeometryAndAbelianHeights §§1.5a and 1.5b (the Gram formula and the degree of a sub-bundle in an adelic presentation, for the deduction) and §§1.12 and 1.14 (the height of algebraic points for a metrized line bundle and the Fubini–Study degree, for the comparison in the remark only); Mathlib's norm of a number field and the index of subgroups.

## Layer 3: Minkowski's second theorem over number fields for balanced bodies

SubspaceTheorem §4.2 defines the successive minima over `K` of a module with respect to a body, and proves their attainment, their comparison with the real minima and Minkowski's second theorem over `K` for a body as in its §4.1, an approximation body, cut out by linear forms with coefficients in `K`. The body attached to a Hermitian vector bundle of rank at least two, `{x : ‖x‖_σ ≤ 1 for all σ}`, is a product of Euclidean or Hermitian balls of dimension at least two defined by real or complex matrices, so it is not of that form. This layer proves these statements, with §4.2's definition of the minima and its proofs, for every compact convex symmetric body balanced over the completions; SubspaceTheorem §4.3 already proves its span statements in that generality.

### 3.1 Successive minima over `K` for balanced bodies

*Origin:* adapted from Bombieri and Vaaler (1983): Minkowski's second theorem over a number field for bodies that are
products over the infinite places (Theorem 3, the upper bound, and Theorem 6, the lower bound under their condition
(3.16)), with their own constants; here for every compact convex symmetric body balanced over the completions, with
the attainment of the minima over `K` by one family, the three comparisons with the real minima through `c_K`, and the
constant `c_K^(−d·n) · 2^(d·n)/(d·n)!` of the lower bound; the case `K = ℚ` of the upper bound and of the attainment is
in [FormalProof], in a real form for bodies with `0` in their interior (method label), and what goes beyond it is
everything over a number field other than `ℚ` and the lower bound.

*Method of the formal proof:* [FormalProof] has the case `K = ℚ` in a real form: for a full lattice in a real normed
space of finite dimension `m`, a compact convex symmetric body with `0` in its interior and any Haar measure, the volume
of the body times the product of the `m` successive minima is at most `2^m` times the covolume
(`Formalism.FN.MinkowskiIIUpper`, proved by `Formalism.FN.minkowskiIIUpper`), and the minima are attained by one
linearly independent family of lattice vectors (`Formalism.FN.SuccMinFacts`, proved by
`Formalism.FN.existsSuccessiveMinimaVectors`). The upper bound is proved through the volume of the dilated body modulo
the lattice spanned by the first vectors of a basis adapted to that family, which does not decrease as vectors are
added and scales with the dilation.

Let `B ⊂ ι → mixedSpace K` be compact, convex, symmetric, with `0` in its interior, and **balanced over the
completions**: if `x ∈ B` and `a ∈ mixedSpace K` has `‖a_v‖ ≤ 1` at every infinite place, then `a·x ∈ B`
(with `a = −1` this gives the symmetry, which the upper bound below uses without balancedness).
For a finitely generated `𝓞 K`-module `Λ ⊆ ι → K` spanning it, `μ l` is the `K`-minimum of SubspaceTheorem §4.2,
indexed from `0`, whose definition reads `B` only as a set, so it applies to these bodies unchanged. Prove,
with the constant `c_K ≥ 1` of SubspaceTheorem §4.2, the largest house of a member of a fixed integral basis of `𝓞 K`,
and `d = [K:ℚ]`, `n = card ι`:

- *Attainment by one family*: `card ι` vectors of `Λ`, linearly independent over `K`, the `l`-th in `μ l • B`.
- *Comparison with the real minima* of `Λ.mixedImage` and `B`: `λ l ≤ μ l`, `μ l ≤ λ (d l)` and, using
  balancedness, `λ (d (l + 1) − 1) ≤ c_K · μ l`. After a `K`-basis identifies a `K`-subspace `W ⊆ K^m` with `K^k`,
  DiophantineApproximationAndTranscendence §2.8 gives `μ l ≤ λ (d l)` for the lattice `W ∩ 𝓞_K^m` and the product of
  the local unit slices, as the selection siegelBasisExtraction; the form here holds for every module and body as above.
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
over. For the body `{x : |A_v x_v| ≤ 1 at every infinite v}` and the module `{x : A_𝔭 x ∈ 𝓞_𝔭^n for all 𝔭}` of an
`A ∈ GL_n(𝔸_K)`, the upper bound and the attainment give the fixed-field adelic basis estimate that
DiophantineApproximationAndTranscendence §2.5 proves in symmetric dimension `r + 1` (its paragraph on adelic symmetric
powers and absolute small vectors).
The formal proof that the family follows uses the real upper bound, and only for a Euclidean ball; the statements over
`K`, the lower bound and `c_K` are not statements of that proof, and no step of it needs them.

*Route.* The proofs of SubspaceTheorem §4.2 apply verbatim: attainment uses that a dilate of a compact body contains
finitely many lattice points; the first two comparisons and the upper bound use the real Minkowski theorem
(Tau Ceti `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`) and Tau Ceti's extraction lemma
`TauCeti.exists_linearIndependent_comp_finrank_mul`; the third comparison multiplies `l + 1` independent vectors of
`Λ ∩ tB` by the members `ω_j` of the integral basis, which keeps them in `c_K t·B` because `B` is balanced;
the lower bound is the lower half of the real Minkowski theorem (Tau Ceti
`ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measureReal`) combined with the third
comparison.
For `μ l ≤ λ (d l)`: `d·l + 1` vectors of `Λ` with real-independent images span a `K`-subspace of dimension at least
`l + 1`, since a `K`-subspace of dimension `l` has real dimension `d·l`.

`Suggested.lean` writes out the `K`-minimum of SubspaceTheorem §4.2 as `successiveMinimum`, for every set `B`, so
that the two halves can be stated, defines the predicate `IsBalancedOverCompletions`, and states Minkowski's second
theorem over `K` in two halves: the lower bound
`covolume_le_prod_successiveMinimum_pow_mul_measure_of_isBalancedOverCompletions`, under
`IsBalancedOverCompletions B`, with `c_K` the largest house of a member of an integral basis taken as an argument, and
the upper bound `prod_successiveMinimum_pow_mul_measure_le_of_convex`, for every compact convex symmetric `B`.

*Needs:* SubspaceTheorem §§4.1–4.2 (the minima over `K`, the constant `c_K` and the proofs carried over);
DiophantineApproximationAndTranscendence §0.0 (the two halves of the real Minkowski theorem, in Tau Ceti) and §2.8 (the
extraction lemma `TauCeti.exists_linearIndependent_comp_finrank_mul`).

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

SubspaceTheorem §§4.1–4.2 (approximation bodies, mixed images, the minima over `K` and the proofs carried over); DiophantineApproximationAndTranscendence §0.0 (Tau Ceti's two halves of the real Minkowski theorem, used in their real-valued forms `ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measureReal` and `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`) and §2.8 (Tau Ceti's extraction lemma `TauCeti.exists_linearIndependent_comp_finrank_mul`). Layer 3 does not use Layer 2.

## Downstream consumers

In the family [RiemannHypothesisForDirichletLFunctions](../README.md), [SlopesOfHermitianVectorBundles](../SlopesOfHermitianVectorBundles/README.md) reads the degree of a sub-bundle of a Hermitian vector bundle as an adelic subspace height, and the heights of vectors, through DiophantineApproximationAndTranscendence §2.5a, at SlopesOfHermitianVectorBundles §§1.1, 1.3, 1.6 and 4.3, and takes the product bound for the absolute minima of the bundle, at the wider form of SlopesOfHermitianVectorBundles §4.3 and at SlopesOfHermitianVectorBundles §4.3a, from DiophantineApproximationAndTranscendence §2.5 (`absoluteAdelicMinima`); the sharper bound for the first absolute minimum, which the slope bounds of the family use, is SlopesOfHermitianVectorBundles §4.3 and does not pass through this roadmap; it obtains the attainment of the successive minima over `K` of a bundle of rank at least two, and their lower bound, from 3.1, at SlopesOfHermitianVectorBundles §4.1.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the subspace height of a lattice with a frame over a CM field, as Gram determinants over a lattice index, with its independence of the lattice vectors and its invariance under an automorphism of the lattice applied to frame and subspace together, and the comparisons of the heights `H_A` with the Arakelov height of points and with `TauCeti.twistedHeight` in the remark (2.5a); and, for every compact convex symmetric body with `0` in its interior that is balanced over the completions, the attainment of the successive minima over `K` by one family, their comparison with the real minima and Minkowski's second theorem over `K`, with its upper half for every compact convex symmetric body (3.1).

Not owned here. The height `H_A` as a construction, adelicSymmetricPowerHeight (with its subspace height through exterior powers), its adelic carrier, its restricted product, its invariance under finite extension and its local isometric reduction, the subspace heights, the absolute Siegel lemma of Roy and Thunder (`absoluteAdelicMinima`) and the dual-height identity are [DiophantineApproximationAndTranscendence](../../DiophantineApproximationAndTranscendence/README.md) §2.5; 2.5a cites the extension invariance, `absoluteAdelicMinima` and the dual-height identity and adds nothing to them. The elementary properties of `H_A` written out over every finite extension of `K` (independence of the scalar and of the Plücker vector, the values at `A = 1`, change of basis, the whole space, lines and the case `n = 1`) are DiophantineApproximationAndTranscendence §2.5a, of which 2.5a is a corollary. The Gram formula for the degree of a Hermitian vector bundle and the degree of a sub-bundle in an adelic presentation, through which 2.5a is deduced, are ArakelovGeometryAndAbelianHeights §§1.5a and 1.5b. The height of algebraic points for a metrized line bundle and the Fubini–Study degree on projective space, with which the remark of 2.5a compares `H_A`, are [ArakelovGeometryAndAbelianHeights](../../ArakelovGeometryAndAbelianHeights/README.md) §§1.12 and 1.14. The extraction lemma through field towers is DiophantineApproximationAndTranscendence §2.8, already in the Tau Ceti library. The approximation domains and bodies, pseudo-bases, mixed images and their covolumes are [SubspaceTheorem](../../SubspaceTheorem/README.md) §4.1; the successive minima over `K` themselves, the constant `c_K`, and the attainment, the comparisons and Minkowski's second theorem over `K` for the approximation bodies are SubspaceTheorem §4.2; the span statements for balanced bodies are SubspaceTheorem §4.3. Both halves of the real Minkowski theorem are DiophantineApproximationAndTranscendence §0.0, in the Tau Ceti library; the lower half is also the item `minkowski_second_lower` of [SuccessiveMinima](../../SuccessiveMinima/README.md) §2.1.

Its consumer in the family is SlopesOfHermitianVectorBundles, as described under Downstream consumers above.

## Exact supplier contracts

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

§0.0: the two halves of Minkowski's second theorem for a discrete full lattice (in the Tau Ceti library, below; 3.1). §2.5: the height `H_A` of vectors for `A ∈ GL_n(𝔸_K)`, adelicSymmetricPowerHeight, with its subspace height through the exterior powers of `A`, which §2.5a writes out over every finite extension of `K`; the adelic carrier, `A ∈ GL_n(𝔸_K)` integral and invertible at almost every finite place, with its restricted product; the extension invariance of the adelic height (local degrees add up, and the norms at the places above `v` are those at `v`); Tau Ceti's `TauCeti.twistedHeight` with its change of variables and its determinant product `TauCeti.deltaL` (for the remark of 2.5a); `absoluteAdelicMinima`, for `n ≥ 2` the bounds `|det A|_𝔸 ≤ ∏ μ_i ≤ 2^(n(n−1)/2) |det A|_𝔸` for the infima of `H_A` over `ℚ̄^n`, a bound for the product of the `n` absolute minima, of which the bound for a single vector with a constant polynomial in `n` is not a consequence for `n ≥ 3` (2.5a); and the dual-height identity `H_A(U) = |det A|_𝔸 · H_{A^(−t)}(U^⊥)`; 2.5a cites the extension invariance, `absoluteAdelicMinima` and the dual-height identity. §2.5a: the heights `H_A(x)` and `H_A(U)` written out over every finite extension of `K`, with their independence of the scalar and of the Plücker vector, the standard data at `A = 1`, the change of basis `H_{A·g}(g^(−1)x) = H_A(x)` and `H_{A·g}(g^(−1)U) = H_A(U)` for `g ∈ GL_n(K)`, `H_A` of the whole space equal to `|det A|_𝔸`, lines and the case `n = 1` (2.5a: the general theorem of which it is a corollary, applied over the CM field `E`, and the heights its remark compares). §2.8: the extraction lemma through field towers (in the Tau Ceti library, below; 3.1).

### From TauCetiRoadmap.SubspaceTheorem

§4.1: the approximation bodies, compact, convex, symmetric and balanced over the completions (in the Tau Ceti library, below); the mixed image `Submodule.mixedImage` of a finitely generated `𝓞 K`-module spanning `ι → K`, a full lattice in `ι → mixedSpace K`. §4.2: the successive minima over `K`, read through `[DiscreteTopology Λ.mixedImage] [IsZLattice ℝ Λ.mixedImage]`, whose definition 3.1 uses for every body; the constant `c_K`, the largest house of a member of a fixed integral basis, with `1 ≤ c_K`; for the approximation bodies, the attainment, the three comparisons with the real minima and Minkowski's second theorem over `K`; and their proofs, which 3.1 carries over to every balanced body.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

§1.5a: the Gram formula for the degree in a basis contained in the module. §1.5b: the presentation of a Hermitian vector bundle by an adelic matrix and `deg^(Ē_V) = −[K:ℚ]·log H_A(V)`. Both are used only for the deduction of 2.5a. §1.12: the height `h_ℒ̄(x) = deg^(x̄^*ℒ̄)/[K′:ℚ]` of an algebraic point for a line bundle with a continuous hermitian metric on a projective flat scheme over `Spec 𝓞 K`, here `O(1)` on the space of lines of a lattice with the Fubini–Study metrics of hermitian norms. §1.14: the Fubini–Study degree of a point of projective space, Tau Ceti's `TauCeti.arakelovLogHeight`, `[K:ℚ]` times the logarithm of `TauCeti.height2` away from `0`. §§1.12 and 1.14 are used only for the comparison in the remark of 2.5a.

### From Mathlib

`Algebra.norm` (the norm `N_{E/ℚ}`) and `AddSubgroup.index` (the index of 2.5a); `NumberField.IsCMField` (the CM field `E` of 2.5a); `NumberField.InfinitePlace` with `mult` and its completions `NumberField.InfinitePlace.Completion`; the adele ring `NumberField.AdeleRing` and the completions `IsDedekindDomain.HeightOneSpectrum.adicCompletion` with their ideal-normalised norms; `Matrix.GeneralLinearGroup`; `NumberField.mixedEmbedding.mixedSpace` and `NumberField.mixedEmbedding.normAtPlace`; `ZLattice.covolume`; `NumberField.house`.

### From Tau Ceti

`ZLattice.successiveMin`, with the two halves of Minkowski's second theorem for a discrete full lattice in a finite-dimensional real normed space and a convex body symmetric about `0`: the lower half `ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measureReal`, for a body with `0` in its interior, and the upper half `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume`; the extraction lemma `TauCeti.exists_linearIndependent_comp_finrank_mul`, which selects `l + 1` vectors independent over `K` from `d (l + 1)` vectors whose images are independent over `ℝ` (3.1); the approximation bodies `TauCeti.NumberField.approxBody` of SubspaceTheorem §4.1 and their balancedness `TauCeti.NumberField.mul_mem_approxBody`; `Submodule.mixedImage`.

## References

- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It states 2.5a in the form given there, the subspace height of a lattice with a frame over a CM field (`GlobalTheory.SubspaceHeight.exists_height`, in `Development/AbelianVarietyTheory/Proofs/TorusHaarMeasure/ExistsSubspaceHeightGramDeterminant.lean` under its directory `src/`).
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
- Damian Roy and Jeffrey Lin Thunder, An absolute Siegel's lemma, J. reine angew. Math. 476 (1996), 1–26: §1, the adelic heights of vectors and subspaces over every finite extension, adapted in 2.5a through DiophantineApproximationAndTranscendence §2.5a; the absolute minima of the adelic height, cited in 2.5a through DiophantineApproximationAndTranscendence §2.5.
- Enrico Bombieri and Walter Gubler, Heights in Diophantine Geometry, Cambridge University Press, 2006, Appendix C.2: successive minima over a number field and the adelic form of Minkowski's second theorem (3.1, through SubspaceTheorem §4.2).
- Enrico Bombieri and Jeffrey D. Vaaler, On Siegel's lemma, Invent. Math. 73 (1983), 11–32: Minkowski's second theorem over a number field, the upper bound (Theorem 3, p. 18) and the lower bound under condition (3.16) (Theorem 6, p. 23), cited in 3.1 for product bodies.
