# Roadmap: representations of compact groups and the Peter-Weyl theorem

This roadmap specifies compact-group representation theory from Haar averaging through
Peter–Weyl, characters, and the `SU(2)` engine. At the analytic end Mathlib supplies
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

Use the individual `TauCeti.RepresentationTheory.Compact.*`,
`TauCeti.RepresentationTheory.Continuous.*`, and `TauCeti.RepresentationTheory.SU2.*`
modules for the constructions below. The specification includes their complete basic APIs,
finite-group and circle comparisons, and the strongly continuous Banach-representation
extension in Layer 5.1. The consume map below identifies the existing interfaces; an
implemented layer remains part of this roadmap's mathematical specification.

**Two neighbouring roadmaps, cited rather than rebuilt.** The Hilbert-space completeness machinery
this roadmap consumes - turning an orthonormal system into a complete `HilbertBasis`, Parseval,
product bases - is exactly the subject of [the weighted orthogonal L² bases
roadmap](../../../Completed/OrthogonalL2Bases/README.md); Peter-Weyl's final assembly step is that roadmap's
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
  `[FiniteDimensional ℂ V]`, the `L²`-side (Layer 5) on the complex Hilbert space
  `Lp ℂ 2 μ_G`. A **continuous representation** is Mathlib's `ContRepresentation ℂ G V`
  (a one-field structure **wrapping** `G →* (V →L[ℂ] V)` — not definitionally equal to it; use `ContRepresentation.toMonoidHom_apply` where the unfolding matters; `RepresentationTheory/Continuous/Basic.lean`); a **unitary** one additionally
  lands in the unitary group, `π g ∈ unitary (V →L[ℂ] V)` for every `g` (equivalently each `π g`
  preserves the inner product). Reuse `ContRepresentation`, `ContRepresentation.toRepresentation`,
  and `ContIntertwiningMap` rather than a private synonym; use `TauCeti.ContRepresentation.IsUnitary`, a `Prop` on `ContRepresentation`.
  The bundle records continuity of each linear operator only: every continuous
  finite-dimensional action here additionally carries `hπ : Continuous π` for the
  operator-valued map. In finite dimensions this is equivalent to continuity of every
  orbit map. Layer 5.1 instead assumes orbit-map continuity on the Banach carrier.
  Algebraic statements about an already unitary action, such as invariance of
  orthogonal complements, need no continuity of the group parameter.
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
  [Completed/OrthogonalL2Bases](../../../Completed/OrthogonalL2Bases/README.md)'s subject, cited there.
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
- **Continuous representations.** `ContRepresentation R G V` (wrapping `G →* (V →L[R] V)`),
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

## Tau Ceti interfaces to consume

Import the individual modules and use their objects and hypotheses directly.

| Layer | Native interfaces |
| --- | --- |
| 0 | `Compact.Haar`: `TauCeti.haarProb`, its probability/Haar/bi-invariance instances and `haarProb_def`; `Compact.Averaging`: `TauCeti.haarAverage` and its integral and translation identities. |
| 1–2 | `Continuous.Unitary.Basic`: `TauCeti.ContRepresentation.IsUnitary`; `Compact.Unitarizable`: `gramOperator` and `isUnitarizable`, with `hπ : Continuous π`; `Compact.UnitaryModel`: `exists_isUnitary_congr`; `Continuous.OrthogonalDecomposition`: `IsUnitary.exists_orthogonal_irreducible_decomposition`. |
| 3–4 | `Continuous.MatrixCoefficient`, `Continuous.Representative`, `Compact.MatrixCoefficient`, `Compact.SchurOrthogonality`, and `Compact.Orthonormal`: continuous coefficients, their actual span and `StarSubalgebra`, their `L²` classes and orthogonality. |
| 5 | `Compact.Convolution`, `Compact.ApproximateIdentity`, `Compact.EigenspaceRepresentation`, and `Compact.RepresentativeDensity`: the non-circular analytic route; `Compact.PeterWeyl`: `TauCeti.IrrepModel`, `IsIrrepSkeleton`, `peterWeylBasis`, `coe_peterWeylBasis`, and the unconditional `stdPeterWeylBasis`. |
| 6 | `Continuous.Character`, `Compact.Character.Basic`, `Compact.ClassFunctionLp`, and `Compact.Character.Basis`: trace characters, orthogonality and completeness in `TauCeti.classFunctionLp ℂ ℂ 2 (TauCeti.haarProb G)`; `Compact.BiregularRepresentation`, `Compact.TraceCoefficient.HilbertSum`, and `Compact.IsotypicBlock.Basic` supply the bimodule/block interfaces. |
| 6b | `Compact.FrobeniusSchur.Basic`, `.Trichotomy`, `.InvariantForm`, `.InvariantTensors`, and `.StructureMap`: the indicator, its invariant-form interpretation and real/quaternionic structures. |
| `SU(2)` | `SU2.Basic`, `.Borel`, `.SymmetricPower`, `.Irreducible`, `.Weight`, `.TorusConjugacy`, `.Exhaustion`, `.Weyl.Character`, and `.Weyl.Integration`: the matrix group and measure instances, symmetric-power models, classification, and normalized formulas. |

Finite-dimensional comparison targets include the forgetful correspondence with
`FDRep`, compatibility with its trace character, the equivalence of algebraic and
closed-subspace irreducibility, and matching continuous and algebraic intertwiners.
State these comparisons explicitly; continuity of the parameter is a hypothesis,
never a consequence of the name `ContRepresentation`.

## Mathematical scope

The full scope is normalized Haar averaging and bi-invariance; the unitarian trick
and complete reducibility; matrix coefficients and their algebra, translations and
involution; Schur orthogonality; uniform and `L²` Peter–Weyl density, an explicitly
identified Hilbert basis and the biregular isotypic decomposition; characters and
class-function completeness; Frobenius–Schur reality types; and symmetric-power
classification, torus conjugacy and Weyl formulas for `SU(2)`. Layer 5.1 includes
density and approximation of G-finite vectors for strongly continuous Banach actions.

`Suggested.lean` imports these existing APIs and suggests interfaces for their
comparisons and further targets. Its continuity hypotheses, normalized measure,
chosen models and basis-element equations are part of each statement. The
milestones below give the definitive mathematical requirements.

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
  mirror in step: use the full subcategory of `FDRep ℂ G` whose finite-dimensional
  actions have continuous parameter maps, with the induced intertwiners. Semisimplicity
  is asserted for this continuous subcategory, not for all abstract `FDRep ℂ G`.
