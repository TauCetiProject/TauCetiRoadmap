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

**What is *not* consumable, and is a build item here.** The consume list above
does not include several things the roadmap needs, and they must not be mistaken for upstream
infrastructure:

- the **continuous-representation-to-`FDRep` correspondence** (the forgetful functor and its
  compatibility with `FDRep.character`);
- the equivalence between **topological irreducibility** (no closed invariant subspace) and
  **algebraic irreducibility** (`Representation.IsIrreducible`) in finite dimensions, and the
  matching of `ContIntertwiningMap` with algebraic intertwiners;
- **joint continuity** `g ↦ π g`: `ContRepresentation ℂ G V` bundles only that each `π g` is a
  continuous linear map, not that `g ↦ π g` is continuous, yet the matrix coefficients need it, so it
  is an explicit added hypothesis where they are formed;
- the `SU(2)` **topological-group, compactness, and Borel instances** (`SU(2)` closed and bounded in
  `Matrix (Fin 2) (Fin 2) ℂ`); and
- **operator- and vector-valued Bochner averaging** against Haar (the averaging API the unitarian
  trick and Schur orthogonality run on).

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

`Suggested.lean` pins the load-bearing objects (`haarProb` and its invariance lemmas, `IsUnitary`,
`isUnitarizable` as an averaged positive operator, `IsInvariant`,
`exists_orthogonal_irreducible_decomposition` with `isCompletelyReducible` as its algebraic corollary,
`matrixCoeff`, `representativeStarSubalgebra`, `schur_orthogonality_self`/`_basis`,
`convolutionOperator` with its compactness and spectral inputs, `IrrepModel`/`IsIrrepSkeleton`,
`IsPeterWeylBasis`, `peterWeylBasis`, `character`, `centralLp`, `character_orthonormal_self`,
`su2Irrep` with `su2Irrep_inequiv`/`su2Irrep_exhaust`, `weyl_integration_formula`) and the milestones
below as `sorry`-targets, so each is claimable and the summit statement `peterWeylBasis` is
machine-checked to be expressible against the pinned Mathlib.

---

## The build, in layers

The ordering is the dependency order. Layers 0-1 (Haar averaging, unitarization) are the analytic
foundation; Layers 2-5 (complete reducibility, matrix coefficients, Schur orthogonality, Peter-Weyl)
are the core; Layer 6 (characters) is the trace corollary; and the engine case `SU(2)`/torus (Layer 6
in parallel, and validated throughout) grounds the abstract theory in a computable example. As each
layer makes the next layer's *types* expressible, its milestones go into `Suggested.lean` (with
`sorry`).

### Layer 0: normalized Haar measure and averaging

- **The Haar probability measure.** `haarProb G : Measure G`, `(Measure.haar univ)⁻¹ • Measure.haar`.
  The rescaling is only meaningful once the total mass is known finite and nonzero, so those are named
  milestones, not simp side-conditions: `haar_univ_lt_top` (finiteness, from
  `CompactSpace.isFiniteMeasure`) and `haar_univ_ne_zero` (nonzero, from `IsOpenPosMeasure` on the
  nonempty open `univ`). Then `haarProb_apply_univ : haarProb G univ = 1` and
  `isProbabilityMeasure_haarProb`. Invariance is pinned as `isMulLeftInvariant_haarProb`,
  `isMulRightInvariant_haarProb`, and **inversion-invariance** `isInvInvariant_haarProb`
  (`Measure.IsInvInvariant`, i.e. `map Inv.inv (haarProb G) = haarProb G`) - **unimodularity of a
  compact group**. Uniqueness
  among Haar probability measures is `isHaarMeasure_eq_of_isProbabilityMeasure`, restated for
  `haarProb` so downstream results do not depend on the `Classical.arbitrary` choice inside
  `Measure.haar`.
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
- **Averaging a Hermitian form, as a positive operator.** Given the fixed inner product `⟨·,·⟩` on a
  finite-dimensional `V` carrying a continuous representation `π`, the averaged form
  `⟨v, w⟩_G := ∫ g, ⟨π g v, π g w⟩ ∂(haarProb G)` is a `G`-invariant inner product (positive-definite
  because averaging a positive continuous integrand over a probability measure of full support stays
  positive-definite, using `IsOpenPosMeasure`/regularity of Haar). Because Lean fixes one
  `InnerProductSpace ℂ V` instance, do **not** package the result as a bare `InnerProductSpace.Core`:
  that alone does not make the *given* `π` unitary under the fixed instance. Instead
  represent the averaged form by its **Gram operator** `S`, a positive-definite self-adjoint
  `S : V →L[ℂ] V` with `⟨v, w⟩_G = ⟨S v, w⟩`; `G`-invariance of the form is exactly
  `(π g)† ∘ S ∘ (π g) = S`.
