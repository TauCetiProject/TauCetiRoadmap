# Roadmap: orthogonal and spin groups

The final source audit on 2026-10-30 verified the complete roadmap against normal-merged
Tau Ceti [`daa66339a578`](https://github.com/TauCetiProject/TauCeti/commit/daa66339a578b8c1c41c20b94839ca25444cc1e8).
The [combined closeout audit](../CloseoutAudit-20261030.md) records the 934-root build
(24,174 Lake jobs), sixteen successful warning-as-error acceptance probes and 128 axiom
reports, all using only `propext`, `Classical.choice` and `Quot.sound`. The source and nine
dependency pins remained unchanged. The earlier results below retain their original revisions.

The completion audit is supported by the native square-class codomain refactor in
[Tau Ceti PR #22023](https://github.com/TauCetiProject/TauCeti/pull/22023), checked at
[`40bc1c43779d`](https://github.com/TauCetiProject/TauCeti/commit/40bc1c43779db5d437068c7c5c0250f535e22cec),
and the empty-away comparisons in
[PR #22024](https://github.com/TauCetiProject/TauCeti/pull/22024), checked at
[`4589478f1240`](https://github.com/TauCetiProject/TauCeti/commit/4589478f1240afbb9fb6c1cab41f1b2826fa29bd).
Both implementations are verified on actual upstream
`40eaa661fe7abb44c5e87aac7bdd2ca66011e972`, where all 24 changed source files are
byte-identical to their reviewed heads. All 127 owned and supporting modules, the broad API
replay and the native acceptance block pass there with Lean 4.36.0-rc1 and Mathlib `2cabef97`.
[Native completion checks](NativeCompletion.md) contain the compiled dimension-zero and real
four-square acceptance proofs, derived directly from the existing APIs.

The repository dependency pin remains Tau Ceti `358314d4ab97` with Lean 4.35.0-rc3.
`Suggested.lean` retains target prototypes, including `sorry` proofs; it is not a discharged
certificate for this completion audit. The generated status and progress reports are
historical snapshots at their recorded revisions. The complete README is the specification.

Mathlib supplies the Clifford, Lipschitz, Pin and Spin carriers, reflections, quadratic
isometries and restricted products. Tau Ceti already supplies the abstract orthogonal and special
orthogonal groups, determinant/reflection calculus, Lipschitz action and reverse norm, general-field
spinor norm, Spin-image theorem, binary norm image, low-dimensional even-unitary comparisons,
local topology and orthogonal adelic interfaces. Import those implementations on their actual
carriers. The layers below specify the complete orthogonal arithmetic library, including the
remaining finite classical and rational joint-image proofs; an existing implementation is an input
to the next layer, not another admitted definition to recreate.

Generic restricted-product packaging, componentwise maps and rational diagonals come from
[RestrictedProducts](../RestrictedProducts/README.md) and its native Tau Ceti successors.
The orthogonal specialization remains here. [Suggested forms](Suggested.lean) import the native
interfaces and prototype the new joint map and its precise theorem targets. They are a selected
interface aid, not an implementation or an exhaustive list of the milestones below.

This roadmap develops the arithmetic of the orthogonal and spin groups attached to a
finite-dimensional nondegenerate quadratic space over a field of characteristic not two: the
spinor norm through reflections, the Clifford comparison and its spinor kernel, orthogonal
transvections, local spinor norms, and the orthogonal specialization of the generic
restricted-product infrastructure. It supplies the algebraic, local, and finite-adelic interfaces
that the named successor roadmap `OrthogonalTamagawaAndLatticeMass` will consume.

**Current boundary.** Strong approximation, reduction theory, Tamagawa measures and
central-isogeny volume formulas are **not** milestones here. Their generic point and approximation
interfaces are [AdelicAlgebraicGroups AA.1 and AA.4.1–4.2](../AdelicAlgebraicGroups/README.md#layer-1-adelic-points-of-algebraic-groups);
its AA.3 owns arithmetic reduction and finite covolume, and AA.2 owns quotient integration,
gauge forms and normalized Tamagawa-measure construction. These are distinct supplier targets.
The number-field simply connected semisimple Tamagawa value is the proposed target of
[EndoscopicTransferAndUnitaryTraceComparison §6.2](../EndoscopicTransferAndUnitaryTraceComparison/README.md#62-tamagawa-number-one-for-simply-connected-semisimple-groups),
with AA.2.4's normalization and its complete proof prerequisites. The orthogonal value and shared
gauge/local-volume inputs have the proposed owner
[GeometryOfNumbersAndQuadraticArithmetic §3.3](../GeometryOfNumbersAndQuadraticArithmetic/README.md#33-finite-stabilizers-genus-classes-and-mass).
These existing written targets are not implemented supplier declarations. The remaining arbitrary
finite-central-isogeny volume-defect API is a distinct required construction under
`TamagawaMeasures`; neither AA.2's measure construction nor the scoped Kottwitz ratios of
EndoscopicTransferAndUnitaryTraceComparison §6.5 export that general API.
`AdelicFourierAnalysis` owns the separate Fourier/Poisson programme.
`OrthogonalTamagawaAndLatticeMass` owns the remaining orthogonal instantiations and adapters,
Spin approximation, Eichler's theorem and the full arbitrary-genus mass and general dyadic
extensions, consuming the shared inputs at their actual hypotheses. The exact partition and
normalization comparisons are stated once under *Consumer contract* below.

**Scope exclusions** (choices, not omissions; each names its owner). The Mathlib Clifford,
Lipschitz, Pin and Spin carriers and the accepted [SpinRepresentations
roadmap](../../TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md)'s algebraically closed structure
theorems are inputs; this roadmap owns the general-field algebraic orthogonal/spin group API, the
spinor norm, the image of `Spin → SO`, and the twisted rational forms of the low-rank
isomorphisms. **Witt decomposition and cancellation, square classes, Hasse invariants, the Hilbert
symbol, and classification over local fields** belong to
[QuadraticFormInvariants](../../TauCetiRoadmap/QuadraticFormInvariants/README.md). **Hasse--Minkowski and global
classification of forms over number fields** belong to
[GlobalQuadraticForms](../../TauCetiRoadmap/GlobalQuadraticForms/README.md). **Local ramification and power-class
facts** belong to [LocalFieldsRamification](../LocalFieldsRamification/README.md), and Hilbert
reciprocity belongs to [ClassFieldTheory](../../TauCetiRoadmap/ClassFieldTheory/README.md).
The current Layer1H arithmetic branch consumes GlobalQuadraticForms 4.3's
quadratic Hasse norm adapter and 6.1's scalar-representation theorem, together
with ClassFieldTheory's `cyclicHasseNorm` and
`isGlobalNorm_iff_isLocalNormEverywhere` contracts. GlobalQuadraticForms 6.3's
Hasse–Minkowski isometry theorem, its 8.4 form-theoretic SO kernel corollary,
and `ClassFieldTheory.hilbertProductFormula` are inputs only to the
`OrthogonalTamagawaAndLatticeMass` successor specification. These are named
roadmap supplier contracts; this distinction does not assert that their
prototypes are imported by OG's `Suggested.lean` or that their proofs are implemented. **Generic compact-open families,
restricted-product maps, finite/away/full adelic packaging, and rational diagonals** belong to
[RestrictedProducts](../RestrictedProducts/README.md). That roadmap explicitly does not own
strong approximation, reduction theory, Tamagawa measures, central-isogeny volume formulas, or
Tamagawa numbers. **General affine group-scheme machinery, representability, root data and
reductive structure theory** belong to [ReductiveGroups](../../TauCetiRoadmap/ReductiveGroups/README.md). This
roadmap owns the point groups `O(Q)`, `SO(Q)` and `Spin(Q)` and their point-group APIs. Constructing
their orthogonal affine group schemes `O_Q`, `SO_Q` and `Spin_Q`, proving representability and the
scheme-to-point comparison, and establishing their specific reductive structure belong to
`OrthogonalTamagawaAndLatticeMass` after ReductiveGroups exposes the required public point functor,
as specified in Layer 3A. **Lattice stabilizers and their arithmetic**, isometry classes, genera, spinor
genera and local densities over `ℤ` retain [IntegralLattices](../../TauCetiRoadmap/IntegralLattices/README.md)'s
owned milestones. [GeometryOfNumbersAndQuadraticArithmetic §§2.4 and 3.3](../GeometryOfNumbersAndQuadraticArithmetic/README.md#24-genus-and-proper-spinor-genus)
owns its number-field genus/spinor-genus extension, finite stabilizers, class sets, adelic mass
identity, and maximal-lattice mass formula, with their stated scope. The **full arbitrary-genus
mass formula**, Eichler's theorem and the genus/spinor-genus comparison requiring strong
approximation, and general dyadic lattice formulas beyond the maximal case remain
`OrthogonalTamagawaAndLatticeMass`'s, and are milestones of neither this roadmap nor
IntegralLattices. **Characteristic
two** is excluded: every field here has `2` invertible, and the Dickson invariant is not
developed. **The connected components of the real orthogonal groups**, their maximal compacts and
their symmetric spaces are outside. **Automorphic representations, the Weil representation, and the
Siegel–Weil formula as an identity between a theta integral and an Eisenstein series**, as well as
adelic Poisson summation, are outside. **Hermitian and unitary groups as a subject** — their classification, their Witt
theory and their invariants — **quadratic forms over division algebras, and orthogonal groups of
forms over rings of integers of number fields** are outside. ⚠ There is one deliberate exception,
and it is narrower than the classical statement of the low-rank isomorphisms: the unitary group
`U(C₀, σ)` of the even Clifford algebra for the canonical involution `σ = reverse` **is** owned
here, as `evenUnitaryGroup`, because in dimensions at most five `Spin_Q` is equal to it, and in
dimension five that group is the symplectic group `Sp(C₀, σ)`. What is **not** owned here is the
reduced norm of a central simple algebra, and hence `SU(A, σ)`: the dimension-six identification
`Spin_Q ≅ SU(C₀, σ)` therefore belongs to **`AlgebrasWithInvolution`**, the named successor that
owns central simple algebras with involution, their reduced norm, and the groups `U(A, σ)`,
`Sp(A, σ)` and `SU(A, σ)` with their functoriality. 1F states exactly the dimension-six fact that
is provable here, namely that the inclusion `Spin_Q ≤ U(C₀, σ)` is **strict** there.

Suggested homes, mirroring Mathlib's directory conventions:

- `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/` for Layers0–1G: the
  general-field algebra and finite-field joint-kernel theorem.
- `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/` for the Layer1H rational
  arithmetic branch and Layers2–3 local and finite-adelic specializations.

The generic restricted-product files live in the homes specified by `RestrictedProducts`,
never under this quadratic-form namespace.

## Standing hypotheses and pinned conventions

Decided once here; every layer states its results against this table.

- **The quadratic space.** `K` is a field with `[Invertible (2 : K)]`, `V` a finite-dimensional
  `K`-vector space, and `Q : QuadraticForm K V`. This is the quadratic form invariants roadmap's
  standing hypothesis, and its results are consumed throughout. Nondegeneracy is
  `QuadraticMap.Nondegenerate Q`, which that roadmap calls regularity in prose; results are proved
  without it wherever it costs nothing. Dimension is `Module.finrank K V`.
- **The bilinear form, un-halved.** `B := QuadraticMap.polar Q`, bundled as
  `QuadraticMap.polarBilin Q`, so that `B x x = 2 • Q x` (`QuadraticMap.polar_self`, whose
  right-hand side is an `nsmul` and not a product) and `Q x = B x x / 2`. This is Mathlib's polarization, not the half-polar form of sources whose
  bilinear form satisfies `b v v = Q v`. Every displayed formula below is against `B`.
- **⚠ The reflection formula.** For `v` with `Q v ≠ 0`, these two spellings are **equal**, and
  both are correct:

      τ_v (x) = x - (B x v / Q v) • v
              = x - (2 · B x v / B v v) • v,

  since `B v v = 2 • Q v`. Their equality is a stated lemma, not a remark, because the two forms
  are what the two halves of the literature write and a proof will meet both. What is genuinely
  wrong is the **mixed** form `x - (2 · B x v / Q v) • v`, obtained by taking a half-polar
  source's `2 · b x v / b v v`, substituting `b ⇝ B` in the numerator, and leaving `Q v` in the
  denominator: it sends `v` to `-3v`. The first spelling above is the quadratic form invariants
  roadmap's, and it is what Mathlib's `Module.reflection` wants: that takes `f : V →ₗ[K] K` and
  `x : V` with `f x = 2` and returns `y ↦ y - f y • x`, and `f := (Q v)⁻¹ • polarBilin Q v` has
  `f v = B v v / Q v = 2` on the nose.
- **Orthogonal group.** `O(Q)` is `orthogonalGroup Q : Subgroup (V ≃ₗ[K] V)` and `SO(Q)` is
  `specialOrthogonalGroup Q`. Their general-field algebraic API is owned here, built on Mathlib's
  Clifford carriers and the accepted SpinRepresentations inputs. No second notion of isometry is
  introduced beside Mathlib's
  `QuadraticMap.IsometryEquiv`. `Matrix.orthogonalGroup`, being the orthogonal group of the
  standard form, is a comparison target after choosing a basis and never a definition. We say
  **proper** for an element of `SO(Q)` and **improper** otherwise.
- **`SO` means determinant one**, which is correct in characteristic not two. The determinant is
  `LinearEquiv.det` restricted to `O(Q)`.
- **Square classes.** `Kˣ/(Kˣ)²` is the quadratic form invariants roadmap's, interoperating with
  the landed `TauCeti.SquareClassGroup`; its multiplicative carrier is written directly as
  `Kˣ ⧸ Subgroup.square Kˣ`. In quotient-free statements "same square class" is
  `IsSquare (a * b)` for units. The spinor norm lands there and adds no alias or third spelling.
- **The Clifford action is twisted conjugation.** The Lipschitz, Pin and Spin groups act on `V`
  by `x ↦ involute g * x * g⁻¹`, matching Mathlib's `pinGroup` and `spinGroup`, which are defined
  through `involute`. Under this action an anisotropic `v` acts as `τ_v` exactly, with no sign.
  Untwisted conjugation sends `v` to `-τ_v`, so a source using it differs from this roadmap by
  `(-1)^r` on a product of `r` vectors; the comparison is stated once as a lemma and never left
  to the reader.
- **The spinor norm** is `θ : O(Q) → Kˣ/(Kˣ)²`, `θ(τ_{v₁} ⬝⬝⬝ τ_{v_r}) = [Q v₁ ⬝⬝⬝ Q v_r]`,
  defined through a reflection factorization and proved independent of it. It is not defined as a
  quotient by the image of `Spin`: the reflection formula is the API the lattice side computes
  with, one reflection at a time.
- **⚠ The Clifford norm is the `reverse` norm, and the sign matters on odd length.** `N g` means
  `reverse g * g`, so that `N (ι v) = Q v` **exactly**, by `reverse_ι` followed by `ι_sq_scalar`.
  Mathlib's `star` is `reverse ∘ involute`, giving the other anti-involution, and
  `star (ι v) * ι v = -Q v` by `star_ι`. The two norms agree on even homogeneous elements and
  differ by `(-1)^r` on a product of `r` vectors. This is not a cosmetic difference that a
  square-class codomain absorbs: `[Q v]` and `[-Q v]` differ by `[-1]`; these square classes are distinct
  exactly when `[-1]` is nontrivial in `Kˣ/(Kˣ)²`. Thus they are distinct over ℚ, and over `ℚ_p`
  exactly when `p = 2` or `p` is odd with `p ≡ 3 (mod 4)`. They agree over `ℚ_p` for odd
  `p ≡ 1 (mod 4)`. Accordingly the two conventions disagree on `O(Q)` at odd reflection length
  exactly when `[-1]` is nontrivial, and agree on `SO(Q)`. Every statement below uses the `reverse` norm.
- **Places and adeles.** Over ℚ we write `ℚ_v` with `ℚ_∞ = ℝ`; for a number field the places are
  as GlobalNumberFields names them and RestrictedProducts packages their point groups. `𝔸_f`
  is the finite adeles, `𝔸` the full
  adeles, `𝔸^S` the adeles away from a finite set `S` of places. Which is meant is never left
  implicit: Layer 3 builds the specialized finite, away-`S`, and full adelic groups, and the
  approximation and measure applications are `OrthogonalTamagawaAndLatticeMass`'s.
- **Adelic points are restricted products of point groups.** `O(V)(𝔸_f)` means the restricted
  product of the topological groups `O(V_p)` relative to a chosen family of compact open
  subgroups, not the orthogonal group of a form over the ring `𝔸_f`. The compact-open family is a
  parameter, so a consumer can instantiate it with the stabilizers of its own lattice.

## What Mathlib already has (consume)

Capability statements only. The pin, inspection date, tracked upstream pull requests, and
re-check notes are maintained in the private migration and provenance ledger.

- **Clifford algebras:** `Mathlib/LinearAlgebra/CliffordAlgebra/` (14 files) has `ι` with
  `ι_sq_scalar`, the universal property, `map` and **`equivOfIsometry`**, the only declaration
  anywhere that turns an isometry of quadratic forms into an isomorphism of Clifford algebras, and
  therefore the route every `Equivalent`-invariance statement in Layer 1 takes;
  `Conjugation.lean` has `involute`, `reverse` and
  their interaction lemmas; `Star.lean` has `star_def : star x = reverse (involute x)` and
  `star_ι : star (ι Q m) = -ι Q m`, which is what pins the sign in the Clifford norm;
  `Grading.lean` has `evenOdd` with `GradedAlgebra`, `evenOdd_isCompl` and the even and odd
  induction principles; `Even.lean` has the even subalgebra with its lift; **`Inversion.lean` has
  `invertibleιOfInvertible`**, which is how an anisotropic vector becomes a unit and hence enters
  the Lipschitz group; `Equivs.lean` already identifies small Clifford algebras with ℂ and with
  the quaternions.
- **Lipschitz, Pin and Spin:** `SpinGroup.lean` has
  `lipschitzGroup Q : Subgroup (CliffordAlgebra Q)ˣ` defined as the closure of the preimage of the
  vectors, `pinGroup Q` and `spinGroup Q` as submonoids with `Group` instances, and the theorems
  `conjAct_smul_range_ι` and `involute_act_ι_mem_range_ι` that the action preserves the embedded
  copy of `V`. ⚠ Every such theorem carries `[Invertible (2 : R)]`, and the docstring records that
  the closure definition of `lipschitzGroup` agrees with the "conjugation preserves `V`"
  definition only in finite dimensions, with the reverse inclusion not proved in Mathlib. Note that
  `pinGroup` is defined as an intersection with `unitary`, so membership already encodes
  `reverse (involute x) * x = 1`; Layer 1C states the Clifford norm against that rather than
  introducing a competing one.
- **Reflections:** `Mathlib/LinearAlgebra/Reflection.lean` has `Module.preReflection` and
  `Module.reflection` as linear equivalences from a functional `f` and a vector `x` with `f x = 2`,
  with involutivity, `Module.reflection_apply_self`, and the products-of-two-reflections API.
  `Mathlib/LinearAlgebra/RootSystem/OfBilinear.lean` has `LinearMap.IsReflective` with
  `coroot_apply_self` supplying the `f x = 2` hypothesis from a form, and
  `isOrthogonal_reflection`, the only statement anywhere that a reflection preserves a bilinear
  form. **Gap: there is no determinant of `Module.reflection`.** The only reflection determinant in
  Mathlib is `Submodule.det_reflection` for the inner-product-space reflection.
- **Quadratic forms:** `QuadraticForm/Basic.lean` has `polar`, `polarBilin`, `polar_self`,
  `Anisotropic` and `exists_orthogonal_basis` (with `[Invertible (2 : K)]`);
  `IsometryEquiv.lean` has `QuadraticMap.IsometryEquiv` with `refl`, `symm`, `trans` and **no group
  structure**; `Radical.lean` has `Nondegenerate` and the radical API.
- **Matrix groups:** `Mathlib/LinearAlgebra/UnitaryGroup.lean` has `Matrix.orthogonalGroup` as an
  abbreviation for `Matrix.unitaryGroup` with the trivial involution, so the standard form only,
  with `mem_orthogonalGroup_iff : A ∈ orthogonalGroup n R ↔ A * Aᵀ = 1`, and
  `Matrix.specialOrthogonalGroup`. ⚠ **Neither carries a topology instance, and neither is known
  compact**; only `SL n R` and `GL n R` have topology at the pin. Layer 2 therefore topologizes
  `O(Q)` through `Module.End K V`, not through a matrix group.
- **The module topology:** `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` has
  `moduleTopology R A`, the finest topology making the module operations continuous, the class
  `IsModuleTopology R A` recording that a supplied instance is that one, `eq_moduleTopology`,
  `IsModuleTopology.iso` for transport along a continuous linear equivalence, and
  `IsTopologicalSemiring.toIsModuleTopology`. This is the canonical topology Layer 2 uses, so no
  private basis-transport construction is introduced. `Mathlib/Analysis/Normed/Module/FiniteDimension.lean`
  has `LinearMap.continuous_of_finiteDimensional`, the archimedean half of the continuity input.
- **Restricted products:** `Mathlib/Topology/Algebra/RestrictedProduct/` (three files) has
  `RestrictedProduct` as a subtype of the dependent product cut out by an `∀ᶠ` condition relative
  to an arbitrary filter, with `structureMap`, `inclusion`, algebra instances up to `CommRing`
  through subobject classes, the evaluation homomorphisms, the inductive-limit topology,
  `isOpen_forall_mem`, **`isOpenEmbedding_structureMap`**, **`locallyCompactSpace_of_group`**, the
  topological group and ring instances, `mapAlong` with its monoid- and ring-hom versions, and
  `unitsEquiv`. This is a better substrate than a first look suggests. **⚠ Gap: there is no
  congruence API at all.** There is no `MulEquiv`, `RingEquiv` or `Homeomorph` induced by
  componentwise equivalences, only one-directional homomorphisms; the exact comparison used by
  Layer 3B is therefore imported from RestrictedProducts.
- **Adeles:** `Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean` defines `FiniteAdeleRing`
  as a `RestrictedProduct` of adic completions relative to their integers, with its topological
  ring structure and `unitEmbedding`; `Mathlib/NumberTheory/NumberField/AdeleRing.lean` is 74
  lines and defines `AdeleRing` as a product together with `principalSubgroup`, about which
  **nothing is proved**: no discreteness, no cocompactness. `ProdAdicCompletions` no longer exists.
  Nothing constructs the points of a group over the adeles.
- **Signature:** `Mathlib/LinearAlgebra/QuadraticForm/Signature.lean` has `sigPos` and `sigNeg`
  with `Equivalent`-invariance, Sylvester uniqueness, and `sigPos_add_sigNeg_add_radical`. ⚠ They
  are in the **root namespace**, not under `QuadraticForm`, despite the file's docstring;
  `QuadraticForm.sigPos` does not exist.
- **`p`-adics:** `Mathlib/NumberTheory/Padics/` has `ℤ_[p]` and `ℚ_[p]`, Hensel's lemma,
  `PadicInt.compactSpace`, and `ProperSpace ℚ_[p]`, from which local compactness follows by
  instance search although no declaration names it.

## What Tau Ceti already has (consume)

These are full-roadmap supplier dependencies, not new local interfaces. A named
contract consumed here need not be an implemented declaration or a direct import
of the selected `Suggested.lean` prototype.

- **Orthogonal direct sums** (`TauCeti/LinearAlgebra/QuadraticForm/Prod.lean`, over a commutative
  ring): `QuadraticMap.orthogonalGroupProd` and `QuadraticMap.specialOrthogonalGroupProd`, both
  injective; `QuadraticMap.mem_range_orthogonalGroupProd_iff` (the `O` image is the subgroup
  preserving both summands); `QuadraticMap.mem_range_specialOrthogonalGroupProd_iff` (the `SO`
  image additionally requires both diagonal blocks to have determinant one); and
  `QuadraticMap.det_orthogonalGroupProd`. Layer 0B consumes these and restates none of them.
- **[QuadraticFormInvariants](../../TauCetiRoadmap/QuadraticFormInvariants/README.md)** owns the canonical
  multiplicative square-class quotient `Kˣ ⧸ Subgroup.square Kˣ`, reflection and
  Cartan--Dieudonné input, Witt theory, `hilbertSymbol`, `localHasse`,
  `hasseInvariant_eq_localHasse`, and local classification. The native spinor maps use `Multiplicative (TauCeti.SquareClassGroup K)`,
  compared to that raw quotient by `TauCeti.multiplicativeSquareClassEquiv`; no third
  square-class carrier or generic pushforward API is introduced.
- **[LocalFieldsRamification](../LocalFieldsRamification/README.md)** owns normalized valuations,
  unit filtrations and the square-class finiteness/deep-squares inputs, including
  `unitFiltration_le_range_powMonoidHom_two` and its sharpness, and the **openness** of the square
  subgroup, `isOpen_range_powMonoidHom`, which 2E and 3C both consume and which does not follow
  from the module topology.
- **[RestrictedProducts](../RestrictedProducts/README.md)** owns generic compact-open
  families, restricted-product maps, rational diagonals, and finite/away/full point packaging. Its
  Lean-level contracts consumed by Layer3 and their native implementations are `integralSubgroup`, `restrictedProductMap`,
  `restrictedProductMapOfForall` with its `_apply`, `restrictedProductCongr`, `rationalDiagonal`,
  `restrictAway`, `RestrictedProductGroup`, `RestrictedProductGroupAway`, and
  `RestrictedProductGroupWithFactor`. It explicitly exports no `LocalPointGroup`, scheme-level
  compact-open carrier, strong approximation, reduction theory, Tamagawa measure, or
  central-isogeny formula. This roadmap imports none of those names and supplies no placeholder
  replacement.
- **[SpinRepresentations](../../TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md)** and Mathlib
  supply the Clifford-algebra representation theory and the algebraically closed low-rank
  exceptional isomorphisms. This roadmap owns their general-field orthogonal/spin arithmetic
  specialization.
- **[GlobalQuadraticForms](../../TauCetiRoadmap/GlobalQuadraticForms/README.md)** supplies the current
  Layer1H norm/representation inputs 4.3 and 6.1, with `LocallyRepresentsScalar`
  for regular Q and nonzero scalars at all finite and real places. Its 6.3/8.4
  isometry/form-kernel outputs are reserved for the named successor contract.
- **[ClassFieldTheory](../../TauCetiRoadmap/ClassFieldTheory/README.md)** supplies the current Layer1H
  cyclic Hasse norm theorem and its local-norm spelling. Its Hilbert product
  formula is consumed by the named successor. These milestone contracts are
  not claims of native OG imports or completed supplier implementations.
- **[IntegralLattices](../../TauCetiRoadmap/IntegralLattices/README.md)** is the downstream consumer, not a
  prerequisite.

### Dependencies, by milestone

Each row names the existing declarations or exact owned supplier milestones it consumes.
The generic field-level branch precedes the rational arithmetic specialization.

| Consumed | From | Used by |
| --- | --- | --- |
| `TauCeti.QuadraticMap.orthogonalGroup`, `specialOrthogonalGroup`; `QuadraticMap.orthogonalDet`, `specialOrthogonalToOrthogonal`; reflection/isometry/base-change and Lipschitz/Spin APIs listed under native input | Implemented Tau Ceti source, on its native carriers | Layers0–3; never recreated as admitted carriers |
| `MulAction.IwasawaStructure.isSimpleGroup`, `Group.IsPerfect`, quotient-center and projective-space action APIs | Mathlib; OG constructs the finite orthogonal polar-space action, elementary generation, primitive-action and stabilizer data | 1G higher ranks, including q=3 |
| Clifford, Lipschitz, Pin and Spin carriers; algebraically closed low-rank comparisons | Mathlib and SpinRepresentations | Layers 0, 1 |
| raw `Kˣ ⧸ Subgroup.square Kˣ`; reflection/Cartan--Dieudonné/Witt inputs; `hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse`; local classification | QuadraticFormInvariants | Layers 0--3 |
| `normalizedValuation`, `unitFiltration`, `square_eq_range_powMonoidHom`, `isOpen_range_powMonoidHom`, square-class counts, `unitFiltration_le_range_powMonoidHom_two`, `not_unitFiltration_le_range_powMonoidHom_two`, `absoluteRamificationIndex` | LocalFieldsRamification | Layers 2, 3 |
| `RestrictedProducts.integralSubgroup`, `restrictedProductMap`, `restrictedProductMapOfForall`, `restrictedProductCongr`, `rationalDiagonal`, `restrictAway`, `RestrictedProductGroup`, `RestrictedProductGroupAway`, `RestrictedProductGroupWithFactor` | RestrictedProducts | Layer 3 |
| `Multiplicative (TauCeti.SquareClassGroup K)`, `TauCeti.multiplicativeSquareClassEquiv`, `CliffordAlgebra.orthogonalSpinorNorm`, `spinorNorm`, `range_spinToSpecialOrthogonal_eq_ker_spinorNorm`, `range_spinorNorm_of_equivalent_binary` | Tau Ceti square-class/spinor-norm API | 1G general χ, Ω and 1H |
| `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple`, `SL2Simple.PSL_commutator_eq_top`, `SL2Simple.PSL_nontrivial`, `PSL2.Iwasawa`, `PSL.iSup_iwasawaT_eq_top` | Mathlib PSL2 simplicity, perfectness, nontriviality and Iwasawa suppliers | 1G low ranks, including F_(q²) |
| `Projectivization.SL_mulAction_ker`, `Projectivization.PSLAction.toPermHom`, `Matrix.ProjectiveSpecialLinearGroup.smul_proj_mk`, `Matrix.ProjectiveSpecialLinearGroup.toPermHom_injective`; the matrix-SL `IsMultiplyPretransitive ... 2` instance in `Mathlib.LinearAlgebra.Projectivization.Action`, native PSL faithfulness/preprimitivity, and `MulAction.IsPretransitive.of_embedding` | Mathlib projective actions and multiple-transitivity transport; OG owns the orthogonal-carrier comparison and quotient two-transitivity adapter | 1G low-rank actions |
| `Matrix.SpecialLinearGroup.lineStab`, `Matrix.SpecialLinearGroup.lineStab_smul`, `Matrix.SpecialLinearGroup.lineStab_isMulCommutative_of_span`; `PSL.iwasawaT`, `PSL.iwasawaT_map_conj` | Mathlib projective stabilizer construction and its conjugation/commutativity laws | consumed through native `rank_two_simple`; no OG-owned Iwasawa comparison |
| `Matrix.SL2.transvection_induction`, `Matrix.SL2.commutator_eq_top`; `littleWedderburn`, `DivisionRing.ofIsUnitOrEqZero`, `TauCeti.QuaternionAlgebra.forall_isUnit_or_nonempty_algEquiv_matrix` | Mathlib and Tau Ceti; OG owns finite-field quaternion splitting and finite-classical carrier/kernel adapters | 1G rank3/4, including F_(q²) |
| Witt decomposition; finite orthogonal root-map and commutator comparison | QFI and ReductiveGroups Layer9's named root maps/relations, after OG carrier comparison | 1G higher ranks; finite simplicity proof owned here |
| GlobalQuadraticForms [6.1 Scalar representation](../../TauCetiRoadmap/GlobalQuadraticForms/README.md#61-scalar-representation), using its `LocallyRepresentsScalar` predicate for regular Q and nonzero a; [4.3 The quadratic Hasse norm adapter](../../TauCetiRoadmap/GlobalQuadraticForms/README.md#43-the-quadratic-hasse-norm-adapter); `ClassFieldTheory.cyclicHasseNorm`, `isGlobalNorm_iff_isLocalNormEverywhere` | Exact GQF milestones and ClassFieldTheory | 1H rational norms |
| QuadraticFormInvariants [6D](../../TauCetiRoadmap/QuadraticFormInvariants/README.md#6d-the-classification-and-its-corollaries): “Isotropy by rank” (rank≥5), “Representation”, “u(K)=4” and “The anisotropic quaternary form is unique”, under its fixed local-field hypotheses; native quaternion norm form/split criterion | Exact QFI milestones and Tau Ceti | 1H local quaternion norm consequence owned here |

Two named successors sit downstream and neither is a current import.
`OrthogonalTamagawaAndLatticeMass` owns the strong-approximation and Tamagawa applications; its
contract is the short section at the end of this document. `AlgebrasWithInvolution` owns central
simple algebras with involution, the reduced norm, and the groups `U(A, σ)`, `Sp(A, σ)` and
`SU(A, σ)`; what this roadmap defers to it is exactly the dimension-six identification of 1F.

## What is missing (build here)

The full target is the determinant/reflection calculus; Lipschitz products, scalar units and
reverse norm; the general-field spinor norm and Spin-image comparison; the even-unitary and twisted
low-rank identifications; the joint determinant–spinor map, finite Ω/PΩ theorem and rational norm
image; transvections and their Clifford lifts; the local topology and full spinor-image table;
localization; integral and compatible compact-open families; and finite/away/full adelic groups,
diagonals, componentwise maps, spinor kernel and double-coset comparisons. All remain required.

### Native input and remaining owner work

The native baseline uses the Tau Ceti package revision recorded by this repository's manifest.
Import `TauCeti.LinearAlgebra.QuadraticForm.OrthogonalGroup.Basic` for the actual O/SO carriers,
determinant, reflections, isometry transport and determinant-index results. Import
`TauCeti.LinearAlgebra.CliffordAlgebra.Spin.SpinorNorm.Basic`, `.Range` and `.Binary` for the
spinor maps, Spin image, represented-value and binary norm-subgroup results. The Lipschitz and
Spin modules also supply scalar/kernel, base-change, transvection and low-rank even-unitary
interfaces. The native ternary quaternion action and reversal-compatible even-Clifford model
supply the exact norm comparison inputs in1H. Do not replace them by opaque suggested definitions.

The native topology and number-theory modules supply substantial parts of Layers2–3, including
`TauCeti.Topology.Algebra.CliffordAlgebra.Spin.SpinorNorm`,
`TauCeti.NumberTheory.QuadraticForm.OrthogonalGroup.CompactOpen`, `.FiniteAdelic` and
`.AdelicSpinorNorm`. Their hypotheses and codomains are part of the import contract. For example,
the native openness theorem assumes a locally compact nontrivially normed field; the general
Hausdorff topological-field result retained in2E additionally owns the reflection-section argument
below. A theorem index is not evidence that every generality of every layer is implemented.

New work includes the general joint-kernel adapters, the full finite odd-field table and its
actual root/action comparisons, the rational sign/prime and norm/Hilbert adapters, and any
orthogonal/topological or adelic milestone not covered at its stated hypotheses by the native
inputs. Prove missing results in this owner while consuming the implemented parts. In particular,
the split/nonsplit twisted-form identifications, global arithmetic suppliers and the complete
acceptance examples remain required even where no suggested signature is listed.

Generic restricted products and diagonals are imported. The strong-approximation, reduction,
Tamagawa and generic degree-four reduced-norm/SU proofs retain the named successor ownership
specified above. GlobalQuadraticForms and ClassFieldTheory are consumed at their exact numbered
arithmetic contracts; importing their admitted Suggested prototypes would not prove them.

---

## The build, in layers

### Layer 0: the orthogonal group, and what the arithmetic needs from it

**Direct prerequisites.** Mathlib: `QuadraticMap.IsometryEquiv`, `LinearEquiv.det`, `polarBilin`,
`Module.reflection`, `BilinForm.baseChange`. SpinRepresentations supplies the Clifford action and
matrix comparisons. QuadraticFormInvariants Layer 0 supplies orthogonal bases; Layer 1 supplies
reflections, Cartan–Dieudonné, Witt's extension theorem. Internal: none.

This layer fixes the general-field carriers `orthogonalGroup Q` and `specialOrthogonalGroup Q` and
the arithmetic API around the imported reflection theory.

**0A. The determinant, and the two spellings of `SO`.** `orthogonalDet : O(Q) →* Kˣ`, the
restriction of `LinearEquiv.det`. For nondegenerate `Q`, `(orthogonalDet g)² = 1`, proved from the
Gram congruence `Mᵀ G M = G` and `det G ≠ 0`, so the determinant lands in `μ₂`.

⚠ `specialOrthogonalGroup Q` is a subgroup of `V ≃ₗ[K] V`, not of `O(Q)`. The determinant kernel
is therefore a **separately named** subgroup
`specialOrthogonalWithin Q : Subgroup (O(Q))`, together with the interface that ties the two
together and that every later layer quotes: the inclusion
`specialOrthogonalToOrthogonal : SO(Q) →* O(Q)`; the equality
`specialOrthogonalWithin Q = (orthogonalDet Q).ker`; a named multiplicative equivalence between
`specialOrthogonalWithin Q` and the accepted `specialOrthogonalGroup Q`, obtained by pulling the
latter back along `(O(Q)).subtype`; and the compatibility of `spinToSpecialOrthogonal` with
`specialOrthogonalToOrthogonal`.

For nondegenerate `Q` with `dim V ≥ 1` the index is exactly 2, since such a form has an anisotropic
vector and hence an improper reflection. Dimension 0 is stated separately: both groups are trivial,
and no statement below silently assumes `dim V ≥ 1`.

**0B. Functoriality and base change.** An isometry `Q ≃qᵢ Q'` induces `O(Q) ≃* O(Q')`, so `O` is an
invariant of `QuadraticMap.Equivalent`; a field extension `K → L` induces an injective
`O(Q) →* O(Q ⊗ L)`, compatible with composition of extensions. The orthogonal direct sum is
consumed from Tau Ceti, not rebuilt: `QuadraticMap.orthogonalGroupProd` embeds
`O(Q₁) × O(Q₂)` into `O(Q₁.prod Q₂)` with image exactly the subgroup preserving both summands
(`QuadraticMap.mem_range_orthogonalGroupProd_iff`), and `QuadraticMap.det_orthogonalGroupProd`
says the determinant of `g₁ ⊕ g₂` is `det g₁ · det g₂`. ⚠ The determinant compatibility does
**not** make the same image statement true for `SO`. The subgroup of `SO(Q₁.prod Q₂)` preserving
both summands is the image of `{(g₁, g₂) ∈ O(Q₁) × O(Q₂) | det g₁ · det g₂ = 1}`, while the image
of `QuadraticMap.specialOrthogonalGroupProd : SO(Q₁) × SO(Q₂) →* SO(Q₁.prod Q₂)` is cut out by
preserving both summands **and** having both diagonal blocks of determinant one
(`QuadraticMap.mem_range_specialOrthogonalGroupProd_iff`). The second subgroup has index two in
the first whenever both summands are nondegenerate of positive dimension (each then has a
reflection, of determinant `−1`, and `(τ₁, τ₂)` is a pair outside the second subgroup), and the
two coincide when one summand is the zero space. These
statements are the ones every later layer localizes with; no criterion for either embedding to
be onto `O(Q₁.prod Q₂)` or `SO(Q₁.prod Q₂)` is claimed.

*Checks for 0B.*

- `Q₁ = Q₂ = ⟨1⟩` over `ℚ`: both `SO(Qᵢ)` are trivial, so the image of
  `specialOrthogonalGroupProd` is trivial, yet `−I₂ = (−1) ⊕ (−1)` preserves both summands and has
  determinant `(−1)(−1) = 1`, so it lies in `SO(Q₁.prod Q₂)`. A definition of the `SO` image as
  "the summand-preserving part of `SO`" gets this wrong.
- The same forms with `O`: the summand-preserving subgroup of `O(⟨1⟩ ⊞ ⟨1⟩)` is
  `{diag(±1, ±1)}`, of order four, equal to the image of `O(⟨1⟩) × O(⟨1⟩)`; the swap of the two
  coordinates is in `O(Q₁.prod Q₂)` but preserves neither summand, so the direct-sum embedding is
  not onto.
- `Q₂` the zero form on the zero space: `O(Q₂)` is trivial, the determinant-product condition
  reduces to `det g₁ = 1`, and the two `SO` subgroups coincide with `SO(Q₁)`.

**0C. The bilinear dictionary.** With `2` invertible, `O(Q)` and the automorphism group of the
symmetric bilinear form `B = polarBilin Q` are the same group: an isometry of `Q` preserves `B` by
polarization, and an isometry of `B` preserves `Q` because `Q x = B x x / 2`. The milestone is the
group isomorphism `O(Q) ≃* O(B)` in both directions, with its determinant compatibility and hence
`SO(Q) ≃* SO(B)`. Beside it, the base-change map for a symmetric bilinear form over a commutative
ring, `O(β) →* O(β.baseChange S)`, stated over the ring rather than the field. ⚠ Without this
milestone the group here and the group an integral lattice's automorphisms sit in are two
different objects, and the roadmaps do not connect: the integral lattices roadmap is bilinear-first
because it works over ℤ, where `2` is not invertible, and this is the only place the two
conventions are reconciled.

**0D. Reflections, as this roadmap uses them.** The reflection `τ_v` is the quadratic form
invariants roadmap's, and this layer records the construction through `Module.reflection` with
`f := (Q v)⁻¹ • polarBilin Q v`, so that involutivity and `τ_v v = -v` come from Mathlib rather
than a private definition. Beside it, the lemma that the two coefficient spellings agree,
`B x v / Q v = 2 · B x v / B v v` for `Q v ≠ 0`, which is what lets a proof move between this
roadmap's convention and a half-polar source's without recomputing, and which is the acceptance
check against the mixed form that sends `v` to `-3v`. What the quadratic form invariants roadmap
does not state, and Layer 1 needs: `det τ_v = -1`
(absent from Mathlib for `Module.reflection` in any form); `τ_{a v} = τ_v` for `a ≠ 0`; the
conjugation law `g τ_v g⁻¹ = τ_{g v}` for `g ∈ O(Q)`; and compatibility with scalar extension,
`τ_v` base changing to the reflection in the image of `v`. The determinant computation is what
makes the parity statement of 0F meaningful, and the conjugation law is what makes the spinor norm
a class function on conjugacy classes of reflections.

**0E. Transitivity, explicitly.** For `v, w` with `Q v = Q w ≠ 0` and `v ≠ w`: since
`Q(v−w) + Q(v+w) = 2 Q v + 2 Q w ≠ 0`, at least one of `v−w` and `v+w` is anisotropic. If
`Q(v−w) ≠ 0` then `τ_{v−w} v = w`, because `B v (v−w) = 2 Q v − B v w = Q(v−w)` makes the
reflection coefficient exactly 1. If instead `Q(v+w) ≠ 0` then `τ_{v+w} v = −w`, so
`τ_w τ_{v+w}` takes `v` to `w`. Hence `O(Q)` acts transitively on each nonzero norm level by at
most two reflections, with the reflections written down. This is a step inside the classical proof
of Cartan–Dieudonné, but it is not stated there as API, and the explicit reflections are exactly
what a spinor-norm computation needs: Witt's extension theorem gives the existence of an isometry
and says nothing about its spinor norm.

**0F. Parity.** The number of reflections in any factorization of `g` has the parity of `det g`,
immediately from `det τ_v = -1`. So `SO(Q)` consists of the elements admitting an even
factorization, and is generated by products of two reflections. Combined with Cartan–Dieudonné,
this is the statement Layer 1B uses to prove that the Spin action has determinant one.

### Layer 1: the Lipschitz group and the spinor norm

**Direct prerequisites.** Mathlib: `lipschitzGroup`, `pinGroup`, `spinGroup`, `reverse`,
`involute`, `star_def`, `star_ι`, `ι_sq_scalar`, `involute_eq_of_mem_even`, `equivOfIsometry`,
`even`, `evenOdd`, `unitary`, `spinGroup.toUnits`, `invertibleιOfInvertible`,
`invertibleOfInvertibleι`. SpinRepresentations Layer 2: `ιRangeEquiv`, the Clifford action, and
its algebraically closed comparison results.
Quadratic Form Invariants Layer 0: orthogonal bases, the multiplicative square-class avatar;
Layer 1: Cartan–Dieudonné. Internal: 0A, 0D, 0E, 0F. For1G additionally consume the native
square-class comparison, orthogonal/spinor homomorphisms and Spin-image theorem;
the low-rank finite proof uses Mathlib's SL2 transvection/commutator and Iwasawa
APIs and the finite quaternion splitting adapter below. The higher-rank route through
ReductiveGroups9 requires its explicit Witt/root-map comparison. Branch1H
additionally consumes GQF4.3/6.1 and the CFT cyclic norm contract in the table;
these arithmetic prerequisites are not used by1A–1G.

Mathlib supplies the Pin and Spin carriers, while SpinRepresentations supplies the algebraically
closed comparison theory. This layer owns the general-field maps and arithmetic: the graded
centre, Clifford norm, spinor norm, and identification of the image of `Spin` in `SO` at
`K`-points.

⚠ Everything below is stated **against Mathlib's carriers as Mathlib defines them**, never against
the classical Clifford group they are expected to coincide with. `lipschitzGroup` is a closure and
`pinGroup`/`spinGroup` are cut out of it by `star`-unitarity; this roadmap's norm is the `reverse`
norm. So membership in the carrier (1B) and the reconciliation of the two norms (1A) are
milestones with hypotheses, not conventions, and they are what make 1E's sequence a theorem about
`spinGroup` rather than about an object nobody has built.

**1A. The Clifford norm, with the two anti-involutions kept apart.** `N g := reverse g * g` for
`g` in `lipschitzGroup Q`, with: the theorem that the value is a scalar, giving a homomorphism
`cliffordNorm : lipschitzGroup Q →* Kˣ` together with `cliffordNorm_spec`, the defining equation
without which the signature is satisfied by the trivial homomorphism; multiplicativity, from
`reverse` being an anti-automorphism; `cliffordNorm_scalarUnits_mul`, that `N (λ · g) = λ² · N g`;
and the value on a vector, `cliffordNorm_vectorUnit : N (ι v) = Q v`, an **equality** with no sign
ambiguity, proved from `reverse_ι` and `ι_sq_scalar`.

⚠ Mathlib cuts `pinGroup Q` and `spinGroup Q` out with the **`star`**-unitary condition, and
`star = reverse ∘ involute` is the *other* anti-involution, with `star (ι v) * ι v = -Q v`. The
square classes `[Q v]` and `[-Q v]` are distinct exactly when `[-1]` is nontrivial; this holds
over ℚ and over `ℚ_p` precisely for `p = 2` or odd `p ≡ 3 (mod 4)`, but not for odd
`p ≡ 1 (mod 4)`. Thus the conventions disagree on `O(Q)` at odd reflection length exactly in
those cases and agree on `SO(Q)`. Because 1E nevertheless states its exact sequence about
Mathlib's `spinGroup`, the reconciliation is three **named theorems** and not a remark inside a
proof:

- `star_mul_self_eq_reverse_mul_self_of_mem_even`: on even elements the two norms agree, by
  `involute_eq_of_mem_even`;
- `star_mul_self_eq_neg_one_pow_reverse_mul_self`: on a product of `r` vectors they differ by
  `(-1)^r`, so the previous item is exactly an even-degree phenomenon;
- `mem_spinGroup_iff_cliffordNorm_eq_one`: `spinGroup Q` is **exactly** the even elements of the
  Lipschitz carrier whose `reverse` norm is one. This is what licenses the use of `spinGroup` in a
  sequence all of whose norms are `reverse` norms.

**1B. ⚠ Mathlib's Lipschitz carrier, the graded centre, and the scalar subgroup.** Mathlib defines
`lipschitzGroup Q` as `Subgroup.closure ((↑) ⁻¹' Set.range (ι Q))`, the subgroup generated by the
invertible vectors, and its module docstring records that agreement with the usual "twisted
conjugation preserves `V`" Clifford group holds in one direction only, the converse not being proved in
Mathlib. So no statement here may be inherited from the classical theory of the latter group: every
membership, surjectivity and kernel claim is a theorem about the closure carrier, with its
hypotheses in the type. The milestones, in order, are

- `vectorUnit`, an anisotropic vector as a unit through `invertibleιOfInvertible`, with
  `vectorUnit_mem_lipschitzGroup`;
- `vectorUnit_inv`, that `(ι v)⁻¹ = ι ((Q v)⁻¹ • v)`, so the generating set is already closed under
  inversion;
- `product_vectorUnits_mem_lipschitzGroup`, and the characterization
  `mem_lipschitzGroup_iff_exists_list`: the carrier is **exactly** the set of products of
  anisotropic vectors, with no inverses needed. Every later theorem about the carrier factors
  through this one;
- `scalarUnits_mem_lipschitzGroup`, that the scalar units lie in the carrier. This is not
  automatic and is where the hypotheses earn their place: a nondegenerate form on a space of
  positive dimension over a field of characteristic not two has an anisotropic `v`, and then
  `λ = ι(λ v) · (ι v)⁻¹` is a product of two generators. Without an anisotropic vector there is no
  such expression, which is what the dimension-zero rejection test records.

`scalarUnits : Kˣ →* lipschitzGroup Q` is then **data**, the codomain restriction of
`Units.map (algebraMap K _)` along that theorem, not an opaque definition: an equation between two
opaque subgroups would prove nothing, and the kernel theorem below is exactly such an equation.

The graded centre, on which that kernel theorem rests, is the hardest item in Layers 0 to 3, and
everything after it in this layer depends on it. The spin representations roadmap's Clifford
structure theorem is stated over an algebraically closed field, so it does not supply what is
needed here, and this roadmap owns the general-field statement rather than waiting on one. For
nondegenerate `Q` on a space of dimension `n` over a field of characteristic not two, with `ω` the
product of an orthogonal basis: the centre of `CliffordAlgebra Q` is `K` when `n` is even and
`K ⊕ K·ω` when `n` is odd, while the **graded** centre, the centralizer for the twisted product, is
`K` in both parities. The proof runs through an orthogonal basis (consumed from the quadratic form
invariants roadmap), the induced basis of the Clifford algebra, and the commutation of a basis
monomial with each `ι e_i`.

Dimension zero is an explicit rejection test: `lipschitzGroup Q` is subsingleton there, so no
injective scalar-unit map from `ℚˣ` exists. Every "the kernel consists of the nonzero scalars"
claim below is `ker_vectorRepresentation_eq_scalarUnits`, an equality against
`(scalarUnits Q hQ hV).range`, never an existential equality between Clifford elements.

**1C. The vector representation.** Twisted conjugation gives a group homomorphism
`vectorRepresentation : lipschitzGroup Q →* O(Q)`, using Mathlib's `conjAct_smul_range_ι` and
`involute_act_ι_mem_range_ι` together with the spin representations roadmap's `ιRangeEquiv`, and
proving that the resulting linear map is an isometry. `vectorRepresentation_vectorUnit` says an
anisotropic `v` acts as `τ_v` exactly, with no sign, which is the twisted-conjugation convention
paying for itself. For nondegenerate `Q` on a finite-dimensional space the homomorphism is
**surjective**, by Cartan–Dieudonné together with that lemma and 1B's characterization of the
carrier; in positive dimension its kernel is `ker_vectorRepresentation_eq_scalarUnits`.
Compatibility with field extension and with `QuadraticMap.Equivalent`, the latter through
`CliffordAlgebra.equivOfIsometry`, which is the only declaration turning an isometry of forms into
an isomorphism of Clifford algebras.

**1D. The spinor norm.** For `Q` nondegenerate on a finite-dimensional space, both hypotheses
carried explicitly because the construction uses both, `θ : O(Q) → Kˣ/(Kˣ)²` by
`θ(τ_{v₁} ⬝⬝⬝ τ_{v_r}) = [Q v₁ ⬝⬝⬝ Q v_r]`. **Well-definedness is the milestone**: two reflection
factorizations of the same `g` lift, by 1C, to Lipschitz elements with the same image, so by 1B
they differ by an element of `(scalarUnits Q hQ hV).range`, that is by a scalar `λ`; and
`N (λ · g) = λ² · N g`, so the two products of norms agree modulo squares. The `reverse` norm of
1A is what makes the products come out as `∏ Q(vᵢ)` with no residual sign. Then `θ` is a group
homomorphism; `θ(τ_v) = [Q v]`; `θ` is invariant under `QuadraticMap.Equivalent` and compatible
with field extension; its restriction along `specialOrthogonalToOrthogonal`, which is the one the
arithmetic uses; and its behaviour on an orthogonal direct sum. Defining `θ` through reflections
rather than as a quotient by the image of `Spin` is what makes it computable on a lattice
stabilizer, one reflection at a time.

Beside them, the bridge theorem: the spinor norm of the isometry induced
by a Lipschitz element is the square class of that element's Clifford norm. That is the theorem the
well-definedness argument produces, and it is what 1E runs on.

**1E. The comparison sequence, with its dimension branches.** The maps, each named: the inclusion
`μ₂(K) → Spin(Q)(K)`, `spinToSpecialOrthogonal Q`, the inclusion `specialOrthogonalToOrthogonal`,
and `θ`; together with `spinToSpecialOrthogonal_eq_vectorRepresentation`, which says the first is
the vector representation read on `spinGroup` and is what connects the sequence to 1A's comparison
theorems. Then, for nondegenerate `Q` on a space of **positive** dimension: the kernel of
`spinToSpecialOrthogonal Q` is the image of `μ₂(K)`, of order two; and the **image** of
`spinToSpecialOrthogonal Q` is exactly the kernel of `θ` restricted along
`specialOrthogonalToOrthogonal`, the **spinor kernel**, which is the object the integral lattices
roadmap's spinor genera are built from. Dimension zero is stated separately, where the kernel is
trivial rather than of order two and the sequence degenerates.

⚠ The image statement is not a corollary of anything; it is the composite of the three named
comparison theorems, and the third of them is stated in its own right:
`exists_scalarUnits_mul_mem_spinGroup_iff` says that an even Lipschitz lift can be rescaled by a
scalar into Mathlib's `spinGroup` **exactly** when its Clifford norm is a square, that is exactly
when the spinor norm of the isometry it induces is trivial. Rescaling is where the `star`/`reverse`
distinction would silently do damage if it were not pinned first.

⚠ The sequence is exact at `Spin` and at `SO`, and `θ` need not be surjective, so nothing here is
a short exact sequence and none of it is written as one. Where `θ` is surjective the sequence
extends by `→ 1` on the right, and Layer 2 proves exactly which local fields, dimensions and
signatures those are. The distinction being tested is between a central isogeny of groups, which is
surjective as a map of algebraic groups, and surjectivity on `K`-points, which is what `θ` measures.
Read the other way, the image statement says that `Spin(Q)(K) → SO(Q)(K)` is onto whenever every
unit of `K` is a square, since `θ` then lands in the trivial group:
`spinToSpecialOrthogonal_surjective_of_square_eq_top`, with the algebraically closed case
`spinToSpecialOrthogonal_surjective_of_isAlgClosed`. So a failure of surjectivity on `K`-points is
never a property of `Q` alone; it always exhibits a nonsquare unit of `K`, and the rejection test
`not_surjective_spinToSpecialOrthogonal_hyperbolic_rat` exhibits `2 ∈ ℚˣ` on the hyperbolic plane.

**1F. Low rank, against a named carrier, with the split and nonsplit cases separated.** The
exceptional isomorphisms over an algebraically closed field are the spin representations roadmap's
Layer 6. ⚠ Those do not classify the rational forms, so the twisted forms are targets here — but a
twisted form is not specified by an isomorphism to an unnamed group, so the carrier comes first.

The carrier is `evenUnitaryGroup Q`, the units of `CliffordAlgebra Q` that are even and satisfy
`σ(x) x = 1` for the canonical involution `σ = reverse`. On even elements `star = reverse` by 1A,
so this is Mathlib's `unitary` condition read inside the even Clifford algebra `C₀`; in the
notation of the literature it is `U(C₀, σ)`. Its API: the subgroup itself, its membership
criterion, its functoriality along an isometry through `CliffordAlgebra.equivOfIsometry`, and
`range_spinGroup_toUnits`, that Mathlib's `spinGroup` is `lipschitzGroup Q ⊓ evenUnitaryGroup Q` —
which is `spinGroup`'s definition read through the comparison theorem of 1A, and the statement
every low-rank identification is a difference from.

The identification, in one theorem: for nondegenerate `Q` with `1 ≤ dim V ≤ 5`,
`evenUnitaryGroup_le_lipschitzGroup`, so `Spin(Q) = U(C₀, σ)` on the nose. ⚠ Dimension zero is
excluded and the exclusion is not decoration: there is no anisotropic vector there, so Mathlib's
closure carrier is trivial while `U(C₀, σ)` is `μ₂(K)`, and the unitary group is the one that is
too big. Read by dimension over a field `K` of characteristic not two:

- **Dimension 3.** `C₀` is a quaternion algebra over `K`, `σ` its conjugation, `U(C₀, σ)` its
  group of norm-one elements, and `SO(Q)` is its unit group modulo the centre. This is the
  dictionary quaternionic arithmetic runs on, which is why it is stated over a general field.
- **Dimension 4.** The centre of `C₀` is the **discriminant quadratic étale algebra**
  `E = K[X]/(X² − d)` for `d` the discriminant, `σ` fixes `E` pointwise, and the two cases are
  genuinely different groups:
  - `E ≅ K × K` split: `C₀` is a product `B₁ × B₂` of two quaternion algebras over `K`, `σ`
    restricts to the canonical involution of each, and `U(C₀, σ)` is the product of the two
    norm-one groups `B₁¹ × B₂¹`, two `K`-almost-simple factors each of **absolute** rank one.
    ⚠ Absolute rank, not `K`-rank: `Bᵢ¹` has `K`-rank one exactly when `Bᵢ` splits, and `K`-rank
    zero when `Bᵢ` is a division algebra, and a split discriminant algebra says nothing about
    whether the `Bᵢ` split. For `x₁² + x₂² + x₃² + x₄²` over `ℝ` the discriminant is a square, so
    `E ≅ ℝ × ℝ`, yet `C₀ ≅ ℍ × ℍ` and `Spin(Q)(ℝ) ≅ SU(2) × SU(2)` is compact, of real rank zero.
    The `K`-split-rank-one reading holds for `H ⟂ H`, where `C₀ ≅ M₂(K) × M₂(K)` and
    `Spin(Q) ≅ SL₂ × SL₂`;
  - `E` a quadratic field: `C₀` is a quaternion algebra over `E`, and `U(C₀, σ)` is the
    restriction of scalars from `E` to `K` of its norm-one group, which is `K`-almost-simple and
    **not** a product of two `K`-factors.
  Conflating the two is conflating geometric factors with `K`-almost-simple factors, and
  conflating a split `E` with split `Bᵢ` is conflating absolute rank with `K`-rank.
- **Dimension 5.** `C₀` is a central simple `K`-algebra of degree four and `σ` is **symplectic**,
  so `U(C₀, σ)` is the symplectic group `Sp(C₀, σ)`, which is `Sp₄` exactly when `C₀` splits.
  ⚠ Recording only the split identification `Spin₅ ≅ Sp₄` would leave the twisted forms unnamed;
  type `C₂` is not covered by any special linear group.
- **Dimension 6, and why it stops here.** `σ` sends `ω` to `-ω`, so it is an involution of the
  **second** kind over the discriminant algebra `E`, `U(C₀, σ)` is a unitary group of degree four,
  and `Spin(Q)` is its **reduced-norm-one** subgroup `SU(C₀, σ)` — strictly smaller. What is a
  milestone here is exactly the strictness,
  `exists_spinGroup_ne_evenUnitaryGroup_finrank_six`, with a split rational witness where
  `U(C₀, σ) ≅ GL₄(ℚ)` and `Spin(Q) ≅ SL₄(ℚ)`, so that nobody extends the dimension-five theorem.
  The generic degree-four reduced norm and `SU(C₀, σ)` interface are supplied by
  the separately owned `AlgebrasWithInvolution` programme; they are not assumed as implemented
  inputs here. The identification `Spin_Q ≅ SU(C₀, σ)` is a milestone of
  **`AlgebrasWithInvolution`**, which owns the reduced norm, the classification of involutions by
  kind and type, and the groups `U(A, σ)`, `Sp(A, σ)` and `SU(A, σ)` with their functoriality.

**1G. Joint determinant–spinor map and finite odd-field kernel.** Define χ once for every field K of
characteristic different from two and every finite-dimensional nondegenerate Q. Use the actual
native `TauCeti.QuadraticMap.orthogonalGroup Q`, `QuadraticMap.orthogonalDet`, corestricted to
`rootsOfUnity 2 K`, and `CliffordAlgebra.orthogonalSpinorNorm Q hQ`. Its codomain is `rootsOfUnity 2
K × Multiplicative (TauCeti.SquareClassGroup K)`. Compare the second factor to `Kˣ ⧸ Subgroup.square
Kˣ` through the canonical `TauCeti.multiplicativeSquareClassEquiv`, with its unit-representative
formula. Define Ω(Q)=ker χ_Q in that actual O(Q) and `PΩ(Q)=Ω(Q) ⧸ Subgroup.center (Ω(Q))`. Prove
its comparison to the existing spinor kernel inside SO via `specialOrthogonalToOrthogonal`, and
consume the native Spin-image theorem. Any legacy raw-square-class statement is transported by that equivalence; the selected forms use
the native O/SO and spinor maps directly. The star-norm convention changes χ by
`(δ,c)↦(δ,[δ]c)`, where δ is read as the unit ±1, and leaves Ω unchanged: on determinant one
it changes nothing. Prove the codomain automorphism, involutivity and reflection evaluation; this
is the precise version of the parity formula.

Now let K be finite of odd cardinality q, and put n=dim Q.

Prove that Kˣ/(Kˣ)² has order two. For n≥2, prove χ_Q onto and `[O(Q):Ω(Q)]=4`. A nondegenerate
binary subspace represents every nonzero scalar: in the split case use xy, and in the nonsplit case
use the surjective norm of the quadratic finite-field extension. Embed its reflections in Q.
Reflections of the same represented square class are conjugate, by rescaling and the existing
norm-level transitivity theorem. Cartan–Dieudonné therefore makes O(Q)'s abelianization generated by
at most the two reflection classes. Their independent images under χ prove `[O(Q),O(Q)]=Ω(Q)` and
`O(Q)_ab≃μ₂(K)×Kˣ/(Kˣ)²`, including q=3 and n=2. This argument does not assert that Ω is perfect. In
dimension1, Q=⟨a⟩ gives image `{(1,[1]),(-1,[a])}` and Ω=1; dimension0 gives the trivial image and
kernel group.

Own the following full finite-classical theorem on these actual groups. Here “simple” means
nonabelian simple, and n=4 split means Witt index two.

| dimension/type | Ω(Q) or its specified quotient | perfectness of Ω | PΩ |
| --- | --- | --- | --- |
| n=0 or1 | 1 | trivial, hence perfect | 1, not simple |
| n=2 split | cyclic of order (q−1)/2 | perfect iff q=3, when trivial | 1 |
| n=2 nonsplit | cyclic of order (q+1)/2 | not perfect | 1 |
| n=3,q=3 | PSL₂(3)≃A₄ | not perfect; abelianization C₃ | A₄, not simple |
| n=3,q>3 | PSL₂(q) | perfect | simple |
| n=4 split,q=3 | (SL₂(3)×SL₂(3))/⟨(-I,-I)⟩ | not perfect; abelianization C₃×C₃ | A₄×A₄, not simple |
| n=4 split,q>3 | (SL₂(q)×SL₂(q))/⟨(-I,-I)⟩ | perfect | PSL₂(q)×PSL₂(q), not simple |
| n=4 nonsplit, every odd q | PSL₂(q²) | perfect | simple, including PSL₂(9)≃A₆ |
| n≥5, every odd q | existing Ω(Q) | perfect | simple |

For every n≥3 prove the scalar-center formula: Z(Ω) consists of I together with −I exactly when n is
even and the determinant square class of the Gram matrix of Q is trivial. This Gram matrix
represents Q itself, equivalently half the pinned polar form; specify that comparison. Thus odd n
has trivial center. In particular the nonsplit four-dimensional Ω has trivial center, whereas the
split four-dimensional Ω has center {±I}. Do not confuse the center of Spin with that of its
orthogonal image.

**1G.LowRankFiniteProof.** For a finite field F with |F|>3, choose r∈F outside
{0,1,−1}, so r≠0 and r²≠1. Feed this same witness to
`Matrix.SL2.commutator_eq_top` and `SL2Simple.PSL_commutator_eq_top`.
Consume `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` with `4≤Nat.card F`
for simplicity of the actual PSL₂(F). Its native proof already uses `PSL2.Iwasawa`,
`PSL.iSup_iwasawaT_eq_top`, perfectness, nontriviality, quasi-preprimitivity and
faithfulness. The native `SL2Simple.PSL_nontrivial` together with the stated
PSL perfectness theorem gives the required nonabelian assertion. Consume
`Projectivization.SL_mulAction_ker`, `Projectivization.PSLAction.toPermHom` and
`Matrix.ProjectiveSpecialLinearGroup.toPermHom_injective` for the central kernel,
descended projective action and its faithfulness. The native `lineStab` construction,
its commutativity and conjugation law supply the Iwasawa stabilizer data inside
the native simplicity proof. These are not new group/action/stabilizer
constructions here; OG owns the orthogonal-carrier and quotient-action adapters.

Retain the explicit quotient action comparison. Take the identity map of projective
points as a `MulActionHom` along the onto quotient `SL₂(F)→PSL₂(F)`, with equivariance
from `Matrix.ProjectiveSpecialLinearGroup.smul_proj_mk`. Apply
`MulAction.IsPretransitive.of_embedding` on two-point embeddings to the native
matrix-SL₂ two-transitivity instance, obtaining `IsMultiplyPretransitive PSL₂(F) P¹(F) 2`.
This is an adapter to the existing PSL action; no native PSL two-transitivity instance
is assumed. Own the
Ω₃≃PSL₂(F), nonsplit Ω₄≃PSL₂(F_(q²)) and split rank4 central-product comparisons,
intertwining their actual actions and identifying their central kernels. Apply the
native PSL₂ results also to F=F_(q²), so nonsplit rank4 at q=3 uses |F|=9>3 and
is mandatory. Prove PSL₂(9)≃A₆ by an explicit faithful degree6 action with image A₆.

For F₃ construct the normal quaternion subgroup of SL₂(F₃) generated by `i=[[0,1],[-1,0]]`,
`j=[[1,1],[1,-1]]`. With `t=[[1,1],[0,1]]`, prove i²=j²=−I, ij=−ji, `[t,i]=−ij` and `[t,j]=−i`.
Prove SL₂(F₃) has order24, this Q₈ has order8, and the quotient is cyclic of order3. These
commutator identities give the reverse inclusion, hence SL₂(3)_ab≃C₃. Its projective action
identifies SL₂(3)/{±I} with A₄; transport the derived Q₈ to V₄ to prove A₄_ab≃C₃. Derive the split
rank4 abelianization C₃×C₃ through its specified central quotient, whose diagonal scalar kernel lies
in the derived subgroup. Transport these F₃ models along finite-field isomorphisms.

**1G.FiniteQuaternionSplit.** For every finite odd field F and units a,b, prove ℍ[F,a,b]≃ₐ[F]M₂(F),
consuming the actual `TauCeti.QuaternionAlgebra.forall_isUnit_or_nonempty_algEquiv_matrix`. In its
division branch reuse `DivisionRing.ofIsUnitOrEqZero` on that branch's nonzero-unit
proof, exactly the construction already used by
`TauCeti.QuaternionAlgebra.instIsSimpleRing` in `Quaternion/CentralSimple.lean`,
and apply native `littleWedderburn`. The odd-field hypothesis supplies invertible2;
use native `_root_.QuaternionAlgebra.equivTuple (a : F) 0 (b : F)`
from `Mathlib.Algebra.Quaternion` to identify this same underlying carrier
`ℍ[F,(a : F),(b : F)]` with `Fin 4 → F` and transport `Finite` before
applying the finite-division-ring instance. The native
division-ring construction is local there; no new exported constructor is assumed.
Commutativity contradicts
ij=−ji and 2ij≠0 for the invertible quaternion generators. Use the same argument
over the finite quadratic discriminant field F_(q²); splitting is not restricted
to F_q. The low-rank Clifford/quaternion isomorphisms and central-kernel comparisons
then give every rank3/4 table row.

The finite-group proof is owned here, not inferred from algebraic semisimplicity, algebraic
simple-connectedness or the CFSG statement. Consume the existing general-field quaternion/low-rank
Clifford comparisons for n=3,4, the finite-field splitting theorem for quaternion algebras, and the
actual central kernel of Spin→SO. Prove the cyclic rank2 rows from its split/nonsplit norm-one torus
and the index-two spinor map. For the higher-rank rows, implement the following finite polar-space proof on the actual Ω:

1. **Witt coordinates and elementary maps.** For n≥5 over every finite odd field, prove Witt index
   at least two from QFI's finite-field classification. Choose hyperbolic pairs and the residual
   anisotropic space of dimension zero, one or two. Define the elementary orthogonal maps and their
   Spin lifts using2C's explicit Eichler transvections, and identify each map's determinant and
   spinor norm. Compute conjugation and parameter-addition on vectors, and compare to
   ReductiveGroups9 root maps/relations where those are used. The comparison is a theorem, not an
   identification from a shared root-system name.
2. **Generation and relations.** Prove elementary elimination of any Ω element in these Witt
   coordinates, including the remaining anisotropic-plane torus in the nonsplit even case; the
   torus step uses the finite quadratic norm calculation. This proves generation of Ω by the
   elementary subgroups. Compute their commutators and express every generator as a product of
   commutators in Ω. In relative rank two handle the B₂ and nonsplit even-dimensional relations
   explicitly, including the field/quadratic-field parameter maps and their trace/norm identities.
   In characteristic three use the invertible coefficient2 and the surjectivity of the quadratic
   trace where required; no step may divide by3 or assume a scalar r with r²≠1 in F₃. This proves
   Ω perfect for q=3 as well as q>3.
3. **Projective action and center.** Construct the action of Ω on the actual set of isotropic
   one-dimensional subspaces. Prove its kernel is precisely the scalar subgroup by evaluating on
   the hyperbolic basis and isotropic combinations spanning V, and prove the stated determinant/
   spinor test for ±I. Descend to a faithful action of PΩ and prove its nontriviality using an
   elementary map moving an isotropic line.
4. **Primitive action and Iwasawa data.** Prove that the stabilizer of an isotropic line in PΩ is
   maximal: use Witt extension and elementary elimination to describe its orbits on the other
   isotropic lines (orthogonal or nonorthogonal to the chosen line), and show that adjoining an
   element from either orbit generates all of PΩ. This includes every relative-rank-two case at
   q=3; the split four-dimensional exception is outside n≥5. For each isotropic line ℓ, use the
   image of the abelian Eichler group `ℓ^⊥/ℓ` as T_ℓ. Prove conjugation equivariance, containment in
   the line stabilizer and generation by all T_ℓ from step2. Feed this actual faithful primitive
   action, these abelian T_ℓ and the proved perfectness into
   `MulAction.IwasawaStructure.isSimpleGroup`. Nontriviality plus perfectness proves nonabelian
   simplicity; do not deduce nonabelianity from `IsSimpleGroup` alone.

This owns the finite projective normal-subgroup theorem and all its prerequisites rather than
assuming it from algebraic semisimplicity, simply connectedness or a statement-only CFSG owner.
All four steps, especially the q=3 calculations, are required theorem targets.
Low-rank isomorphisms must intertwine the actual action and central quotient, not just match orders.
The q=3 rank3 and split rank4 nonperfect groups are exceptions to perfectness, not exceptions to
Ω=[O,O].

For primary comparison, [Zywina, §2.2 Lemma2.2](https://arxiv.org/html/2001.07273#S2.SS2) states the
quotient, center and perfect/simple results under n≥3 and q>3. Its hypotheses must be preserved in
that citation. The q=3 extension in this table remains an explicit theorem target with the preceding
proof obligations; it is not attributed to that lemma. Its direct primary reference, including
q=3, is D. E. Taylor, *The Geometry of the Classical Groups*: there Ω is the derived group of O
(proof of Theorem 11.45), Theorem 11.45 gives Ω=[SO,SO] generated by commutators of reflections
for dim≥3, Theorem 11.51 identifies Ω with the spinor kernel in SO for isotropic V of dimension
≥2 (finite V of dimension ≥3 is isotropic by Theorem 11.2), Theorem 11.46 gives generation by
Siegel (Eichler) transformations, Theorem 11.47 gives perfectness for dim≥3 except Ω(3,3),
Ω⁺(4,2) and Ω⁺(4,3), Theorem 11.30 gives the primitive rank-three action on singular points for
dim≥5 and Witt index ≥2, and Theorem 11.48 gives simplicity of PΩ for dim≥3 except PΩ(3,3) and
dimension four with Witt index two. Taylor's PΩ is Ω modulo its scalars; identifying that with
the quotient by the centre of Ω is step 3 above. This full target replaces the source's
unspecified finite-field “usually” qualification while preserving that source literal separately.

**1H. Rational determinant–spinor image, including binary exceptions.** Over ℚ consume the same
joint map and existing range/binary/isotropic theorems, without redefining the spinor norm. Put
`S=Multiplicative (TauCeti.SquareClassGroup ℚ)` and S₊={positive rational square classes}.
Use 1G’s `TauCeti.multiplicativeSquareClassEquiv` to compare S with `ℚˣ/(ℚˣ)²`.
Prove the canonical sign-and-prime-valuation
equivalence `S≃C₂⊕⨁_(p prime)C₂`: only finitely many valuations are odd, and the inverse sends that
finite support to the signed squarefree rational representative. This is a direct sum, not an
unrestricted direct product.

In positive dimension choose v with a=Q(v)≠0 and put T_Q=θ(SO(Q)(ℚ)). Prove the exact joint image,
including both directions,

`im χ_Q = ({1}×T_Q) ∪ ({−1}×[a]T_Q)`.

The proved native `CliffordAlgebra.spinorNorm_range_orthogonal_eq_sup` supplies the marginal θ-image; the joint-coset
refinement retains information that marginal would lose. Ω(Q)=ker χ_Q and the first isomorphism
theorem identify O(Q)/Ω(Q) with this explicit abelian image. No claim that this is O(Q)'s entire
abelianization is made over ℚ.

| Q over ℚ | T_Q | exact joint image |
| --- | --- | --- |
| dimension0 | {1} | trivial |
| Q=⟨a⟩ | {1} | {(1,1),(-1,[a])} |
| dimension2, Q≃a(x²−d y²), d a square | S | μ₂×S |
| dimension2, Q≃a(x²−d y²), d nonsquare | image of N_(ℚ(√d)/ℚ)(ℚ(√d)ˣ) in S | even part T_Q, odd part [a]T_Q |
| dimension≥3, positive definite | S₊ | μ₂×S₊ |
| dimension≥3, negative definite | S₊ | even positive classes, odd negative classes |
| dimension≥3, indefinite | S | μ₂×S |

These rows specify the form/rank dependence exactly; real-indefinite binary forms can still have
finite-prime norm restrictions. For a diagonal binary form ⟨a,b⟩ use d=−b/a; its square class equals
−ab, matching native `range_spinorNorm_of_equivalent_binary`. For nonsquare d prove the effective
membership test `[c]∈T_Q` iff `(c,d)_v=1` for every rational place v. Consume
GlobalQuadraticForms4.3, ClassFieldTheory's cyclic Hasse norm theorem and QuadraticFormInvariants'
norm/Hilbert-symbol comparison. Only the real place and primes dividing2cd need checking after
choosing integral squarefree representatives; use the explicit dyadic and odd-prime symbol formulas.
This finite test decides membership in a precisely defined infinite image, not an enumeration of
O(Q).

For dimension3 take the actual quaternion even-Clifford model B and consume
`quaternionUnitsToSpecialOrthogonal_surjective` and
`quaternionUnitsQuotientCenterEquivSpecialOrthogonal`. Own its norm comparison `θ(image
b)=[nrd(b)]`, by consuming `exists_evenQuaternionEquiv_of_finrank_eq_three` with its
reversal-compatibility conclusion, `evenQuaternionEquiv_reverseEven_mul_self` and
`orthogonalSpinorNorm_lipschitzToOrthogonal`, then restricting the latter through SO. The
norm-compatible model already exists natively; only this composed spinor-image adapter is new. An
arbitrary algebra equivalence is not silently assumed to preserve the chosen involution. Then prove
the quaternion global norm consequence: nrd(Bˣ) is all nonzero rationals if B splits at the real
place, and the positive rationals if B ramifies there. Consume GlobalQuadraticForms6.1's
scalar-representation local–global theorem, expressed by its `LocallyRepresentsScalar`
predicate for regular Q and nonzero scalars, on the quaternion norm form and the local
quaternion norm consequence proved in1H below; the matrix algebra case is immediate from determinant. In the
division case the norm form is anisotropic over ℚ, so an isotropic vector for nrd⊥⟨−c⟩ has last
coordinate nonzero and yields the required norm. The only local obstruction is positivity at the
real ramified place. This proves the quaternion case of Hasse–Schilling here as an orthogonal norm
adapter, without constructing a second generic reduced-norm/global-quadratic-form supplier.
[Voight,14.7.1–14.7.4](https://link.springer.com/chapter/10.1007/978-3-030-56694-4_14) gives the
primary comparison.

Own the local consequence used here from QFI6D's exact milestones “Isotropy by rank”
(rank≥5), “Representation”, “u(K)=4” and “The anisotropic quaternary form is unique”. Over each nonarchimedean
completion, a quaternion division norm form is anisotropic of rank4. For any c≠0 its orthogonal sum
with ⟨−c⟩ has rank5 and is isotropic; the last coordinate is nonzero by anisotropy, so division
gives a norm vector of value c. The split matrix case represents c by diag(c,1). At a real place,
the Hamilton norm is a sum of four squares and represents precisely the positive scalars; a split
matrix norm represents every nonzero scalar. At complex places the quaternion algebra splits. Thus
positivity at ramified real places is the only local norm obstruction. Apply
GlobalQuadraticForms [6.1 Scalar representation](../../TauCetiRoadmap/GlobalQuadraticForms/README.md#61-scalar-representation)
to the regular norm form and nonzero scalar c, identifying every finite and real place
in `LocallyRepresentsScalar`. This is an OG norm adapter from the named local/global form theorems; no
supplier named local-quaternion-norm-groups is assumed.

For dimension≥3 choose a rational nondegenerate ternary subspace: any three diagonal directions in
the definite case, and both signs plus one further direction in the indefinite case. Its even
Clifford quaternion algebra is real-ramified exactly for a definite ternary form. Extend its proper
isometries by the identity on the orthogonal complement and prove determinant/spinor compatibility
by the existing reflection or orthogonal-product theorem. This supplies the table's lower
inclusions. The real-sign reflection calculation supplies its upper inclusions. Indefinite means
indefinite over ℝ here and does not assert rational isotropy; the anisotropic rational ternary cases
are included.

As acceptance cases, prove: the rational hyperbolic plane has full joint image; x²+y² has T equal to
the positive classes in which each prime3mod4 occurs to even valuation; 3(x²+y²) has the same T but
a different odd coset; every definite rational ternary has T=S₊; every indefinite rational ternary
has T=S, including the anisotropic form x²+y²−3z². Prove this example anisotropic by clearing
denominators and reducing a primitive integral solution modulo3: x and y are divisible by3, then z
is as well, a contradiction. For x²+y² the norm test rejects[3] and accepts[2]. For 3(x²+y²), [3]
occurs only in the odd coset, illustrating why the joint table is needed. The n≥3 quotient is
infinite of infinite elementary2-rank by the distinct positive prime classes. Thus the source's
“large abelian quotient” has an exact theorem for every rational nondegenerate form of dimension≥3,
with every smaller rank described separately. Apply the star/reverse parity dictionary when
comparing with the source N; do not assert unqualified surjectivity of Spin(ℚ)→SO(ℚ) or perfectness
of a rational spinor kernel.

**Borcherds121/RQFT2 consumer.** The pp98–99 adapter consumes1A's star/reverse dictionary,
1G's full odd-field table and1H's exact rational joint image. The source's symbol Ω for a Pin image
need not be this simultaneous determinant–spinor kernel; identify each actual domain/map before
transport. Its positive/negative-definite sign statements use the star convention, whereas the
native reflection formula here uses reversal. Its finite “usually” and “quotient is the centre”
wording remains literal source evidence; the usable theorem is the complete exceptional-case
table and quotient by Z(Ω) above. This owner supplies that mathematics, without promoting the
source wording to an unqualified theorem or changing a source-reading flag.

### Layer 2: local topology, transvections, and local spinor norms

**Direct prerequisites.** Mathlib: `Padic` with its `ProperSpace` instance, the matrix and
endomorphism topology instances, `Module.End`. Spin Representations Layer 0:
finite-dimensionality of `CliffordAlgebra Q`. Quadratic Form Invariants Layer 3, the plain
discriminant, and Layers 6C and 6D: `hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse`,
and the classification over `ℚ_p` by `(dim, d, s)`. LocalFieldsRamification Layer 0: local compactness and `𝒪[K]`
compact open; Layer 1: `square_eq_range_powMonoidHom`, `card_squareClasses_of_isUnit`,
`card_squareClasses_dyadic`, and the deep-squares pair `unitFiltration_le_range_powMonoidHom_two`
with `not_unitFiltration_le_range_powMonoidHom_two`, which is `U(K, 2e+1) ⊆ (Kˣ)²` together with
its sharpness, at the `e` of `absoluteRamificationIndex`. Internal: 0B, 0C, 0D, 1A, 1C, 1D, 1E.

`K` is `ℝ` or `ℚ_p` throughout, and each statement is proved uniformly in the local field where
the proof is uniform, so that a later development over a general local field can reuse it.

**2A. The topology is Mathlib's `moduleTopology`, and the milestone is that it applies.** A
finite-dimensional space over a local field carries no `TopologicalSpace` instance on its own, and
"the topology from `Module.End K V ≅ K^{n²}`" names a transport along a chosen basis rather than a
canonical object. Mathlib already has the canonical one:
`moduleTopology K V`, the finest topology making the module operations continuous, with the class
`IsModuleTopology K V` recording that a supplied instance is that one, and `eq_moduleTopology`
converting between them. That is the vocabulary used here, and no private basis-transport
construction is introduced.

The milestones are consequently about *applying* it rather than building it: that for `K` a local
field and `V` finite-dimensional the module topology is the basis transport, so `IsModuleTopology`
holds for the product topology through any basis and basis-independence is a corollary rather than
a separate theorem; that `Module.End K V` and `CliffordAlgebra Q` carry the module topology, the latter
needing finite-dimensionality of the Clifford algebra, that is the Poincaré–Birkhoff–Witt
statement `dim = 2^n`, recorded in the dependency table as an input; that the module topology is
Hausdorff and locally compact in this setting; and that every linear map between
finite-dimensional spaces is continuous for it, which is what makes base change and change of basis
continuous. The linear automorphism group `V ≃ₗ[K] V` is not a `K`-module and carries no module
topology: it receives the group topology induced from `Module.End K V × Module.End K V` described
in 2B.

⚠ Every topological statement in Layers 2 and 3 carries `IsModuleTopology` as a hypothesis rather
than an arbitrary `TopologicalSpace` instance, and `IsModuleTopology` **on its own is not enough**.
Each statement also carries the separation, the local compactness and the openness of the squares
that its proof uses, and one that omits them is not a weaker theorem but a wrong one. Two
counterexamples pin why, and both live at the same place: `K` with the indiscrete topology is a
topological field, and the indiscrete topology on a finite-dimensional space over it *is* the
module topology, so `IsModuleTopology` holds and rules nothing out.

- **Separation.** Take `K` indiscrete and `Q x = x²` in dimension one. The isometry set inside
  `Module.End K K = K` is `{±1}`, a nonempty proper subset of an indiscrete space, hence not
  closed. So 2B's closedness needs `{0}` closed, that is `T2Space K`, which is exactly what makes
  the equalizer of two continuous maps into `K` closed.
- **Openness of the squares.** Same topology, `Q x = a x²` with `a` a nonsquare. Then `O(Q)` is
  `{±1}` with the indiscrete topology and `ker θ` is the trivial subgroup, nonempty and proper and
  not open. So 2E needs `(Kˣ)²` open in `Kˣ`; that is the local-field input cited from the local
  LocalFieldsRamification Layer 1, and it does not follow from the module topology.

Local compactness of the point groups is carried the same way, as `LocallyCompactSpace K`. Over `ℝ`
and over `ℚ_p` all three hold, so no generality is lost; what is gained is that the hypotheses are
the ones the proofs consume, and a later development over another local field can read off exactly
what it has to supply.

**2B. Point groups as topological groups, in one canonical topology.** `Module.End K V` carries the
module topology of 2A, and `V ≃ₗ[K] V` carries the topology induced by `f ↦ (f, f⁻¹)` into
`Module.End K V × Module.End K V`, the coarsest one making composition and inversion continuous.
⚠ That is **the** topology of this roadmap and it is declared once, as an instance: every subgroup
of `V ≃ₗ[K] V` carries the subspace topology from it, so `O(Q)(K)`, `SO(Q)(K)` and every compact
open subgroup of either are topologized by that single declaration, as are the restricted products
of Layer 3. No statement in Layers 2 to 5 quantifies over a topology, carries one as data, or
supplies one of its own, and consequently there is never a gap between the topology a subgroup is
proved compact open in and the topology the restricted product containing it is formed with.
`Spin(Q)(K)` is topologized the same way, from the module topology on `CliffordAlgebra Q`.

The milestones: `V ≃ₗ[K] V` is a topological group in it; `O(Q)(K)` is **closed** in
`Module.End K V`, being cut out by the polynomial equations `Q (f x) = Q x`; `SO(Q)(K)` is closed
in `O(Q)(K)` and, the determinant being continuous with image in the discrete `μ₂`, also open in
it; both are locally compact, from closedness inside a finite-dimensional space over a locally
compact field; `Spin(Q)(K)` is a closed, locally compact topological group. Continuity of the
determinant, of the vector representation, of `spinToSpecialOrthogonal` and of the base-change maps
of Layer 0B.

**2C. Eichler transvections and their Spin lifts.** Stated here, before anything uses them. For an
isotropic vector `u` and a vector `w` orthogonal to `u`,
`E_{u,w}(x) = x + B(x,u) w − B(x,w) u − Q(w) B(x,u) u` is a proper isometry of `Q`; `w ↦ E_{u,w}`
is a homomorphism from the additive group of `u^⊥ / K u` into `SO(Q)`; the conjugation law under
`O(Q)`; base change and continuity; and the spinor norm of a transvection is trivial, so
transvections lie in the spinor kernel. ⚠ That last fact says each transvection *has* a lift to
`Spin`, and existence of individual lifts is not a subgroup. The milestone is therefore an
**explicit canonical Clifford lift** `w ↦ Ẽ_{u,w}` written down inside the even Clifford algebra,
with its own additive composition law in `w`, and with `spinToSpecialOrthogonal ∘ Ẽ_{u,·} = E_{u,·}`
proved. These are the unipotent one-parameter subgroups of `Spin` that
`OrthogonalTamagawaAndLatticeMass` generates with; without the lift as a homomorphism, that
roadmap has no root subgroups to work with.

**2D. Compactness, stated sharply.** `O(Q)(ℝ)` is compact if and only if `Q` is definite, and
`O(Q)(ℚ_p)` is compact if and only if `Q` is anisotropic over `ℚ_p`. For the noncompact
direction, split by dimension. In dimension two the Eichler parameter space is trivial:
`u^⊥ / K u = 0` for an isotropic vector `u`. Put the hyperbolic plane in the `xy`-model and use
the unbounded diagonal torus `t ↦ diag(t, t⁻¹)` instead. In dimension at least three, choose a
nonzero class in `u^⊥ / K u` and use the resulting unbounded one-parameter family of Eichler
transvections from 2C. The converse bounds the matrix entries of an isometry of a definite or
anisotropic form. The same statements hold for `SO`. ⚠ For `Spin` the corresponding statement is
**not** a formal consequence of having a
continuous map with finite kernel onto a compact group, so it is a separate milestone: prove that
`spinToSpecialOrthogonal` is proper on local points, or obtain compactness from the affine
group-scheme comparison once its public carrier exists.

**2E. Continuity of the spinor norm.** ⚠ Discreteness of `Kˣ/(Kˣ)²`, which follows from openness
of `(Kˣ)²`, shows only that a *continuous* map into it is locally constant; it does not make an
arbitrary map continuous. The milestone is therefore that `ker θ` is **open** in `O(Q)(K)`,
obtained by factoring `θ` through the continuous Clifford norm of 1A and the open quotient map
`Kˣ → Kˣ/(Kˣ)²`, with every step named: continuity of `N` on `lipschitzGroup Q`, openness of the
quotient map, and the descent of `θ` along the surjection of 1C.

**2E.ReflectionSections, for the retained general topological-field scope.** Own a local
continuous section of `lipschitzToOrthogonal` near identity over any Hausdorff topological field
with invertible2 and finite-dimensional module topology, explicitly assuming continuity of field
inversion (`IsTopologicalDivisionRing K`) as well as the ring operations. Choose an orthogonal
anisotropic basis.
Inductively correct a nearby isometry's image of each basis vector by the two-reflection
nonzero-norm-level construction from0E, choosing the branch whose denominators remain nonzero
at identity and whose product is identity there. Work inside the successively fixed orthogonal
complements; prove the branch domains open, all coefficients continuous and the last corrected
isometry identity. Multiply the corresponding Clifford vector-unit lifts and normalize by their
nonzero scalar value at identity. This gives an actual continuous local lift, not a choice of
unrelated lifts. Translate it to show that the surjective Lipschitz action is a quotient/open map.
The continuous reverse norm then descends to the square-class quotient; open squares imply the
open spinor kernel. Prove the zero-dimensional case separately. The existing native
`CliffordAlgebra.isOpen_ker_orthogonalSpinorNorm` and continuity results discharge the locally
compact nontrivially normed case at their stronger hypotheses; this section owns the stated
remaining generality and keeps its assumptions explicit.

**2F. ⚠ Local spinor norms: the table, by field, dimension and signature.** The image of `θ` on
`O(V_v)` and on `SO(V_v)`, enumerated rather than gestured at. The split is mathematical, not
presentational: a single "dimension at least three implies surjective" statement is **false** at
the real place, and "the image is all square classes" is false twice over for a definite real
form. Each row is a named theorem.

| field | dimension | signature / type | `θ(SO)` | `θ(O)` |
| --- | --- | --- | --- | --- |
| any | `0` | — | trivial | trivial |
| any | `1` | `Q x = a x²` | trivial | `⟨[a]⟩` |
| `ℚ_p` | `2` | isotropic | all square classes | all square classes |
| `ℚ_p` | `2` | anisotropic, `Q ≅ a·N_{E/ℚ_p}` | index `2`: the image of `N(Eˣ)` | that, joined with `[a]` |
| `ℚ_p` | `≥ 3` | — | all square classes | all square classes |
| `ℝ` | `≥ 1` | indefinite | all of `ℝˣ/(ℝˣ)²` | all of `ℝˣ/(ℝˣ)²` |
| `ℝ` | `≥ 1` | positive definite | trivial | **trivial** |
| `ℝ` | `≥ 1` | negative definite | trivial | all of `ℝˣ/(ℝˣ)²` |

The two real definite rows are the point of splitting by signature. For a positive definite form
every value of `Q` is a positive real and hence a square, so **every** reflection has trivial
spinor norm and the image is trivial on `O` as well as on `SO`. For a negative definite form every
value lies in the single class `[-1]`, so a single reflection has nontrivial spinor norm and the
image on `O` is everything, while on `SO`, where reflections come in pairs, the classes cancel and
the image is trivial again. Writing one "definite" row for `O` would be wrong.

The nonarchimedean rows carry their own trap: dimension two is where surjectivity fails, the image
on `SO` of an anisotropic binary form being the image of the norm group of its discriminant
quadratic field extension, of index exactly two by local class field theory. That is why the
dimension hypothesis of the dimension-`≥ 3` row is load-bearing. ⚠ And that row's `O` entry is
**not** "all square classes": for `Q ≅ a·N_{E/ℚ_p}` the values of `Q` are `a·N(Eˣ)`, so the image
on `O` is the norm-group image joined with `[a]`, which is everything when `a` is not a norm and is
the norm-group image itself when it is — at `Q = N_{E/ℚ_p}` the two columns coincide.

The whole `O` column is generated from the `SO` column by one general-field lemma,
the proved native `CliffordAlgebra.spinorNorm_range_orthogonal_eq_sup`, for a specified
v with `[Invertible (Q v)]`: `O(Q)` is `SO(Q)` together with that reflection, so
`θ(O)` is `θ(SO)` joined with the class of `Q v`. Its native maps are the
O-level `orthogonalSpinorNorm` and SO-level `spinorNorm`; when applying it
to the table's legacy O-level `spinorNorm` spelling, consume Layer1G's
canonical square-class equivalence and joint-map/carrier comparisons first.
The shared short name does not identify the O and SO domains. That is why the two columns can
differ only by a factor of two, and it is what makes the two real definite rows differ.

In each case the local spinor kernel, the image of `Spin(V_v) → SO(V_v)`, is
`ker θ|_{SO(V_v)}` by 1E localized, and from dimension three on over `ℚ_p` its index is the number
of square classes — `4` for odd `p` and `8` at `p = 2`, by the LocalFieldsRamification counts. These
are exactly the statements a later integral-lattices successor needs before it can compute
`θ_p(K_p⁺(L))` from Jordan data.

**2G. The real place, beyond the table.** `Spin(V_ℝ)` is compact exactly when `Q` is definite,
through 2D; that and the two real rows of 2F are everything later successors use from the real
place. The connected-component theory of `O(p,q)` is outside this roadmap.

**2H. Localization of factorizations.** A reflection factorization over ℚ base changes to one over
`ℚ_v` at every place, `θ` commutes with the base-change maps `O(V) → O(V_v)` of Layer 0B, and the
diagram relating the global and local spinor norms commutes. This is what makes the adelic spinor
norm of Layer 3 agree with the rational one on diagonal elements.

### Layer 3: localization and adelic points

**Direct prerequisites.** The exact Lean-level restricted-product carriers, maps, and diagonals
exported by RestrictedProducts, plus all of Layer 2. No README-only point-group,
strong-approximation, or measure contract is treated as a dependency.

**3A. Not a milestone: the affine group-scheme comparison.** Strong approximation and Tamagawa
theory quantify over `ℚ`-almost-simple factors, use simple connectedness of `Spin`, use a central
isogeny of algebraic groups, and use invariant differential forms. None of that is available for a
bare point group, and none of it is built here. Constructing `O_Q`, `SO_Q` and `Spin_Q` as affine
group schemes, identifying their `K`-points with the point groups of Layers 0 to 2 as groups and,
locally, as topological groups, and proving smoothness, the central `μ₂`-isogeny, semisimplicity
and simple connectedness, belongs to `OrthogonalTamagawaAndLatticeMass`, after Reductive Groups
exposes a public point functor. This roadmap's Layer 3 is stated entirely about point groups and
never about a scheme.

**3B. Imported generic restricted-product substrate.** This is a dependency, not an
owned milestone. Use `RestrictedProducts.integralSubgroup`, `restrictedProductMap`,
`restrictedProductMapOfForall`, `restrictedProductCongr`, `rationalDiagonal`, `restrictAway`,
`RestrictedProductGroup`, `RestrictedProductGroupAway` and `RestrictedProductGroupWithFactor`
directly. The orthogonal aliases of 3D are instantiations of these carriers, and no generic
restricted-product declaration is introduced in this namespace. ⚠ The componentwise maps of 3D are
built with `restrictedProductMapOfForall`, the everywhere-preserving constructor, and not with the
eventual `restrictedProductMap`: only the former carries `integralSubgroup` into
`integralSubgroup`, and the supplier carries a Lean-stated rejection test showing the eventual one
does not.

**3C. Compatible compact-open data.** ⚠ A single family `U_p ≤ O(V_p)` does not determine the
reference subgroups for the other two groups or for the square-class codomain, so the parameter is
a **compatible tuple** `(U_p^O, U_p^{SO}, U_p^{Spin})`. Every openness and compactness statement in
it is against the one canonical topology of 2B, so the tuple carries no topology of its own; a
structure that spoke of compact open subgroups while storing its own topology would prove nothing
about the restricted products built from it. Two families are supplied:

- `U_p^O ≤ O(V_p)`, compact and open at every finite place;
- `U_p^{Spin} ≤ Spin(V_p)`, compact and open at every finite place, supplied rather than obtained
  as a preimage, since a preimage of a compact set under `Spin → SO` is compact only once
  properness is known (2D);

together with two integrality hypotheses, which are what make the diagonal maps of 3E well defined:
every element of `O(V)(ℚ)` lies in `U_p^O` for almost all `p`, and every element of `Spin(V)(ℚ)`
lies in `U_p^{Spin}` for almost all `p`.

The third member is **derived, and its properties are proved rather than assumed**:
`U_p^{SO} := U_p^O ∩ SO(V_p)` as a named definition, with the theorems that it is open in `SO(V_p)`
(from openness of `U_p^O` and continuity of the inclusion) and compact (from closedness of
`SO(V_p)` in `O(V_p)`, 2B), and with the integrality hypothesis for `SO` derived from the one for
`O` rather than assumed, since a rational proper isometry lying in `U_p^O` lies in the
intersection. The compatibility that ties the tuple together is that `U_p^{Spin}` maps into
`U_p^{SO}`, and it is stated that way rather than as "maps into `U_p^O`": it is what the adelic map
`Spin(V)(𝔸_f) → SO(V)(𝔸_f)` of 3D is built from, and the weaker statement does not give it.
Beside them the reference subgroup `θ_p(U_p^{SO})` in the local square-class group, defined as the
image of `U_p^{SO}` under the local spinor norm and not as a further parameter — with two theorems
about it, because a reference family for a topological restricted product is not just a family of
subgroups.

- ⚠ **The reference images are open**, `isOpen_localSpinorNormImage`. Continuity of `θ_p` does not
  give this: the image of a compact open subgroup under a continuous homomorphism is compact but
  need not be open, and no general theorem makes it so. The proof runs through
  `discreteTopology_localSquareClasses`, that `ℚ_pˣ/(ℚ_pˣ)²` is **discrete** because `(ℚ_pˣ)²` is
  open — the LocalFieldsRamification input, read on `Subgroup.square` through that roadmap's
  `square_eq_range_powMonoidHom` — in which every subgroup is open. So the openness input is about
  the square classes and nothing about `U`.
- **The reference images are identified at almost every prime**,
  `eventually_localSpinorNormImage_eq_unitSquareClasses`: for the standard integral family of a
  basis and `dim V ≥ 3`, `θ_p(U_p^{SO})` is the group `unitSquareClasses p` of **unit square
  classes**, the image of `ℤ_pˣ` in `ℚ_pˣ/(ℚ_pˣ)²`, off the finite set of primes at which the
  `ℤ`-span of the basis fails to be unimodular, together with `2`. This is what the lattice
  spinor-genus consumer reads off Jordan data.

  ⚠ That identification is a theorem about the **family**, not about the construction, and neither
  inclusion is automatic: in dimension one `SO(V_p)` is trivial at every prime, so every compatible
  tuple has trivial reference images and never the unit classes, which
  `exists_localSpinorNormImage_ne_unitSquareClasses` records. Openness is what holds for every
  tuple; the value is what an integral family supplies.

**3D. The three adelic point groups.** The index conventions are pinned in Lean rather than written
informally: the finite places are indexed by the primes; the archimedean place is carried by a
product decomposition rather than by a dependent type of places, so that `G(𝔸) = G(ℝ) × G(𝔸_f)` is
a definition and not a theorem; and for a finite set `S` of places with `∞ ∈ S`, `G(𝔸^S)` is the
restricted product over the finite places outside `S`. At `S = {∞}`, the canonical reindexing
which forgets the vacuous exclusion proofs identifies it with `G(𝔸_f)` as a topological group,
preserving every local coordinate and the rational diagonal. For **each** of `O`, `SO` and `Spin`,
relative to a compatible tuple: finite adelic points, points away from `S`, and full adelic points.
Then the restrictions `G(𝔸_f) → G(𝔸^S)`, the projections out of `G(𝔸)`, and the componentwise maps
`Spin(V)(𝔸_•) → SO(V)(𝔸_•) → O(V)(𝔸_•)` in all three flavours, obtained from 3B's functoriality
applied to `spinToSpecialOrthogonal` and `specialOrthogonalToOrthogonal` with 3C's compatibility.
⚠ All three groups are built and not just `O`. The approximation application in
`OrthogonalTamagawaAndLatticeMass` is a theorem about `Spin` transported to `SO`, and its measure
application is about `SO`; constructing only `O` would supply neither interface. The away-`S`
projection and its kernel comparison use the same finite set `S` throughout. The maps exist for
every compatible tuple of 3C; surjectivity onto a spinor kernel additionally uses the explicit
integral-lifting condition and its standard-family theorem in 3F. A local lift with no
almost-everywhere reference control is not a restricted-product point.

**3E. ⚠ Diagonal points: discrete in the full adeles, not generally discrete in the finite
adeles.** Density in the finite adeles is not a Layer 3 statement at all; it belongs to
`OrthogonalTamagawaAndLatticeMass`. The diagonal
map is well defined only once one knows that a given rational isometry lies in `U_p` for all but
finitely many `p`, which is a theorem. Both forms are milestones: the **relative** one, for a
tuple satisfying "every element of `O(V)(ℚ)` lies in `U_p^O` for almost all `p`" as an explicit
hypothesis, which is the form the integral lattices roadmap discharges for its lattice
stabilizers; and the **absolute** one, discharging that hypothesis for the stabilizers of the
`ℤ`-span of a chosen basis of `V`, by clearing denominators in the matrix of a rational isometry
and of its inverse. The second exists so the roadmap's own objects rest on something; it develops
no lattice arithmetic. Its carrier is `integralOrthogonalSubgroup`, characterized **as data** by
integrality of the matrix entries of an isometry and of its inverse in the base-changed basis.
Record and prove both directions in the API. For an orthogonal matrix, however, integrality of the
matrix already implies integrality of its inverse: its determinant is `±1`, and the inverse is the
adjugate divided by that unit. Thus the first condition does define a subgroup in this orthogonal
setting; it is not merely a submonoid. The carrier retains its openness, compactness, and
`eventually_mem_integralOrthogonalSubgroup`, which is `eventually_mem_orth` discharged rather than
assumed. It is also the family 3C's reference-image identification is stated for.

The diagonal map is built for each of the three groups, and for each of the three flavours of 3D:
for `O` and for `Spin` from the two integrality hypotheses of 3C, and for `SO` from `O`'s, since a
rational proper isometry lying in `U_p^O` lies in `U_p^{SO}`. Each comes with its evaluation rule
and its injectivity, and the square `Spin(V)(ℚ) → Spin(V)(𝔸_f) → SO(V)(𝔸_f)` against
`Spin(V)(ℚ) → SO(V)(ℚ) → SO(V)(𝔸_f)` commutes, which lets `OrthogonalTamagawaAndLatticeMass`
speak of "the image of the rational spin points in adelic `SO`" without saying which of the two
routes is meant. Prove the same commuting square after restriction away from each finite
`S` containing the archimedean place, with coordinate evaluation outside `S`, and for the full
adelic maps; all diagonals use the same rational quadratic space and compatible reference tuple.
These identities and the 3F lifting theorem are exports here, independently of any density theorem.

Then, and the contrast is the point: `G(ℚ)` is **discrete in `G(𝔸)`**, the full adeles, once the
real place is included. It is **not** discrete in `G(𝔸_f)`, and the roadmap records the
counterexample rather than leaving the distinction to be discovered: for a split rational
quadratic space of dimension at least three, take integral `u` and `w` and the rational
one-parameter family `t ↦ E_{u,tw}` of 2C; inside any basic finite-adelic neighbourhood of the
identity, a nonzero integer `t` divisible by a high enough power of each of the finitely many
constrained primes gives a transvection that is integral at every other prime and arbitrarily
close to the identity at the constrained ones. So the diagonal image accumulates at the identity.
This supplies the rejection test a density theorem must respect.

**3F. The adelic spinor norm, on `SO`, with reference-controlled lifting.** For a
nondegenerate rational quadratic space of every dimension, form the restricted product of the
local square-class groups relative to the reference subgroups `θ_p(U_p^{SO})` of 3C. The local
spinor norms induce a continuous homomorphism `adelicSpinorNorm` from `SO(V)(𝔸_f)` into it, with
coordinate evaluation equal to the local spinor norm. Define `adelicSpinorNormAway S` on the
**same** `SO(V)(𝔸^S)`, using the restricted product of these references over the finite primes
outside `S`, for every finite `S` containing `∞`; its kernel is `adelicSpinorKernelAway S`.
At `S = {∞}` identify these with the finite-adelic norm and `adelicSpinorKernel` by the actual
3D carrier conventions. Form the full-adelic norm on `SO(V)(ℝ) × SO(V)(𝔸_f)` with codomain the
real square-class group times the finite restricted product and kernel `fullAdelicSpinorKernel`.
Give the defining membership iff every retained local norm is one, component evaluation,
continuity, closedness of each kernel and commutation with restriction/projection and the 3E
diagonals. Closedness uses the Hausdorff local square-class quotients from the open-square
results of 2E/2F, and the Hausdorff restricted-product topology; it is not a density assertion.

The references are part of the definition: `θ_p(U_p^{SO})` is derived from the same tuple, never
an independently chosen family. The domain is `SO`; an improper element of `U_p^O` need not have
spinor norm in `θ_p(U_p^{SO})`. Every norm map must have its actual coordinate rule, rather than
being an unspecified homomorphism whose trivial instance says nothing about the desired kernel.

Construct the Spin projection corestricted to each of these kernels using the native local
`range_spinToSpecialOrthogonal_eq_ker_spinorNorm`. Its reverse inclusion for restricted products
requires the following explicit **integral-lifting condition** on the reference tuple:
for all but finitely many primes `p`, every `g ∈ U_p^{SO}` with `θ_p(g) = 1` has a lift
`s ∈ U_p^{Spin}` under the local Spin projection. This condition is additional to 3C's
forward compatibility, which alone does not imply it. Prove the relative theorem under this
condition: the range of the componentwise Spin projection is exactly the spinor kernel in the
finite adeles, away from each such `S`, and in the full adeles. Choose integral lifts at the
almost-all primes where the target is integral and the condition holds, and arbitrary local
lifts at the remaining finitely many retained primes; for the full version also choose a real
lift by the same native local theorem. The resulting family is a restricted-product point.
Prove the corestricted projection surjective, its coordinate and inclusion rules, compatibility
with restriction and projection, and transport along the reference-family equivalences of 3B.
This theorem applies also in dimensions zero and one, using the native trivial-`SO` branch;
no strong-approximation or noncompactness assumption enters any of these exports.

Discharge the integral-lifting condition for the standard family of 3C–3E, rather than leaving
it as an unsupported premise: take `U_p^{Spin}` to be the **full preimage** of `U_p^O` under the
Spin action, the native `integralSpinSubgroup` for the chosen base-changed rational basis.
Its openness, compactness and rational eventual integrality are the 2D/3E theorems. If
`g ∈ U_p^{SO}` is in the local spinor kernel, the native local range theorem gives a Spin lift;
its action is in `U_p^O`, so this very lift belongs to the full preimage. This proves lifting at
every prime, including `2`, with no unimodularity or dimension restriction. Extend to tuples
with the same reference subgroups outside a finite set via 3B's canonical identifications.
For other compatible tuples retain the explicit condition and prove it when applicable; do not
assert integral lifting for arbitrary smaller Spin references or silently change the chosen
restricted product. These are point-group/norm/lifting targets owned here, not an invocation of
strong approximation or a theorem about closures of rational points.

**3G. Double cosets, with the maps stated separately.** The set `G(ℚ) \ G(𝔸_f) / U`, with three
distinct comparison statements rather than one blanket change-of-`U` map, since eventually equal
reference families give canonically equivalent ambient groups but do **not** automatically give a
canonical bijection of double-coset sets: an inclusion `U ≤ U'` of compact opens induces a
surjection of double-coset sets in the corresponding direction; conjugate compact opens induce a
canonical bijection. For componentwise transport, let `Φ : G(𝔸_f) ≃* G'(𝔸_f)` be the equivalence
induced by the componentwise local equivalences. Besides `Φ(U) = U'`, require and prove
`Φ(ΔG(ℚ)) = ΔG'(ℚ)`. Then the representative rule `[g] ↦ [Φ(g)]` is well-defined, and the
inverse is induced by `Φ.symm`; these equalities prove both inverse laws on double cosets. In the
intended specialization where one rational isometry `f : Q ≃qᵢ Q'` induces every local equivalence,
its rational group isomorphism `Φ_ℚ` commutes with localization at each place. Hence
`Φ(ΔG(ℚ)) = ΔG'(ℚ)` follows by applying `Φ_ℚ` to rational points (with the inverse rational
isometry giving onto-ness). This diagonal proof is separate from the compact-open transport.
Finiteness of the set is not claimed here.

**3H. Explicit stop point.** RestrictedProducts exports none of the norm-one subgroup,
reduction theory, finite-covolume theorem, strong approximation, or Tamagawa infrastructure. This
roadmap therefore stops after the specialized point groups, diagonals, and adelic spinor norm. It
states no generic finite-covolume or density theorem and no orthogonal application of one.

## Consumer contract for `OrthogonalTamagawaAndLatticeMass`

Layers 0 to 3 expose all three point groups and the spinor-kernel API because one named successor
consumes them: **`OrthogonalTamagawaAndLatticeMass`**, which owns the orthogonal application of
strong approximation, Eichler's theorem, the arbitrary-genus mass and general dyadic extensions,
and the point/reference, form-twist and normalization adapters specified below. It consumes the
shared orthogonal value, gauges and maximal-lattice inputs from their existing proposed owner;
it does not duplicate them. None is a milestone here or may be promoted back into this roadmap.

**What this roadmap exports to it**, by exact name: `transvection` and `transvectionLiftHom`, the
root subgroups of 2C; `spinorNorm` with its local table 2F–2G and its localization 2H;
`finiteAdelicOrthogonal`, `finiteAdelicSpecialOrthogonal`, `finiteAdelicSpin` and their away-`S`
and full-adelic forms, with the componentwise maps and the diagonals of 3D–3E; `adelicSpinorNorm`
with its evaluation rule and `adelicSpinorKernel`, `adelicSpinorNormAway S` and
`adelicSpinorKernelAway S`, their full-adelic forms, and the 3F reference-controlled Spin-image
comparisons and standard integral-lifting theorem; `unitSquareClasses` with the reference-image
theorems of 3C; and the double-coset comparisons of 3G.

**What the successor must import before it may state anything**, and may not replace by a local
substitute: the algebraic-group point functor and almost-simple-factor API from Reductive Groups;
the evaluation topology, local analytic structure, integral models and local Kneser–Tits inputs of
[ReductiveGroupsPartII RG2.0, RG2.0a, RG2.3 and RG2.4](../../TauCetiRoadmap/ReductiveGroupsPartII/README.md);
[AdelicAlgebraicGroups AA.1.1–1.4](../AdelicAlgebraicGroups/README.md#11-affine-points-and-integral-models)
for the actual Hopf-model adelic/restricted-product, coordinate and diagonal comparisons;
[AA.4.1–4.2](../AdelicAlgebraicGroups/README.md#42-strong-approximation-and-arithmetic-closures)
for weak and strong approximation over number fields, including its theorem for connected
semisimple simply connected groups with the noncompactness condition on every almost-simple
factor; [AA.3](../AdelicAlgebraicGroups/README.md#layer-3-reduction-and-arithmetic-quotients) for arithmetic reduction and finite
covolume; and [AA.2](../AdelicAlgebraicGroups/README.md#layer-2-characters-quotient-measures-and-tamagawa-measures)
for quotient integration and the normalized Tamagawa measure with its stated convergence-factor
inputs. These theorem interfaces retain their own hypotheses and proofs.
For the **number-field simply connected semisimple value**, consume
[EndoscopicTransferAndUnitaryTraceComparison §6.2](../EndoscopicTransferAndUnitaryTraceComparison/README.md#62-tamagawa-number-one-for-simply-connected-semisimple-groups):
`τ(S)=1` for every connected simply connected semisimple group over a number field, including
inner forms, products, restriction of scalars and exceptional factors. This numerical theorem has
no choice of `S` or factorwise `S`-noncompactness hypothesis; those remain on the away-`S`
strong-approximation application alone. Its full Lai/Kottwitz/Clozel
proof programme and prerequisites, including the local/global Hasse and trace-formula inputs,
remain that owner's obligations; neither isotropy nor strong approximation proves this value.
Its §6.5 gives scoped Kottwitz ratios for that layer's reductive/endoscopic/centralizer inputs;
it is not an arbitrary finite-central-isogeny pushforward or defect theorem.
For the **orthogonal value and shared gauge/local-volume package**, consume
[GeometryOfNumbersAndQuadraticArithmetic §3.3](../GeometryOfNumbersAndQuadraticArithmetic/README.md#33-finite-stabilizers-genus-classes-and-mass):
`orthogonalTamagawa_two` for nondegenerate forms of rank at least three over a number field,
`orthogonalPinnedGaugeJacobian`, `compactOrthogonalGaugeVolume`,
`orthogonalIntegralRealGaugeCompatibility`, and, only for maximal integral lattices,
`smoothMaximalOrthogonalModel`, its reductive quotient and congruence kernels, and
`orthogonalCanonicalLocalVolume`. That owner's direct Weil/Siegel–Weil stabilizer and quaternion
programme proves the orthogonal value separately; it is not a generic central-isogeny defect
export. Its §§2.4 and 3.3 own the number-field genus and proper-spinor-genus extension, finite
stabilizers/class sets, proper adelic mass identity and ordinary/proper mass comparison.
The maximal-lattice evaluation §3.3.5 keeps its totally real degree-at-least-two, totally positive,
rank-at-least-three and maximality hypotheses; it supplies neither a rational arbitrary-genus
formula nor an arbitrary-lattice dyadic formula. Keep the existing `ℤ` and binary branches in
IntegralLattices and construct the successor's remaining extensions with those inputs.

These are immutable **written roadmap contracts**, not claims that their suggested signatures
or native proofs exist. Before transporting a numerical value, the successor must identify its
scheme/point quotient and its Haar and quotient measures with these exact supplier conventions.
Use [AA.2.4](../AdelicAlgebraicGroups/README.md#24-gauge-forms-and-tamagawa-normalization)'s
`|d_K|^(−dim G/2) ρ_G⁻¹ ∏_v λ_v |ω|_v`, additive measures `vol(𝒪_v)=1`, `dx` and `2 dx dy`,
normalized absolute values, Artin character-lattice factors (including ramified inertia), and
counting measure on rational points. For reductive groups the number is on `G(𝔸_K)^1` with
lattice-normalized split-centre measure; semisimple groups have no split-character quotient.
Compare the §3.3 pinned real density and motive/canonical local measures through its
`orthogonalIntegralRealGaugeCompatibility`, retaining all discriminant, conductor and ramification
factors. A real Jacobian, local compact volume, or bare normalization name is not this global
comparison. If another normalization is used, construct and prove the transport scalar before
applying either numerical value. No function-field theorem is imported by these number-field
contracts.

The **arbitrary finite-central-isogeny volume-defect API** remains a separate required generic
construction under `TamagawaMeasures`, consuming AA's measures and the actual cohomological/value
inputs rather than reproving §6.2. Any alternative derivation through `Spin→SO` must first supply
that complete API, including local and adelic lifting obstructions, rational-image and quotient
comparisons, character-lattice and gauge Jacobians, and the actual finite cohomological defect
terms. A finite scheme kernel is not surjectivity on local or adelic points, and its order alone
is not a quotient-volume ratio. This remains required library scope. Its construction is not
a prerequisite for consuming §3.3's independent direct orthogonal-value route with its own
proved normalization comparison.
Also consume `ClassFieldTheory.hilbertProductFormula`, and
GlobalQuadraticForms [6.3 Hasse–Minkowski isometry](../../TauCetiRoadmap/GlobalQuadraticForms/README.md#63-hasseminkowski-isometry)
and [8.4 The form-theoretic SO kernel consequence](../../TauCetiRoadmap/GlobalQuadraticForms/README.md#84-the-form-theoretic-so-kernel-consequence).

**What it then proves**, listed so that the interface above can be checked against a use: that the
orthogonal root subgroups generate the elementary subgroup of `Spin(V)(K)`; and the actual
orthogonal instantiation of the generic strong-approximation theorem. Fix its number field
(`K = ℚ` for the Layer 3 point groups here) and a finite set `S` containing **all** archimedean
places. Prove that the relevant Spin algebraic group is connected, simply connected and
semisimple for `dim V ≥ 3`, with the point/scheme comparison of 3A, and discharge **every**
hypothesis of the actual generic supplier. In particular, for **every almost-`K`-simple factor**
`H`, require that `∏_{v ∈ S} H(K_v)` is noncompact, equivalently that this factor has a noncompact
local group at some place in `S`; different factors may use different places. This is not a
synonym for real indefiniteness: retain definite rational forms by allowing a suitable finite
place in `S` for every factor. Dimension two is excluded from this semisimple density statement:
its Spin group is a one-dimensional torus, and the analogous assertion is false.

Under those same hypotheses and the reference control of 3F, prove density of the rational Spin
diagonal in `Spin(V)(𝔸^S)` and then the precise closure equality **inside the same
`SO(V)(𝔸^S)`**: the closure of the rational Spin image is `adelicSpinorKernelAway S`. Use the 3E
commuting diagonal square, the continuous Spin projection, the 3F restricted-product
image-equals-kernel theorem, and closedness of that kernel. No strong-approximation proof or
closure conclusion is hidden in the local lifting theorem. The finite-adelic statement is the
specialization `S = {all archimedean places}` (here `{∞}`) **only when the same factor
noncompactness and supplier hypotheses hold for this S**. Choosing an additional finite place
for a definite form gives an away-from-that-place statement, not the finite-adelic one. None of
these assertions implies a closure equality in the full adeles, whose rational diagonal is
discrete as in 3E. Nor is the Spin-image closure the closure of all rational `O`-points: when
a rational reflection has a nonsquare spinor norm, its image is an improper isometry and is not
in this `SO` kernel; whenever a retained local spinor norm is nontrivial it also fails the
kernel's coordinate condition. The rational `O` image and the Spin image remain distinct.

The successor owns the orthogonal instantiation of AA.4.2 and the adapter to the shared
orthogonal gauge and Tamagawa-measure package of GeometryOfNumbersAndQuadraticArithmetic §3.3.
Construct its required scheme/point adapter explicitly:
identify the actual native Spin and SO point groups with the affine group-scheme points over
`ℚ`, every completion and the adeles, as groups and locally as topological groups, with the
coefficient, diagonal and Spin-projection squares commuting. Compare the standard basis family
of 3C–3F with the integral-model references of AA.1.1–1.2 outside a proved finite exceptional
set, using the actual integral morphisms and proper central Spin projection, then transport
through the canonical finite-change and away-`S` identifications. Forward reference compatibility
or local kernel surjectivity alone is not this comparison. For another compatible tuple, state
and prove the corresponding model/reference comparison before applying the generic theorem;
no arbitrary restricted-product topology is silently identified with the scheme adelic topology.
The generic approximation proof remains AA.4.2's; the point-group norm and lifting exports here
do not consume it. For `dim V ≥ 3`, transport the number-field theorem
`orthogonalTamagawa_two` through these point/quotient and normalization comparisons to obtain
`τ(SO_Q)=2` in the rational consumer convention; the numerical theorem stays with its §3.3 owner.
The successor retains the separate low-dimensional measure comparisons and values `2` for a
nonsplit binary form, `1` for a split one, and `1` in dimensions one and zero. They are not
specializations of the rank-at-least-three theorem. Preserve IntegralLattices' direct low-rank
mass branches and the guard on its Conway–Sloane normalization.

⚠ Two ownership facts that a reader of the successor will otherwise get wrong.
`Ш¹(ℚ, SO_Q) = 1` is not a formality: consume GlobalQuadraticForms 6.3's
Hasse–Minkowski isometry theorem and its 8.4 form-theoretic corollary (suggested
implementation name `TauCeti.NumberField.QuadraticForm.equivalent_of_locallyEquivalent`). The translation into a pointed-set statement,
including the comparison with the appropriate `SO(Q)` twists, is this successor's
work; that form-theoretic supplier defines no `H¹(K, SO(Q))`.
For an alternative central-isogeny computation, first construct/import the complete generic
defect API described above and instantiate it with the actual `Spin→SO` torsor, cohomology and
measure comparisons. Neither the bare value `τ(Spin)=1`, the order of `μ₂`, nor §6.5's scoped
Kottwitz ratio is a substitute. The direct §3.3 route and this required general comparison programme retain
separate proof dependencies and the same final normalization.

## Required basic API

"Build the library, don't race to the theorem" applies per object. Each object this roadmap owns
carries the same seven-part checklist, and a milestone is not discharged until all seven exist:
**constructors and the defining characterization**; **extensionality**, that is a usable criterion
for two elements to be equal; **functoriality** in the quadratic space, along isometries;
**base change**, along a field extension for the field-level objects and along a ring map for the
bilinear ones; **comparison lemmas** against the neighbouring object, which is the row below or
above it here; **edge cases**, meaning dimension zero, dimension one, and the degenerate form
wherever a statement is claimed without nondegeneracy; and the **downstream interface**, the
handful of lemmas the consuming layer actually calls.

The objects, in dependency order: `orthogonalDet` and the `specialOrthogonalWithin` interface
(0A); the bilinear-form isometry group and the dictionary (0C); the reflection with its
determinant and conjugation law (0D); `vectorUnit` and the scalar-unit homomorphism, with the
membership theorems that put them in Mathlib's carrier (1B); the Clifford norm and the three
`star`-versus-`reverse` comparison theorems (1A); the spinor norm (1D); `evenUnitaryGroup` with its
membership criterion, its functoriality along an isometry, and its comparison with `spinGroup`
(1F); χ with determinant and native square-class codomain, its defining
formula, reflection values and general-field even/odd image law; Ω as its
actual kernel and PΩ as its actual central quotient, with isometry/base-change
maps and comparison to the Spin image; the full finite table and rational
norm/sign membership algorithms, including rank0/1/2 exceptions (1G–1H);
the local topological point groups (2A, 2B); the transvections and their Spin lifts (2C);
`integralOrthogonalSubgroup` (3E); the compatible compact-open data, `unitSquareClasses`, and the
three adelic point groups (3C, 3D); the adelic spinor norm and the adelic spinor kernel (3F).

**Central-quotient functoriality is a theorem obligation.** Isometry transport is onto and
therefore carries centers onto centers. A field-extension map Ω(Q)(K)→Ω(Q_L)(L) is not generally
onto, so its projective quotient map requires an explicit proof that the source center maps into
the target center; an arbitrary group homomorphism does not supply this. Prove that comparison
here. In dimensions zero and one use triviality, and in dimension two use the abelian norm-one
torus description for both fields. In dimension at least three, prove the scalar-center lemma:
for finite fields use the full finite table; for infinite fields use the rational Cayley open
family in SO and its squares (which lie in Ω), show that commuting with that family is a
polynomial identity, and compute its natural-representation centralizer to be scalars. Own the
Cayley-domain, density and coefficient-centralizer adapters on the actual quadratic space rather
than assuming a generic reductive-group density theorem. Then determinant and spinor naturality
carry each allowed scalar into the target kernel and center. State the quotient representative
law and the identity/composition laws, and reject any supposed quotient transport lacking this
center-containment proof. Complete this transport result after the finite scalar-center cases;
the finite classification uses the general χ/Ω/PΩ carriers but does not assume this projective
field-extension theorem. No full-field finite-classical simplicity statement is inferred.

## Worked examples (acceptance criteria)

Discharge these alongside their layers. Each catches a vacuous definition, a wrong sign, or a
convention drift.

- The two reflection spellings agree: `B x v / Q v = 2 · B x v / B v v` for `Q v ≠ 0`, and
  `τ_v v = -v` computed from either. The mixed form `2 · B x v / Q v` gives `-3v`, and that is the
  error the convention table warns against (Layer 0D).
- Dimension one, `Q x = a x²` for `a ∈ Kˣ`: `O(Q) = {±1}`, `SO(Q)` is trivial, `-1` is the
  reflection in any `v ≠ 0`, and `θ(-1) = [a]`, which is nontrivial exactly when `a` is not a
  square. Two different conditions are tested here. “`a` is a nonsquare” tests that the
  `reverse` spinor norm of this reflection is nontrivial: for `Q x = x²` one gets `θ(-1) = [1]`,
  which does not test it. “`-1` is a nonsquare” is what separates the conventions: the `star`
  norm of the same reflection is `[-a]`, so over ℚ the instance `Q x = x²` gives `[1]` for
  `reverse` and `[-1] ≠ [1]` for `star`, and is the discriminating instance for 1A's
  convention. Over `ℚ_5`, where `-1` is a square (`2² ≡ -1 (mod 5)`, lifted by Hensel's
  lemma), both norms give `[a]`, so no instance over `ℚ_5` separates them; over `ℚ_p`, `-1` is
  a nonsquare exactly for `p = 2` or odd `p ≡ 3 (mod 4)` (Layers 0, 1).
- The hyperbolic plane over any `K`: `SO(H) ≅ Kˣ` through the diagonal torus and `θ` on that torus
  is the square class of the parameter, so `θ : SO(H)(K) → Kˣ/(Kˣ)²` is **surjective**, and the
  image of `Spin(H)(K) → SO(H)(K)` is the square-parameter subgroup `(Kˣ)²`, which is `ker θ`. The
  sequence of 1E extended by `→ 1` is therefore exact here over every `K`. ⚠ Whether
  `Spin(H)(K) → SO(H)(K)` is itself onto is a property of `K`, not of `H`: it is surjective exactly
  when every unit of `K` is a square. Over `ℚ` it is **not**, the parameter `2` having no preimage,
  which is `not_surjective_spinToSpecialOrthogonal_hyperbolic_rat`, and what fails there is the
  naive expectation that a central isogeny is onto on `K`-points. Over an algebraically closed
  field the same form is a case of `spinToSpecialOrthogonal_surjective_of_isAlgClosed`, and the
  acceptance proof verifies surjectivity rather than contradicting it (Layers 0, 1).
- The sum of three squares over ℚ: the central map from the norm-one Hamilton quaternions to
  `SO(Q)` is an isogeny of algebraic groups with kernel `±1`, and its image on rational points is
  the spinor kernel, strictly smaller than `SO(Q)(ℚ)`. Stating it as "`SO(Q)(ℚ)` is the quotient of
  `Spin(Q)(ℚ)` by `±1`" is exactly the error the previous item is designed to catch (Layer 1F).
- `O(Q)(ℝ)` for a definite `Q` is compact and agrees with the Euclidean orthogonal group of
  `TauCeti/LinearAlgebra/OrthogonalGroup.lean`; for `Q = x² − y²`, pass to the isometric
  `xy`-model and exhibit noncompactness with the diagonal torus
  `t ↦ diag(t, t⁻¹)`. The acceptance proof must also verify that `u^⊥ / ℝ u = 0` in
  dimension two, so the transvection family of 2C cannot serve as the witness there. In dimension
  at least three the isotropic noncompactness example uses a nontrivial Eichler transvection family
  (Layers 2B, 2D).
- A rational isometry lies in the stabilizer of the standard `ℤ`-span at all but finitely many
  primes, exhibited for one explicit non-integral rational isometry (Layer 3E).
- **Non-discreteness in the finite adeles**: for a split rational `V` of dimension at least three,
  the transvections `E_{u,tw}` with `t` a highly divisible integer accumulate at the identity in
  `SO(V)(𝔸_f)`, so the diagonal image is not discrete there, while it is discrete in `SO(V)(𝔸)`.
  This is the acceptance check for 3E (Layer 3).
- Two compatible tuples differing at one prime give a canonical isomorphism of restricted products,
  computed on coordinates, and the induced comparison of double-coset sets is the one 3G names
  rather than a bijection (Layer 3).
- Dimension four, split against nonsplit, in three forms: `H ⟂ H` over `ℚ`, whose discriminant
  algebra splits and whose `Spin` is `SL₂ × SL₂`, two factors each of `ℚ`-rank one; the sum of
  four squares over `ℝ`, whose discriminant algebra also splits but whose `Spin(ℝ)` is
  `SU(2) × SU(2)`, two factors of real rank zero; and `x² + y² + z² + 2w²` over `ℚ`, whose
  discriminant algebra is the field `ℚ(√2)` and whose `Spin` is one `ℚ`-almost-simple factor. The
  first two test that the split case of 1F asserts absolute rank one and nothing more, and the
  third tests the distinction between split and nonsplit that 1F draws (Layer 1F).
- **Dimension five is symplectic**: for a five-dimensional `Q` the even Clifford algebra has degree
  four, `Spin(Q) = evenUnitaryGroup Q = Sp(C₀, σ)`, and in the split case `Spin₅ ≅ Sp₄`, which is
  not a special linear group of any central simple algebra (Layer 1F).
- **Dimension six is where that stops**: for a split rational six-dimensional `Q`,
  `evenUnitaryGroup Q ≅ GL₄(ℚ)` while `Spin(Q) ≅ SL₄(ℚ)`, so the dimension-five equality is sharp.
  This is the acceptance check that nobody extends `evenUnitaryGroup_le_lipschitzGroup` past
  dimension five (Layer 1F).
- **A positive-definite real form has trivial spinor norm on the whole of `O`**, not all square
  classes: every value of `Q` is a positive real and hence a square. Beside it, a negative-definite
  form of the same rank, where `θ(O)` is all of `ℝˣ/(ℝˣ)²` and `θ(SO)` is trivial. This is the
  acceptance check for the signature split in 2F (Layer 2).
- **The reference images are open but not identified**: `θ_p(U_p^{SO})` is open for every
  compatible tuple, while for a one-dimensional `V` it is trivial at every prime and so is never
  the unit square classes. This is the acceptance check for 3C (Layer 3).

## Ordering and parallelism

The supplier order distinguishes the general joint map, finite classification and local topology:

    Mathlib, native Tau Ceti, SpinRepresentations, QFI field API → OG0–1F → OG1G.General;
    OG0–1E + native algebraic transvection/lift API (2C) → OG1G.Finite elementary engine;
    Mathlib PSL2/SL2/action + finite quaternion splitting → OG1G.Finite low ranks;
    CFT cyclic norms → QFI symbol comparison → GQF4.3/6.1 → OG1H;
    QFI6D local forms + OG1G.General → OG1H;
    LocalFieldsRamification, QFI local API + OG0–1F → OG2 local topology/image tables;
    RestrictedProducts + OG2 → OG3.

The algebraic formulas and lifts called2C are constructed after1E and before the finite engine;
their continuity belongs to the local branch. Neither2C nor that local branch consumes1G.Finite.
Thus using elementary transvections in1G does not create a finite-classification/topology cycle.
Any ReductiveGroups root-relation input is used only below its finite-simplicity consequences;
the direct Witt-coordinate relations above remain owned here if no matching native comparison is
available.

ClassFieldTheory and GlobalQuadraticForms have no OrthogonalSpinGroups input;
their complete supplier contracts preserve CFT→QFI→GQF. OG1H consumes the
named norm/representation outputs and supplies no input back to them. The
ReductiveGroups9 alternative proof route is used only after the stated carrier
comparison; OG owns finite abstract simplicity.

Within this roadmap, Layers0–1F and1G.General establish the algebraic orthogonal/spin API and
exact spinor-kernel sequence; the algebraic2C lifts then supply1G.Finite's elementary engine
and the full odd-field classification. Layer 1H is the rational arithmetic
branch with its stated norm suppliers. Layer 2 builds the orthogonal local specialization and
transvections. Layer 3 instantiates imported adelic carriers and maps and constructs the
adelic spinor norm.

`OrthogonalTamagawaAndLatticeMass` branches after Layer 3 and behind Reductive Groups and the
generic successors named in its contract; `AlgebrasWithInvolution` branches after Layer 1 and is
independent of everything adelic. IntegralLattices may consume only the interfaces that have
available at the required hypotheses; its Eichler and mass-formula applications are developed
by the first of those two with the exact supplier interfaces above.

## References

- E. Artin, *Geometric Algebra*, Interscience (1957). Chapter III for reflections, the
  transitivity computation of 0E and Cartan–Dieudonné.
- O. T. O'Meara, *Introduction to Quadratic Forms*, Grundlehren 117, Springer (1963; corrected
  1973), PRIMARY. §43 the orthogonal group and reflections; §55 the spinor norm, its
  well-definedness and the local computations of 2F, with 55:6 the local surjectivity in dimension
  at least three; §101 the adelic setting; 104:4 strong approximation for the spin group, which is
  `OrthogonalTamagawaAndLatticeMass`'s. ⚠ His Hasse symbol convention is `∏_{i≤j}`, translated
  per the quadratic form invariants roadmap's table. (104:5, Eichler's theorem for lattice
  classes, belongs to `OrthogonalTamagawaAndLatticeMass` §0.3, the successor that also owns Layer
  3A's affine group-scheme construction and point comparison; the IntegralLattices roadmap's scope
  table assigns Eichler's theorem `cls⁺ L = spn⁺ L` to that successor.)
- D. E. Taylor, *The Geometry of the Classical Groups*, Heldermann (1992); author's corrected
  copy (2021). Theorems 11.2, 11.30, 11.45–11.48 and 11.51 for the finite orthogonal groups of
  1G, including the field with three elements: isotropy, primitive action, generation, perfectness
  and simplicity with their exceptions, and the spinor kernel.
- C. Chevalley, *The Algebraic Theory of Spinors*, Columbia (1954); reprinted in *Collected Works*
  vol. 2, Springer (1997). Chapter II for the Lipschitz group, the vector representation, the
  centre and graded centre computation of 1B, and the Clifford norm of 1A.
- N. Bourbaki, *Algèbre*, Chapitre 9, *Formes sesquilinéaires et formes quadratiques*, Hermann
  (1959). §9 for the Clifford group, the spinor norm and the exact sequence of 1E, in the
  conventions closest to Mathlib's.
- M.-A. Knus, *Quadratic and Hermitian Forms over Rings*, Grundlehren 294, Springer (1991).
  Chapter IV for the Clifford algebra, its centre, the discriminant quadratic étale algebra of a
  quaternary form and the split/nonsplit dichotomy of 1F.
- M.-A. Knus, A. Merkurjev, M. Rost, J.-P. Tignol, *The Book of Involutions*, AMS Colloquium
  Publications 44 (1998). §15 for the low-rank exceptional isomorphisms **over a general field**,
  with the twisted forms, which is what 1F needs and what the algebraically closed statements do
  not give.
- W. Scharlau, *Quadratic and Hermitian Forms*, Grundlehren 270, Springer (1985). Chapter 9 for the
  spinor norm and the Clifford invariant with the sign conventions stated explicitly, against which
  1A's `reverse`-versus-`star` comparison is checked.
- T. Y. Lam, *Introduction to Quadratic Forms over Fields*, GSM 67, AMS (2005). Chapter I for
  reflections (I.7), Witt theory and the extension theorem (I.4.9), in the conventions the
  quadratic form invariants roadmap adopts.
- M. Eichler, *Quadratische Formen und orthogonale Gruppen*, Grundlehren 63, Springer (1952; 2nd
  ed. 1974). The origin of the transvections of 2C and of the approximation argument.
- M. Kneser, *Quadratische Formen* (revised with R. Scharlau), Springer (2002). Strong
  approximation and the spinor-genus apparatus, for `OrthogonalTamagawaAndLatticeMass`.
- V. Platonov, A. Rapinchuk, *Algebraic Groups and Number Theory*, Academic Press (1994), PRIMARY
  for `OrthogonalTamagawaAndLatticeMass`. Chapter 3 treats adelic groups and rational-point
  discreteness;
  Theorem 5.5 and the surrounding material supply reduction-theory references; Chapter 5 treats
  Tamagawa measures and numbers; Chapter 7 treats strong approximation and Kneser--Tits
  generation.
- A. Rapinchuk, *Strong approximation for algebraic groups*, in *Thin Groups and Superstrong
  Approximation*, MSRI Publications 61, Cambridge (2014), 269–298. A source for
  `OrthogonalTamagawaAndLatticeMass`.
- J.-P. Serre, *Lie Algebras and Lie Groups*, Lecture Notes in Mathematics 1500, Springer (1992).
  Part II for `p`-adic analytic groups and Cartan's theorem that a closed subgroup of a `p`-adic Lie
  group is a Lie subgroup.
- A. Weil, *Adeles and Algebraic Groups*, Progress in Mathematics 23, Birkhäuser (1982). The
  Tamagawa measure and the simply connected classical groups, for
  `OrthogonalTamagawaAndLatticeMass`.
- T. Ono, *On the relative theory of Tamagawa numbers*, Ann. of Math. 82 (1965) 88–111. The
  mathematical source for the central-isogeny calculation that
  `OrthogonalTamagawaAndLatticeMass` may instantiate only through its exact supplier.
- J. G. M. Mars, *Les nombres de Tamagawa de certains groupes algébriques*, Séminaire Bourbaki
  exp. 351 (1968/69). The orthogonal and spin Tamagawa numbers surveyed, with the derivation of
  `τ(SO) = 2` from `τ(Spin) = 1` as an alternative comparison route; its complete generic
  defect API is still required. The shared numerical orthogonal value is owned by
  GeometryOfNumbersAndQuadraticArithmetic §3.3 through its separately specified direct route.
- J. W. S. Cassels, A. Fröhlich (eds.), *Algebraic Number Theory*, Academic Press (1967). The
  adelic and product-formula background.
- J.-P. Serre, *A Course in Arithmetic*, GTM 7, Springer (1973), Chapter IV. The local and global
  square-class background in the form the sibling roadmaps use.
