# Roadmap: representations of compact groups and the Peter-Weyl theorem

Mathlib has the two ends of this subject and almost nothing in between. At the analytic end it has
**Haar measure** on a locally compact group in full: `MeasureTheory.Measure.haar`
(`MeasureTheory/Measure/Haar/Basic.lean`), the `MeasureTheory.IsHaarMeasure` typeclass, left
invariance (`isMulLeftInvariant_haarMeasure`), regularity (`regular_haarMeasure`), the normalization
`haarMeasure_self`, and the **uniqueness** theorems of `MeasureTheory/Measure/Haar/Unique.lean`
(`isHaarMeasure_eq_of_isProbabilityMeasure`, `haarScalarFactor`); on a compact group Haar is finite
(`CompactSpace.isFiniteMeasure`), so it normalizes to a probability measure. At the Hilbert-space end
it has the complete `HilbertBasis` API (`Analysis/InnerProductSpace/l2Space.lean`: `HilbertBasis.mk`,
`HilbertBasis.mkOfOrthogonalEqBot`, `Orthonormal`, `HilbertBasis.tsum_inner_mul_inner`), the inner
product on `L²` (`MeasureTheory/Function/L2Space.lean`: `L2.innerProductSpace`), and the density of
continuous functions `ContinuousMap.toLp_denseRange` on a compact space of finite measure. It even
has **one complete worked instance of the whole theory**: the Fourier orthonormal basis
`fourierBasis : HilbertBasis ℤ ℂ (Lp ℂ 2 haarAddCircle)` of `L²` of the circle
(`Analysis/Fourier/AddCircle.lean`), which is exactly Peter-Weyl for `S¹`.

What Mathlib does **not** have is the theory that connects them: the **Peter-Weyl theorem** itself
(a search for `PeterWeyl`/`matrixCoeff` in Mathlib returns nothing), continuous **unitary
representations** of a compact group as a named object, the **averaging against Haar measure** that
makes every finite-dimensional representation unitarizable and completely reducible, the **matrix
coefficients** of a representation and their **Schur orthogonality** in `L²(G)`, the statement that
the matrix coefficients of the irreducibles are dense in `C(G)` and form a **Hilbert basis of
`L²(G)`**, the Hilbert-space decomposition `L²(G) ≅ ⨁_π End(V_π)`, the **characters** of compact
groups and their orthonormality, and the engine case `SU(2)` and the **maximal torus** with the Weyl
integration and character formulas in the compact setting. The finite-group character theory Mathlib
does have (`char_orthonormal`, Maschke) is the specialization of this theory to the discrete compact
group `G` with counting measure, and it is proved by ring theory (`k[G]` semisimple), not by
integration; none of it transfers to a positive-dimensional compact group without the Haar-analytic
development this roadmap builds.

This roadmap builds that development, from Haar averaging up to Peter-Weyl and its character
corollaries, with `SU(2)` and the torus as the foundational worked engine. Suggested home:
`TauCeti/RepresentationTheory/Compact/` (the general theory) and `TauCeti/RepresentationTheory/SU2/`
(the engine case), mirroring Mathlib's `RepresentationTheory/`.

**Two neighbouring roadmaps, cited rather than rebuilt.** The Hilbert-space completeness machinery
this roadmap consumes - turning an orthonormal system into a complete `HilbertBasis`, Parseval,
product bases - is exactly the subject of [the weighted orthogonal L² bases
roadmap](../../OrthogonalL2Bases/README.md); Peter-Weyl's final assembly step is that roadmap's
"orthonormal system + completeness ⇒ `HilbertBasis`" pattern, instantiated with `G`-matrix
coefficients in place of orthogonal polynomials, and this roadmap cites its `HilbertBasis`-assembly
lemmas rather than reproving them. In the opposite direction, specializing every theorem here to a
**finite** compact group (discrete topology, normalized counting measure) recovers [the finite-group
character theory roadmap](../CharacterTheory/README.md): Schur orthogonality of matrix coefficients
becomes `char_orthonormal`, complete reducibility becomes Maschke, and Peter-Weyl becomes
`k[G] ≅ ⨁ Matₙᵢ(k)`. That specialization is a worked acceptance criterion below, not a
separate development.

## Standing conventions

