# Roadmap: orthogonal and spin groups

Mathlib has the Clifford algebra and nothing for it to act on. It has `CliffordAlgebra` over a
commutative ring with the embedding `ι`, the grade involution `involute`, the anti-automorphism
`reverse`, the `ZMod 2` grading and the even subalgebra; it has `lipschitzGroup` — defined as the
subgroup *closure* of the invertible vectors, which its own docstring records as agreeing with the
usual "twisted conjugation preserves `V`" Clifford group in one direction only — and `pinGroup` and
`spinGroup`, cut out of that closure by the `star`-unitary condition, with their group structures
and the theorems that twisted conjugation preserves the embedded copy of the underlying module; it
has `Module.reflection` as a linear equivalence
attached to a functional; it has `QuadraticMap.IsometryEquiv`, carrying no group structure; it has
`Matrix.orthogonalGroup`, which is the orthogonal group of the standard form only and which
carries no topology; it has `RestrictedProduct` with its topology, the finite adele ring of a
Dedekind domain and the adele ring of a number field. It has none of the spinor norm or the
orthogonal-specific arithmetic developed here. Generic restricted-product
packaging, componentwise maps, and rational diagonals are consumed from
[RestrictedProducts](../RestrictedProducts/README.md), not rebuilt in this roadmap.

This roadmap develops the arithmetic of the orthogonal and spin groups attached to a
finite-dimensional nondegenerate quadratic space over a field of characteristic not two: the
spinor norm through reflections, the Clifford comparison and its spinor kernel, orthogonal
transvections, local spinor norms, and the orthogonal specialization of the generic
restricted-product infrastructure. It supplies the algebraic, local, and finite-adelic interfaces
that the named successor roadmap `OrthogonalTamagawaAndLatticeMass` will consume.

**Current boundary.** Strong approximation, reduction theory, Tamagawa measures and
central-isogeny volume formulas are **not** milestones here. Their generic halves belong to the
successors `RestrictedProducts` names — `AlgebraicGroupStrongApproximation`,
`ArithmeticReductionTheory`, `TamagawaMeasures`, `AdelicFourierAnalysis` — and their orthogonal
half belongs to `OrthogonalTamagawaAndLatticeMass`, which is the single named owner of the
orthogonal Tamagawa number, the mass formula, and the density statements. What this roadmap owes
that successor is a short interface, stated once under *Consumer contract* below.

**Scope exclusions** (choices, not omissions; each names its owner). The Mathlib Clifford,
Lipschitz, Pin and Spin carriers and the accepted [SpinRepresentations
roadmap](../RepresentationTheory/SpinRepresentations/README.md)'s algebraically closed structure
theorems are inputs; this roadmap owns the general-field algebraic orthogonal/spin group API, the
spinor norm, the image of `Spin → SO`, and the twisted rational forms of the low-rank
isomorphisms. **Witt decomposition and cancellation, square classes, Hasse invariants, the Hilbert
symbol, and classification over local fields** belong to
[QuadraticFormInvariants](../QuadraticFormInvariants/README.md). **Hasse--Minkowski and global
classification of forms over number fields** belong to
[GlobalQuadraticForms](../GlobalQuadraticForms/README.md). **Local ramification and power-class
facts** belong to [LocalFieldsRamification](../LocalFieldsRamification/README.md), and Hilbert
reciprocity belongs to [ClassFieldTheory](../ClassFieldTheory/README.md). Those global suppliers
are inputs only to `OrthogonalTamagawaAndLatticeMass`, not current imports. **Generic compact-open families,
restricted-product maps, finite/away/full adelic packaging, and rational diagonals** belong to
[RestrictedProducts](../RestrictedProducts/README.md). That roadmap explicitly does not own
strong approximation, reduction theory, Tamagawa measures, central-isogeny volume formulas, or
Tamagawa numbers. **Affine group schemes,
representability, root data, and reductive structure theory** belong to
[ReductiveGroups](../ReductiveGroups/README.md); the orthogonal specializations `O_Q`, `SO_Q` and
`Spin_Q` stay here. **Lattice stabilizers and their arithmetic**, isometry classes, genera, spinor
genera, Eichler's theorem for lattice classes, and local densities belong to
[IntegralLattices](../IntegralLattices/README.md); the **mass formula** and the genus/spinor-genus
comparison that needs strong approximation belong with the orthogonal Tamagawa computation, in
`OrthogonalTamagawaAndLatticeMass`, and are milestones of neither this roadmap nor
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