- **Schur's lemma, transported.** Import `FDRep.finrank_hom_simple_simple` and
  `finrank_endomorphism_simple_eq_one` (over `ℂ`, algebraically closed) as: a continuous
  `G`-intertwiner between finite-dimensional irreducibles is `0` or an isomorphism, and a self-
  intertwiner is a scalar. This is stated through `ContIntertwiningMap` and the `FDRep` mirror, not
  reproved.

<a id="invariant-hermitian-metrics"></a>
#### Layer2.1. Invariant Hermitian metrics and multiplicity spaces

Fix a finite-dimensional unitary complex representation π with its given inner
product, conjugate-linear in the first variable. Represent every Hermitian form
h by the unique self-adjoint continuous linear Gram operator T with
`h(v,w)=⟪v,Tw⟫`. Prove the representation and uniqueness, and that positive
definiteness of h is equivalent to `re⟪v,Tv⟫>0` for every v≠0. Invariance
`h(π(g)v,π(g)w)=h(v,w)` is equivalent to `Tπ(g)=π(g)T` for every g.
Prove these comparisons and their transport under unitary intertwiners. The
map `v↦h(v,−)` into the complex linear dual is conjugate-linear; construct
the comparison by the stated Gram operators with that scalar convention.

For irreducible π, apply Layer2's native scalar Schur lemma to T. Self-adjointness
makes its scalar real and positivity makes it strictly positive. Prove that the
invariant positive Hermitian forms are exactly `c⟪−,−⟫` with a unique real c>0.
For two such forms, construct the identity-times-`1/√c` equivariant isometry
from the first metric to the second when `h₂=c h₁`, and prove both metric and
inverse identities. Consume the native
`TauCeti.ContRepresentation.exists_linearIsometryEquiv_congr_eq` theorem and
compare its normalization with this particular scalar map. For an initially
nonunitary representation, use Layer1's Gram conjugacy to transport this
classification; no extra choice of an inner-product instance is implicit.

For a supplied finite unitary decomposition `V≃⊕_i(S_i⊗ℂ^{m_i})`, with the S_i
pairwise inequivalent unitary irreducibles and m_i>0, construct the *-algebra
identification of the commuting operators with `∏_i Matrix (Fin m_i) (Fin m_i) ℂ`.
Pin it by `T|_(S_i⊗ℂ^{m_i})=id_(S_i)⊗A_i`. Prove addition, multiplication,
complex scalars, adjoints and both inverse-map identities; for units prove
compatibility with operator and matrix inversion. Invariant positive metrics
correspond exactly to positive-definite Hermitian A_i. Under a decomposition
change `d'=(⊕_i(id⊗U_i))d`, with each U_i unitary, prove
`A_i'=U_i A_i U_i†`, and prove compatibility with reindexing. For the trivial representation
on ℂ², the Gram operator diag(1,2) gives an invariant positive metric that is
not a scalar multiple of the standard one. Thus scalar uniqueness uses the
irreducibility hypothesis; repeated copies retain their full matrix freedom.

Specialize to finite discrete groups and compare Layer1's Haar average with
`|G|⁻¹ Σ_g⟪π(g)v,π(g)w⟫`; the unnormalized sum is |G| times that form.
[InvariantMetricTargets.lean](InvariantMetricTargets.lean) gives suggested
native operator statements. This unit consumes Layers1–2 and finite-dimensional
Hilbert linear algebra; matrix coefficients and Peter–Weyl are subsequent users.

### Layer 3: matrix coefficients

- **Definition.** `matrixCoeff π v w : C(G, ℂ)`, `g ↦ ⟪π g v, w⟫` for `v w : V`; continuous because
  `π` is continuous and the inner product is continuous. Its image in `L²(G, haarProb G)` is
  `matrixCoeffLp π v w : Lp ℂ 2 (haarProb G)` (via `ContinuousMap.toLp`, using finiteness of Haar).
- **The algebra of matrix coefficients.** Sesquilinearity in `(v, w)`; behaviour under **left and
  right translation** `matrixCoeff π v w (g₀ * g)` and `(g * g₀)` (each a matrix coefficient again,
  the `G×G`-action that structures `L²(G)`); the **involution**, pinned for a unitary action as
  `conj (matrixCoeff π v w g) = matrixCoeff π w v g⁻¹`; identify it also with
  the coefficient of the conjugate representation on the conjugate vectors in the
  same order. Products of matrix coefficients of `π, ρ`
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
  proved by averaging the rank-one operator `v ↦ ⟪e_l, v⟫ • e_j` into a `G`-intertwiner and applying
  Schur (self-intertwiner is a scalar, whose trace fixes the constant `d⁻¹`). This is the continuous
  analogue of `char_orthonormal`, and the load-bearing orthogonality computation.
  - **Pin the convention.** With Mathlib's sesquilinear `L2.innerProductSpace` and
    `matrixCoeff π v w g = ⟪π g v, w⟫`, the exact placement of the conjugation and the Kronecker
    indices is convention-sensitive. State the basis-level identity `schur_orthogonality_basis`
    (`⟪matrixCoeffLp π (e j) (e i), matrixCoeffLp π (e l) (e k)⟫ = d⁻¹ · δ_{jl} · δ_{ik}`) in Mathlib's
    exact convention, **verify it against `fourierBasis` on `AddCircle`**, and derive the coordinate-free
    `schur_orthogonality_self` (`= d⁻¹ · conj⟪v₁,v₂⟫ · ⟪w₁,w₂⟫`) from it, rather than stating the
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
  - `convolutionOperator_isCompact` - the operator is compact (`IsCompactOperator`). The native
    `isCompactOperator_convolutionOperator` factors through the compact map into
    `C(G)` using Arzelà–Ascoli. Also develop the continuous-kernel Hilbert–Schmidt
    comparison, consuming the Hilbert–Schmidt operator API and "Hilbert–Schmidt ⇒ compact" of
    [`OperatorTheory/OperatorIdeals`](../../OperatorTheory/OperatorIdeals/README.md) Part C;
    the remaining step, "continuous kernel on a compact space ⇒ Hilbert–Schmidt integral
    operator", is kernel theory and stays here;
  - `convolutionOperator_isSelfAdjoint` for a symmetric kernel `k g⁻¹ = conj (k g)`;
  - `nonzero_eigenspace_finite_dim_continuous_rep` - each nonzero eigenspace is
    finite-dimensional (Mathlib's `IsCompactOperator.finite_dimensional_eigenspace`, pinned as
    `convolutionOperator_eigenspace_finiteDimensional`) **and** invariant under the right regular action
    `R_g f(x) = f(xg)`, so it carries a
    continuous finite-dimensional representation. Evaluation and Riesz representation
    identify the continuous eigenfunctions with conjugates of its matrix coefficients;
    star closure then puts them in `𝓡(G)` - this is where the
    finite-dimensional representations *come from*, proved before any separation claim, so nothing is
    smuggled in;
  - `approx_identity_exists` - a net of nonnegative symmetric kernels whose convolution tends to the
    identity uniformly on `C(G)`.

  Write `A_k := convolutionOperator k : L²(G) → L²(G)`. Construct its bounded
  continuous representative `S_k : L²(G) → C(G)` for every continuous kernel k,
  with `‖S_k u‖∞ ≤ ‖k‖₂ ‖u‖₂`, using Haar invariance and Cauchy–Schwarz.
  Prove continuity of the pointwise convolution from L²-continuity of the
  translated kernel, and prove `j ∘ S_k = A_k` for the continuous-function map
  `j : C(G) → L²(G)`. Full support of Haar makes j injective; hence S_k vanishes
  on ker(A_k). For symmetric k, compact self-adjoint spectral theory for A_k
  gives finite sums of nonzero eigenspace projections converging in L² on
  ker(A_k)ᗮ. Apply S_k to these tails to obtain uniform convergence to S_k f;
  the kernel component contributes zero. Each nonzero eigenspace consists of
  continuous matrix coefficients by the preceding representation construction.
  Thus S_k f is a uniform limit of finite coefficient sums. First choose an
  approximate-identity k with `‖S_k f−f‖∞` small, then a finite spectral sum s
  with `‖S_k f−s‖∞` small. This proves uniform density. Only after this does
  point separation (`representativeStarSubalgebra_separatesPoints`) and any
  Stone–Weierstrass argument enter as corollaries.