- **The group.** `G` is a **compact Hausdorff topological group** throughout
  (`[Group G] [TopologicalSpace G] [IsTopologicalGroup G] [CompactSpace G] [T2Space G]`), and
  `[MeasurableSpace G] [BorelSpace G]` where the measure is used. Compact Hausdorff groups are
  locally compact, so `MeasureTheory.Measure.haar` applies, and on them it is finite
  (`CompactSpace.isFiniteMeasure`). Do **not** bundle these into one class; spell the hypotheses
  each result uses, in Kevin Buzzard's Zulip-standard unbundled style. The finite-group theory of
  [../CharacterTheory](../CharacterTheory/README.md) is the case `[Finite G]` with the discrete
  topology, and results should be stated so that case is a genuine specialization.
- **Normalized Haar is *the* measure; pin it once.** Fix `μ_G := (Measure.haar univ)⁻¹ • Measure.haar`,
  the **Haar probability measure** (`IsProbabilityMeasure`), and reuse Mathlib's `Measure.haar`
  rather than re-deriving existence. Its defining properties are Mathlib's: left invariance
  (`isMulLeftInvariant_haarMeasure`), regularity, and **uniqueness** among Haar probability measures
  (`isHaarMeasure_eq_of_isProbabilityMeasure`), so `μ_G` is convention-independent and every
  averaging integral `∫ g, F g ∂μ_G` is normalized to total mass `1`. State bi-invariance
  (left *and* right invariance, and inversion-invariance) as a lemma, since a compact group is
  unimodular; the averaging arguments use all three.
- **Complex Hilbert spaces and continuous unitary representations.** Representation spaces are
  **complex** inner product spaces; the finite-dimensional theory (Layers 1-5) works on
  finite-dimensional complex `V` with `[NormedAddCommGroup V] [InnerProductSpace ℂ V]`
  `[FiniteDimensional ℂ V]`, the `L²`-side (Layer 5) on the separable complex Hilbert space
  `Lp ℂ 2 μ_G`. A **continuous representation** is Mathlib's `ContRepresentation ℂ G V`
  (`= G →* V →L[ℂ] V`, `RepresentationTheory/Continuous/Basic.lean`); a **unitary** one additionally
  lands in the unitary group, `π g ∈ unitary (V →L[ℂ] V)` for every `g` (equivalently each `π g`
  preserves the inner product). Reuse `ContRepresentation`, `ContRepresentation.toRepresentation`,
  and `ContIntertwiningMap` rather than a private synonym; the unitarity predicate is the one new
  bundling, `IsUnitary`, and it is a `Prop` on `ContRepresentation`, not a new carrier type.
- **`FDRep` is the categorical mirror; the continuous representation is the primary spine.** Develop
  the theory on `ContRepresentation ℂ G V` with continuity and unitarity as explicit hypotheses,
  because that is where Haar averaging and matrix coefficients live and where the finite-group case
  matches Mathlib. Where the categorical statement is cleaner - Schur's lemma
  (`FDRep.finrank_hom_simple_simple`, over the algebraically closed `ℂ`), simplicity
  (`CategoryTheory.Simple`), irreducibility (`Representation.IsIrreducible`) - transport along the
  forgetful correspondence and keep the mirror in step, exactly as
  [../CharacterTheory](../CharacterTheory/README.md) keeps `FDRep` beside `MonoidAlgebra`.
  Irreducible = topologically irreducible: no closed `G`-invariant subspace other than `0` and `V`;
  in finite dimensions this agrees with `Representation.IsIrreducible`, and that agreement is a
  stated lemma.
- **Reuse Mathlib's Hilbert-basis and L² vocabulary; do not privatise it.** Bases are
  `HilbertBasis ι ℂ (Lp ℂ 2 μ_G)`, orthonormality is `Orthonormal`, Parseval is
  `HilbertBasis.tsum_inner_mul_inner`, the inner product is `L2.innerProductSpace`, density of
  continuous functions is `ContinuousMap.toLp_denseRange`. The circle instance
  (`fourierBasis`, `coe_fourierBasis`, `haarAddCircle`) is the template every general statement must
  specialize back to. The completeness-to-`HilbertBasis` assembly is
  [../OrthogonalL2Bases](../../OrthogonalL2Bases/README.md)'s subject, cited there.