- `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/` for Layers 0 and 1, the field-level
  algebra with no arithmetic in it, beside the ambient form theory the quadratic form invariants
  roadmap puts at `TauCeti/LinearAlgebra/QuadraticForm/`.
- `TauCeti/NumberTheory/QuadraticForm/OrthogonalGroup/` for Layers 2 and 3: orthogonal local and
  finite-adelic specializations.

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
  square-class codomain absorbs: `[Q v]` and `[-Q v]` differ by `[-1]`, which is nontrivial over
  ℚ and over `ℚ_p`, so the two conventions genuinely disagree on `O(Q)` at odd reflection length,
  and agree on `SO(Q)`. Every statement below uses the `reverse` norm.
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
  definition only in finite dimensions, with the reverse inclusion an open TODO. Note that
  `pinGroup` is defined as an intersection with `unitary`, so membership already encodes
  `reverse (involute x) * x = 1`; Layer 1C states the Clifford norm against that rather than
  introducing a competing one.
- **Reflections:** `Mathlib/LinearAlgebra/Reflection.lean` has `Module.preReflection` and
  `Module.reflection` as linear equivalences from a functional `f` and a vector `x` with `f x = 2`,
  with involutivity, `reflection_apply_self`, and the products-of-two-reflections API.
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

The final portfolio dependencies are imports, not local interfaces.

- **[QuadraticFormInvariants](../QuadraticFormInvariants/README.md)** owns the canonical
  multiplicative square-class quotient `Kˣ ⧸ Subgroup.square Kˣ`, reflection and
  Cartan--Dieudonné input, Witt theory, `hilbertSymbol`, `localHasse`,
  `hasseInvariant_eq_localHasse`, and local classification. This roadmap uses the raw quotient
  directly and introduces no `SquareClass` alias or generic pushforward API.
- **[LocalFieldsRamification](../LocalFieldsRamification/README.md)** owns normalized valuations,
  unit filtrations and the square-class finiteness/deep-squares inputs, including
  `unitFiltration_le_range_powMonoidHom_two` and its sharpness, and the **openness** of the square
  subgroup, `isOpen_range_powMonoidHom`, which 2E and 3C both consume and which does not follow
  from the module topology.
- **[RestrictedProducts](../RestrictedProducts/README.md)** owns generic compact-open
  families, restricted-product maps, rational diagonals, and finite/away/full point packaging. Its
  Lean-level contracts consumed in
  `Suggested.lean` are `integralSubgroup`, `restrictedProductMap`,
  `restrictedProductMapOfForall` with its `_apply`, `restrictedProductCongr`, `rationalDiagonal`,
  `restrictAway`, `RestrictedProductGroup`, `RestrictedProductGroupAway`, and
  `RestrictedProductGroupWithFactor`. It explicitly exports no `LocalPointGroup`, scheme-level
  compact-open carrier, strong approximation, reduction theory, Tamagawa measure, or
  central-isogeny formula. This roadmap imports none of those names and supplies no placeholder
  replacement.
- **[SpinRepresentations](../RepresentationTheory/SpinRepresentations/README.md)** and Mathlib
  supply the Clifford-algebra representation theory and the algebraically closed low-rank
  exceptional isomorphisms. This roadmap owns their general-field orthogonal/spin arithmetic
  specialization.
- **[IntegralLattices](../IntegralLattices/README.md)** is the downstream consumer, not a
  prerequisite.

### Dependencies, by milestone

Every row names exact Lean declarations in the supplier. There is no README-only stand-in.

| Consumed | From | Used by |
| --- | --- | --- |
| Clifford, Lipschitz, Pin and Spin carriers; algebraically closed low-rank comparisons | Mathlib and SpinRepresentations | Layers 0, 1 |
| raw `Kˣ ⧸ Subgroup.square Kˣ`; reflection/Cartan--Dieudonné/Witt inputs; `hilbertSymbol`, `localHasse`, `hasseInvariant_eq_localHasse`; local classification | QuadraticFormInvariants | Layers 0--3 |
| `normalizedValuation`, `unitFiltration`, `square_eq_range_powMonoidHom`, `isOpen_range_powMonoidHom`, square-class counts, `unitFiltration_le_range_powMonoidHom_two`, `not_unitFiltration_le_range_powMonoidHom_two`, `absoluteRamificationIndex` | LocalFieldsRamification | Layers 2, 3 |
| `RestrictedProducts.integralSubgroup`, `restrictedProductMap`, `restrictedProductMapOfForall`, `restrictedProductCongr`, `rationalDiagonal`, `restrictAway`, `RestrictedProductGroup`, `RestrictedProductGroupAway`, `RestrictedProductGroupWithFactor` | RestrictedProducts | Layer 3 |