#### Layer5.1. G-finite vectors in strongly continuous Banach representations

Consume the topology-free shared prefix and Banach density theorem of
[AutomorphicFormsOnReductiveGroups §2.1](https://github.com/TauCetiProject/TauCetiRoadmap/blob/04038f3cfbc018183bfe4190d837ce8e778f67aa/TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md#21-compact-finite-vectors-and-admissibility). That prefix is the
sole owner of the field-general `Representation.IsGFinite`,
`gFiniteSubmodule`, addition/scalar/invariance/equivariant-map API and the
generic `gFiniteSubmodule_dense` theorem. These names describe its common
contract on a native `Representation`, not a second public API here.
For a continuous representation π use `π.toRepresentation`; its actual
orbit span gives exactly this predicate by `isGFinite_toRepresentation_iff`.
The local spellings in Suggested.lean show this same contract on actual
native carriers; they are suggested interface forms, not a claim that a
new shared implementation already exists or a request for duplicate proofs.

For a compact Hausdorff topological group G, a complete complex normed space E
and a representation by continuous linear automorphisms, assume explicitly
that g↦π(g)v is continuous for every v. The shared predicate means finite
dimensionality of the complex span of {π(g)v | g∈G}; retain the exact
identification of its invariant submodule and continuous-intertwiner maps.
Here construct the application estimates and witnesses: uniform boundedness
on compact orbit maps gives C_π=sup_g‖π(g)‖<∞; operator-norm continuity is
not assumed. Consume [BanachAlgebras A7.IntegratedRepresentations](https://github.com/TauCetiProject/TauCetiRoadmap/blob/4ca3e99e0e27255fdcf8aea71e4e9aef052a3d77/TauCetiRoadmap/BanachAlgebras/README.md)
for T_f v=∫f(g)π(g)v dμ_G, ‖T_f‖≤C_π‖f‖₁ and its chosen
neighbourhood-net approximate identities. Only this early integration
contract is used, not A7's later Fourier or Johnson applications.
Construct the compact-group Haar-probability normalization and prove
π(h)T_f v=T_(L_h f)v, L_h f(g)=f(h⁻¹g).

Apply the shared Banach theorem and expose its concrete approximation
witnesses under these conventions. For a finite sum p of matrix
coefficients, left translates span a finite-dimensional space; covariance
makes T_p v G-finite. Given v and ε>0, retain an approximate-identity
kernel u with ‖T_u v−v‖<ε/2 and a representative function p with
C_π‖p−u‖₁‖v‖<ε/2, treating v=0 separately. Keep their actual
finite-orbit-span witnesses. This is the common theorem's constructive
application, not a second generic-density proof target. Prove the
norm estimates, covariance, naturality and uniform-on-compact-vector-sets
refinement from bounded operator norms and a finite ε-net. Use nets for
arbitrary compact groups. The vector-valued Bochner integral and its
separable-compact-image measurability come from the integration contract;
no separability of the whole E is imposed.

The prerequisite order is the topology-free shared prefix, Layer5's
matrix-coefficient Peter–Weyl density for functions on G, the shared §2.1
Banach density theorem, then these application adapters. No other
automorphic construction, locally convex extension or Lie-smoothness
result is an early input. TopologicalKTheory T6.1 owns section/L²-section
actions and finite bundle embeddings applying this interface.
NoncompactQuantumSymmetry M0 owns further Hilbert isotypic projections,
multiplicities, completed-tensor and smooth-vector comparisons. For compact
Lie groups, [SmoothBanachRepresentations SB4](../SmoothBanachRepresentations/README.md)
consumes the same shared predicate and density theorem through these
adapters and proves density in the stronger smooth Fréchet topology.
Its generic smooth-vector density is independent earlier material; neither
that comparison nor Dixmier–Malliavin is a premise of generic Banach
G-finite density.

- **Density in `L²(G)`.** From uniform density plus `ContinuousMap.toLp_denseRange` (continuous
  functions dense in `L²` on the compact finite-measure `G`), `𝓡(G)` is **dense in `L²(G)`**, so its
  orthogonal complement is `⊥`.
- **The Peter-Weyl Hilbert basis (the summit).** Combining Layer 4's orthonormal system with
  `L²`-density via `HilbertBasis.mkOfOrthogonalEqBot`, the normalized matrix coefficients
  `{√(dim V_π) · π_{ij}}` form a Hilbert basis of `L²(G)` indexed by `Σ π, Fin dπ × Fin dπ`.
  - **The index is chosen data, not free.** "One representative per equivalence
    class" hides a skeleton of the unitary dual: chosen model spaces, chosen unitary irreducible
    representations, and chosen orthonormal bases. Package this as a structure `IrrepModel G` (carrier,
    Hilbert structure, representation, explicit continuity, unitarity, irreducibility, dimension) and a predicate
    `IsIrrepSkeleton (models : ι → IrrepModel G)` ("pairwise inequivalent and exhaustive up to
    isomorphism"); the basis index is `Σ i, Fin (models i).dim × Fin (models i).dim`.
  - Because the summit `peterWeylBasis` quantifies the basis existentially, the element-level content
    (the analogue of `coe_peterWeylBasis`) must live **inside** `IsPeterWeylBasis models b`, which
    asserts `b ⟨i, j, k⟩ = √(models i).dim • matrixCoeffLp (models i).rep e_j e_k` for the chosen
    bases. For `G : Type u`, take the native `TauCeti.IrrepClass ℂ G : Type u`
    and `TauCeti.stdPeterWeylBasis ℂ G`; helpers allow arbitrary index universes,
    and no universe-zero smallness or countability of the unitary dual is imposed.
    Otherwise the bundled `HilbertBasis` is near-vacuous, in exactly the sense
    [Completed/OrthogonalL2Bases](../../../Completed/OrthogonalL2Bases/README.md) warns against. Parseval is
    `HilbertBasis.tsum_inner_mul_inner`.
- **The isotypic decomposition.** As unitary `G×G`-representations (left and right translation),
  `L²(G) ≅ ⨁̂_π (V_π ⊗ V_π*)`, i.e. `⨁̂_π End(V_π)`, the closure of the algebraic direct sum over
  the irreducibles `π`, with the `π`-block of dimension `(dim V_π)²` spanned by `π`'s matrix
  coefficients. State the block projections (averaging against `dim V_π · conj χ_π`, from Layer 6)
  and that they are the isotypic projectors.

<a id="compact-dual-countability"></a>
#### Layer5.2. Countability, metrizability and Haar L²

For compact Hausdorff G prove the equivalence of: G is second countable; G is
metrizable; the native complex unitary dual `TauCeti.IrrepClass ℂ G` is countable;
and `Lp ℂ 2 (haarProb G)` is separable. These are consequences of Layer5, with
no countability hypothesis in its general Peter–Weyl theorem. Prove invariance
under topological group isomorphism and transport to every irreducible skeleton.

In the second-countable case, compact metrizability makes C(G,ℂ) separable;
its dense map into L² makes L² separable. The Peter–Weyl Hilbert basis then
has countable index. Each irreducible has positive finite dimension, so this
index is countable exactly when the unitary dual is countable. In the reverse
direction, countably many irreducible models give the continuous homomorphism
`g↦(π(g))_π` into a countable product of finite-dimensional unitary groups.
Prove injectivity using Layer5's point-separating matrix coefficients. Compactness
and the Hausdorff target make this a topological embedding; the product is
metrizable. Consume the existing countable-product and compact metrization APIs,
and [BanachSpaceTheory B5](../../BanachSpaceTheory/README.md#b5-function-spaces-and-weak-compactness)'s
early ℓ²/Hilbert-basis countability and support unit. The metrization criterion
is downstream of general Peter–Weyl.

For every index type J, let G_J=∏_(j∈J) Circle with its product topology and
normalized Haar measure. Construct the continuous one-dimensional characters
χ_j(z)=z_j, prove they are pairwise distinct, and prove their complex-valued
L² classes form an orthonormal family. For j≠k compute
`∫ conj(χ_j)χ_k=0` by Haar translation in one coordinate, and hence
`‖χ_j−χ_k‖₂=√2`. Thus uncountable J gives an uncountable unitary dual,
nonseparable L² and a nonmetrizable compact group. For countable J the product
is metrizable and all four conditions hold, including the empty product.
For every G and every individual L² vector, prove that only countably many
Peter–Weyl coefficients, and hence isotypic blocks, are nonzero, using the
finite sum of squared norms. This per-vector statement holds even when the
whole dual is uncountable.

[CountabilityTargets.lean](CountabilityTargets.lean) gives suggested statements
on the native unitary dual and Haar L². The countable-base Peter–Weyl formulation
is also in [Etingof, §37](https://ocw.mit.edu/courses/18-755-lie-groups-and-lie-algebras-ii-spring-2024/mit18_755_s24_lec11.pdf).

<a id="compact-product-dual"></a>
#### Layer5.3. Characters of arbitrary products

For an arbitrary family of compact Hausdorff abelian groups G_i, use the
product topology on G=∏_i G_i and native `PontryaginDual` with its compact-open
topology. Construct the canonical topological group isomorphism

`Multiplicative (⨁ i, Additive (PontryaginDual G_i)) ≃ₜ* PontryaginDual G`.

The direct sum has the **discrete** topology. It is not given the subspace
topology from the product of the coordinate duals. On a finitely supported
family (χ_i), the forward map sends x to `∏_i χ_i(x_i)`; the inverse restricts
χ along the continuous coordinate inclusions `ι_i:G_i→G`, which are identity
in all other coordinates. Prove these restrictions have finite support and
both maps are inverse homomorphisms. Supply evaluation, coordinate-inclusion,
coordinate-projection, support, finite/empty-product, reindexing and
coordinatewise pullback formulas. Reindexing is by actual index equivalences;
coordinatewise pullback preserves finite support.

Own the finite-coordinate lemma first for arbitrary families of topological
groups, without compactness or commutativity assumptions on the factors.
Continuity of χ at1 gives a basic identity cylinder restricting only finitely
many coordinates and mapped into `Circle.centeredArc (π/2)`. The subgroup
whose restricted coordinates are1 lies in that cylinder. All positive powers
of each of its elements still lie there; use native
`Circle.eq_one_of_forall_pow_mem_centeredArc_pi_div_two` to show χ is1 on
this tail subgroup. Decompose x into its finitely supported coordinate part
and a tail element. This proves the finite product formula and the exact
support characterization, with no countability or sequential argument.
Conversely finite products of coordinate characters are continuous. For
compact factors, consume Mathlib's existing discreteness instance for the
Pontryagin dual of a compact group; the product is compact by Tychonoff.
The algebraic isomorphism is therefore a topological one. This elementary
construction precedes its Peter–Weyl applications and requires no general
Pontryagin biduality theorem.

For G=Circle^J deduce that every character has a unique finite integer
multi-index n and is `z↦∏_j z_j^(n_j)`, giving the discrete dual
`Multiplicative (J →₀ ℤ)`. Consume native
`TauCeti.fourierPontryaginDualEquiv` and `AddCircle.homeomorphCircle` at period
2π for the single-circle computation. This input is independent of the product
theorem. Include the empty index type and negative exponents.
For J=ℕ, the coordinate-restriction tuples of the characters χ_n(z)=z_n
converge coordinatewise to the all-trivial tuple in the product of the discrete
coordinate duals. The characters do not converge to1 in the compact-open dual
of Circle^ℕ, which is discrete. They also do not converge pointwise to1 on Circle^ℕ:
evaluate them on the constant tuple −1. Prove these topology distinctions.

This is Conway, *A Course in Functional Analysis*, second edition, VII.9,
exercise11, with the maps and topologies fixed explicitly.
[ProductDualTargets.lean](ProductDualTargets.lean) gives selected signatures.

<a id="compact-abelian-fourier"></a>
#### Layer5.4. Compact abelian Fourier theory

For every compact Hausdorff abelian group G, identify the native unitary dual
`TauCeti.IrrepClass ℂ G` with `PontryaginDual G`. Prove that each complex
irreducible has dimension1: commutativity makes every action operator an
intertwiner, so Schur's lemma makes it scalar; irreducibility then forces
dimension1. Its scalar action is a continuous circle-valued character,
independent of the unit vector used to read it. Conversely a continuous
circle character acts on ℂ by scalar multiplication and is irreducible.
Prove these constructions inverse on unitary-equivalence classes, with the
scalar-action formula on each native irreducible model.

For χ in `PontryaginDual G`, write `c_χ∈C(G,ℂ)` for `g↦(χ(g):ℂ)`.
Identify the representative-function star-algebra with the finite complex
linear span of the c_χ, using `c_χ c_ψ=c_(χψ)`, `star(c_χ)=c_(χ⁻¹)`
and the trivial character for1. Deduce point separation and uniform density
from Layer5's Peter–Weyl theorem. This is the compact abelian specialization
of that construction; it uses neither the general LCA Fourier-inversion
engine nor Pontryagin biduality.

Construct
`characterBasis : HilbertBasis (PontryaginDual G) ℂ (Lp ℂ 2 (haarProb G))`
with the exact equation
`characterBasis χ = ContinuousMap.toLp 2 (haarProb G) ℂ c_χ`.
The normalized Haar measure makes these vectors have norm1. Fix the
comparison with the native Peter–Weyl basis explicitly: its coefficient
`g↦⟪π(g)v,w⟫` is conjugate-linear in π(g)v, so the character vector c_χ
corresponds to the one-dimensional scalar representation χ⁻¹, not χ.
Reindex the standard basis using that inverse-character correspondence
and the unique row/column indices. Prove orthonormality, completeness and
agreement with the displayed continuous representatives under this reindexing.

For f in Haar L², identify the basis coordinate with
`f̂(χ)=∫_G conj(χ(g)) f(g) d(haarProb G)`; prove integrability and
independence of the a.e. representative. Obtain Parseval
`Σ_χ |f̂(χ)|²=‖f‖₂²` and the unconditional L² expansion
`f=Σ_χ f̂(χ) c_χ` from this same Hilbert basis. No pointwise or uniform
convergence of the Fourier expansion is asserted. Transport Layer5.2 through
the irreducible-class/character bijection to obtain
`MetrizableSpace G ↔ Countable (PontryaginDual G)`, with its second-countable
and separable-L² equivalents. Include the trivial group and arbitrary
uncountable duals; every individual expansion has countable support.

These are Conway VII.9 exercises8–10, assigned by Banach course notes p136.
[AbelianFourierTargets.lean](AbelianFourierTargets.lean) gives selected native
comparison, uniform-density and basis-element signatures.

### Layer 6: characters of compact groups

- **The character.** `character π hπ : C(G, ℂ)`, `g ↦ trace (π g)`, with
  `hπ : Continuous π`. With the fixed coefficient convention,
  `∑_i π_{ii} = conj (character π hπ)`; equivalently the trace is the sum
  `∑_i ⟪e_i, π g e_i⟫`. Thus the character is in the representative algebra
  and (Layer 3) has an `L²(G)` class. It is a **class function**:
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
  `conj χ_π`, since the sum of diagonal coefficients is `conj χ_π`.
  The inversion linear isometry `f(g) ↦ f(g⁻¹)` preserves the closed class-function
  subspace and sends `χ_π` to `conj χ_π`; transport completeness back along it.
  Reuse `toLp_star_character_mem_peterWeylBlock` and
  `TauCeti.ContRepresentation.invLpₗᵢ_characterLp` with their actual unitarity
  and continuity hypotheses. This is the compact-group **class-function completeness**, the infinite analogue of
  "#irreducibles = #conjugacy classes".

### Layer 6a: the representation ring of a compact connected Lie group

Retain Layers0–6 for all compact Hausdorff topological groups. This additional
application assumes K is a compact **connected finite-dimensional real Lie**
group, T an actual maximal torus and `W=N_K(T)/T`. Representations are
finite-dimensional continuous complex representations, with continuity of the
parameter map explicit as in the standing conventions. Use [LieGroups Layer2](../LieGroups/README.md#layer-2-the-closed-subgroup-cartan-theorem)
for automatic smoothness and Layers3–4 for differentiation and integration;
[LieHighestWeight Layers0–5](../LieHighestWeight/README.md) supply the semisimple
highest-weight modules, one-dimensional top lines and finite lower-weight bounds.
Use only Layer6's early formal-character/additivity interfaces: prove the leading
orbit-sum formula from those bounds and the actual normalizer action. Neither the
Weyl character formula nor6E/6F's Haar/Fourier applications is a premise. No
Borel–Weil, flag cohomology, generic algebraic-group classification, HC isomorphism
or compact character-ring surjectivity is an input.

**Virtual representations and actual torus characters.** Construct R(K), the
Grothendieck ring of finite-dimensional continuous complex representations,
with addition by direct sum, multiplication by tensor product, unit, dual,
restriction and continuous intertwiner/equivalence APIs. Reuse the generic
additive group-completion engine (`Algebra.GrothendieckAddGroup`) and prove its
split-representation specialization. Layers1–2 and Schur orthogonality identify
it with the free abelian group on irreducible equivalence classes, with the
finite tensor-decomposition coefficients as multiplication. Also identify it
with the subring of complex class functions generated by **continuous** finite
characters. The native general `TauCeti.virtualCharacters` allows arbitrary
algebraic representations; do not silently use its entire carrier for this
continuous subgroup. Construct the continuous subring and comparison map using
actual continuous coordinate models and prove equivalence-independence,
cancellation, character injectivity, tensor/dual identities and naturality.
The positive cone consists of nonnegative irreducible multiplicities; an
arbitrary integral combination is virtual and need not be a genuine module.

Let `X=Additive (PontryaginDual T)` be the actual character group (native
`PontryaginDual`, whose carrier is `ContinuousMonoidHom T Circle`), not the full
real dual Lie algebra and not an automatically simply connected weight lattice.
Construct torus weight spaces and their finite internal sum from commuting
unitaries; one-dimensionality of irreducibles gives `R(T)≃Z[X]`, using
Mathlib `AddMonoidAlgebra ℤ X` after the explicit additive-character convention.
Prove the character/Fourier coefficient equation and uniqueness, and the finite
rank/lattice identification from LieGroups Layers5A–6's actual torus quotient.
For `chi(exp X)=exp(i ell_chi(X))`, the differential is `i ell_chi` and
`ell_chi(ker exp_T)⊆2πZ`. Compare this with the dimensionless Y coordinates of
LieGroups7F; do not lose that2pi factor. For a real finite-dimensional T-module, construct the conjugate-linear map
on its complexification sending the chi-weight space bijectively to the
chi-inverse weight space, with its involution and dimension equations. This
proves opposite multiplicities without assuming semisimple root theory; the
compact adjoint application uses LG5A–6's full central/Cartan zero-weight space.
Pin the left Weyl action by `(w·chi)(t)=chi(n⁻¹tn)` for n representing w;
it is independent of the representative modulo T. On the integral group
algebra send `e^chi` to `e^(w·chi)`, with fixed subring `Z[X]^W`.

**Global existence and descent before the ring isomorphism.** Consume
LieGroups5A's compact center/derived Lie splitting, its early7 compact simply
connected semisimple integration, and7F's actual finite central covering
`q:Z(K)^0×K_der,sc→K` with finite kernel F. Retain the homomorphism, its torus
restriction, quotient topology, kernel embedding and derivative/period equations.
Do not treat these covering factors as direct factors of K. Construct the
pullback injection from the actual X into
`X*(Z(K)^0)⊕P_der`, and prove its image is exactly the characters trivial on
F in the covering torus. Dominance is imposed only on the derived coordinate.
This includes the zero-root case and preserves the full central character.


For the lattice input to LieGroups7F, use RootSystems' finite root geometry and
LHW10's pure abstract root-datum/coweight comparison. This phase uses the actual
finite-free integral lattices and their field extension, with no compact group or
period theorem. The later compact-period reverse-inclusion argument and the
subsection titled `Late compact-center application in LieGroups` are consumers
of LG integration and periods; neither is an early premise of7F. RootSystems'
independent root-exchange route supplies its finite Coxeter input; the generic
real-disk2G construction and later compact-normalizer applications are not
required for this lattice cut.

For each dominant element of X, integrate the derived highest-weight module to
K_der,sc by LieGroups4, and use its specified central-torus character. The
covering-product action is the actual map
`(z,s)↦chi(z)·rho_lambda(s)`. Compute its restriction to F; the actual X condition
makes it the identity. Descend through q, proving continuity and smoothness from
the quotient/local-cover charts, not an unproved abstract representation of K.
Construct and prove the descent on intertwiners, tensor and dual maps, unique
factorization and the top weight line. Prove irreducibility and uniqueness by
the derivative/connected-group stable-subspace dictionary. Conversely pull
back an irreducible K-module, use Schur for the central torus, and restrict to
the semisimple derived factor; its Lie highest weight and actual torus
character give exactly that dominant element of X. State all differentiability,
Lie-to-group invariant-subspace and intertwiner comparisons at this cut.
A Lie-algebra central functional can be arbitrary; it integrates only when the
actual periods and the finite kernel conditions hold.

Now restriction gives the ring isomorphism
`R(K)≃Z[X*(T)]^W`. Injectivity follows from all-element conjugacy into T and
compact character injectivity. For surjectivity, give the orbit-sum basis of
`Z[X]^W`, summing each DISTINCT weight in W·lambda once, including walls and
lambda=0. Prove the irreducible-character formula with leading orbit sum coefficient1,
and finite downward-dominance subtraction. Each finite subtraction has fixed
central character and a bounded semisimple weight set, so prove termination
without ordering arbitrary central real directions. Construct the inverse ring
map, not just additive spanning, and prove it preserves multiplication by
restriction injectivity. This is integral virtual-character surjectivity; it
asserts neither that each invariant positive torus character is positive in
the irreducible basis nor that every Lie dominant weight integrates to K.

**Normalization and global-form tests.** For a torus W is trivial and all
irreducibles are its actual characters. For the trivial group R(K)=Z and X=0.
For SU2 all highest integers n≥0 occur, whereas for SO3 only even SU2 highest
integers descend. The positive torus character `e²+e⁻²=chi_(Sym²)−1` is
virtual but not a positive SU2 character, testing the positive-cone distinction. For U(n), n>0, use the actual covering
`S1×SU(n)→U(n), (z,A)↦zA`, with kernel `(z,z⁻¹I)` for zⁿ=1. A central exponent
q and derived highest coefficients a_i descend exactly when
`q≡Σ_(i=1)^(n−1) i a_i (mod n)`. Compare this with the full integer tuple
lambda, where q=Σlambda_i and a_i=lambda_i−lambda_(i+1). This is a congruence,
not an independent central/derived lattice split. Exterior powers1,…,n and
determinant inverse give the U(n) ring generators; include n=1, and treat U(0)
as trivial without a purported injective scalar-circle inclusion. Other global
forms need not admit all fundamental modules or a polynomial representation
ring on a purported independent set of fundamental characters.

**Recognizing genuine U(2) weight characters.** For a finitely supported
function `f:ℤ²→ℕ`, prove that f is the diagonal-torus weight-multiplicity
function of a finite-dimensional continuous complex U(2) representation iff

```
f(a,b)=f(b,a)                         for all a,b∈ℤ,
f(a,b)≥f(a+1,b−1)                    whenever a≥b.
```

Finite support is a hypothesis, not a consequence of these two conditions.
Use this layer's actual character lattice and the engine's SU2 strings;
retain every central degree `a+b`, including negative determinant twists.
For each dominant pair `a≥b`, construct
`L_(a,b)=det^b⊗Sym^(a−b)(ℂ²)` restricted to U(2), and prove its weights
are `(a−j,b+j)`, `0≤j≤a−b`, each with multiplicity1. Equivalently descend
`z^(a+b)⊗Sym^(a−b)` through `S1×SU2→U2`: the kernel element
`(−1,−I)` acts trivially since `(a+b)−(a−b)=2b` is even.
Prove irreducibility, the actual comparison of these two constructions,
and exhaustion using the preceding global existence/descent theorem.

Recover the multiplicity of L_(a,b) by the outward difference
`m_(a,b)=f(a,b)−f(a+1,b−1)` for a≥b. First prove the inequality makes
this a nonnegative integer; finite support makes the list finite.
Telescope on each fixed-sum, fixed-parity weight string to prove that
`⊕_(a≥b) L_(a,b)^(⊕m_(a,b))` has weight function f. Construct the
representation and its weight-space comparison, and prove uniqueness up
to equivalence from the multiplicity formula. Give a finite extraction
algorithm and its dimension check `Σ f=Σ_(a≥b)m_(a,b)(a−b+1)`.
For instance multiplicities `1,2,1` at `(2,0),(1,1),(0,2)` give
`Sym²(ℂ²)⊕det`. The Weyl-invariant function supported with value1 at
`(1,−1),(−1,1)` fails the inequality at `(0,0)` and is only the virtual
character `det⁻¹⊗Sym²(ℂ²)−1`. This criterion identifies the genuine
positive cone in rank2; it does not infer positivity from Weyl invariance.


The algebraic universal-enveloping center and trace-form adapter is owned by
LieHighestWeight9. CharacteristicClasses C5.1 owns compact invariant polynomial
restriction. Neither polynomial invariant theorem nor a semisimple Lie weight
label replaces this layer's actual integrable group-character construction.

### Layer 6b: Frobenius–Schur reality types

For every finite-dimensional continuous complex representation define
`ν₂(π) = ∫_G χ_π(g²) dμ_G`, using the trace character and Haar probability.
Prove invariance under representation equivalence and compatibility with the
finite-group normalized average. For a unitary irreducible prove the trichotomy
`ν₂ ∈ {1,0,−1}` with these exact interpretations:

- `ν₂ = 1` iff there is a nonzero invariant symmetric nondegenerate complex
  bilinear form, equivalently a conjugate-linear action-commuting map `J` with
  `J² = id`. Its fixed real subspace is a real form; prove the complexification
  comparison and dimension statement.
- `ν₂ = −1` iff there is a nonzero invariant alternating nondegenerate complex
  bilinear form, equivalently such a `J` with `J² = −id`. Prove the resulting
  even complex dimension and the quaternionic structure comparison.
- `ν₂ = 0` iff the representation is inequivalent to its complex conjugate
  (equivalently its dual in the unitary setting), and no nonzero invariant
  complex bilinear form exists.

Include uniqueness of an invariant form or an equivariant conjugate-linear
map up to complex scalar, and normalization of a nonzero map to the stated
squares. The real and quaternionic conditions require the specified maps and
nondegenerate forms, rather than existence of an unspecified reality predicate.
These are compact-group targets; the finite-group specialization belongs to
[CharacterTheory](../CharacterTheory/README.md), and the Lie-algebra highest-weight
comparison belongs to [LieHighestWeight](../LieHighestWeight/README.md).

### Engine case: `SU(2)` and the maximal torus

Built in parallel with Layers 3-6 and used to validate every abstract statement on a concrete,
computable group. The general theory of a compact **connected Lie** group reduces to its maximal torus
and rank-one `SU(2)` subgroups, so `SU(2)` is foundational.

- **The group and its torus.** `SU(2) = Matrix.specialUnitaryGroup (Fin 2) ℂ` with its `Group`
  instance, compact (closed bounded in `Matrix (Fin 2) (Fin 2) ℂ`) and Hausdorff; the **maximal
  torus** `T` the diagonal subgroup `{diag(e^{iθ}, e^{-iθ})}`, isomorphic to `AddCircle` / `S¹`, and
  the fact that **every element of `SU(2)` is conjugate into `T`** (unitary diagonalization).
- **The irreducibles and their classification.** `su2Irrep n :
  ContRepresentation ℂ SU(2) (Sym^n ℂ²)`, the representation on degree-`n` homogeneous polynomials in
  two variables (`Sym^n(ℂ²)`), of dimension `n+1`. The native monomial-coordinate
  model has the standard Euclidean norm and is not unitary in that norm for n≥2.
  Before applying unitary coefficient/orthogonality results use Layer1 and
  `exists_isUnitary_congr` to pass to a unitary equivalent model; trace characters
  and their formulas transfer by equivalence invariance. **Peter-Weyl does not classify these**: it gives a
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
    isomorphic to it). Prove the weight/string and highest-weight statements
    explicitly. Exhaustion can also use the native non-circular route: uniform
    density of the explicit symmetric-power characters in continuous class functions,
    together with Schur orthogonality against a hypothetical missing irreducible.
    This uses neither exhaustion nor completeness of all irreducible characters as an input.
- **The character on the torus.** For every `θ`, the weight sum is
  `χ_n(θ) = ∑_{k=0}^n exp(i(n−2k)θ)`. When `sin θ ≠ 0` it equals
  `sin((n+1)θ)/sin θ`; at `θ = kπ` its continuous value is
  `(n+1)(−1)^{nk}`. The `{χ_n}` form an orthonormal Hilbert basis of the
  **even/`W`-invariant** torus functions for the **Weyl-weighted measure**
  `2 sin²θ · dθ/(2π)` on `[0,2π]`, equivalently `(2/π) sin²θ dθ`
  on `[0,π]`. This is the transported Haar class-function space of `SU(2)`,
  and recovers Layer 6's completeness after classification.
- **Weyl integration and character formulas.** `weyl_integration_formula`: for a class function `f`
  on `SU(2)`, integration reduces to the torus with Weyl factor
  `|Δ(θ)|² = |e^{iθ} - e^{-iθ}|² = 4 sin²θ`. **Pin one normalization and test it:**
  the pinned form is `∫_{SU(2)} f dμ = (1/(2π)) ∫₀^π f(θ) · 4 sin²θ dθ` (Haar probability measure on
  `SU(2)`, Weyl chamber `[0, π]`, transported torus density `(1/(2π))·4 sin²θ`), and the `f = 1` test
  `weyl_integration_formula_normalized` confirms `(1/(2π)) ∫₀^π 4 sin²θ dθ = 1`; equivalent forms on
  `AddCircle`, `[0, 2π]`, and the full torus are then derived from it. The **Weyl character formula**
  `χ_n(θ) = (e^{i(n+1)θ} - e^{-i(n+1)θ})/(e^{iθ} - e^{-iθ})`
  holds when `sin θ ≠ 0`; the finite weight sum and the denominator-cleared
  identity hold everywhere and determine the continuous endpoint values. These are the
  compact-group specializations that a later general-compact-Lie-group roadmap (maximal tori, roots,
  the Weyl group) would abstract; here they are proved by hand for `SU(2)`.
- **Unitary conjugacy classes of SU(2) homomorphisms and embeddings.** For every
  n≥0 classify continuous group homomorphisms SU(2)→U(n), with conjugacy by
  U(n), using the preceding complex symmetric-power irreducibles. Construct the
  bijection with finitely supported multiplicities m_d∈ℕ satisfying
  `Σ_(d≥0)(d+1)m_d=n`: its representative is the orthogonal direct sum of
  m_d copies of a fixed unitary model of Sym^d(ℂ²), transported to ℂⁿ by a
  unitary basis. Prove independence of that basis, exhaustiveness and uniqueness.
  In particular an invertible complex intertwiner between two unitary models
  can be replaced by a unitary intertwiner using its positive polar factor.
  These are complex representation multiplicities, including for irreducibles
  of real or quaternionic type; no real-dimension count replaces d+1.

  Prove `(-I)·v=(-1)^d v` on Sym^d(ℂ²). For d≥1 prove its Lie algebra
  action is nonzero and has zero kernel by simplicity of su(2); its group
  kernel is therefore discrete and central, using connectedness and the actual
  center Z(SU(2))={±I}. Thus the kernel is {I} for odd d and {±I} for positive
  even d; Sym^0 has kernel all of SU(2). Prove the kernel of the direct sum is
  the intersection of these kernels. Consequently the homomorphism is faithful
  iff m_d>0 for some odd d. A faithful continuous homomorphism here is a
  topological embedding by compactness of SU(2) and the Hausdorff target;
  compare it with the smooth Lie-group embedding through LieGroups' automatic
  smoothness and the injective differential. Supply the converse from an
  embedding to faithfulness.

  Identify these multiplicity lists with partitions of n, whose part d+1
  occurs m_d times. Embeddings correspond precisely to partitions containing
  an even part. Prove finiteness, a terminating enumeration and the cardinal
  identity `#(embedding conjugacy classes)=p(n)-p_odd(n)`, where p(n) counts
  all partitions and p_odd(n) counts partitions with all parts odd, with the
  empty partition included. For n=0 and n=1 the only homomorphism is trivial
  and there are no embeddings; for n=2,3,4 the numbers of embedding classes
  are respectively 1,1,3. This is the finite-dimensional unitary-conjugacy
  problem assigned in Knutson's first-semester p60.


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
  characters `fourier (-n)` for the scalar action `g ↦ fourier n g`, since
  the first inner-product slot is conjugate-linear. Reindex by `n ↦ -n`
  when comparing the coefficient basis with Mathlib's `fourierBasis`. The Peter–Weyl
  `L²`-density **is** `span_fourier_closure_eq_top`. Acceptance: the general `peterWeylBasis`,
  specialized to `AddCircle 1`, is `fourierBasis` (up to the indexing equivalence
  `Σ π, Fin 1 × Fin 1 ≃ ℤ`), and `character_orthonormal` is `orthonormal_fourier`. This is the sanity
  check that the abstract statements are correctly normalized.
- **`SU(2)` irreducibles and characters (its own deliverable).** `su2Irrep n` is
  irreducible of dimension `n+1`; its character on `T` is the finite weight sum,
  equal to `sin((n+1)θ)/sin θ` when `sin θ ≠ 0`, with the continuous endpoint values above;
  `∫_{SU(2)} χ_m χ_n⁻ dμ = δ_{mn}` computed **via** `weyl_integration_formula` (reducing to
  `(2/π)∫_0^π sin((m+1)θ)sin((n+1)θ) dθ = δ_{mn}`); and the `{su2Irrep n}` exhaust the irreducibles.
  Acceptance: the character orthonormality for `SU(2)` is proved through the Weyl integration formula,
  not assumed, and matches Layer 6's abstract `character_orthonormal_self`. The `SU(2)` classification
  (`su2Irrep_inequiv`, `su2Irrep_exhaust`) includes the weight argument and
  the explicit non-circular exhaustion proof. **`SU(2)` exhaustion is
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
[Completed/OrthogonalL2Bases](../../../Completed/OrthogonalL2Bases/README.md). Layer 6 (characters) is a corollary of Layers
4-5. The `SU(2)`/torus engine is built alongside Layers 3-6 and is where the character and Weyl
integration formulas are proved concretely; the circle and finite-group specializations are the
acceptance criteria that keep the abstract normalizations honest. A contributor can complete Layers
0-2 (the unitarian trick and complete reducibility) as a self-contained first deliverable, well before
the Peter-Weyl density argument.

Layer6a is a separate compact CONNECTED Lie-group application after the general compact Haar/character theory and LieGroups' actual finite central cover/period phases. Semisimple highest-weight modules and LieII integration precede its descent construction; that descent precedes invariant-character-ring surjectivity. Its proof uses no Borel–Weil or HC endpoint. The pre-Weyl-formula type-A virtual-character unit remains independent: it uses the existing explicit polynomial GLn construction, not this general compact classification as an earlier premise.

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