- **`SU(2)` and the maximal torus are the engine, not an afterthought.** `SU(2)` is
  `Matrix.specialUnitaryGroup (Fin 2) ℂ` (`LinearAlgebra/UnitaryGroup.lean`, with its `Group`
  instance), its maximal torus the diagonal circle. The general theory is stated for abstract compact
  `G`, but its concreteness is validated on `SU(2)`/`T`, and the compact-group character and Weyl
  integration formulas are proved there as the foundational case (Layer 6). Use Mathlib's
  `specialUnitaryGroup`, `unitaryGroup`, `AddCircle`, never a private matrix group.

## What Mathlib already has (consume)

- **Haar measure and its uniqueness.** `MeasureTheory.Measure.haar` (`Measure/Haar/Basic.lean`,
  `[LocallyCompactSpace G]`), the abstract `MeasureTheory.IsHaarMeasure` (`Group/Measure.lean`),
  `haarMeasure`, `haarMeasure_self`, `isMulLeftInvariant_haarMeasure`, `regular_haarMeasure`,
  `isHaarMeasure_haarMeasure`; `Measure/Haar/Unique.lean`:
  `isHaarMeasure_eq_of_isProbabilityMeasure` (**uniqueness of the normalized Haar measure**),
  `haarScalarFactor`, `integral_isMulLeftInvariant_eq_smul_of_hasCompactSupport`,
  `measure_isMulInvariant_eq_smul_of_isCompact_closure`.
- **Finiteness on compact groups.** `CompactSpace.isFiniteMeasure`
  (`Measure/Typeclasses/Finite.lean`), so Haar on a compact group is finite and normalizable;
  the regularity instances `instRegularOfIsHaarMeasureOfCompactSpace`,
  `instInnerRegularOfIsHaarMeasureOfCompactSpace` (`Measure/Haar/Unique.lean`).
- **Bochner integral.** `MeasureTheory.integral` (`Integral/Bochner/Basic.lean`), for the
  operator- and vector-valued averaging integrals; integrability of continuous functions on a
  compact finite-measure space.
- **Continuous representations.** `ContRepresentation R G V` (`= G →* V →L[R] V`),
  `ContRepresentation.toRepresentation`, `ContIntertwiningMap`
  (`RepresentationTheory/Continuous/Basic.lean`).
- **Representations, irreducibility, Schur.** `Representation`, `Representation.IsIrreducible`
  (`RepresentationTheory/Irreducible.lean`), `FDRep k G` and `CategoryTheory.Simple`
  (`RepresentationTheory/FDRep.lean`), Schur's lemma `FDRep.finrank_hom_simple_simple` and
  `finrank_endomorphism_simple_eq_one` (over the algebraically closed `ℂ`).
- **Characters as traces.** `Representation.character`, `FDRep.character` with `char_one`,
  `char_conj`, `char_tensor`, `char_dual`, `char_linHom` (`RepresentationTheory/Character.lean`) -
  algebraic identities that hold verbatim for continuous finite-dimensional representations.
- **Hilbert-space API.** `HilbertBasis`, `HilbertBasis.mk`, `HilbertBasis.mkOfOrthogonalEqBot`,
  `HilbertBasis.coe_mk`, `Orthonormal`, `HilbertBasis.hasSum_inner_mul_inner`,
  `HilbertBasis.tsum_inner_mul_inner` (`Analysis/InnerProductSpace/l2Space.lean`);
  `L2.innerProductSpace`, `MeasureTheory.Lp` (`MeasureTheory/Function/L2Space.lean`);
  `ContinuousMap.toLp`, `ContinuousMap.toLp_denseRange` (`Function/ContinuousMapDense.lean`,
  needing `[CompactSpace] [IsFiniteMeasure] [WeaklyRegular]`).
- **The circle instance (the ready-made Peter-Weyl for `S¹`).** `AddCircle`, `AddCircle.haarAddCircle`
  (`IsProbabilityMeasure`), `fourier n : C(AddCircle T, ℂ)`, `fourierLp`,
  `fourierBasis : HilbertBasis ℤ ℂ (Lp ℂ 2 haarAddCircle)`, `coe_fourierBasis`, `orthonormal_fourier`,
  `span_fourier_closure_eq_top`, `hasSum_fourier_series_L2` (`Analysis/Fourier/AddCircle.lean`).