- **Every finite-dimensional continuous representation is unitarizable.** `isUnitarizable`: there is
  such a positive-definite self-adjoint `S` intertwined by every `π g` as above. Equivalently there is
  an equivalent Hilbert structure (retopologize `V` by `⟨·,·⟩_G`, or conjugate `π` by `S^{1/2}` on the
  original space) for which all `π g` are unitary, so downstream results may assume `IsUnitary` without
  loss of generality. This is the compact-group replacement for the invertibility of `|G|` in Maschke.

### Layer 2: complete reducibility

- **Invariant complements.** For a unitary `π` and a closed `G`-invariant subspace `W ⊆ V`, the
  **orthogonal complement** `Wᗮ` is `G`-invariant (unitarity), so `V = W ⊕ Wᗮ` as representations.
  This is the averaging-free half, once Layer 1 gives unitarity.
- **Complete reducibility (compact Maschke), internal form first.** The primary
  statement `exists_orthogonal_irreducible_decomposition` is the *geometric* one: a unitary
  finite-dimensional continuous representation is an **orthogonal direct sum of irreducible invariant
  subspaces** - a finite family `U : Fin k → Submodule ℂ V` of invariant subspaces, each minimal (no
  proper nonzero invariant subspace, i.e. the block is topologically irreducible), forming an internal
  direct sum (`DirectSum.IsInternal`) and pairwise orthogonal - proved by induction on dimension using
  invariant complements. The algebraic statement `isCompletelyReducible`
  (`IsSemisimpleModule (MonoidAlgebra ℂ G) π.toRepresentation.asModule`) is then a **corollary** via an
  explicit correspondence lemma; it is a *specialization-compatible* shadow, not literally Mathlib's
  Maschke theorem, so
  the finite-group case *specializes to* `IsSemisimpleModule` rather than being it. Keep the `FDRep`
  mirror (semisimplicity of the finite-dimensional representation category) in step.
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
- **The matrix-coefficient space of a representation, as a `*`-subalgebra.** For an
  irreducible `π` with orthonormal basis `(e_i)` of `V`, the `(dim V)²` functions
  `π_{ij}(g) = ⟪π g e_j, e_i⟫`; the span of all matrix coefficients of all finite-dimensional
  representations is the **representative ring** `𝓡(G) ⊆ C(G)`. Pin it as a `StarSubalgebra`
  (`representativeStarSubalgebra`), not merely a `Submodule` (`representativeSubmodule`): the density
  proof needs it closed under multiplication (via `π ⊗ ρ`), containing the constants (trivial
  representation), and closed under conjugation (via the contragredient), and a bare submodule loses
  that structure.
  - **Do not claim point separation here.** That `𝓡(G)` separates points is
    *equivalent to* "`G` has enough finite-dimensional representations", which **is** Peter-Weyl, so
    asserting it in Layer 3 is circular. Separation is a **corollary** proved in Layer 5, downstream of
    the analytic density theorem (`representativeStarSubalgebra_separatesPoints`), and Stone-Weierstrass
    separation is used only *after* Peter-Weyl has produced the representations, never to prove density.

### Layer 4: Schur orthogonality in L²(G)

- **First orthogonality (fixed irreducible).** For a unitary irreducible `π` of dimension `d` with
  orthonormal basis `(e_i)`, `∫ g, π_{ij}(g) · conj(π_{kl}(g)) ∂(haarProb G) = d⁻¹ · δ_{jl} δ_{ik}`,
  proved by averaging the rank-one operator `v ↦ ⟪v, e_l⟫ e_j` into a `G`-intertwiner and applying
  Schur (self-intertwiner is a scalar, whose trace fixes the constant `d⁻¹`). This is the continuous
  analogue of `char_orthonormal`, and the load-bearing orthogonality computation.
  - **Pin the convention.** With Mathlib's sesquilinear `L2.innerProductSpace` and
    `matrixCoeff π v w g = ⟪π g v, w⟫`, the exact placement of the conjugation and the Kronecker
    indices is convention-sensitive. State the basis-level identity `schur_orthogonality_basis`
    (`⟪matrixCoeffLp π (e j) (e i), matrixCoeffLp π (e l) (e k)⟫ = d⁻¹ · δ_{jl} · δ_{ik}`) in Mathlib's
    exact convention, **verify it against `fourierBasis` on `AddCircle`**, and derive the coordinate-free
    `schur_orthogonality_self` (`= d⁻¹ · ⟪v₁,v₂⟫ · conj⟪w₁,w₂⟫`) from it, rather than stating the
    classical formula informally.