Two named successors sit downstream and neither is a current import.
`OrthogonalTamagawaAndLatticeMass` owns the strong-approximation and Tamagawa applications; its
contract is the short section at the end of this document. `AlgebrasWithInvolution` owns central
simple algebras with involution, the reduced norm, and the groups `U(A, σ)`, `Sp(A, σ)` and
`SU(A, σ)`; what this roadmap defers to it is exactly the dimension-six identification of 1F.

## What is missing (build here)

This roadmap builds only the orthogonal/spin-specific material: the determinant and reflection
calculus for `O(Q)` and `SO(Q)`; the description of Mathlib's Lipschitz carrier as the products of
anisotropic vectors, and the membership of the scalar units in it; the reverse Clifford norm and
its three comparisons with Mathlib's `star`-unitary Pin and Spin; the general-field spinor norm and
the exact kernel/image comparison for `Spin → SO`; the unitary group of the even Clifford algebra
and its identification with `Spin` in dimensions at most five; orthogonal transvections and their
canonical Clifford lifts; the local topological point groups and the local spinor-norm table by
field, dimension and signature; localization and base-change maps; the integral compact-open family
of a basis; compatible compact-open data with the openness and almost-everywhere value of its
reference images; and the specialized adelic point groups, diagonals, componentwise maps, and
spinor norm built from the exact generic API.

It does not build generic restricted products, rational diagonals, reduction theory, general
strong approximation, invariant differential measures, or general Tamagawa numbers, nor the reduced
norm of a central simple algebra and the group `SU(A, σ)` that the dimension-six low-rank
identification needs. The first two are current `RestrictedProducts` exports; the rest belong to
the two named successors. `Suggested.lean` imports and uses every Lean-level supplier declaration
currently needed and contains no theorem whose type assumes a missing strong-approximation,
Tamagawa or reduced-norm contract.

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
`O(Q) →* O(Q ⊗ L)`, compatible with composition of extensions; an orthogonal direct sum gives
`O(Q₁) × O(Q₂) ↪ O(Q₁ ⊞ Q₂)` whose **image is exactly the subgroup preserving each summand**,
stated as that equality rather than as an unidentified obstruction. Any criterion for the embedding
to be onto is a separate statement with its own hypotheses, and none is claimed here. Each of these
carries its determinant compatibility, so the same statements hold for `SO`. This is the machinery
every later layer localizes with.

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
Layer 1: Cartan–Dieudonné. Internal: 0A, 0D, 0E, 0F.

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
difference survives passage to square classes, since `[Q v]` and `[-Q v]` differ by `[-1]`, which
is nontrivial over ℚ and over `ℚ_p`; the two conventions genuinely disagree on `O(Q)` at odd
reflection length and agree on `SO(Q)`. Because 1E nevertheless states its exact sequence about
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
conjugation preserves `V`" Clifford group holds in one direction only, the converse being an open
TODO. So no statement here may be inherited from the classical theory of the latter group: every
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

Beside them, the bridge `spinorNorm_vectorRepresentation`: the spinor norm of the isometry induced
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
  - `E ≅ K × K` split: `C₀` is a product of two quaternion algebras over `K` and `U(C₀, σ)` has
    two `K`-almost-simple factors, each of `K`-rank one;
  - `E` a quadratic field: `C₀` is a quaternion algebra over `E`, and `U(C₀, σ)` is the
    restriction of scalars from `E` to `K` of its norm-one group, which is `K`-almost-simple and
    **not** a product of two `K`-factors.
  Conflating the two is conflating geometric factors with `K`-almost-simple factors.
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
  The reduced norm of a degree-four central simple algebra exists in neither Mathlib nor any Tau
  Ceti roadmap, so `SU(C₀, σ)` has no carrier and `Spin_Q ≅ SU(C₀, σ)` is a milestone of
  **`AlgebrasWithInvolution`**, which owns the reduced norm, the classification of involutions by
  kind and type, and the groups `U(A, σ)`, `Sp(A, σ)` and `SU(A, σ)` with their functoriality.

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
a separate theorem; that `Module.End K V`, `V ≃ₗ[K] V` and `CliffordAlgebra Q` carry it, the last
needing finite-dimensionality of the Clifford algebra, that is the Poincaré–Birkhoff–Witt
statement `dim = 2^n`, recorded in the dependency table as an input; that it is Hausdorff and
locally compact in this setting; and that every linear map between finite-dimensional spaces is
continuous for it, which is what makes base change and change of basis continuous.

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
`spinorNorm_range_orthogonal_eq_sup`: in positive dimension `O(Q)` is `SO(Q)` together with any one
reflection, so `θ(O)` is `θ(SO)` joined with the class of `Q v`. That is why the two columns can
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