- **The matrix groups for the engine case.** `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup` and
  its `Group` instance (`LinearAlgebra/UnitaryGroup.lean`); `Matrix.SpecialLinearGroup`.
- **Finite-group specialization to check against.** `char_orthonormal`, Maschke
  (`IsSemisimpleRing k[G]`), and the algebraically-closed Artin-Wedderburn theorem, all in
  `RepresentationTheory/*` - the `[Finite G]` shadow of everything below.

## What is missing (build here)

Everything between the two ends. The **normalized Haar probability measure** `μ_G` as a pinned
convention and its **bi-invariance/unimodularity**; the **unitarity predicate** `IsUnitary` on
continuous representations, and **Haar averaging** of a Hermitian form into a `G`-invariant inner
product (**Weyl's unitarian trick**), giving that every finite-dimensional continuous representation
is **unitarizable**; **complete reducibility** - every finite-dimensional continuous representation is
an orthogonal direct sum of irreducibles - via averaging a projection, the compact-group analogue of
Maschke that Mathlib has only for finite `G`; the **matrix coefficients** `π_{v,w}(g) = ⟨π g v, w⟩`
as elements of `C(G)` and `L²(G)`, with their algebra (products, translates, involution); the **Schur
orthogonality relations** for matrix coefficients in `L²(G, μ_G)`, the continuous analogue of
`char_orthonormal`, proved by Haar averaging and Schur's lemma; the **Peter-Weyl theorem** in its
several equivalent forms - matrix coefficients of irreducibles are **dense in `C(G)`** (uniform) and
in `L²(G)`, they form a **`HilbertBasis` of `L²(G)`**, and the Hilbert-space decomposition
`L²(G) ≅ ⨁̂_π End(V_π)` (a `π`-isotypic block for each irreducible, of dimension `(dim V_π)²`) as
`G×G`-representations; the **characters** `χ_π = trace ∘ π` of compact groups, their **orthonormality**
`∫ χ_π χ_ρ⁻ dμ_G = δ_{πρ}` and their spanning of the class functions (central `L²` functions), a
**compact-group class-function completeness**; and the **engine case** - the finite-dimensional
irreducible representations `Sym^n(ℂ²)` of `SU(2)`, its characters, the **maximal torus** `T ⊂ SU(2)`
and the **Weyl integration formula** and **Weyl character formula** in the compact setting, from which
the general character theory of `SU(2)` follows. None of this is upstream.

`Suggested.lean` pins the load-bearing objects (`haarProb`, `IsUnitary`, `unitarize`,
`isUnitarizable`, `isCompletelyReducible`, `matrixCoeff`, `schur_orthogonality`, `IsPeterWeylBasis`,
`peterWeylBasis`, `character`, `character_orthonormal`, `su2Irrep`, `weyl_integration_formula`) and
the milestones below as `sorry`-targets, so each is claimable and the summit statement
`peterWeylBasis` is machine-checked to be expressible against the pinned Mathlib.

---

## The build, in layers

The ordering is the dependency order. Layers 0-1 (Haar averaging, unitarization) are the analytic
foundation; Layers 2-5 (complete reducibility, matrix coefficients, Schur orthogonality, Peter-Weyl)
are the core; Layer 6 (characters) is the trace corollary; and the engine case `SU(2)`/torus (Layer 6
in parallel, and validated throughout) grounds the abstract theory in a computable example. As each
layer makes the next layer's *types* expressible, its milestones go into `Suggested.lean` (with
`sorry`).

### Layer 0: normalized Haar measure and averaging

- **The Haar probability measure.** `haarProb G : Measure G`, `(Measure.haar univ)⁻¹ • Measure.haar`,
  with `IsProbabilityMeasure (haarProb G)`, `IsMulLeftInvariant`, `IsMulRightInvariant`, and
  inversion-invariance (**unimodularity of a compact group**). Uniqueness among Haar probability
  measures is `isHaarMeasure_eq_of_isProbabilityMeasure`, restated for `haarProb` so downstream
  results do not depend on the `Classical.arbitrary` choice inside `Measure.haar`.