- **Second orthogonality (distinct irreducibles).** For **inequivalent** unitary irreducibles `π, ρ`,
  every matrix coefficient of `π` is orthogonal in `L²(G)` to every matrix coefficient of `ρ`, by
  averaging into an intertwiner `V_π → V_ρ` and applying the vanishing half of Schur. Name the
  packaged statement `schur_orthogonality`.
- **The normalized matrix coefficients are orthonormal.** `√d · π_{ij}` over all irreducibles `π`
  (one representative per equivalence class) and all `i, j` form an **orthonormal system** in
  `L²(G, haarProb G)` (`Orthonormal`), the system Peter-Weyl proves complete. Their indexing set is
  `Σ π, Fin (dim V_π) × Fin (dim V_π)`.

### Layer 5: the Peter-Weyl theorem

- **Density in `C(G)` (the analytic core), via the non-circular convolution route.**
  The representative `*`-subalgebra is **dense in `C(G)` for the uniform norm**
  (`representativeStarSubalgebra_dense`). This is the one genuinely hard analytic step, and it must be
  proved *without* assuming point separation (which is Peter-Weyl itself). Split it into explicit,
  individually non-circular lemmas:
  - `convolutionOperator k : Lp ℂ 2 (haarProb G) →L[ℂ] Lp ℂ 2 (haarProb G)`, `f ↦ k * f`;
  - `convolutionOperator_isCompact` - the operator is compact (`IsCompactOperator`);
  - `convolutionOperator_isSelfAdjoint` for a symmetric kernel `k g⁻¹ = conj (k g)`;
  - `nonzero_eigenspace_finite_dim_continuous_rep` - each nonzero eigenspace is
    finite-dimensional (Mathlib's `IsCompactOperator.finite_dimensional_eigenspace`, pinned as
    `convolutionOperator_eigenspace_finiteDimensional`) **and** translation-invariant, so it carries a
    continuous finite-dimensional representation whose functions lie in `𝓡(G)` - this is where the
    finite-dimensional representations *come from*, proved before any separation claim, so nothing is
    smuggled in;
  - `approx_identity_exists` - a net of nonnegative symmetric kernels whose convolution tends to the
    identity uniformly on `C(G)`.

  Density then follows: convolving `f ∈ C(G)` by an approximate identity approximates `f` uniformly,
  and spectral decomposition writes each convolution as a finite sum of matrix coefficients. Only
  *after* this does point separation (`representativeStarSubalgebra_separatesPoints`) and any
  Stone-Weierstrass argument enter, as corollaries.
- **Density in `L²(G)`.** From uniform density plus `ContinuousMap.toLp_denseRange` (continuous
  functions dense in `L²` on the compact finite-measure `G`), `𝓡(G)` is **dense in `L²(G)`**, so its
  orthogonal complement is `⊥`.