**3B. Imported generic restricted-product substrate.** This is a dependency checkpoint, not an
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
restricted product over the finite places outside `S`, so that at `S = {∞}` it is `G(𝔸_f)` on the
nose rather than up to an identification. For **each** of `O`, `SO` and `Spin`, relative to a
compatible tuple: finite adelic points, points away from `S`, and full adelic points. Then the
restrictions `G(𝔸_f) → G(𝔸^S)`, the projections out of `G(𝔸)`, and the componentwise maps
`Spin(V)(𝔸_•) → SO(V)(𝔸_•) → O(V)(𝔸_•)` in all three flavours, obtained from 3B's functoriality
applied to `spinToSpecialOrthogonal` and `specialOrthogonalToOrthogonal` with 3C's compatibility.
⚠ All three groups are built and not just `O`. The approximation application in
`OrthogonalTamagawaAndLatticeMass` is a theorem about `Spin` transported to `SO`, and its measure
application is about `SO`; constructing only `O` would supply neither interface.

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
no lattice arithmetic. Its carrier is `integralOrthogonalSubgroup`, cut out **as data** by
integrality of the matrix entries of an isometry and of its inverse in the base-changed basis — one
condition alone gives a submonoid and not a subgroup — with its openness, its compactness, and
`eventually_mem_integralOrthogonalSubgroup`, which is `eventually_mem_orth` discharged rather than
assumed. It is also the family 3C's reference-image identification is stated for.

The diagonal map is built for each of the three groups, and for each of the three flavours of 3D:
for `O` and for `Spin` from the two integrality hypotheses of 3C, and for `SO` from `O`'s, since a
rational proper isometry lying in `U_p^O` lies in `U_p^{SO}`. Each comes with its evaluation rule
and its injectivity, and the square `Spin(V)(ℚ) → Spin(V)(𝔸_f) → SO(V)(𝔸_f)` against
`Spin(V)(ℚ) → SO(V)(ℚ) → SO(V)(𝔸_f)` commutes, which lets `OrthogonalTamagawaAndLatticeMass`
speak of "the image of the rational spin points in adelic `SO`" without saying which of the two
routes is meant.

Then, and the contrast is the point: `G(ℚ)` is **discrete in `G(𝔸)`**, the full adeles, once the
real place is included. It is **not** discrete in `G(𝔸_f)`, and the roadmap records the
counterexample rather than leaving the distinction to be discovered: for a split rational
quadratic space of dimension at least three, take integral `u` and `w` and the rational
one-parameter family `t ↦ E_{u,tw}` of 2C; inside any basic finite-adelic neighbourhood of the
identity, a nonzero integer `t` divisible by a high enough power of each of the finitely many
constrained primes gives a transvection that is integral at every other prime and arbitrarily
close to the identity at the constrained ones. So the diagonal image accumulates at the identity.
This supplies the rejection test a density theorem must respect.

**3F. The adelic spinor norm, on `SO`.** The restricted product of the local square-class groups
relative to the reference subgroups `θ_p(U_p^{SO})` of 3C; the theorem that the componentwise local
spinor norms induce a continuous homomorphism `SO(V)(𝔸_f) → ∏' ℚ_p^×/(ℚ_p^×)²` into it,
**together with its evaluation rule**, that the `p`-component of the value is the local spinor norm
of the `p`-component of the argument; and the **adelic spinor kernel** as its kernel. Three things
are pinned here rather than left to an implementer.

- There is no such thing as "the restricted product of the local square-class groups" until the
  reference subgroups are fixed; several inequivalent choices exist, and the one used here is
  `θ_p(U_p^{SO})`.
- ⚠ The domain is adelic **`SO`**, not adelic `O`. The reference subgroups are the images of the
  `U_p^{SO}`, and an improper element of `U_p^O` has no reason to have local spinor norm inside
  `θ_p(U_p^{SO})`, so a map out of adelic `O` would not land in the stated codomain.