- **The averaging operator.** For a continuous `F : G → V` into a complete normed space, the average
  `⨍ g, F g ∂(haarProb G) = ∫ g, F g ∂(haarProb G)` (total mass `1`), with its basic properties:
  linearity, that averaging a constant is that constant, and **translation invariance**
  `∫ g, F (g₀ * g) = ∫ g, F g` (from left invariance). This is the single tool the unitarian trick
  and every orthogonality relation run on. Integrability is automatic: `F` continuous on a compact
  finite-measure space is Bochner-integrable.

### Layer 1: unitarizability (Weyl's unitarian trick)

- **The unitarity predicate.** `IsUnitary (π : ContRepresentation ℂ G V) : Prop`, that each `π g`
  preserves the inner product (equivalently `π g ∈ unitary (V →L[ℂ] V)`), with the equivalence of
  the two forms and the fact that a unitary representation's matrix coefficients are bounded by
  `‖v‖ ‖w‖`.
- **Averaging a Hermitian form.** Given any inner product `⟨·,·⟩₀` on a finite-dimensional `V`
  carrying a continuous representation `π`, the averaged form
  `⟨v, w⟩_G := ∫ g, ⟨π g v, π g w⟩₀ ∂(haarProb G)` is a `G`-invariant inner product (positive-definite
  because averaging a positive continuous integrand over a probability measure with full support stays
  positive-definite, using `IsOpenPosMeasure`/regularity of Haar). Name it `unitarize`.
- **Every finite-dimensional continuous representation is unitarizable.** `isUnitarizable`: there is a
  `G`-invariant inner product making `π` unitary, i.e. `π` is `IsUnitary` for `⟨·,·⟩_G`. This is the
  compact-group replacement for the invertibility of `|G|` in Maschke, and everything downstream may
  assume a representation is unitary without loss of generality.

### Layer 2: complete reducibility

- **Invariant complements.** For a unitary `π` and a closed `G`-invariant subspace `W ⊆ V`, the
  **orthogonal complement** `Wᗮ` is `G`-invariant (unitarity), so `V = W ⊕ Wᗮ` as representations.
  This is the averaging-free half, once Layer 1 gives unitarity.
- **Complete reducibility (compact Maschke).** `isCompletelyReducible`: every finite-dimensional
  continuous representation of a compact group is an **orthogonal direct sum of irreducibles**, by
  induction on dimension using invariant complements. State it both as an internal orthogonal
  decomposition and, via the `FDRep` mirror, as semisimplicity of the finite-dimensional
  representation category. Specializing to `[Finite G]` recovers Maschke's `IsSemisimpleModule`.
- **Schur's lemma, transported.** Import `FDRep.finrank_hom_simple_simple` and
  `finrank_endomorphism_simple_eq_one` (over `ℂ`, algebraically closed) as: a continuous
  `G`-intertwiner between finite-dimensional irreducibles is `0` or an isomorphism, and a self-
  intertwiner is a scalar. This is stated through `ContIntertwiningMap` and the `FDRep` mirror, not
  reproved.

### Layer 3: matrix coefficients

- **Definition.** `matrixCoeff π v w : C(G, ℂ)`, `g ↦ ⟪π g v, w⟫` for `v w : V`; continuous because
  `π` is continuous and the inner product is continuous. Its image in `L²(G, haarProb G)` is
  `matrixCoeffLp π v w : Lp ℂ 2 (haarProb G)` (via `ContinuousMap.toLp`, using finiteness of Haar).
- **The algebra of matrix coefficients.** Sesquilinearity in `(v, w)`; behaviour under **left and
  right translation** `matrixCoeff π v w (g₀ * g)` and `(g * g₀)` (each a matrix coefficient again,
  the `G×G`-action that structures `L²(G)`); the **involution** `conj (matrixCoeff π v w) =
  matrixCoeff π̄ w v` under the contragredient/unitarity; products of matrix coefficients of `π, ρ`
  are matrix coefficients of `π ⊗ ρ`. This is the `C(G)`-subalgebra Peter-Weyl density is stated for.
- **The matrix-coefficient space of a representation.** For an irreducible `π` with orthonormal basis
  `(e_i)` of `V`, the `(dim V)²` functions `π_{ij}(g) = ⟪π g e_j, e_i⟫`; the span of all matrix
  coefficients of all finite-dimensional representations is the **representative ring**
  `𝓡(G) ⊆ C(G)`, a `*`-subalgebra containing constants and separating points (it separates points
  precisely because `G` has enough finite-dimensional representations - itself part of Peter-Weyl,
  Layer 5).