- **The Peter-Weyl Hilbert basis (the summit).** Combining Layer 4's orthonormal system with
  `L²`-density via `HilbertBasis.mkOfOrthogonalEqBot`, the normalized matrix coefficients
  `{√(dim V_π) · π_{ij}}` form a Hilbert basis of `L²(G)` indexed by `Σ π, Fin dπ × Fin dπ`.
  - **The index is chosen data, not free.** "One representative per equivalence
    class" hides a skeleton of the unitary dual: chosen model spaces, chosen unitary irreducible
    representations, and chosen orthonormal bases. Package this as a structure `IrrepModel G` (carrier,
    Hilbert structure, representation, unitarity, irreducibility, dimension) and a predicate
    `IsIrrepSkeleton (models : ι → IrrepModel G)` ("pairwise inequivalent and exhaustive up to
    isomorphism"); the basis index is `Σ i, Fin (models i).dim × Fin (models i).dim`.
  - Because the summit `peterWeylBasis` quantifies the basis existentially, the element-level content
    (the analogue of `coe_peterWeylBasis`) must live **inside** `IsPeterWeylBasis models b`, which
    asserts `b ⟨i, j, k⟩ = √(models i).dim • matrixCoeffLp (models i).rep e_j e_k` for the chosen
    bases - otherwise the bundled `HilbertBasis` is near-vacuous, in exactly the sense
    [../OrthogonalL2Bases](../../OrthogonalL2Bases/README.md) warns against. Parseval is
    `HilbertBasis.tsum_inner_mul_inner`.
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
- **Characters span the class functions.** "Central `L²` functions" is not a
  slogan: elements of `L²(G)` are a.e. equivalence classes, so conjugation-invariance must be **almost
  everywhere**, not pointwise. Pin the target as a genuine *closed* subspace
  `centralLp G : Submodule ℂ (Lp ℂ 2 (haarProb G))`, the functions fixed a.e. by every conjugation
  `f ↦ f ∘ (h · h⁻¹)`, and prove `characterLp_mem_centralLp`. The characters of the irreducibles form
  an **orthonormal Hilbert basis of `centralLp G`**, the "central" restriction of Peter-Weyl: project
  `peterWeylBasis` onto the center of each `End(V_π)` block, which is one-dimensional and spanned by
  `χ_π`. This is the compact-group **class-function completeness**, the infinite analogue of
  "#irreducibles = #conjugacy classes".

### Engine case: `SU(2)` and the maximal torus

Built in parallel with Layers 3-6 and used to validate every abstract statement on a concrete,
computable group. The general theory of a compact **connected** group reduces to its maximal torus
and rank-one `SU(2)` subgroups, so `SU(2)` is foundational.

- **The group and its torus.** `SU(2) = Matrix.specialUnitaryGroup (Fin 2) ℂ` with its `Group`
  instance, compact (closed bounded in `Matrix (Fin 2) (Fin 2) ℂ`) and Hausdorff; the **maximal
  torus** `T` the diagonal subgroup `{diag(e^{iθ}, e^{-iθ})}`, isomorphic to `AddCircle` / `S¹`, and
  the fact that **every element of `SU(2)` is conjugate into `T`** (unitary diagonalization).
- **The irreducibles and their classification.** `su2Irrep n :
  ContRepresentation ℂ SU(2) (Sym^n ℂ²)`, the representation on degree-`n` homogeneous polynomials in
  two variables (`Sym^n(ℂ²)`), of dimension `n+1`. **Peter-Weyl does not classify these**: it gives a
  Hilbert-space decomposition into *some* irreducibles, but does not identify them as the symmetric
  powers, and the torus character basis below itself depends on knowing the irreducible characters are
  exactly the `χ_n`. So the classification is a **separate, prior layer**, proved directly:
  - **Torus conjugacy** `su2_conjugate_into_torus`: every element of `SU(2)` is conjugate into the
    maximal torus (unitary diagonalization).
  - **Weight/string decomposition** `su2Irrep_character_torus`: on the torus, `su2Irrep n` has weights
    `{n, n-2, …, -n}`, each with multiplicity one, computed from the diagonal action.
  - **Highest-weight argument**: `su2Irrep n` is **irreducible** (`su2Irrep_irreducible`), the
    `su2Irrep n` are **pairwise inequivalent** (distinct highest weights, `su2Irrep_inequiv`), and they
    **exhaust** the finite-dimensional irreducibles (`su2Irrep_exhaust`: every finite-dimensional
    unitary irreducible admits a nonzero intertwiner from some `su2Irrep n`, hence by Schur is
    isomorphic to it). Only *after* this is character orthonormality used as validation, never as the
    classification.
- **The character on the torus.** From the weight decomposition, `χ_n(θ) = e^{inθ} + e^{i(n-2)θ} +
  ⋯ + e^{-inθ} = sin((n+1)θ)/sin θ`; the `{χ_n}` are an orthonormal basis of the **even/`W`-invariant**
  functions on `T` (the class functions of `SU(2)`), recovering Layer 6's completeness concretely -
  once the classification above has shown these are *all* the characters.
- **Weyl integration and character formulas.** `weyl_integration_formula`: for a class function `f`
  on `SU(2)`, integration reduces to the torus with Weyl factor
  `|Δ(θ)|² = |e^{iθ} - e^{-iθ}|² = 4 sin²θ`. **Pin one normalization and test it:**
  the pinned form is `∫_{SU(2)} f dμ = (1/(2π)) ∫₀^π f(θ) · 4 sin²θ dθ` (Haar probability measure on
  `SU(2)`, Weyl chamber `[0, π]`, transported torus density `(1/(2π))·4 sin²θ`), and the `f = 1` test
  `weyl_integration_formula_normalized` confirms `(1/(2π)) ∫₀^π 4 sin²θ dθ = 1`; equivalent forms on
  `AddCircle`, `[0, 2π]`, and the full torus are then derived from it. The **Weyl character formula**
  `χ_n(θ) = (e^{i(n+1)θ} - e^{-i(n+1)θ})/(e^{iθ} - e^{-iθ})` is the alternating-sum form. These are the
  compact-group specializations that a later general-compact-Lie-group roadmap (maximal tori, roots,
  the Weyl group) would abstract; here they are proved by hand for `SU(2)`.

---

## Worked examples (acceptance criteria)

- **Finite groups recover [../CharacterTheory](../CharacterTheory/README.md).** For `[Finite G]` with
  the discrete topology, `haarProb G` is normalized counting measure `|G|⁻¹ • count`, `L²(G)` is
  `G → ℂ` with the Hermitian pairing, `exists_orthogonal_irreducible_decomposition` **specializes to**
  Maschke, `schur_orthogonality_self` **specializes to** `char_orthonormal`, `character_orthonormal_self`
  to the first orthogonality relation, and `peterWeylBasis` to `dim L²(G) = ∑_π (dim V_π)² = |G|` with
  the matrix coefficients as a basis, i.e. `k[G] ≅ ⨁_π End(V_π)`. Acceptance: each general theorem,
  specialized to `G = ZMod n` or `G = Equiv.Perm (Fin 3)`, reduces to the finite-group statement
  without new hypotheses.
- **The circle `S¹` and Fourier series are Peter-Weyl.** For `G = AddCircle 1` (abelian, so every
  irreducible is one-dimensional, `dim V_π = 1`, indexed by `ℤ`), the matrix coefficients are the
  characters `fourier n`, `peterWeylBasis` **is** Mathlib's `fourierBasis`, and the Peter-Weyl
  `L²`-density **is** `span_fourier_closure_eq_top`. Acceptance: the general `peterWeylBasis`,
  specialized to `AddCircle 1`, is `fourierBasis` (up to the indexing equivalence
  `Σ π, Fin 1 × Fin 1 ≃ ℤ`), and `character_orthonormal` is `orthonormal_fourier`. This is the sanity
  check that the abstract statements are correctly normalized.
- **`SU(2)` irreducibles and characters (its own deliverable).** `su2Irrep n` is
  irreducible of dimension `n+1`; its character on `T` is `sin((n+1)θ)/sin θ`;
  `∫_{SU(2)} χ_m χ_n⁻ dμ = δ_{mn}` computed **via** `weyl_integration_formula` (reducing to
  `(2/π)∫_0^π sin((m+1)θ)sin((n+1)θ) dθ = δ_{mn}`); and the `{su2Irrep n}` exhaust the irreducibles.
  Acceptance: the character orthonormality for `SU(2)` is proved through the Weyl integration formula,
  not assumed, and matches Layer 6's abstract `character_orthonormal_self`. The `SU(2)` classification
  (`su2Irrep_inequiv`, `su2Irrep_exhaust`) is proved from the weight argument. **`SU(2)` exhaustion is
  not an acceptance criterion for the general compact-group layers** (Layers 0-6): those stand on their
  own, and the `SU(2)` classification and Weyl integration are a separately deliverable engine, split
  as below.

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

**Separable deliverables.** This is one coherent dependency chain, but it is broad,
and several pieces are independent formalization projects; treat them as separately shippable units,
kept cross-linked but not blocking one another:
1. **Layers 0-2** - normalized Haar, the unitarian trick, and compact Maschke (complete reducibility).
2. **Layers 3-4** - matrix coefficients and Schur orthogonality in `L²(G)`.
3. **Layer 5** - the Peter-Weyl analytic core (convolution operators, density, the `HilbertBasis`).
4. **Layer 6** - central `L²` functions and the character theory.
5. **The `SU(2)` engine** - the irreducible classification and the Weyl integration/character formulas.

The `SU(2)` classification (unit 5) is genuinely research-sized and does **not** condition units 1-4;
in particular its exhaustion statement is not an acceptance criterion for the general layers.

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