- ⚠ The evaluation rule is part of the milestone. A homomorphism into that restricted product with
  no rule relating its components to the local spinor norms is satisfied by the trivial
  homomorphism, and every theorem stated about its kernel would then be a theorem about the whole
  group.

**3G. Double cosets, with the maps stated separately.** The set `G(ℚ) \ G(𝔸_f) / U`, with three
distinct comparison statements rather than one blanket change-of-`U` map, since eventually equal
reference families give canonically equivalent ambient groups but do **not** automatically give a
canonical bijection of double-coset sets: an inclusion `U ≤ U'` of compact opens induces a
surjection of double-coset sets in the corresponding direction; conjugate compact opens induce a
canonical bijection; and a componentwise equivalence carrying one tuple to another transports the
double-coset set along 3B's canonical equivalence. Finiteness of the set is not claimed here.

**3H. Explicit stop point.** RestrictedProducts exports none of the norm-one subgroup,
reduction theory, finite-covolume theorem, strong approximation, or Tamagawa infrastructure. This
roadmap therefore stops after the specialized point groups, diagonals, and adelic spinor norm. It
states no generic finite-covolume or density theorem and no orthogonal application of one.

## Consumer contract for `OrthogonalTamagawaAndLatticeMass`

Layers 0 to 3 expose all three point groups and the spinor-kernel API because one named successor
consumes them: **`OrthogonalTamagawaAndLatticeMass`**, which owns the orthogonal applications of
strong approximation and of Tamagawa theory, the orthogonal Tamagawa numbers, the mass formula, and
the genus/spinor-genus comparison. None of that is a milestone here, and none of it may be promoted
back into this roadmap. The contract is short, and it is the whole of what the two roadmaps agree
on.

**What this roadmap exports to it**, by exact name: `transvection` and `transvectionLiftHom`, the
root subgroups of 2C; `spinorNorm` with its local table 2F–2G and its localization 2H;
`finiteAdelicOrthogonal`, `finiteAdelicSpecialOrthogonal`, `finiteAdelicSpin` and their away-`S`
and full-adelic forms, with the componentwise maps and the diagonals of 3D–3E; `adelicSpinorNorm`
with its evaluation rule and `adelicSpinorKernel`; `unitSquareClasses` with the reference-image
theorems of 3C; and the double-coset comparisons of 3G.

**What the successor must import before it may state anything**, and may not replace by a local
stand-in: an algebraic-group point functor and the almost-simple-factor API from Reductive Groups;
a generic strong-approximation theorem and the reduction-theory stages from
`AlgebraicGroupStrongApproximation` and `ArithmeticReductionTheory`; a Tamagawa measure, a
finite-covolume theorem, the simply connected semisimple value, and the central-isogeny defect
formula from `TamagawaMeasures`; `ClassFieldTheory.hilbertProductFormula`; and
`GlobalQuadraticForms.hasseMinkowski_equivalent`.

**What it then proves**, listed so that the interface above can be checked against a use: that the
orthogonal root subgroups generate the elementary subgroup of `Spin(V)(K)`; that the
noncompact-place condition of the imported theorem is equivalent to noncompactness of every
almost-simple factor at a place of `S` — ⚠ a noncompact-*place* condition, not a synonym for
indefiniteness, since a positive-definite rational form may satisfy it at a finite place; the
resulting density of the rational spin points in `Spin(V)(𝔸^S)` for `dim V ≥ 3`, dimension two
being excluded because `Spin(V)` is then a one-dimensional torus and the statement is false; that
the closure of the rational spin image inside adelic `SO` is exactly the adelic spinor kernel and
**not** the closure of all rational `O`-points, a rational reflection of nonsquare spinor norm
lying in the larger image and outside the kernel; the orthogonal gauge forms and Tamagawa
measures; and `τ(SO_Q) = 2` for `dim V ≥ 3`, with the low-dimensional values `2` for a nonsplit
binary form, `1` for a split one, and `1` in dimensions one and zero, which are the guard the
integral lattices roadmap's Conway–Sloane normalization records in its own low-rank branch.