### Layer 4: Schur orthogonality in L²(G)

- **First orthogonality (fixed irreducible).** For a unitary irreducible `π` of dimension `d` with
  orthonormal basis `(e_i)`, `∫ g, π_{ij}(g) · conj(π_{kl}(g)) ∂(haarProb G) = d⁻¹ · δ_{ik} δ_{jl}`,
  proved by averaging the rank-one operator `v ↦ ⟪v, e_l⟫ e_j` into a `G`-intertwiner and applying
  Schur (self-intertwiner is a scalar, whose trace fixes the constant `d⁻¹`). This is the continuous
  analogue of `char_orthonormal`, and the load-bearing orthogonality computation.
- **Second orthogonality (distinct irreducibles).** For **inequivalent** unitary irreducibles `π, ρ`,
  every matrix coefficient of `π` is orthogonal in `L²(G)` to every matrix coefficient of `ρ`, by
  averaging into an intertwiner `V_π → V_ρ` and applying the vanishing half of Schur. Name the
  packaged statement `schur_orthogonality`.
- **The normalized matrix coefficients are orthonormal.** `√d · π_{ij}` over all irreducibles `π`
  (one representative per equivalence class) and all `i, j` form an **orthonormal system** in
  `L²(G, haarProb G)` (`Orthonormal`), the system Peter-Weyl proves complete. Their indexing set is
  `Σ π, Fin (dim V_π) × Fin (dim V_π)`.

### Layer 5: the Peter-Weyl theorem

- **Density in `C(G)` (the analytic core).** The representative ring `𝓡(G)` of Layer 3 is **dense in
  `C(G)` for the uniform norm**. This is the one genuinely hard analytic step: it is proved by the
  spectral theorem for the compact self-adjoint convolution operator `f ↦ k * f` on `L²(G)` for a
  suitable symmetric kernel `k` (each nonzero eigenspace is finite-dimensional and `G`-invariant,
  hence built from matrix coefficients), together with an approximate identity so that convolution
  approximates the identity uniformly on `C(G)`. The compact-operator/spectral input is the
  substantial prerequisite; state it as an explicit named lemma
  (`compact_convolution_selfAdjoint_hasEigenspaces`) rather than assuming it.
- **Density in `L²(G)`.** From uniform density plus `ContinuousMap.toLp_denseRange` (continuous
  functions dense in `L²` on the compact finite-measure `G`), `𝓡(G)` is **dense in `L²(G)`**, so its
  orthogonal complement is `⊥`.
- **The Peter-Weyl Hilbert basis (the summit).** Combining Layer 4's orthonormal system with
  `L²`-density via `HilbertBasis.mkOfOrthogonalEqBot`, the normalized matrix coefficients
  `{√(dim V_π) · π_{ij}}` form a **`HilbertBasis (Σ π, Fin dπ × Fin dπ) ℂ (Lp ℂ 2 (haarProb G))`**.
  Pin the object `peterWeylBasis` and the element-level `coe_peterWeylBasis` (in the style
  [../OrthogonalL2Bases](../../OrthogonalL2Bases/README.md) mandates: a bundled `HilbertBasis` without
  its `coe_*` is near-vacuous). Package the predicate `IsPeterWeylBasis` so the statement is
  source-agnostic. Parseval is `HilbertBasis.tsum_inner_mul_inner`.
- **The isotypic decomposition.** As unitary `G×G`-representations (left and right translation),
  `L²(G) ≅ ⨁̂_π (V_π ⊗ V_π*)`, i.e. `⨁̂_π End(V_π)`, the closure of the algebraic direct sum over
  the irreducibles `π`, with the `π`-block of dimension `(dim V_π)²` spanned by `π`'s matrix
  coefficients. State the block projections (averaging against `dim V_π · conj χ_π`, from Layer 6)
  and that they are the isotypic projectors.

### Layer 6: characters of compact groups

- **The character.** `character π : C(G, ℂ)`, `g ↦ trace (π g)`; a matrix coefficient sum
  `∑_i π_{ii}`, hence continuous and (Layer 3) an element of `L²(G)`. It is a **class function**:
  `character π (h * g * h⁻¹) = character π g` (`char_conj` transported), i.e. central in `C(G)`.
  Reuse `FDRep.character` and its identities (`char_one`, `char_tensor`, `char_dual`) verbatim; they
  are algebraic.
- **Orthonormality of characters.** `character_orthonormal`:
  `∫ g, χ_π(g) · conj(χ_ρ(g)) ∂(haarProb G) = δ_{[π],[ρ]}` for irreducibles, immediate from Layer 4's
  first orthogonality summed over `i = j`, `k = l`. The `[Finite G]` shadow is exactly Mathlib's
  `char_orthonormal`.
- **Characters span the class functions.** The characters of irreducibles form an **orthonormal
  Hilbert basis of the space of central `L²` functions** (the `L²` class functions), the "central"
  restriction of Peter-Weyl: project `peterWeylBasis` onto the center of each `End(V_π)` block, which
  is one-dimensional and spanned by `χ_π`. This is the compact-group **class-function completeness**,
  the infinite analogue of "#irreducibles = #conjugacy classes".

### Engine case: `SU(2)` and the maximal torus

Built in parallel with Layers 3-6 and used to validate every abstract statement on a concrete,
computable group. The general theory of a compact **connected** group reduces to its maximal torus
and rank-one `SU(2)` subgroups, so `SU(2)` is foundational.

- **The group and its torus.** `SU(2) = Matrix.specialUnitaryGroup (Fin 2) ℂ` with its `Group`
  instance, compact (closed bounded in `Matrix (Fin 2) (Fin 2) ℂ`) and Hausdorff; the **maximal
  torus** `T` the diagonal subgroup `{diag(e^{iθ}, e^{-iθ})}`, isomorphic to `AddCircle` / `S¹`, and
  the fact that **every element of `SU(2)` is conjugate into `T`** (unitary diagonalization).
- **The irreducibles.** `su2Irrep n : ContRepresentation ℂ SU(2) (Sym^n ℂ²)`, the representation on
  degree-`n` homogeneous polynomials in two variables (`Sym^n(ℂ²)`), of dimension `n+1`; that these
  are **irreducible**, **pairwise inequivalent**, and (via Peter-Weyl for `SU(2)`) **exhaust** the
  irreducibles.
- **The character on the torus.** `character (su2Irrep n)` restricted to `T` is the Laurent
  polynomial `χ_n(θ) = e^{inθ} + e^{i(n-2)θ} + ⋯ + e^{-inθ} = sin((n+1)θ)/sin θ`, computed directly
  from the diagonal action; the `{χ_n}` are an orthonormal basis of the **even/`W`-invariant**
  functions on `T` (the class functions of `SU(2)`), recovering Layer 6's completeness concretely.
- **Weyl integration and character formulas.** `weyl_integration_formula`: for a class function `f`
  on `SU(2)`, `∫_{SU(2)} f dμ = (1/2)∫_T f(θ) · |Δ(θ)|² dθ` with Weyl factor
  `|Δ(θ)|² = |e^{iθ} - e^{-iθ}|² = 4 sin²θ`, reducing integration over `SU(2)` to the torus; and the
  **Weyl character formula** `χ_n(θ) = (e^{i(n+1)θ} - e^{-i(n+1)θ})/(e^{iθ} - e^{-iθ})` as the
  alternating-sum form. These are the compact-group specializations that a later
  general-compact-Lie-group roadmap (maximal tori, roots, the Weyl group) would abstract; here they
  are proved by hand for `SU(2)`.

---

## Worked examples (acceptance criteria)

- **Finite groups recover [../CharacterTheory](../CharacterTheory/README.md).** For `[Finite G]` with
  the discrete topology, `haarProb G` is normalized counting measure `|G|⁻¹ • count`, `L²(G)` is
  `G → ℂ` with the Hermitian pairing, `isCompletelyReducible` **is** Maschke, `schur_orthogonality`
  **is** `char_orthonormal`, `character_orthonormal` **is** the first orthogonality relation, and
  `peterWeylBasis` **is** the statement `dim L²(G) = ∑_π (dim V_π)² = |G|` with the matrix
  coefficients as a basis, i.e. `k[G] ≅ ⨁_π End(V_π)`. Acceptance: each general theorem, specialized
  to `G = ZMod n` or `G = Equiv.Perm (Fin 3)`, reduces to the finite-group statement without new
  hypotheses.