⚠ Two ownership facts that a reader of the successor will otherwise get wrong.
`Ш¹(ℚ, SO_Q) = 1` is not a formality: it is the Hasse principle for quadratic forms, consumed by
exact name as `GlobalQuadraticForms.hasseMinkowski_equivalent`, and translating it into a
pointed-set statement is the successor's work, because that supplier defines no `H¹(K, SO(Q))`.
And the central-isogeny computation is instantiated from the imported defect formula, never
restated as a generic Ono ratio.

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
(1F); the local topological point groups (2A, 2B); the transvections and their Spin lifts (2C);
`integralOrthogonalSubgroup` (3E); the compatible compact-open data, `unitSquareClasses`, and the
three adelic point groups (3C, 3D); the adelic spinor norm and the adelic spinor kernel (3F).

## Worked examples (acceptance criteria)

Discharge these alongside their layers. Each catches a vacuous definition, a wrong sign, or a
convention drift.

- The two reflection spellings agree: `B x v / Q v = 2 · B x v / B v v` for `Q v ≠ 0`, and
  `τ_v v = -v` computed from either. The mixed form `2 · B x v / Q v` gives `-3v`, and that is the
  error the convention table warns against (Layer 0D).
- Dimension one, `Q x = a x²` for `a ∈ Kˣ`: `O(Q) = {±1}`, `SO(Q)` is trivial, `-1` is the
  reflection in any `v ≠ 0`, and `θ(-1) = [a]`, which is nontrivial exactly when `a` is not a
  square. ⚠ The scalar has to be carried: for `Q x = x²` one gets `Q v = v²` and `θ(-1) = [1]`,
  so that instance is the degenerate one and tests nothing. With `a` a nonsquare this is the
  acceptance check that the square class detects `-1` and hence that the `reverse` and `star`
  norms of 1A really do differ on `O(Q)` (Layers 0, 1).
- The hyperbolic plane over any `K`: `SO(H) ≅ Kˣ` through the diagonal torus and `θ` on that torus
  is the square class of the parameter, so `θ : SO(H)(K) → Kˣ/(Kˣ)²` is **surjective**; the image
  of `Spin(H)(K) → SO(H)(K)` is the square-parameter subgroup, which is `ker θ`, so
  `Spin(H)(K) → SO(H)(K)` is **not** surjective. The sequence of 1E extended by `→ 1` is therefore
  exact here, and what fails is the naive expectation that a central isogeny is onto on `K`-points
  (Layers 0, 1).
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
- Dimension four, split against nonsplit: a quaternary form with split discriminant algebra, whose
  `Spin` has two factors after base change, beside one whose discriminant algebra is a quadratic
  field, whose `Spin` has one. This tests the distinction 1F draws (Layer 1F).
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

The current supplier order is fixed by the portfolio DAG:

    LocalFieldsRamification, QuadraticFormInvariants,
    RestrictedProducts → OrthogonalSpinGroups.

Within this roadmap, Layers 0 and 1 establish the algebraic orthogonal/spin API and exact
spinor-kernel sequence. Layer 2 builds the orthogonal local specialization and transvections.
Layer 3 instantiates imported adelic carriers and maps and constructs the adelic spinor norm.
That is the end of this PR's current scope.

`OrthogonalTamagawaAndLatticeMass` branches after Layer 3 and behind Reductive Groups and the
generic successors named in its contract; `AlgebrasWithInvolution` branches after Layer 1 and is
independent of everything adelic. IntegralLattices may consume only the interfaces that have
actually landed; its Eichler and mass-formula applications wait for the first of those two.

## References

- E. Artin, *Geometric Algebra*, Interscience (1957). Chapter III for reflections, the
  transitivity computation of 0E and Cartan–Dieudonné.
- O. T. O'Meara, *Introduction to Quadratic Forms*, Grundlehren 117, Springer (1963; corrected
  1973), PRIMARY. §43 the orthogonal group and reflections; §55 the spinor norm, its
  well-definedness and the local computations of 2F, with 55:6 the local surjectivity in dimension
  at least three; §101 the adelic setting; 104:4 strong approximation for the spin group, which is
  `OrthogonalTamagawaAndLatticeMass`'s. ⚠ His Hasse symbol convention is `∏_{i≤j}`, translated
  per the quadratic form invariants roadmap's table. (104:5, Eichler's theorem for lattice
  classes, is the integral lattices roadmap's.)
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
  `τ(SO) = 2` from `τ(Spin) = 1` targeted by `OrthogonalTamagawaAndLatticeMass`.
- J. W. S. Cassels, A. Fröhlich (eds.), *Algebraic Number Theory*, Academic Press (1967). The
  adelic and product-formula background.
- J.-P. Serre, *A Course in Arithmetic*, GTM 7, Springer (1973), Chapter IV. The local and global
  square-class background in the form the sibling roadmaps use.