- **The circle `S¹` and Fourier series are Peter-Weyl.** For `G = AddCircle 1` (abelian, so every
  irreducible is one-dimensional, `dim V_π = 1`, indexed by `ℤ`), the matrix coefficients are the
  characters `fourier n`, `peterWeylBasis` **is** Mathlib's `fourierBasis`, and the Peter-Weyl
  `L²`-density **is** `span_fourier_closure_eq_top`. Acceptance: the general `peterWeylBasis`,
  specialized to `AddCircle 1`, is `fourierBasis` (up to the indexing equivalence
  `Σ π, Fin 1 × Fin 1 ≃ ℤ`), and `character_orthonormal` is `orthonormal_fourier`. This is the sanity
  check that the abstract statements are correctly normalized.
- **`SU(2)` irreducibles and characters.** `su2Irrep n` is irreducible of dimension `n+1`; its
  character on `T` is `sin((n+1)θ)/sin θ`; `∫_{SU(2)} χ_m χ_n⁻ dμ = δ_{mn}` computed **via**
  `weyl_integration_formula` (reducing to `(2/π)∫_0^π sin((m+1)θ)sin((n+1)θ) dθ = δ_{mn}`); and the
  `{su2Irrep n}` exhaust the irreducibles. Acceptance: the character orthonormality for `SU(2)` is
  proved through the Weyl integration formula, not assumed, and matches Layer 6's abstract
  `character_orthonormal`.

## Ordering

Layer 0 (normalized Haar, averaging) is the foundation and comes first; it needs only Mathlib's
`Measure.haar` and the Bochner integral. Layer 1 (unitarizability) needs Layer 0's averaging; Layer 2
(complete reducibility) needs Layer 1's unitarity and Mathlib's Schur; Layer 3 (matrix coefficients)
needs Layer 1 (unitarity bounds them) and Layer 0 (the `L²` embedding). Layer 4 (Schur orthogonality)
needs Layers 1-3 and is the load-bearing computation. Layer 5 (Peter-Weyl) needs Layer 4's orthonormal
system and its own hard analytic prerequisite, the compact-operator spectral theorem for the
convolution operator, which is named as a target within it; the `HilbertBasis` assembly cites
[../OrthogonalL2Bases](../../OrthogonalL2Bases/README.md). Layer 6 (characters) is a corollary of Layers
4-5. The `SU(2)`/torus engine is built alongside Layers 3-6 and is where the character and Weyl
integration formulas are proved concretely; the circle and finite-group specializations are the
acceptance criteria that keep the abstract normalizations honest. A contributor can complete Layers
0-2 (the unitarian trick and complete reducibility) as a self-contained first deliverable, well before
the Peter-Weyl density argument.

## References

- D. Bump, *Lie Groups*, 2nd ed., Springer GTM 225 (2013) - the compact-group chapters: Haar measure,
  Schur orthogonality, Peter-Weyl, the character theory, and `SU(2)` with the Weyl integration and
  character formulas as the worked engine (Chs. 2-4, 15-18).
- A. W. Knapp, *Lie Groups Beyond an Introduction*, 2nd ed., Birkhäuser (2002) - Peter-Weyl,
  characters of compact groups, and the reduction of a compact connected group to its maximal torus
  (Ch. IV).
- G. B. Folland, *A Course in Abstract Harmonic Analysis*, 2nd ed., CRC (2016) - the Haar-analytic
  development: Haar measure, convolution and approximate identities, the compact convolution operator,
  and the Peter-Weyl theorem in the `L²(G)` and `C(G)` forms (Ch. 5).
- T. Bröcker, T. tom Dieck, *Representations of Compact Lie Groups*, Springer GTM 98 (1985) -
  unitarizability, complete reducibility, matrix coefficients, Peter-Weyl, and the `SU(2)`/maximal-
  torus structure theory (Chs. II-III, VI).
- E. Hewitt, K. A. Ross, *Abstract Harmonic Analysis I/II* - the definitive reference for Haar measure
  and the representation theory of general (not necessarily Lie) compact groups.
