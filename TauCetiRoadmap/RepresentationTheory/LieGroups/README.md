# Roadmap: Lie groups and the Lie algebra correspondence

**Summary.** A Lie group is a group that is a smooth manifold on which multiplication and inversion
are smooth; its Lie algebra 𝔤 is the space of left-invariant vector fields, or equivalently the
tangent space at the identity, with the bracket of vector fields. This roadmap builds the theory
that ties a real finite-dimensional Lie group `G` to `𝔤`: the exponential map `𝔤 → G`, the adjoint
representations, closed and immersed subgroups, the Lie functor and its inverse, and then the
structure theory of compact and of real reductive Lie groups, with the matrix groups and the circle
as the running examples. Every statement is about a real Lie group modelled on a
finite-dimensional space, smooth, Hausdorff and without boundary; compactness, connectedness and
reductivity are assumed statement by statement, and complex Lie groups appear from Layer 7 on.

The first headline is Lie's correspondence. Every finite-dimensional real Lie algebra is the Lie
algebra of a simply connected Lie group. If `G` is simply connected, every Lie-algebra homomorphism
`𝔤 → 𝔤'` is the differential of exactly one smooth homomorphism `G → G'`, so simply connected Lie
groups and finite-dimensional real Lie algebras are equivalent categories. Every Lie subalgebra of
`𝔤` is the Lie algebra of a connected immersed Lie subgroup, which may be dense, as the irrational
line in a torus shows.

The second is the structure of compact groups. In a compact connected Lie group `G` all maximal
tori are conjugate, every element lies in one, and the exponential map is onto. For a maximal
torus `T` with Weyl group `W = N(T)/T` and a continuous class function `f`, the Weyl integration
formula `∫_G f = |W|⁻¹ ∫_T f(t) D(t) dt` holds for the normalized Haar measures, with
`D(t) = |det(Ad(t⁻¹) − 1)|` on `𝔤/Lie(T)`; for `SU(2)` this is `4 sin²θ` on `diag(e^{iθ}, e^{−iθ})`.

The third concerns complexification and real groups. Every connected Lie group has a universal
complexification; for compact `G` the map to it is injective and every finite-dimensional continuous
representation of `G` extends to a holomorphic representation of it, so that `U(n)` complexifies
to `GL_n(ℂ)`. A real reductive group with a Cartan involution `θ` and `K = G^θ` is `K × exp 𝔭`
with unique factors, and it has the Iwasawa decomposition `G = KAN` and the decomposition
`G = K exp(𝔞̄₊) K`; for `GL_n(ℝ)` these are the polar decomposition and Gram–Schmidt. On the
flag manifold of a complex reductive group the Borel–Weil theorem realizes the irreducible
representations as spaces of holomorphic sections.

The roadmap sits between several others. It supplies
[CompactGroups](../CompactGroups/README.md) with the general maximal-torus reduction that roadmap
carries out by hand for `SU(2)`, and consumes from it the normalized Haar measure, Peter–Weyl and
characters. [LieHighestWeight](../LieHighestWeight/README.md) supplies the highest-weight modules
`L(λ)` and the Serre presentation that Borel–Weil and the compact real forms use.
[ReductiveGroups](../../ReductiveGroups/README.md) supplies the algebraic groups over `ℂ` and the
generic Bruhat decomposition for the flag manifolds. [DifferentialGeometry](../../DifferentialGeometry/README.md)
supplies the Frobenius theorem, Sard's theorem and the mapping degree used by the integration
theorems and by torus conjugacy, and [AdoIwasawa](../AdoIwasawa/README.md) supplies Ado's theorem,
from which Lie's third theorem follows.

Layers 0 to 3 differentiate: the exponential map, the adjoint representations, the
closed-subgroup theorem and the Lie functor with the Baker–Campbell–Hausdorff series. Layers 4 and 5
integrate: Frobenius, Lie's third theorem, the equivalence of categories, universal covers, centres
and the enveloping algebra. Layers 5A to 9 are the structure theory: the invariant metric of a
compact group, maximal tori and Weyl integration, complexification and real forms, Borel–Weil and
Bruhat, and the Cartan, Iwasawa and `KAK` decompositions. The next section gives the order.

## How to read the build

The layers come in three groups, ordered by their *Needs:* lines: a target uses only its own and earlier
layers, except that Lie's third theorem (§4.2) and the counit of the adjunction of §4.3 use the
construction of the universal cover in §5.1, which does not depend on Layer 4.

- **The Lie functor, from groups to algebras (Layers 0–3).** Layer 0 fixes the Lie algebra, the
  exponential map and one-parameter subgroups; Layer 1 the adjoint representations and the
  left-trivialized derivative of the exponential; Layer 2 the Lie algebra of an arbitrary subgroup,
  the closed-subgroup theorem, the matrix groups under Mathlib's names and the simple connectedness
  of `SU(2)`; Layer 3 the Lie functor and the Baker–Campbell–Hausdorff series. These four layers
  form a self-contained first block.
- **Integration, from algebras to groups (Layers 4–5).** Layer 4 integrates Lie subalgebras to
  connected immersed subgroups (Frobenius), proves Lie's third theorem and the equivalence of
  categories. Layer 5 treats universal covers, centres and adjoint groups, the global
  Baker–Campbell–Hausdorff coordinates of nilpotent groups, and the enveloping algebra. Inside
  this block the universal-cover construction comes first, since Lie's third theorem uses it.
- **Compact and reductive structure (Layers 5A–9).** Layer 5A builds the `Ad`-invariant inner
  product of a compact group and the splitting of its Lie algebra. Layer 6 proves the maximal-torus
  theorems, constructs the compact root system and the Weyl group, and proves the Weyl integration
  formula. Layer 7 constructs complexifications, compact real forms, real forms of complex groups,
  the central torus and derived subgroup of the complex Lie group of a complex reductive algebraic
  group, and the compact–algebraic comparison. Layer 8 builds flag manifolds, associated line
  bundles, Bruhat cells and the Borel–Weil–Bott theorem. Layer 9 builds the global matrix models of
  real reductive groups and proves the Cartan, Iwasawa and `KAK` decompositions.

Layer `5A` sits between Layers 5 and 6 and is labelled with a letter; its section is `5A.1`. Each
layer ends with its examples and its dependencies, and a `*Needs:*` line under each target lists
what its statement and its route use, so that a target proved another way is not held behind an
unrelated layer. The layers are far from uniform in size: each of Layers 6
to 9 rests on large bodies of complex geometry, homogeneous spaces, sheaf cohomology and
real-reductive structure, and completing Layers 0 to 3 makes their statements expressible rather
than cheap.

This README is the roadmap. [Suggested.lean](Suggested.lean) is its acceptance test: it states,
each with `sorry`, the headline theorems that are statable against the pinned Mathlib and Tau
Ceti, with the few definitions their statements need, and its module docstring names the headlines
that are not statable at the pins and those the pinned library proves.

## Conventions

- **The group and its settings.** A Lie group is Mathlib's `LieGroup I n G`: a `Group G` that is a
  `C^n` manifold on a model `I : ModelWithCorners ℝ E H` with `C^n` multiplication and inversion.
  The standing setting is a real, finite-dimensional, smooth Lie group: `[FiniteDimensional ℝ E]`,
  `[LieGroup I ∞ G]`, `[T2Space G]` and `[BoundarylessManifold I G]` (the last two hold for every
  Lie group, by Tau Ceti's `ModelWithCorners.t2Space_of_lieGroup` and `ContMDiffMul.boundarylessManifold`,
  and are carried explicitly where a declaration uses them). Finite-dimensionality is the standing
  hypothesis of every layer; Banach–Lie groups are outside this roadmap. Above that floor each
  result states the hypotheses it uses: the structure theory of Layers 5A and 6 adds
  `[CompactSpace G]` and `[ConnectedSpace G]`, the reductive statements a complex or a real
  reductive hypothesis. Do not bundle "real, finite-dimensional, compact, connected, semisimple"
  into one class: spell the hypotheses each theorem uses. Complexifications and real forms are
  complex Lie groups (base field `ℂ`), introduced in Layer 7 and named as such.
- **Real and complex Lie-algebra carriers.** For a real group the Lie algebra `𝔤` is Mathlib's
  `LeftInvariantDerivation I G` with its commutator bracket over `ℝ`, compared with the tangent
  Lie algebra `GroupLieAlgebra I G` at `1` by Tau Ceti's `leftInvariantDerivationEquivGroupLieAlgebra`
  and `leftInvariantDerivationLieEquivGroupLieAlgebra`. Its finite-dimensionality is
  `finiteDimensional_leftInvariantDerivation`, registered in the acceptance file as the instance
  `instFiniteDimensionalLeftInvariantDerivation`. For a complex Lie group `H` the Lie algebra is
  `GroupLieAlgebra Ic H` for a finite-dimensional complex model `Ic` and `LieGroup Ic ∞ H`, not
  derivations of global holomorphic functions (a compact complex torus has a nonzero tangent Lie
  algebra and only constant global holomorphic functions); `LieGroup Ic (minSmoothness ℂ 3) H`,
  which Mathlib's bracket on `GroupLieAlgebra` requires, comes from `LieGroup.of_le`, and
  completeness of the model from finite-dimensionality. Layer 7 uses the model `𝓘(ℂ, E)` after
  the model transport of ComplexManifolds Milestone 1 where needed, and writes `I_R` for the
  realified model on the same carrier that Milestone 1 provides. The complex `Lie(H)` always means
  this tangent Lie algebra, compared after restriction of scalars with the real derivation algebra
  of the realification.
- **The exponential map.** `lieExp : 𝔤 → G` is Tau Ceti's `lieExp`, the time-one value of the
  invariant integral curve, under the standing hypotheses (finite-dimensional real model, smooth
  Lie group, `T2Space`, boundaryless). The flow theory behind invariant integral curves (the
  maximal flow of a vector field with its jointly open domain, joint smoothness and group law, and
  the fundamental theorem of flows, Lee, *Introduction to Smooth Manifolds*, Thm. 9.12) is
  [DifferentialGeometry](../../DifferentialGeometry/README.md) Layer 3 (its 3.2, with Tau Ceti's
  `TauCeti.flowOf`, and 3.3, which reconciles the flow with the invariant integral curves). Keep the arbitrary model-with-corners scope of
  later statements separate from this boundaryless interface. On the units `Rˣ` of a
  finite-dimensional real normed algebra the exponential is compared with `NormedSpace.exp`, on
  matrix groups with `NormedSpace.exp` on matrices (Mathlib has no separate matrix exponential
  function, only the `Matrix.exp_*` lemmas about `NormedSpace.exp`), and on the circle with
  `Circle.exp`; these coincidences are theorems, not definitions, and the matrix exponential is
  never redefined.
- **Matrix topology.** The general linear group `(Matrix n n ℝ)ˣ` is a real Lie group through
  Mathlib's instance on the units of a normed algebra, for a matrix norm; Tau Ceti's matrix
  statements use Mathlib's scoped `L∞` operator norm (`Matrix.Norms.Operator`). In finite dimension
  every such norm induces the entrywise topology, so a consumer using another norm transports along
  the instance choice and nothing else changes.
- **The adjoint carriers.** The Lie-algebra adjoint is Mathlib's
  `LieAlgebra.ad ℝ 𝔤 : 𝔤 →ₗ⁅ℝ⁆ Module.End ℝ 𝔤`, with `LieAlgebra.ad_apply : ad x y = ⁅x, y⁆`. The group
  adjoint is Tau Ceti's `TauCeti.Lie.Ad : G → (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)`, the differential at `1` of conjugation
  `x ↦ g x g⁻¹`; `Ad g X = g X g⁻¹` on matrix groups.
- **Matrix groups.** The general statements are about abstract Lie groups; every one of them has a
  matrix-group form, kept beside it as [CompactGroups](../CompactGroups/README.md) keeps `SU(2)`
  beside the general compact group. The matrix groups are Mathlib's: `Matrix.GeneralLinearGroup`,
  `Matrix.SpecialLinearGroup`, `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`,
  `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`, `Matrix.symplecticGroup` and `Circle`;
  no private matrix group is introduced. Mathlib's unitary, orthogonal and symplectic groups are
  submonoids of the matrix ring; they enter the Lie theory as subgroups of the units through
  `Units.val` (Layer 2).
- **Root systems and Weyl groups.** For the reductive and complex structure theory the root system
  of a Killing Lie algebra is Mathlib's `LieAlgebra.IsKilling.rootSystem` and the abstract Weyl group
  is `RootPairing.weylGroup`, the province of [RootSystems](../RootSystems/README.md) and
  [LieHighestWeight](../LieHighestWeight/README.md). The geometric Weyl group `N(T)/T` of Layer 6 is
  Tau Ceti's `Subgroup.normalizerQuotient T` and is proved isomorphic to the abstract Weyl group, not
  reintroduced. The highest-weight modules `L(λ)` that Borel–Weil realizes are LieHighestWeight's,
  through Tau Ceti's `TauCeti.irreducibleQuotient`.
- **Haar measure and Peter–Weyl.** The Weyl integration formula (§6.9) is an identity of integrals
  against Haar probability measures; the normalized Haar probability, its bi-invariance, Peter–Weyl
  and the orthonormality of characters are [CompactGroups](../CompactGroups/README.md)'s (its
  §§0.1, 5.2 and 6.2), cited rather than rebuilt. This roadmap supplies the general maximal-torus
  reduction that CompactGroups proves only for `SU(2)`; specializing back to `SU(2)` recovers its
  §E.4.
- **Universes.** A target that quantifies over complex Lie groups, coefficient modules or
  representations (§§7.3, 7.6, 7.11) is stated for target groups in arbitrary universes: the group,
  charted-space and Lie-group structures, `GroupLieAlgebra` and the tangent equivalences are
  transported along `ULift` type copies, and the transports commute with the character, period and
  universality maps (§7.2). The acceptance file fixes the target universes to those of its source,
  which is a special case.
- **Names.** The acceptance file states its theorems in the namespace
  `TauCetiRoadmap.RepresentationTheory.LieGroups`; suggested homes for the code are
  `TauCeti/Geometry/Lie/` for the general theory and `TauCeti/Geometry/Lie/Matrix/` for the
  matrix groups, mirroring Mathlib's `Geometry/Manifold/Algebra/`.

## Layer 0: the exponential map and one-parameter subgroups

The exponential map and the one-parameter subgroups are Tau Ceti's, constructed from the invariant
integral curve evaluated at time one; this layer fixes the conventions, the facts used below and
their matrix and circle forms. The constructions need a finite-dimensional real model, a smooth
Lie group, `T2Space` and a boundaryless model, so that the identity is an interior point.

### 0.1 The Lie algebra and the tangent space at the identity

The Lie algebra of `G` is `𝔤 = LeftInvariantDerivation I G`. Evaluation at `1` followed by
Mathlib's identification of point derivations with tangent vectors (valid because `E` is
finite-dimensional and `G` is smooth) is the linear equivalence
`leftInvariantDerivationEquivGroupLieAlgebra : 𝔤 ≃ₗ[ℝ] GroupLieAlgebra I G`, under
`[FiniteDimensional ℝ E]`, `[ContMDiffMul I ∞ G]`, `[T2Space G]` and the interior-point hypothesis
at `1`; `leftInvariantDerivationLieEquivGroupLieAlgebra` is its Lie-algebra form. Its inverse is
`tangentToLeftInvariantDerivation`, the derivation that differentiates along the left-invariant
vector field of a tangent vector (`leftInvariantDerivationEquivGroupLieAlgebra_symm_apply`,
`tangentToLeftInvariantDerivation_apply`), so every left-invariant derivation is the derivation of
a left-invariant vector field. `finiteDimensional_leftInvariantDerivation` and
`finrank_leftInvariantDerivation_eq_modelVectorSpace` give `finrank ℝ 𝔤 = finrank ℝ E`; the
acceptance file registers the first as the instance `instFiniteDimensionalLeftInvariantDerivation`.
(Kirillov, Chs. 2–3.)
*Needs:* Mathlib `LeftInvariantDerivation`, `GroupLieAlgebra`; Tau Ceti as named.

**Checks.**
- For the vector group `G = ℝⁿ` the left-invariant derivations are the
  constant-coefficient first-order operators `∑ aᵢ ∂ᵢ`, the bracket is zero and `finrank 𝔤 = n`;
  a definition through all derivations of `C^∞(G)` would give an infinite-dimensional space.

### 0.2 The exponential map

`lieExp : 𝔤 → G` satisfies `lieExp X = γ_X(1)` for the invariant integral curve `γ_X` through `1`.
It is smooth (`contMDiff_lieExp`), it is a local diffeomorphism at `0`
(`isLocalDiffeomorphAt_lieExp_zero`), which gives the exponential chart at `1` and the local
logarithm `lieLog`, and in the identity chart its derivative at `0` is the canonical isometry of
`𝔤` with the model space (`hasFDerivAt_extChartAt_lieExp_zero`), the precise form of
"`d(exp)_0` is the identity". It is natural: for a smooth homomorphism `φ : G →* G'`,
`φ (lieExp X) = lieExp (lieMap φ X)` (`map_lieExp`, Layer 3). The subgroup generated by its image
is the identity component, and `G` itself when `G` is connected
(`TauCeti.closure_range_lieExp_eq_connectedComponentOfOne`, `TauCeti.closure_range_lieExp_eq_top`).
*Needs:* §0.1; Tau Ceti as named.

**Checks.**
- On the circle, under `circleLieAlgebraEquiv : Lie(Circle) ≃ₗ[ℝ] ℝ`, `lieExp` is `Circle.exp`,
  `t ↦ e^{it}` (`lieExp_circle`): it sends `2π` to `1`, so the exponential map need not be
  injective even for a compact connected abelian group.
- On `SL₂(ℝ)` the image of `lieExp` is not a subgroup and not all of the group: `diag(−2, −1/2)`
  is not an exponential (§5.3), although `SL₂(ℝ)` is connected and so generated by the image.

### 0.3 One-parameter subgroups

`oneParameterSubgroup X : Multiplicative ℝ →ₜ* G`, `t ↦ lieExp (t • X)`, is a continuous group
homomorphism with smooth underlying curve (`contMDiff_oneParameterSubgroup`):
`lieExp ((s + t) • X) = lieExp (s • X) * lieExp (t • X)` and `lieExp (0 • X) = 1`. Conversely every
continuous homomorphism `φ : Multiplicative ℝ →ₜ* G` is `oneParameterSubgroup X` for a unique `X`
(`existsUnique_eq_oneParameterSubgroup`; Kirillov, online author copy, Prop. 3.1, for smooth
homomorphisms), so a continuous one-parameter subgroup is automatically smooth and
`Hom_cont(ℝ, G) ≃ 𝔤`; this bijection is the justification of the definition of `𝔤`.
*Needs:* §0.2; Tau Ceti as named.

**Checks.**
- The classification needs continuity: an additive map `ℝ → ℝ` that is `ℚ`-linear but not
  `ℝ`-linear (one exists by a Hamel basis) is a homomorphism `(ℝ, +) → (ℝ, +)` not of the form
  `t ↦ tX`.

### 0.4 The matrix and circle forms

For a finite-dimensional real normed algebra `R`, `unitsLieAlgebraEquiv` identifies `Lie(Rˣ)` with
`R` and `lieExp_eq_expUnit` identifies `lieExp` on `Rˣ` with the unit exponential `TauCeti.expUnit`,
whose value is `NormedSpace.exp`. The complete-normed-algebra `TauCeti.expUnit`, its one-parameter
subgroup `TauCeti.expUnitHom` and their series laws hold under their own, more general, hypotheses;
these do not assert an unrestricted Banach derivation–tangent equivalence. On `GL_n(ℝ)` the value
is `NormedSpace.exp` on matrices (`lieExp_generalLinearGroup_coe`), and it inherits Mathlib's
`Matrix.exp_diagonal`, `Matrix.exp_transpose` and `Matrix.exp_conj` as
`lieExp_generalLinearGroup_diagonal`, `lieExp_generalLinearGroup_transpose` and
`lieExp_generalLinearGroup_units_conj`; on the circle it is `Circle.exp` (`lieExp_circle`), with
`Circle.exp_add` the one-parameter-subgroup law.
(Hall, Chs. 2–5.)
*Needs:* §0.2; Mathlib `NormedSpace.exp`, the `Matrix.exp_*` lemmas, `Circle.exp`; Tau Ceti as
named.

**Checks.**
- In `GL₂(ℝ)`, `X = [[0, −π], [π, 0]]` has `lieExp X = exp X = −1` (rotation by `π`); the entrywise
  exponential would give `[[1, e^{−π}], [e^{π}, 1]]`, which is not even orthogonal.
- In `GL₂(ℝ)`, `X = diag(1, 0)` and `Y = E₁₂` do not commute, and
  `exp(X + Y) = [[e, e − 1], [0, 1]] ≠ exp X · exp Y = [[e, e], [0, 1]]`: the addition law
  `Matrix.exp_add_of_commute` needs its commutation hypothesis.

### Examples

- `GL_n(ℝ) = Matrix.GeneralLinearGroup (Fin n) ℝ` has `Lie(GL_n) = Matrix (Fin n) (Fin n) ℝ` and
  `lieExp = NormedSpace.exp` on matrices.
- `Circle` has `Lie(Circle) ≅ ℝ` and `lieExp = Circle.exp`.
- For `ℝⁿ` the exponential is the identity of `ℝⁿ`.

### Dependencies

Mathlib: `LieGroup`, `LeftInvariantDerivation`, `GroupLieAlgebra`, `NormedSpace.exp`, the
`Matrix.exp_*` lemmas, `Circle.exp`. Tau Ceti: the derivation–tangent comparison, `lieExp`,
`lieLog`, `oneParameterSubgroup` and the comparisons named above. DifferentialGeometry Layer 3 for
the flow theory. Nothing of Layers 1–9 is used.

## Layer 1: the adjoint representations `Ad` and `ad`

### 1.1 The group adjoint

`TauCeti.Lie.Ad : G → (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)` is the differential at `1` of conjugation `c_g : x ↦ g x g⁻¹`,
transported from the tangent adjoint `TauCeti.Lie.tangentAd` through
`leftInvariantDerivationLieEquivGroupLieAlgebra`, with `TauCeti.Lie.Ad_one`, `TauCeti.Lie.Ad_mul`
and `TauCeti.Lie.Ad_inv`. It is a smooth representation of `G` on `𝔤`, the adjoint representation:
`TauCeti.Lie.continuousAdjointRepresentation`, `TauCeti.Lie.contMDiff_continuousAdjointRepresentation`
and the joint smoothness `TauCeti.Lie.contMDiff_Ad_apply`. On the units `Rˣ` of a finite-dimensional
real normed algebra it is conjugation, `Ad g X = g X g⁻¹`, read through
`TauCeti.Lie.unitsLieAlgebraLieEquiv` (`TauCeti.Lie.unitsLieAlgebraEquiv_Ad`).
(Kirillov, Chs. 2–3; Hall, Chs. 2–5.)
*Needs:* Layer 0; Tau Ceti as named.

**Checks.**
- In `GL₂(ℝ)` with `g = diag(2, 1)` and `X = E₁₂`, `Ad g X = g X g⁻¹ = 2 E₁₂`. The opposite
  convention `g⁻¹ X g` gives `½ E₁₂` and is an anti-homomorphism, `(gh)⁻¹ X (gh) ≠ g⁻¹(h⁻¹ X h)g`
  in general, so `Ad_mul` would fail.
- For abelian `G` (a torus, `ℝⁿ`) `Ad` is trivial; for `G = SU(2)`, `Ad` maps onto the rotations
  `SO(3)` of `𝔰𝔲(2) ≅ ℝ³` with kernel `{±1}`.

### 1.2 The infinitesimal adjoint

The Lie-algebra adjoint is `LieAlgebra.ad ℝ 𝔤`, `ad X = ⁅X, ·⁆`, and it is the derivative of `Ad`:
`TauCeti.Lie.mfderiv_Ad_apply_one` and `TauCeti.Lie.mfderiv_continuousAdjointRepresentation_one`
prove `d(Ad)_1 X = ad X` on the derivation carrier, and `TauCeti.Lie.hasDerivAt_Ad_lieExp_smul_apply_zero`
is its orbit form: `s ↦ Ad (lieExp (s • X)) Y` has derivative `⁅X, Y⁆` at `s = 0`. This is the
geometric meaning of the bracket (Kirillov, online author copy, Lemma 3.14(1)).
*Needs:* §1.1; Mathlib `LieAlgebra.ad`; Tau Ceti as named.

**Checks.**
- In `GL_n(ℝ)`, `d/ds|₀ exp(sX) Y exp(−sX) = XY − YX`, which is `ad X Y` for the commutator bracket
  that `TauCeti.Lie.unitsLieAlgebraLieEquiv` puts on the matrices
  (`TauCeti.Lie.groupLieAlgebra_units_ad_apply`); conjugating the other way, `exp(−sX) Y exp(sX)`,
  would give `YX − XY = −ad X Y`.

### 1.3 Conjugation and the exponential

Conjugation and the exponential commute: `g · lieExp X · g⁻¹ = lieExp (Ad g X)`
(`TauCeti.Lie.conj_lieExp`). The adjoint of an exponential is the operator exponential of the
adjoint, `Ad (lieExp X) = exp (ad X)`, as bounded operators on `𝔤`
(`LeftInvariantDerivation.Ad_lieExp`, with its pointwise form `LeftInvariantDerivation.Ad_lieExp_apply`)
and on the tangent carrier (`TauCeti.Lie.tangentAd_mulInvariantExp_apply`); on algebra units it is
`TauCeti.Lie.tangentAd_expUnit`, with no finite-dimensionality hypothesis. As consequences,
derivations that bracket to zero have commuting exponentials and
`lieExp (X + Y) = lieExp X * lieExp Y` for them (`TauCeti.Lie.commute_lieExp_of_lie_eq_zero`,
`TauCeti.Lie.lieExp_add_of_lie_eq_zero`).
(Hall, Chs. 2–5.)
*Needs:* §§1.1–1.2; Mathlib `NormedSpace.exp`; Tau Ceti as named.

**Checks.**
- In `GL₂(ℝ)` with `X = diag(1, 0)` and `Y = E₁₂`, `ad X Y = Y`, so `exp(ad X) Y = e Y`, and
  `Ad(exp X) Y = diag(e, 1) E₁₂ diag(e⁻¹, 1) = e E₁₂`; the sign `exp(−ad X)` would give `e⁻¹ Y`.

### 1.4 The left-trivialized derivative of the exponential

For a complete real normed algebra `R` the Banach form is in Tau Ceti:
`TauCeti.Lie.banachDexpFactor_eq_integral_exp` writes the factor `(1 − exp(−ad x))/ad x` as the
Bochner integral `∫_{s∈[0,1]} exp(−s ad x) ds` on `R →L[ℝ] R`,
`TauCeti.Lie.fderiv_exp_apply_eq_exp_mul_integral` is the derivative formula
`d(exp)_x = L_{exp x} ∘ ∫_{s∈[0,1]} exp(−s ad x) ds`, and
`TauCeti.Lie.fderiv_lieExp_units_coe_eq_exp_mul_banachDexpFactor` is its `lieExp` form on `Rˣ`.
Prove the Lie-group form `mfderiv_lieExp_eq_integral`: for every finite-dimensional real Lie group
`G` (standing hypotheses) and every `X ∈ 𝔤`, the derivative of `lieExp` at `X`, read through
`leftInvariantDerivationEquivGroupLieAlgebra`, is `d(L_{lieExp X})_1 ∘ ∫_{s∈[0,1]} exp(−s ad X) ds`,
where `L_g` is left multiplication by `g` and the operator integral is the Bochner integral on
`𝔤 →L[ℝ] 𝔤`; so the notation `(1 − exp(−ad X))/ad X` means this operator also where `ad X` is
singular. Route: the variation of the invariant integral curve, or the units case transported along
a faithful local chart (Hall, *Lie Groups, Lie Algebras, and Representations*, 2nd ed., Thm. 5.4
for the matrix case).
*Needs:* §§0.1–0.2, §1.2; Mathlib `mfderiv`, `intervalIntegral`, `NormedSpace.exp`; Tau Ceti
`leftInvariantDerivationEquivGroupLieAlgebra` and, for the transport route, the Banach forms named
above.

**Checks.**
- `ad X = 0` (an abelian group, or any central `X`): the integral is the identity and the formula
  says `d(lieExp)_X = d(L_{lieExp X})_1`; on `ℝⁿ` both sides are the identity.
- Convention witness in `GL₂(ℝ)`, `X = diag(1, 0)`, `Y = E₁₂`: `exp(X + tY) = [[e, t(e − 1)], [0, 1]]`,
  so `d(exp)_X(Y) = (e − 1)E₁₂` and its left translate to `1` is `exp(X)⁻¹(e − 1)E₁₂ = (1 − e⁻¹)E₁₂`;
  since `ad X · E₁₂ = E₁₂`, `∫₀¹ exp(−s ad X) ds · E₁₂ = (1 − e⁻¹)E₁₂`, matching. The opposite sign
  `exp(+s ad X)` would give `(e − 1)E₁₂`, and right translation to `1` would give `(e − 1)E₁₂` as
  well: the formula is left-trivialized with `exp(−s ad X)`.
- `GL₁(ℝ) = ℝˣ`: `ad X = 0` and `d(exp)_x = e^x`, the real derivative, so the formula reduces to the
  one-variable chain rule and the factor is `1`.

### Examples

- On `GL_n(ℝ)`: `Ad g X = g X g⁻¹`, `ad X Y = XY − YX`, and `Ad(exp X) = exp(ad X)` is
  `Matrix.exp_conj` read through `Matrix.exp_add_of_commute` for the commuting operators `L_X` and
  `R_X`.
- On `SU(2)`, `Ad` is the double cover onto `SO(3)` (§1.1).

### Dependencies

Layer 0. Mathlib `LieAlgebra.ad`, `NormedSpace.exp`, Bochner and interval integrals. Tau Ceti: the
adjoint representation and its laws, the adjoint-exponential formula, and the Banach `dexp`
formulas named above.

## Layer 2: the closed-subgroup (Cartan) theorem

### 2.1 The Lie subalgebra of any subgroup

For every subgroup `K ≤ G` put `𝔨 = {X ∈ 𝔤 | lieExp (t • X) ∈ K for every real t}`. Tau Ceti's
`TauCeti.Lie.lieSubalgebraOfSubgroup K` is the Lie subalgebra generated by `𝔨`, and
`TauCeti.Lie.mem_lieSubalgebraOfSubgroup` proves that for closed `K` the generation adds nothing.
Prove `mem_lieSubalgebraOfSubgroup_iff`: for every subgroup `K`, closed or not,
`X ∈ lieSubalgebraOfSubgroup K ↔ ∀ t : ℝ, lieExp (t • X) ∈ K`, so that `𝔨` is itself a Lie
subalgebra. Route, by a finite-product construction that does not use closedness of `K` or the
integration theory of Layer 4: let `K₀ ≤ K` be the subgroup generated by the one-parameter groups
`lieExp (t • X)`, `X ∈ 𝔨`, and let `V` be the span of the `Ad k X` for `k ∈ K₀` and `X ∈ 𝔨`. Choose a
basis `Y₁, …, Y_d` of `V` among these vectors; each `lieExp (t • Yᵢ)` lies in `K₀`. The product map
`(t₁, …, t_d) ↦ ∏ lieExp (tᵢ • Yᵢ)` is an embedded patch near `0` by the finite-dimensional rank
theorem, and its tangent spaces are left translates of `V` by the `Ad(K₀)`-invariance of `V`. Pull
back each left-invariant `Z ∈ V` to that patch and use the local existence and uniqueness of
integral curves (Layer 0) to show `lieExp (t • Z) ∈ K₀` for small `t`, then for all `t` by integer
powers; hence `V = 𝔨`. Differentiating `Ad (lieExp (t • X)) V = V` inside the finite-dimensional, hence
closed, subspace `V` gives closure under the bracket (§1.2). (For finite-dimensional `G` the
statement also follows from Yamabe's theorem that an arcwise connected subgroup is an integral
subgroup: Neeb, *Towards a Lie theory of locally convex groups*, Rem. II.6.5(b) and Problem IV.1.)
*Needs:* §§0.2–0.3, §1.2; Tau Ceti `TauCeti.Lie.lieSubalgebraOfSubgroup`,
`TauCeti.Lie.hasDerivAt_Ad_lieExp_smul_apply_zero`; the finite-dimensional inverse function theorem
(Mathlib `HasStrictFDerivAt.toOpenPartialHomeomorph`) for the product patch.

**Checks.**
- `K = ℚ ⊂ ℝ`: `lieExp (t • X) = tX ∈ ℚ` for every real `t` forces `X = 0`, so `𝔨 = 0`, although `K`
  is dense; a definition taking the closure of `K` first would give `ℝ`.
- `K` the irrational line `{(t, √2 t)}` in the torus `(ℝ/ℤ)²`: `𝔨` is the line `ℝ(1, √2)`; the
  subgroup is not closed and its Lie algebra has dimension 1, not 2.
- `K = SL₂(ℤ) ⊂ SL₂(ℝ)`: the path `t ↦ lieExp (t • X)` is continuous into a discrete subgroup, hence
  constant, so `𝔨 = 0`; a definition that only asked `lieExp X ∈ K` would admit the nilpotent
  `X = [[0, 1], [0, 0]]`, whose exponential `[[1, 1], [0, 1]]` lies in `SL₂(ℤ)` while that of
  `X/2` does not.

### 2.2 The closed-subgroup theorem

For finite-dimensional real `G` and closed `K`, `K` is an embedded Lie subgroup
(`TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`; Kirillov, online author copy, Thm. 2.8). The data
`TauCeti.Lie.EmbeddedLieSubgroupData` carries a `LieGroup 𝓘(ℝ, E') ∞ K` structure for the subspace
topology and a smooth inclusion with
everywhere split differential, and the model space can be taken to be `K`'s own
`lieSubalgebraOfSubgroup K` (`TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`).
For every such data the differential of the inclusion is a Lie-algebra isomorphism of
`LeftInvariantDerivation 𝓘(ℝ, Lie(K)) K` onto `lieSubalgebraOfSubgroup K`
(`TauCeti.Lie.EmbeddedLieSubgroupData.range_lieMapSubtypeVal_eq`,
`TauCeti.Lie.EmbeddedLieSubgroupData.lieEquivLieSubalgebraOfSubgroup`), so `Lie(K) = 𝔨`, and by
naturality (`map_lieExp`) the exponential of `K` is the restriction of that of `G`. The closed-`K`
limit criterion is `TauCeti.Lie.mem_lieSubalgebraOfSubgroup_iff_exists_seq`: `X ∈ 𝔨` iff there are
`tₙ → 0` with `tₙ > 0` and `Xₙ → X` with `lieExp (tₙ • Xₙ) ∈ K` eventually.
*Needs:* Tau Ceti as named; nothing of §2.1.

**Checks.**
- The limit criterion is not asserted for non-closed subgroups: for `ℚ ⊂ ℝ`, `tₙ = 1/n` and `Xₙ = 1`
  satisfy the right-hand side, while `X = 1` is not in `𝔨 = 0` (`lieExp (t • 1) = t ∉ ℚ` for
  irrational `t`).
- For the closed one-parameter subgroup `K = {diag(eᵗ, e²ᵗ)} ⊂ GL₂(ℝ)`, `Lie(K)` is the line spanned
  by `diag(1, 2)` and the model space of its embedded structure is one-dimensional, while the
  diagonal subgroup containing it has the two-dimensional Lie algebra of diagonal matrices: the
  comparison identifies `Lie(K)` with `𝔨`, not with the Lie algebra of a closed overgroup.

### 2.3 The matrix groups

The classical matrix groups are closed subgroups of `GL_n = (Matrix n n 𝕜)ˣ`, hence embedded Lie
subgroups with the expected Lie algebras, and Tau Ceti computes these Lie algebras for its own
carriers: for the image of `Matrix.SpecialLinearGroup.toGL` over any `RCLike` field,
`TauCeti.Lie.isClosed_range_toGL` and
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_sl` (the real Lie
algebra is `LieAlgebra.SpecialLinear.sl`, the trace-zero matrices); for the unitary subgroup of the
units of a finite-dimensional real normed star algebra (for matrices, the preimage of
`Matrix.unitaryGroup` under `Units.val`), `TauCeti.Lie.isEmbeddedLieSubgroup_unitarySubgroup` and
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_skewAdjoint`, with the
real case `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_so` for the
full orthogonal group; for `TauCeti.GLSpecialUnitary`,
`TauCeti.Lie.isEmbeddedLieSubgroup_GLSpecialUnitary` and
`TauCeti.Lie.lieSubalgebraOfSubgroup_GLSpecialUnitary` (the skew-Hermitian trace-zero matrices,
degenerating over `ℝ` to `LieAlgebra.Orthogonal.so` by
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_GLSpecialUnitary_lieSubalgebra_iff_mem_so`); for
`TauCeti.GLSymplectic`, `TauCeti.isClosed_GLSymplectic` and
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_sp` (the Lie algebra is
`LieAlgebra.Symplectic.sp`); and for the special orthogonal carrier of the positive-definite real
Clifford form `realCliffordForm n 0`,
`TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_realCliffordForm_lieSubalgebra_iff_mem_so`.

Prove the transport to Mathlib's own names, so that each `Lie(−)` is stated on Mathlib's group: the
preimages under `Units.val` of `Matrix.unitaryGroup n 𝕜` and `Matrix.orthogonalGroup n ℝ` are the
closed subgroups `unitarySubgroup` of `GL_n(𝕜)` and `GL_n(ℝ)`, and the preimages of
`Matrix.specialUnitaryGroup n 𝕜` and `Matrix.specialOrthogonalGroup n ℝ` are `TauCeti.GLSpecialUnitary`
over `𝕜` and over `ℝ` (Mathlib's `Matrix.orthogonalGroup` and `Matrix.specialOrthogonalGroup` are the
real unitary and special unitary groups). The special linear carrier above is the image of Mathlib's
`Matrix.SpecialLinearGroup` under `Matrix.SpecialLinearGroup.toGL`, and `TauCeti.GLSymplectic` is by
definition the preimage of `Matrix.symplecticGroup l ℝ`. Give the symplectic group its embedded
Lie-subgroup structure (one application of `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed` to
`TauCeti.isClosed_GLSymplectic`); and state
`Lie(SO(n)) = 𝔰𝔬(n)` on the preimage of `Matrix.specialOrthogonalGroup n ℝ` itself rather than on
the Clifford-form carrier. These transports give the compact-groups and classical-groups roadmaps
their smooth structures. Cartan's automatic-smoothness corollary is
`TauCeti.Lie.contMDiff_of_continuous_monoidHom`: every continuous homomorphism between
finite-dimensional real Lie groups is smooth, so "Lie group homomorphism" may be stated as
"continuous homomorphism" (`ContinuousMonoidHom.toContMDiffMonoidMorphism`).
(Hall, Chs. 2–5.)
*Needs:* §2.2; Mathlib's matrix groups and `LieAlgebra.SpecialLinear.sl`,
`LieAlgebra.Orthogonal.so`, `LieAlgebra.Symplectic.sp`; Tau Ceti as named.

**Checks.**
- Dimensions: `dim 𝔰𝔩_n(ℝ) = n² − 1`, `dim 𝔰𝔬(n) = n(n − 1)/2`, `dim 𝔲(n) = n²`, `dim 𝔰𝔲(n) = n² − 1`,
  `dim 𝔰𝔭(2l, ℝ) = l(2l + 1)`; for `n = 2` and `l = 1` these are `3, 1, 4, 3, 3`.
- `O(2)` and `SO(2)` have the same Lie algebra `𝔰𝔬(2)`: the Lie algebra does not see the second
  component.
- Over `ℂ` the trace condition of `𝔰𝔲(n)` is not implied by skew-Hermitianness: `i · 1` is
  skew-Hermitian with trace `ni ≠ 0` (for `n ≥ 1`). A single exponential does not detect it either:
  a matrix of trace `2πi` has `det (exp A) = e^{2πi} = 1`; it is the whole line `t ↦ exp(tA)` that
  pins `trace A = 0`.

### 2.4 The simply connected rank-one source

Construct the smooth identification of `SU(2) = Matrix.specialUnitaryGroup (Fin 2) ℂ` with the unit
sphere `S³ ⊂ ℂ²` given by the first column `(a, b)`, with inverse `(a, b) ↦ [[a, −b̄], [b, ā]]`,
together with the determinant, unitarity and inverse laws, and prove `simplyConnectedSpace_SU2`:
`SU(2)`, with its subspace topology from the matrices, is simply connected. Simple connectedness of
`S³` is Tau Ceti's `TauCeti.simplyConnectedSpace_sphere` (spheres in a real normed space of rank
greater than two); the unit quaternions give a second route
(`Quaternion.mem_specialUnitaryGroup_iff_exists_toComplexMatrix`,
`Quaternion.unitaryHomeomorphSphere`). This is the simply connected rank-one source to which
Layer 4's integration of Lie-algebra homomorphisms is applied in Layer 6 (§6.6); it uses no
torus or Weyl structure.
(Hall, Chs. 2–5, where `SU(2)` and `SO(3)` are the running example.)
*Needs:* §§2.2–2.3 for the smooth structure; Mathlib `Matrix.specialUnitaryGroup`, `Metric.sphere`,
`SimplyConnectedSpace`; Tau Ceti `TauCeti.simplyConnectedSpace_sphere`.

**Checks.**
- `[[a, −b̄], [b, ā]]` has determinant `|a|² + |b|²` and is unitary exactly when `|a|² + |b|² = 1`;
  `(a, b) = (1, 0)` gives the identity and `(0, 1)` gives `[[0, −1], [1, 0]]`.
- `SO(3)` is compact, connected and three-dimensional with the same Lie algebra, and is not simply
  connected (its fundamental group has order two); `U(1) = S¹` is not simply connected either. So
  the theorem is specific to `SU(2)`.

### Examples

- `SU(2) ⊂ GL₂(ℂ)` and `SO(3) ⊂ GL₃(ℝ)` are embedded Lie subgroups with Lie algebras the
  skew-Hermitian trace-zero matrices and the skew-symmetric matrices, both `ℝ³` with the cross
  product.
- A closed subgroup cut out by polynomial equations, such as the centralizer of a matrix, is an
  embedded Lie subgroup by §2.2.

### Dependencies

Layers 0–1. Mathlib's matrix groups and their Lie algebras, `SimplyConnectedSpace`. Tau Ceti: the
closed-subgroup theorem and its Lie-algebra comparison, the limit criterion, the matrix-group Lie
algebras, automatic smoothness, the product chart `Submodule.lieExpMulLieExp`, the simple
connectedness of spheres.

## Layer 3: the Lie functor and Baker–Campbell–Hausdorff

### 3.1 The functor on morphisms

For a smooth homomorphism `φ : ContMDiffMonoidMorphism I I' ∞ G G'`, `lieMap φ = d(φ)_1 : 𝔤 →ₗ⁅ℝ⁆ 𝔤'`
is a Lie-algebra homomorphism (`lieMap`), natural against the exponential,
`φ (lieExp X) = lieExp (lieMap φ X)` (`map_lieExp`), continuous (`continuous_lieMap`), with
`lieMap_id` and `lieMap_comp`. Together with Layer 0 this is the Lie functor `G ↦ Lie(G)`,
`φ ↦ lieMap φ`, from Lie groups to finite-dimensional real Lie algebras; by §2.3 it applies to every
continuous homomorphism (`ContinuousMonoidHom.lieMap`, `ContinuousMonoidHom.lieMap_comp`). A smooth
homomorphism is a local diffeomorphism at `1` exactly when its Lie map is bijective
(`ContMDiffMonoidMorphism.isLocalDiffeomorphAt_iff_lieMap_bijective`).
*Needs:* Layers 0–2; Tau Ceti as named.

**Checks.**
- `det : GL_n(ℝ) → ℝˣ` has Lie map the trace, `d/dt|₀ det(exp(tX)) = tr X`, in the coordinates
  `unitsLieAlgebraEquiv` on both sides; the trace kills commutators, as a Lie homomorphism into
  the abelian Lie algebra `ℝ` must, whereas `X ↦ tr(X²)` (also a natural invariant) is not
  additive.

### 3.2 Injectivity on connected groups

If `G` is connected, `lieMap` determines `φ`: two smooth homomorphisms with the same differential at
`1` agree on `lieExp 𝔤`, which generates a connected `G` (`lieMap_injective`, for preconnected `G`;
`ContinuousMonoidHom.lieMap_injective`). So the Lie functor is faithful on connected groups, and a
connected Lie group is generated by any neighbourhood of `1` (Kirillov, online author copy,
Thm. 3.17 and Cor. 2.9).
*Needs:* §3.1, §0.2; Tau Ceti as named.

**Checks.**
- Connectedness is needed: on `G = ℤ/2ℤ` (a zero-dimensional Lie group) the identity and the trivial
  homomorphism to itself have the same differential `0` and differ.

### 3.3 The Baker–Campbell–Hausdorff series

The local Baker–Campbell–Hausdorff germ is Tau Ceti's: `TauCeti.lieLocalBCH`, the germ at `(0, 0)`
of `(X, Y) ↦ lieLog (lieExp X * lieExp Y)`, with `TauCeti.lieLocalBCH_map_lieExp`, its naturality
`TauCeti.map_lieLocalBCH`, its bracket term
`TauCeti.isBigO_lieLocalBCH_representative_sub_bracket`
(`bch X Y = X + Y + ½⁅X, Y⁆ + O(‖(X, Y)‖³)`), and the Banach-algebra germ `NormedSpace.localBCH`
with `TauCeti.lieLocalBCH_eq_unitsLocalBCH` on units. Build the series. Define the formal series
`B(X, Y)` by the degreewise Dynkin Lie series in the completed free Lie algebra; its first terms are
`X + Y + ½[X, Y] + (1/12)([X, [X, Y]] + [Y, [Y, X]]) + ⋯`. For a complete normed algebra `R`, define
its numerical value at arbitrary `x, y : R` as the `tsum` of the evaluated degreewise Dynkin terms,
with the `tsum` convention that a non-summable series has value zero; this makes the value a total
function and grants no algebraic identity where the series is not norm-summable. On either
coordinate axis all terms except the degree-one term vanish, so `B(0, y) = y` and `B(x, 0) = x` hold
for every `x, y`. Prove absolute convergence on an explicit neighbourhood (a constructed `r > 0` with
`‖x‖ + ‖y‖ < r`), the product identity `exp(x) · exp(y) = exp(B(x, y))` there (Kirillov, online
author copy, Thm. 3.34), associativity whenever every series and intermediate product in the
identity lies in the convergence domain, and functoriality under continuous algebra and Lie
homomorphisms on that domain. On a smaller closed ball prove an explicit cubic remainder bound
`‖B(x, y) − x − y − ½[x, y]‖ ≤ C(‖x‖ + ‖y‖)³` with a constructed constant `C`. Identify the germ at
`(0, 0)` of the convergent series with `NormedSpace.localBCH`, and through
`TauCeti.lieLocalBCH_eq_unitsLocalBCH` and a chart with `TauCeti.lieLocalBCH` of an abstract Lie
group: this is a comparison of local germs, not a global logarithm. All other numerical laws are
claimed only on their stated convergence domains.
*Needs:* §§0.2, 3.1; Mathlib free Lie algebras (`FreeLieAlgebra`), `tsum`, `NormedSpace.exp`; Tau
Ceti `TauCeti.lieLocalBCH`, `NormedSpace.localBCH`, `TauCeti.lieLocalBCH_eq_unitsLocalBCH`.

**Checks.**
- Sign of the bracket term, in the Heisenberg group of `3 × 3` unitriangular matrices with
  `X = E₁₂`, `Y = E₂₃`, `[X, Y] = E₁₃`: `exp X · exp Y = 1 + E₁₂ + E₂₃ + E₁₃`, and
  `exp(X + Y + ½E₁₃) = 1 + (E₁₂ + E₂₃ + ½E₁₃) + ½E₁₃` is the same matrix; with `−½[X, Y]` the
  `(1, 3)` entry would be `0`.
- For commuting `x, y` every bracket vanishes, `B(x, y) = x + y` and the product identity is
  `Matrix.exp_add_of_commute`.
- The endpoint laws hold everywhere, including where the series would not converge for a generic
  pair: `B(0, y) = y` for every `y`.

### Examples

- On `GL_n(ℝ)`, `lieMap` of a continuous homomorphism is its derivative at `1`; `lieMap det = trace`.
- On a two-step nilpotent group the series stops at `X + Y + ½[X, Y]` (Layer 5, §5.3).

### Dependencies

Layers 0–2. Mathlib free Lie algebras, `tsum`, `NormedSpace.exp`. Tau Ceti: `lieMap` and its laws,
faithfulness, the local BCH germs.

## Layer 4: Frobenius, Lie's third theorem, and the equivalence of categories

### 4.1 The subalgebra–immersed-subgroup correspondence

An immersed Lie subgroup is not a subspace-topology `Subgroup G`: it carries its own, generally
finer, manifold and group structure with an injective immersion into `G`. The carrier is Tau
Ceti's `TauCeti.Lie.ImmersedLieSubgroupData I K`: a connected Lie group `X` on a finite-dimensional
model with an injective homomorphism `X →* G` whose range is `K` and which is an immersion in
Mathlib's sense (`Manifold.IsImmersion`), hence smooth with injective differential;
`TauCeti.Lie.IsImmersedLieSubgroup K` says such data exist. Its differential is an injective Lie
map with range in `lieSubalgebraOfSubgroup K` (`TauCeti.Lie.ImmersedLieSubgroupData.injective_lieMapToHom`,
`TauCeti.Lie.ImmersedLieSubgroupData.range_lieMapToHom_le`), and two presentations with the same
differential range have the same image (`TauCeti.Lie.ImmersedLieSubgroupData.eq_of_range_lieMapToHom_eq`).

For a Lie subalgebra `𝔥 ≤ 𝔤` the left-invariant distribution `x ↦ d(L_x)_1 𝔥 ⊆ TangentSpace I x` is
involutive because `⁅𝔥, 𝔥⁆ ⊆ 𝔥` (`TauCeti.mulInvariantDistribution`,
`TauCeti.isInvolutiveDistribution_mulInvariantDistribution_iff`), so it is the tangent
distribution of the foliation `LieSubalgebra.mulInvariantFoliation`, and the leaf through `1` is a
path-connected subgroup `LieSubalgebra.integralLeafSubgroup 𝔥`, which carries the subspace topology.
Prove `exists_immersedLieSubgroup_lieSubalgebra`: every Lie subalgebra `𝔥` is the Lie algebra
`lieSubalgebraOfSubgroup K` of a subgroup `K` with `IsImmersedLieSubgroup K`. Route: by the Frobenius
theorem of DifferentialGeometry Layer 4 (4.3–4.4: an involutive distribution is integrable and its
leaves are immersed submanifolds), the leaf through `1` with its leaf topology is a connected
manifold; the group operations are smooth for it because left translations permute the leaves;
the inclusion is an injective immersion with differential range `𝔥`; and a one-parameter subgroup
of `G` lying in the leaf is continuous for the leaf topology, so `lieSubalgebraOfSubgroup K = 𝔥`.
Then prove that `𝔥 ↦ integralLeafSubgroup 𝔥` is a bijection between the Lie subalgebras of `𝔤` and
the connected immersed subgroups of `G` up to isomorphism of presentations, injective by the
uniqueness theorem above; the closed ones are the embedded subgroups of §2.2 (Kirillov, online
author copy, Thms. 3.43 and 3.46).
*Needs:* §2.1 for `lieSubalgebraOfSubgroup K` of a non-closed `K`, §3.1;
DifferentialGeometry 4.3–4.4 (Frobenius and leaves; Tau Ceti `TauCeti.IsInvolutiveDistribution`,
`TauCeti.IntegralManifold`); Tau Ceti as named.

**Checks** for `TauCeti.Lie.ImmersedLieSubgroupData` and `TauCeti.Lie.IsImmersedLieSubgroup`.
- The irrational line `K = {(t, √2 t)} ⊂ (ℝ/ℤ)²` with `X = ℝ`, `t ↦ (t, √2 t)`: injective, smooth,
  immersive, image `K`, so `IsImmersedLieSubgroup K` holds although `K` is dense and not closed; the
  subtype `↥K` with its subspace topology is not locally connected, so no structure on the
  subspace topology could make it a one-dimensional Lie group.
- `K = ℚ ⊂ ℝ` and `K = SL₂(ℤ) ⊂ SL₂(ℝ)`: a connected Lie group with an injective homomorphism onto
  a countable group is a point, so the only countable `K` with `IsImmersedLieSubgroup K` is `{1}`;
  consistently, `lieSubalgebraOfSubgroup K = 0` and the integral subgroup of `0` is `{1}`, not `K`.
- Dropping injectivity would admit `X = ℝ → S¹ ⊂ ℂˣ`, `t ↦ e^{it}`, whose image `S¹` is the integral
  subgroup of `iℝ` but whose source is not the circle; the bijection up to isomorphism needs
  injectivity. Dropping connectedness would admit the discrete group `X = SL₂(ℤ)` with
  `K = SL₂(ℤ)`, a countable immersed subgroup with `lieSubalgebraOfSubgroup K = 0`, whose Lie
  algebra integrates to `{1}`; connectedness is what makes a subgroup with given Lie algebra
  unique, so that `K ↦ lieSubalgebraOfSubgroup K` is injective on immersed subgroups.
  The immersion field is the only smoothness condition: a `ℚ`-linear automorphism of `X = ℝ = G`
  exchanging two Hamel basis vectors is an injective homomorphism of a connected group onto `K = ℝ`
  that is not continuous. For a smooth injective homomorphism the injectivity of the differential
  would be automatic, since `ker dφ = Lie(ker φ) = 0`.

### 4.2 Lie's third theorem

Prove `exists_simplyConnected_lieGroup`: every finite-dimensional real Lie algebra `L` is the Lie
algebra of a simply connected Lie group, that is, there are a finite-dimensional real model and a
simply connected Lie group `G` on it with `Nonempty (LeftInvariantDerivation I G ≃ₗ⁅ℝ⁆ L)`. Route:
the real case of the Ado–Iwasawa theorem embeds `L` as a subalgebra of `𝔤𝔩_n = Matrix n n ℝ`
([AdoIwasawa](../AdoIwasawa/README.md) Layer 5, with its Layer 9 interface for Lie's third
theorem); §4.1 integrates it to a connected immersed subgroup of `GL_n(ℝ)`, a connected Lie group
with Lie algebra `L`; its universal cover (§5.1) is simply connected with the same Lie algebra
(Kirillov, online author copy, Thm. 3.48). The universal-cover construction is independent of
Lie's third theorem, so the dependency is acyclic.
*Needs:* §4.1; §5.1's Tau Ceti `TauCeti.UniversalCover.exists_universalCover`; AdoIwasawa Layer 5;
Tau Ceti `TauCeti.Lie.unitsLieAlgebraLieEquiv` for `Lie(GL_n(ℝ)) = 𝔤𝔩_n`.

**Checks.**
- `L = ℝ`: the theorem gives `G = ℝ`; the circle has the same Lie algebra and is not simply connected,
  so it is not the group of the theorem.
- `L = 𝔰𝔩₂(ℝ)`: `SL₂(ℝ)` has this Lie algebra but fundamental group `ℤ`; the simply connected group is
  its universal cover. `L = 0` gives the one-point group.

### 4.3 The equivalence of categories

The Lie functor of Layer 3, restricted to simply connected Lie groups, is an equivalence onto
finite-dimensional real Lie algebras. Prove `exists_monoidHom_of_lieHom`: for simply connected `G`
and any Lie group `G'`, every Lie-algebra homomorphism `f : 𝔤 →ₗ⁅ℝ⁆ 𝔤'` is `lieMap φ` for a smooth
homomorphism `φ : G →* G'`. Route: integrate the graph of `f`, a Lie subalgebra of `𝔤 × 𝔤'`, to a
connected immersed subgroup of `G × G'` (§4.1); its projection to `G` is a covering homomorphism,
hence an isomorphism since `G` is simply connected, and `φ` is read off the graph; alternatively,
extend the local homomorphism given by the local BCH germs (§3.3) by simple connectedness.
Uniqueness is `lieMap_injective` (§3.2). Together with Lie's third theorem (essential
surjectivity) this is the equivalence `SimplyConnLieGrp ≃ FinDimLieAlg` (Kirillov, online author
copy, Thm. 3.38 and Cors. 3.49–3.50).
*Needs:* §§3.1–3.2, §4.1; for the second route §3.3's Tau Ceti `TauCeti.lieLocalBCH`.

State the equivalence as a coreflection. `TauCeti.Lie.lieMapEquiv` assumes second-countable
source and target. Extend it to every target `H` through its identity component `H⁰`: a smooth
homomorphism out of a connected group lands in `H⁰`, and `H⁰` is second-countable, being connected
and hence σ-compact. Then define the integration functor
`Γ : FGLieAlgCat ℝ ⥤ TauCeti.LieGroupCat`, sending `L` to the simply connected group of Lie's third
theorem (§4.2) and a Lie-algebra homomorphism to its integral `LieHom.integrate`. Prove
`Γ ⊣ TauCeti.LieGroupCat.lieFunctor`: with a chosen identification `e_L : Lie (Γ L) ≅ L`, the
hom-set bijection `(Γ L ⟶ H) ≃ (L ⟶ Lie H)` sends `f` to `Lie f ∘ e_L⁻¹`. The unit is an
isomorphism, so `Γ` is fully faithful with essential image the simply connected groups. The counit
at `H` is the composite `Γ (Lie H) → H⁰ ↪ H` of the universal covering homomorphism of `H⁰` (§5.1,
the construction of the cover) with the inclusion. The equivalence of
`TauCeti.LieGroupCat.isSimplyConnected.FullSubcategory` with `FGLieAlgCat ℝ` is the restriction of
this adjunction. The integration API takes models in `Type`, so prove the adjunction on
`TauCeti.LieGroupCat.{0, 0, 0}` and `FGLieAlgCat.{0} ℝ`.
*Needs:* the morphism theorem above; §4.2 for the objects of `Γ`; §5.1's construction of the
universal cover, which does not use §4.3, for the counit.

**Checks.**
- `G = ℝ`, `G' = Circle`, `Lie(Circle) ≅ ℝ` by `circleLieAlgebraEquiv`: the Lie-algebra map
  `x ↦ cx` integrates to `t ↦ Circle.exp (ct)` for every real `c`. For the source `Circle` instead,
  only the integers `c` integrate, since `Circle.exp (c · 2π) = 1` is needed: simple connectedness of
  the source is used.

### 4.4 The Galois coinsertion, naturality and normal subgroups

Throughout this section `G` is second-countable, the hypothesis under which Tau Ceti constructs the
integral leaf subgroup. Remove it by working in the identity component `G⁰`, which is
second-countable and contains every connected immersed subgroup. These results refine §4.1 and do
not use §§4.2–4.3.

*The Galois coinsertion.* Prove `gc_integralLeafSubgroup_lieSubalgebraOfSubgroup`: for every Lie subalgebra
`𝔥 ≤ 𝔤` and every subgroup `Q ≤ G`, closed or not,
`integralLeafSubgroup 𝔥 ≤ Q ↔ 𝔥 ≤ lieSubalgebraOfSubgroup Q`, with
`lieSubalgebraOfSubgroup (integralLeafSubgroup 𝔥) = 𝔥`, and package the two as a
`GaloisCoinsertion`. Route: `→` is monotonicity of
`lieSubalgebraOfSubgroup` together with
`LieSubalgebra.lieSubalgebraOfSubgroup_integralLeafSubgroup`. `←` uses §2.1's
`mem_lieSubalgebraOfSubgroup_iff`, which puts `lieExp X` in `Q` for every `X ∈ 𝔥`, and the
generation of the integral leaf subgroup by exponentials
(`LieSubalgebra.integralLeafSubgroup_eq_closure_lieExp_image`; `Subgroup.closure` is abstract
generation). The fixed points on the group side are the connected immersed subgroups, which is the
order isomorphism `TauCeti.Lie.integralLeafSubgroupOrderIso`, and `Q ↦
integralLeafSubgroup (lieSubalgebraOfSubgroup Q)` is the largest connected immersed subgroup
contained in `Q`. Read off the lattice operations from the adjunction:
- the left adjoint preserves joins, so `integralLeafSubgroup (⨆ i, 𝔥 i) = ⨆ i, integralLeafSubgroup
  (𝔥 i)` in `Subgroup G`. The join of connected immersed subgroups is the abstract subgroup they
  generate, with no closure taken;
- the right adjoint preserves meets, so `lieSubalgebraOfSubgroup (⨅ i, Q i) = ⨅ i,
  lieSubalgebraOfSubgroup (Q i)` for arbitrary subgroups, extending
  `TauCeti.Lie.lieSubalgebraOfSubgroup_inf` beyond closed ones. The meet of connected immersed `K`
  and `L` is `integralLeafSubgroup (𝔨 ⊓ 𝔩)`, the largest connected immersed subgroup contained in
  `K ⊓ L`.
*Needs:* §2.1, §4.1.

*Naturality.* For a smooth homomorphism `φ : G → G'` and a Lie subalgebra `𝔥 ≤ 𝔤`, prove
`(integralLeafSubgroup 𝔥).map φ = integralLeafSubgroup (𝔥.map (lieMap φ))`, and for connected
`G` the range formula `φ.range = integralLeafSubgroup (lieMap φ).range`; for general `G` the
latter describes `φ(G⁰)`. Route: both sides are generated by exponentials
(`integralLeafSubgroup_eq_closure_lieExp_image`), `Subgroup.map` commutes with
`Subgroup.closure`, and `map_lieExp` moves the exponential across `φ`. With the Galois coinsertion,
for connected immersed `K ≤ G` and an arbitrary subgroup `Q' ≤ G'`,
`K.map φ ≤ Q' ↔ K ≤ integralLeafSubgroup ((lieSubalgebraOfSubgroup Q').comap (lieMap φ))`, by
`LieSubalgebra.map_le_iff_le_comap`. For closed `Q'`, the subgroup `φ⁻¹ Q'` is closed, hence
embedded (§2.2), with Lie algebra the preimage under `lieMap φ` of that of `Q'`. So the right-hand
side is the identity component of `φ⁻¹ Q'`.
*Needs:* §§0.3, 3.1, 4.1 and the Galois coinsertion above; §2.2 for the closed-preimage
identification.

*Normal subgroups.* For connected `G`, prove that a connected immersed subgroup `K` is normal
exactly when `lieSubalgebraOfSubgroup K` is an ideal; the forward implication needs no
connectedness of `G`. Route: by naturality for the inner automorphism `MulAut.conj g`
(`conj_lieExp`, `lieSubalgebraOfSubgroup_map_conj`) and injectivity of the correspondence, `K` is
normal exactly when `Ad g` preserves `𝔨` for every `g`. If every `Ad (lieExp (t • X))` preserves
`𝔨`, differentiating at `t = 0` (`hasDerivAt_Ad_lieExp_smul_apply_zero`, with `𝔨` closed as a
finite-dimensional subspace) gives `⁅X, 𝔨⁆ ⊆ 𝔨`. Conversely,
`Ad (lieExp X) = exp (ad X)` (`LeftInvariantDerivation.Ad_lieExp`) preserves an ideal, and
connected `G` is generated by exponentials.
*Needs:* §§1.1–1.3, §4.1 and naturality above.

**Checks.**
- `G = (ℝ/ℤ)²` is abelian: every Lie subalgebra is an ideal and every subgroup is normal,
  including the dense irrational line, which is not closed.
- `G = SU(2)` and `K` the diagonal circle: `𝔨 = 𝔲(1)` is not an ideal of `𝔰𝔲(2)`, and `K` is not
  normal.
- Connectedness of `G` is needed for the reverse implication. In `G = ℝ² ⋊ ℤ/2`, with `ℤ/2`
  swapping the coordinates, `𝔤 = ℝ²` is abelian, so `𝔨 = ℝ × 0` is an ideal, but `K = ℝ × 0` is
  not normal: the swap moves it to `0 × ℝ`.
- Connectedness of the source is needed for the range formula. For `φ = id` on the discrete group
  `ℤ/2`, the range is the whole group while the integral leaf subgroup of the zero Lie algebra is
  trivial.
- The meet is not the intersection. In `(ℝ/ℤ)²` the circles `t ↦ (t, 0)` and `t ↦ (t, 2t)` meet in
  the two points `(0, 0)` and `(1/2, 0)`, while their Lie algebras meet in `0` and the meet is
  trivial.
- The join is not the product set. In the Heisenberg group, the product of the two horizontal
  one-parameter subgroups is a two-dimensional subset, but the join of their Lie algebras is the
  whole three-dimensional Heisenberg algebra, and the join of the subgroups is the whole group.
- The join is not the closure. In `(ℝ/ℤ)³` the lines of slopes `(1, √2, 0)` and `(0, 1, √3)` span
  a plane meeting `ℤ³` only in `0`, whose image `K ⊔ L` is a dense, non-closed immersed subgroup of
  dimension two. The closure of `K ⊔ L` is the whole torus, which is strictly larger.

### Examples

- The subalgebra `ℝ(1, √2)` of `Lie((ℝ/ℤ)²)` integrates to the dense irrational line.
- `𝔰𝔲(2) ≅ 𝔰𝔬(3)` integrates to `SU(2)`, which is simply connected (§2.4), and the isomorphism is
  the Lie map of `Ad : SU(2) → SO(3)`.

### Dependencies

Layers 0–3; §5.1 for the universal cover. DifferentialGeometry Layer 4 (Frobenius). AdoIwasawa
Layer 5. Tau Ceti: the immersed-subgroup carrier and its uniqueness theorem, the left-invariant
distribution and foliation of a subalgebra, the universal cover.

## Layer 5: simply-connected covers and the enveloping algebra

### 5.1 Simply-connected covers

Every connected Lie group `G` has a universal cover `G̃`, a simply connected Lie group with a
covering homomorphism `p : G̃ →* G` whose Lie map is an isomorphism
(`TauCeti.UniversalCover.exists_universalCover`); concretely `G̃` is
`TauCeti.UniversalCover (1 : G)` with the group law of pointwise multiplication of paths, the Lie
group structure `TauCeti.UniversalCover.instLieGroup` (the smooth structure on a covering space of
DifferentialGeometry 2.3, Tau Ceti `IsLocalHomeomorph.chartedSpaceComap`), and
`TauCeti.UniversalCover.lieMap_projHom_bijective` (Kirillov, online author copy, Thm. 2.5). The
kernel of `p` is central (`TauCeti.UniversalCover.ker_projHom_le_center`) and discrete, and it is
`π₁(G, 1)` (`TauCeti.UniversalCover.kerProjHomEquivFundamentalGroup`); continuous homomorphisms out
of `G` are the continuous homomorphisms out of `G̃` that kill `ker p`
(`TauCeti.UniversalCover.homEquivKerProjHom`, with its Lie-map form
`TauCeti.UniversalCover.lieMap_homEquivKerProjHom_symm`). This construction is independent of Lie's
third theorem and is the input Layer 4 draws on. Prove the refinement of §4.3 to connected sources:
for connected `G`, a Lie-algebra homomorphism `f : 𝔤 → 𝔤'` is `lieMap φ` for a smooth `φ : G →* G'`
if and only if the homomorphism `G̃ → G'` integrating `f ∘ lieMap p` (§4.3) is trivial on `ker p`,
and then `φ` is unique.
*Needs:* §4.3; Tau Ceti as named.

**Checks.**
- `G = Circle`: `G̃ = ℝ`, `ker p = 2πℤ ≅ π₁(S¹) = ℤ`, and the homomorphism `x ↦ cx` of Lie algebras
  descends to `Circle → Circle` exactly for integer `c`, as in §4.3.
- `G = SO(3)`: `G̃ = SU(2)` and `ker p = {±1}`, central of order two.

### 5.2 Centres, adjoint quotients and marked global forms

For connected `G`, the kernel of `Ad` is the centre: `Ad g = 1` iff `g ∈ Z(G)`, which is
`TauCeti.Lie.mem_centralizer_iff_forall_Ad_apply_eq_self` for the closed connected subgroup `G`
itself, with `TauCeti.Lie.lieSubalgebraOfSubgroup_top` (Kirillov, online author copy, Thm. 3.32).
The kernel of `ad` is the centre `𝔷(𝔤)` (Mathlib `LieDerivation.ad_ker_eq_center`). Prove that the
`Ad(G)`-fixed vectors of `𝔤` are `𝔷(𝔤)`, by exponential naturality and generation by an identity
neighbourhood; identify the Lie algebra of the closed central subgroup `Z(G)` with `𝔷(𝔤)` by §2.2;
deduce that `Z(G)` is discrete iff `𝔷(𝔤) = 0`, equivalently the adjoint representation has no
nonzero invariant vector. For a smooth action of connected `G` on a manifold, prove that its
fixed-point set is the common zero set of all fundamental vector fields: uniqueness of their
integral curves gives invariance under each exponential (Tau Ceti `TauCeti.fundamentalVectorField`,
`TauCeti.isMIntegralCurve_mulInvariantExp_smul_smul`), and generation gives invariance under `G`.

Prove that every discrete normal subgroup of connected `G` is central, by its conjugation orbit, and
use this to prove that `G/Z(G)` is centreless when `Z(G)` is discrete. Construct the quotient Lie
group `G/Z(G)` for discrete `Z(G)` and its covering homomorphism, whose Lie map is an isomorphism. For a
finite-dimensional real centreless Lie algebra `𝔤`, let `U` be its simply connected integration
(§4.2). Then `Z(U)` is discrete; construct `G_ad = U/Z(U)` and the faithful immersed adjoint map into
`Aut(𝔤)`; its Lie-group topology is the quotient (equivalently, immersed) topology, and it is not
asserted to be the subspace topology of its matrix image.

Classify the connected integrations of `𝔤` with a specified identification of their Lie algebra
with `𝔤`, and isomorphisms preserving that identification: for every subgroup `D ≤ Z(U)` construct
the smooth group `U/D`, the cover `U/D → G_ad`, their kernels and differentials, and the inverse
classification maps. Conversely integrate the marked identity from `U` to any such `H`;
connectedness makes it onto with discrete central kernel `D`, and the quotient comparison is an
isomorphism. Prove `Z(U/D) = Z(U)/D` by the discrete-normal-subgroup argument applied to its
central preimage. Thus `π₁(G_ad)` is `Z(U)` (Kirillov, online author copy, Cor. 3.49 for the
classification of connected integrations as `U/D`). Forgetting the marking, include the action of
`Aut(𝔤)` on these central subgroups instead of asserting an unmarked one-to-one correspondence with
individual `D`. Treat `𝔤 = 0` as the point. The conclusions need connectedness and the centreless
hypothesis, as the finite group `Q₈` and the Heisenberg group show.
*Needs:* §§2.2, 3.2, 4.2–4.3, 5.1; Mathlib `LieDerivation.ad_ker_eq_center`, `Subgroup.center`;
Tau Ceti as named.

**Checks.**
- `SU(2)`: `Ad` is the double cover `SU(2) → SO(3)`, `ker Ad = {±1} = Z(SU(2))` and `𝔷(𝔰𝔲₂) = 0`, so the
  centre is discrete and `SU(2)/{±1} = SO(3)` is centreless; the Lie-algebra kernel `ker ad = 0` does
  not see the finite centre.
- The Heisenberg group `H` of `3 × 3` unitriangular matrices: `Z(H)` is the one-parameter central
  line, `𝔷(𝔥)` the line of `E₁₃`, and `H/Z(H) ≅ ℝ²` is abelian with centre `ℝ²`, so "`G/Z(G)` is
  centreless" needs `Z(G)` discrete.
- Connectedness: in the finite group `Q₈` (a zero-dimensional Lie group) `Ad` is trivial, so
  `ker Ad = Q₈ ≠ Z(Q₈) = {±1}`.

### 5.3 Nilpotent global BCH coordinates and connected quotients

For a finite-dimensional nilpotent real Lie algebra `𝔫`, construct the truncated BCH polynomial on
a type copy of its vector-space carrier, with the same topology and manifold structure. Specify a
nilpotence bound: all Lie words longer than it vanish, so the series of §3.3 has only finitely many
nonzero terms. Prove the global multiplication associative: both sides of the associativity
equation are polynomial maps and agree on an identity neighbourhood by §3.3, hence everywhere.
Prove that `0` is the unit, `−X` the inverse, the group laws smooth, and identify the tangent Lie
algebra with `𝔫` through the identity linear map. This BCH group is simply connected by the
contraction of the vector space, and §§4.2–4.3 identify it with the simply connected integration of
`𝔫`, with inverse maps. Its one-parameter subgroup through `X` is `t ↦ tX`, so its exponential is the
identity in these coordinates and a global diffeomorphism. Prove naturality under real
Lie-algebra homomorphisms, not only existence of coordinates.

For a connected finite-dimensional real Lie group `H` with nilpotent Lie algebra `𝔥`, take the
universal covering homomorphism `p : H̃ → H` of §5.1 and its Lie-algebra isomorphism `dp`. Compare
`H̃` with the BCH group on `𝔥`, take its discrete central kernel `Γ = ker p` and the smooth quotient
comparison `H̃/Γ ≃ H`. Exponential naturality gives `p(exp_H̃((dp)⁻¹X)) = exp_H(X)`, so `exp_H` is
onto: prove `lieExp_surjective_of_isNilpotent` (for connected `G` with
`LieRing.IsNilpotent (LeftInvariantDerivation I G)`, `lieExp` is surjective). For simply connected
`H` recover the global exponential diffeomorphism above. Contract `H̃` through its BCH coordinates
and use the covering comparison of higher homotopy groups (Tau Ceti
`IsCoveringMap.homotopyGroupMulEquiv`) to prove `π_j(H, 1) = 0` for every `j ≥ 2`; identify
`π₁(H, 1)` with `Γ`. A connected `H` need not be contractible or have injective exponential. Include
the point and the circle as boundary cases. The local input is §3.3 (Kirillov, online author copy,
Thm. 3.34); the global polynomial group law and its consequences are targets here, and they do not
weaken the simply connected hypotheses of any orbit-method representation theorem.
*Needs:* §§3.3, 4.2–4.3, 5.1; Mathlib `LieRing.IsNilpotent`; Tau Ceti
`IsCoveringMap.homotopyGroupMulEquiv`, `TauCeti.UniversalCover.kerProjHomEquivFundamentalGroup`.

**Checks.**
- The Heisenberg algebra `𝔥 = span(X, Y, Z)`, `[X, Y] = Z`: the truncated series is
  `B(U, V) = U + V + ½[U, V]`, every longer word vanishes, and `exp` to the unitriangular group is the
  bijection `aX + bY + cZ ↦ [[1, a, c + ab/2], [0, 1, b], [0, 0, 1]]` (with `X = E₁₂`, `Y = E₂₃`,
  `Z = E₁₃`).
- Abelian `ℝⁿ`: `B(U, V) = U + V` and `exp = id`; the circle `ℝ/ℤ` is connected and nilpotent with
  surjective, non-injective exponential and `Γ = ℤ`.
- Without nilpotence: `SL₂(ℝ)` is not nilpotent and its exponential is not surjective, since
  `diag(−2, −1/2)` is not `exp X` for any `X ∈ 𝔰𝔩₂(ℝ)` (such an `X` commutes with the matrix, hence is
  real diagonal, and `exp X` then has positive diagonal entries).

### 5.4 The universal enveloping algebra

The universal enveloping algebra `UniversalEnvelopingAlgebra ℝ 𝔤` acts on smooth functions by
left-invariant differential operators: `TauCeti.envelopingAction` is the algebra map extending the
action of left-invariant derivations through `UniversalEnvelopingAlgebra.lift`, its image is the
algebra generated by the left-invariant vector fields (`TauCeti.range_envelopingAction`), it commutes
with left translations, and it is faithful (`TauCeti.envelopingAction_injective`), so `U(𝔤)` is the
algebra of left-invariant differential operators (`TauCeti.envelopingAlgEquivAdjoin`); the
derivative action is `LeftInvariantDerivation.hasDerivAt_apply_mul_lieExp_smul`, and the
Poincaré–Birkhoff–Witt basis is Tau Ceti's `Module.Basis.pbwBasis`. For an irreducible real
`U(𝔤)`-module `V` keep the action `Z(U(𝔤)) → Z(End_{U(𝔤)}(V))`, whose target is a division algebra
and need not consist of real scalars. On finite-dimensional complex irreducible modules, or real
absolutely irreducible ones, construct the scalar central character under these coefficient and
irreducibility hypotheses. For highest-weight modules use LieHighestWeight §7.1's one-dimensional
highest-weight-line construction of the central character (Tau Ceti
`TauCeti.vermaCentralCharacter`, `TauCeti.vermaCentralCharacter_casimirElement`), including its
possibly infinite-dimensional scope and the Casimir comparison.
*Needs:* Layer 0; Mathlib `UniversalEnvelopingAlgebra`, `UniversalEnvelopingAlgebra.lift`,
`Subalgebra.center`; Tau Ceti as named; LieHighestWeight §7.1.

**Checks.**
- The real circle rotation module: `𝔤 = ℝ = Lie(Circle)`, `V = ℝ²` with the generator acting by
  `J = [[0, −1], [1, 0]]`. It is irreducible over `ℝ` (no real eigenvector), the central element acts
  by `J` with `J² = −1`, not by a real scalar, and its commutant is `ℂ`.
- On `G = ℝ`, with `X = d/dx`, the element `X²` acts on `C^∞(ℝ)` by `d²/dx² ≠ 0`, but by `0` on the
  polynomials of degree at most one: faithfulness needs the action on all smooth functions, not on
  a finite-dimensional space of them.

### Examples

- Connected integrations of `𝔰𝔩₂(ℝ)` with centre `Z(U) ≅ ℤ`: `PSL₂(ℝ) = U/Z(U)`, `SL₂(ℝ) = U/2ℤ` and the
  `n`-fold covers `U/nℤ`; marked by the identity of `𝔰𝔩₂(ℝ)`, they are classified by `n ≥ 0`.
- The Heisenberg group and the circle in §5.3.

### Dependencies

Layers 0–4. Mathlib: `UniversalEnvelopingAlgebra`, `LieRing.IsNilpotent`, `LieDerivation.ad_ker_eq_center`.
Tau Ceti: the universal covering group and its kernel and descent theorems, the centralizer
criterion, fundamental vector fields, the enveloping-algebra action and PBW basis, the central
character of a Verma module, the covering comparison of homotopy groups. DifferentialGeometry 2.3.
LieHighestWeight §7.1.

## Layer 5A: compact Lie-algebra metric and splitting

For a compact connected Lie group `G` (standing hypotheses), write `𝔤 = Lie(G)`. This layer
supplies the compact real inner product and splitting used by Layer 6; it is independent of the
universal-cover and complexification constructions.

### 5A.1 The real `Ad`-invariant metric and derived-algebra splitting

Using the continuous adjoint representation (§1.1) and the normalized Haar probability `μ_G` of
[CompactGroups](../CompactGroups/README.md) §0.1 (Tau Ceti `TauCeti.haarProb`) with the invariance of
Bochner integrals of §0.2, start from any positive-definite real inner product `⟨·,·⟩₀` on `𝔤` and
construct `B_G(X, Y) = ∫_G ⟨Ad(g⁻¹)X, Ad(g⁻¹)Y⟩₀ dμ_G(g)`. Prove that `B_G` is positive-definite,
symmetric and `Ad(G)`-invariant; positivity uses that every `Ad(g)` is invertible and that Haar
measure is positive on nonempty open sets. Differentiate the invariance along `lieExp (t • X)` to
prove every `ad X` skew-adjoint for `B_G`. Then prove `𝔤 = 𝔷(𝔤) ⊕ [𝔤, 𝔤]` orthogonally, that
`𝔰 = [𝔤, 𝔤]` is a centreless semisimple ideal, and that its Killing form is negative-definite; give
the radical, centre and bracket-orthogonality arguments from this real invariant form and the trace
identities. This is the real application of Haar averaging; the complex unitarization theorem is
not substituted for it.
(Knapp, Chs. I, IV–VII.)
*Needs:* §§1.1–1.2, §0.2; CompactGroups §§0.1–0.2; Mathlib `LieAlgebra.center`,
`LieAlgebra.derivedSeries`, `LieAlgebra.IsSemisimple`, `killingForm`.

**Checks** for `B_G`.
- The trivial group and the circle: for `G = 1`, `𝔤 = 0` and the splitting is `0 = 0 ⊕ 0`; for
  `G = S¹`, `Ad` is trivial, `B_G = ⟨·,·⟩₀` whatever the start, `𝔷(𝔤) = ℝ` and `[𝔤, 𝔤] = 0`.
- `G = SU(2)` with basis `e₁ = iσ_z`, `e₂ = iσ_x`, `e₃ = iσ_y` and the non-invariant start
  `⟨e_j, e_k⟩₀ = λ_j δ_jk`, `λ = (1, 2, 3)`: `Ad(SU(2)) = SO(3)` acts transitively on directions, so
  the average of the quadratic form is `(λ₁ + λ₂ + λ₃)/3 = 2` times the standard form, `B_G = 2 δ_jk`;
  a definition that skipped the averaging would keep `λ`, which `Ad(exp(π e₁/4))` (rotating `e₂`
  into `±e₃`) shows is not invariant.
- Skew-adjointness needs invariance: with `[e₁, e₂] = −2e₃` and `[e₁, e₃] = 2e₂`,
  `⟨ad(e₁)e₂, e₃⟩₀ = −2λ₃ = −6` while `⟨e₂, ad(e₁)e₃⟩₀ = 2λ₂ = 4`, so `ad(e₁)` is not skew for
  `⟨·,·⟩₀`; for `B_G` the two values are `−4` and `4`. The Killing form is negative-definite:
  `κ(e₁, e₁) = tr(ad(e₁)²) = −8`.

### Examples

- `U(n)`: `𝔲(n) = iℝ · 1 ⊕ 𝔰𝔲(n)`, with `B_G` a multiple of `(X, Y) ↦ −tr(XY)` on `𝔰𝔲(n)` for `n ≥ 2`.

### Dependencies

Layers 0–2. CompactGroups §§0.1–0.2. Mathlib Killing forms and semisimplicity. Nothing of Layers
3–5 is used.

## Layer 6: maximal tori, the Weyl group, and Weyl integration

Throughout, `G` is a compact connected Lie group (standing hypotheses with `[CompactSpace G]` and
`[ConnectedSpace G]`) unless a statement says otherwise, `T` a maximal torus and `𝔱 = Lie(T)`.

### 6.1 Tori and maximal tori

A torus is a compact connected commutative subgroup (`TauCeti.Lie.IsTorus`), and a maximal torus
is a torus maximal under inclusion (`TauCeti.Lie.IsMaximalTorus`, `Maximal IsTorus T`). The
following hold in Tau Ceti for a finite-dimensional real Lie group: a torus is `lieExp` of its Lie
algebra (`TauCeti.Lie.IsTorus.image_lieExp_lieSubalgebraOfSubgroup`) and a product of circles,
one for each dimension of its Lie algebra (`TauCeti.Lie.IsTorus.nonempty_continuousMulEquiv_pi_circle`);
every torus lies in a maximal torus and maximal tori exist (`TauCeti.Lie.IsTorus.exists_isMaximalTorus_le`,
`TauCeti.Lie.exists_isMaximalTorus`); a torus has a topological generator
(`TauCeti.Lie.IsTorus.exists_closedZpowers_eq`, with Kronecker's criterion
`TauCeti.closedZpowers_lieExp_eq_top_iff`); and for compact `G` the centralizer and the normalizer
of a maximal torus have the Lie algebra of the torus, `𝔱` is a maximal abelian subalgebra, and the
Weyl group `N_G(T)/T`, Tau Ceti's `Subgroup.normalizerQuotient T`, is finite
(`TauCeti.Lie.IsMaximalTorus.lieSubalgebraOfSubgroup_centralizer`,
`TauCeti.Lie.IsMaximalTorus.lieSubalgebraOfSubgroup_normalizer`,
`TauCeti.Lie.IsMaximalTorus.eq_lieSubalgebraOfSubgroup_of_isLieAbelian`,
`TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient`; Bröcker–tom Dieck, Ch. IV, §1). Prove the
character criterion for compact tori: `t ∈ T` is a topological generator iff `χ(t) ≠ 1` for every
nontrivial continuous character `χ : T → Circle`; and the coordinate form of Kronecker density: for
`x ∈ ℝ^r` with `1, x₁, …, x_r` linearly independent over `ℚ`, the image of `x` generates a dense
cyclic subgroup of `ℝ^r/ℤ^r`. Prove `C_G(T)⁰ = T`, from the equality of Lie algebras and the openness
of `T` in its normalizer (`TauCeti.Lie.IsMaximalTorus.isOpen_subgroupOf_normalizer`), before the full
equality `C_G(T) = T` of §6.7.
(Bröcker–tom Dieck, Ch. IV, §1.)
*Needs:* Layers 0–2; Tau Ceti as named.

**Checks** for `TauCeti.Lie.IsMaximalTorus` and `Subgroup.normalizerQuotient`.
- `U(n)`: the diagonal subgroup `T` is a maximal torus (a unitary matrix commuting with a diagonal
  matrix with distinct entries is diagonal); the diagonal matrices with entries `±1` are compact and
  abelian but not connected, `SU(2) ⊂ U(2)` is compact and connected but not abelian, and
  `{diag(z, 1)} ⊂ U(2)` is a torus properly contained in `T`: none is a maximal torus. The Weyl group
  `N(T)/T ≅ S_n`, by the permutation matrices.
- `G = 1`: `T = ⊥` is a maximal torus with trivial Weyl group. `G = Q₈` (zero-dimensional): the only
  torus is `⊥`, its Weyl group `Q₈/⊥` has eight elements, and `−1` lies in no torus, so exhaustion
  (§6.3) needs connectedness while finiteness of the Weyl group here does not.
- `SU(2)`, `T = {diag(z, z̄)}`: `N(T)/T = C₂`, represented by `[[0, −1], [1, 0]]`, whereas
  `N(T)/Z(G) = N(T)/{±1}` is infinite; the quotient is by `T`, not by the centre, and not by the
  centralizer before `C_G(T) = T` is proved.
- The character criterion on the circle: `t = e^{2πiθ}` generates a dense subgroup iff `θ` is
  irrational, iff `tⁿ ≠ 1` for every `n ≠ 0`, the characters of the circle being `z ↦ zⁿ`.

### 6.2 Homogeneous-space floor

For a closed Lie subgroup `H ≤ G`, the free proper right action of `H` gives the smooth quotient
`G/H`, the principal bundle `G → G/H` and the tangent-quotient description of the projection
([SmoothBundlesConnections](../../SmoothBundlesConnections/README.md) B1.4, on its B1.1 principal-bundle
interface, with the closed-subgroup structure of §2.2). Before applying it to `H = T` or to each
`H_α` of §6.7, establish that the chosen subgroup is closed; the concrete manifold, tangent-space
and projection identifications are explicit applications here. Neither SmoothBundlesConnections
section depends on this layer.
(Bröcker–tom Dieck, Chs. IV–VI.)
*Needs:* §2.2; SmoothBundlesConnections B1.1 and B1.4.

### 6.3 Conjugacy and exhaustion

For compact connected `G`, prove that any two maximal tori are conjugate
(`isConj_of_isMaximalTorus`, stated as equality of the underlying sets after conjugation), that
every element lies in a maximal torus (`exists_mem_maximalTorus`), and that `lieExp` is surjective
(`lieExp_surjective`), treating the connected zero-dimensional group directly. Route, by the
mapping degree: use [DifferentialGeometry](../../DifferentialGeometry/README.md) 10.3–10.5 for
oriented degree, regular-value counts, homotopy invariance and `∫ f*ω = deg(f) ∫ ω`, including top
cohomology under its actual hypotheses, and own the application to `F : G/T × T → G`,
`F([g], t) = g t g⁻¹`, with compact domain. Put `𝔪 = 𝔱^⊥` for the invariant form of §5A.1. Fix
orientations of `𝔪` and `𝔱` so that their ordered product `(𝔪, 𝔱)` is the chosen orientation of `𝔤`,
and use left translations for `G/T`, `T` and `G`; connectedness of `T` makes the quotient
orientation well defined. At a topological generator `a ∈ T` (§6.1) prove that the fibre is
`N_G(T)/T`. `Ad_a` has no nonzero fixed vector on `𝔪`, hence `1 − Ad_a` is invertible there; since `T`
is connected, `Ad_a` has determinant `+1` and fixes `𝔱` pointwise; orthogonality and the absence of
the eigenvalue `+1` on `𝔪` make its `−1` multiplicity even, and `dim 𝔪` even, before any root-space
theorem. For the domain curves `([g exp(sX)], t exp(sY))`, `X ∈ 𝔪`, `Y ∈ 𝔱`, the derivative
left-trivialized at `g t g⁻¹` is `Ad_g((Ad_{t⁻¹} − 1)X + Y)`. At every point of the fibre the same
parity argument applies: the real blocks contribute `(−2)` to an even power and each nonreal pair of
eigenvalues contributes `|λ⁻¹ − 1|² > 0`, so all local degrees are positive with these orientations,
including when `𝔪 = 0`. Nonzero degree gives surjectivity; taking the closure of the cyclic subgroup
of a generator of any maximal torus gives conjugacy. Exhaustion and surjectivity of `lieExp` follow.
`SU(2)` recovers CompactGroups §E.1's torus conjugacy. The comparison with root data is §6.5.
(Bröcker–tom Dieck, Ch. IV, §1.)
*Needs:* §§5A.1, 6.1–6.2; DifferentialGeometry 10.3–10.5; Tau Ceti `TauCeti.Lie.IsMaximalTorus`.

**Checks.**
- `U(n)`: exhaustion is the spectral theorem for unitary matrices, and conjugacy says every maximal
  torus is conjugate to the diagonal one.
- Connectedness is needed for exhaustion: in `O(2)` the reflections lie in no torus (the identity
  component `SO(2)` is the only maximal torus).

### 6.4 Conjugacy classes and the normalizer

For compact connected `G` with maximal torus `T`, prove `exists_mem_normalizer_conj`: two elements of
`T` conjugate in `G` are conjugate by an element of `N_G(T)`. Route: if `g t g⁻¹ = u` with `t, u ∈ T`,
both `T` and `g T g⁻¹` are maximal tori of the compact connected group `C_G(u)⁰`, so some
`c ∈ C_G(u)⁰` conjugates `g T g⁻¹` to `T`, and `n = c g ∈ N_G(T)` satisfies `n t n⁻¹ = u`. With
exhaustion, the map from `T` modulo the action of `N_G(T)` to the space of conjugacy classes of `G`
is a bijection and, both orbit spaces being compact Hausdorff, a homeomorphism (Bröcker–tom Dieck,
Ch. IV, §§1–2).
*Needs:* §6.3; §2.2 for the closed subgroup `C_G(u)`.

**Checks.**
- `SU(2)`: `diag(z, z̄)` and `diag(z̄, z)` lie in one conjugacy class and are swapped by the nontrivial
  element of `N(T)/T = C₂`; the quotient is the arc of eigenvalue arguments `0 ≤ θ ≤ π`.
- `U(n)`: `T` modulo `N(T)/T = S_n` is the set of unordered spectra, the spectral theorem.
- The full centralizer need not be connected, which is why the argument passes to `C_G(u)⁰`: for
  `u = diag(1, −1, −1) ∈ SO(3)` the centralizer is the disconnected group `O(2)` of the rotations
  about the first axis and the half-turns about the axes perpendicular to it.

### 6.5 Compact real roots and the Weyl comparison

For compact connected `G` and maximal torus `T`, use §5A.1's real `Ad`-invariant positive inner
product and orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤, 𝔤]`, with their invariance and bracket equations.
Construct `𝔱 = 𝔷(𝔤) ⊕ 𝔱_ss` by restriction; the centre lies in every maximal toral subalgebra.
Simultaneously diagonalize the commuting unitary adjoint action of `T` on `𝔤_ℂ`, form its nonzero
root characters `χ_α : T → S¹` and real root planes, and prove `dχ_α = iα`. Identify the zero weight
space with `𝔱_ℂ`. Prove that `𝔱_ss,ℂ` is a Cartan subalgebra of the complexified semisimple summand
(Mathlib `LieSubalgebra.IsCartanSubalgebra`) and match the weight and root spaces. Using the
`𝔰𝔩₂`-string and integrality results (Tau Ceti `TauCeti.exists_int_of_hasEigenvalue`,
`TauCeti.finrank_eq_of_hasPrimitiveVectorWith`, `TauCeti.exists_int_apply_coroot`) and the
one-dimensionality of root spaces of a Killing Lie algebra (Mathlib
`LieAlgebra.IsKilling.finrank_rootSpace_eq_one`), prove that complex root spaces are lines and real
root planes have dimension 2, that the roots vanish on `𝔷(𝔤)` and span `𝔱_ss*`, and that they form a
finite reduced crystallographic root pairing with their coroots. Establish the root-space bracket
and rank-one normalization needed for the comparison, not only a list of weights. With the
invariant metric put `α∨ = 2α♯/‖α‖²` and prove that the root reflections act by `X ↦ X − α(X)α∨`.
Export the root-pairing isomorphism with `LieAlgebra.IsKilling.rootSystem` on `𝔱_ss,ℂ`, preserving
roots, coroots, reflections and the Weyl action fixing the centre. This is the compact real
realization of the abstract root system of [RootSystems](../RootSystems/README.md); character
periods and integral-lattice and isogeny refinements are ConvexityToric T1's.
(Bröcker–tom Dieck, Chs. IV–VI.)
*Needs:* §§5A.1, 6.1, 6.3; Mathlib `LieAlgebra.IsKilling.rootSystem`, `RootPairing`; Tau Ceti as
named.

**Checks.**
- `SU(2)`, `T = {diag(e^{iθ}, e^{−iθ})}`: the roots are `±α` with `χ_α(diag(z, z̄)) = z²`, the real root
  plane is spanned by `[[0, 1], [−1, 0]]` and `[[0, i], [i, 0]]`, and `α∨` is `diag(i, −i)` up to the
  identification `dχ_α = iα`; `α(α∨) = 2`.
- `U(n)`: the roots are `e_j − e_k`, `j ≠ k`, all vanishing on the centre `iℝ · 1`, and the root
  system is of type `A_{n−1}` on `𝔱_ss`.

### 6.6 Rank-one representatives

For each root build the compact `𝔰𝔲(2)` subalgebra from its real root plane and coroot, with its
normalized brackets. Integrate the resulting Lie-algebra homomorphism out of the simply connected
`SU(2)` (§§2.4, 4.3) to `φ_α : SU(2) → G`, and prove the derivative and torus and normalizer
equations. Its image is compact and connected; its standard normalizer element gives
`n_α ∈ N_G(T)` inducing the reflection of §6.5. For `X ∈ 𝔱` with `α(X) = 0`, show that the rank-one
Lie algebra centralizes `X` and, by connectedness, that its group image and `n_α` lie in `Z_G(X)⁰`.
Prove the restriction and conjugation laws: these are representatives, not only the name of an
abstract reflection. Pin `dφ_α(diag(i, −i)) = α∨`. With `dχ_α = iα` and `α(α∨) = 2`, record the
calibration for a later algebraic cocharacter `ν_alg` extending this compact circle:
`dν_alg(1) = −iα∨` and `d(ν_alg|S¹)(i) = α∨`, so that its root pairing is `dα_alg(dν_alg(1)) = 2`. The
pinned algebraic comparison proves the extension and matches the root maps; the compact construction
here assumes nothing from algebraic groups.
(Bröcker–tom Dieck, Chs. IV–VI.)
*Needs:* §§2.4, 4.3, 6.5.

**Checks.**
- `G = SU(2)` itself: `φ_α` is the identity and `n_α = [[0, −1], [1, 0]]`, which acts on `T` by
  inversion, the reflection of the root `α`.
- `G = SO(3)` with `T` the rotations about the first axis: `φ_α : SU(2) → SO(3)` is the double cover,
  not injective; the representative of the reflection is a half-turn about an axis perpendicular to
  the first.

### 6.7 The Weyl group

The Weyl group is `Subgroup.normalizerQuotient T`, finite by
`TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient`; it acts on `T` by conjugation and on `𝔱` by
the adjoint action (`Subgroup.normalizerQuotientMulAut`, `Subgroup.weylAdjointRepresentation`,
intertwined by `TauCeti.Lie.lieExp_weylAdjointRepresentation_apply`). Prove
`centralizer_eq_of_isMaximalTorus`: `C_G(T) = T` for compact connected `G`, so these actions are
faithful. Route, using only the maximal-torus theorems above: if `g` centralizes `T`, choose a
maximal torus `S` containing `g`; both `S` and `T` lie in `C_G(g)⁰` and are maximal there; conjugate
`S` to `T` inside `C_G(g)⁰`; that conjugation fixes `g`, hence `g ∈ T` (Bröcker–tom Dieck, Ch. IV,
§1). This does not use the later Lie-algebra centralizer theorem of HamiltonianReduction R2.

Identify the action of the Weyl group on `𝔱_ss` with the Weyl group of the root pairing of §6.5,
fixing the centre, by proving both inclusions: the rank-one representatives of §6.6 realize the
abstract reflection subgroup, and the converse needs the compact normalizer and root-crossing
argument showing that every element of the geometric Weyl group acts by a product of root
reflections. For this, construct the regular-chamber comparison. Put
`𝔱_reg = {X : α(X) ≠ 0 for every root}` and `𝔤_reg = Ad(G) · 𝔱_reg`. Prove that every element of `𝔤` is
conjugate into `𝔱`, and use the centralizer-dimension formula to identify `𝔤_reg` with the locus of
minimal centralizer dimension and with the complement of the singular images below; in the case
with no roots `𝔤_reg = 𝔤`. Construct the proper local-diffeomorphism covering
`q : G/T × 𝔱_reg → 𝔤_reg`, `q([g], X) = Ad_g X`, using the root-plane derivative, maximal-torus
conjugacy and the invariant norm. For each root form the compact subgroup `H_α = T · φ_α(SU(2))`, of
dimension `dim T + 2`; prove that it centralizes `ker α` and that the singular set is the finite
union of the images of `G/H_α × ker α`, each domain of dimension `dim 𝔤 − 3`.

Prove that `𝔤_reg` is connected and simply connected. Use
[DifferentialGeometry](../../DifferentialGeometry/README.md) 10.2 for finite-dimensional Sard, and
construct and justify here the smooth perturbation families relative to fixed boundary collars,
including the interior evaluation, submersion and finite-dimensional parameter argument; no
separate relative-genericity theorem is assumed. First approximate continuous paths and discs in `𝔤`
by smooth maps, preserving a compact avoidance reserve on the designated subset where the data are regular, in
particular the endpoint and boundary collars, and prove that the straight-line homotopy there stays
in `𝔤_reg`; no avoidance is assumed on an initial filling disc away from that subset. Fix data
that are smooth near the collars, and smooth arbitrary continuous boundary data before fixing a
smooth collar. Prove the avoidance of the finite family in dimensions 1 and 2 with those fixed
smooth boundary data; a bare dimension count on an arbitrary singular set does not supply this.

Identify the connected components of `𝔱_reg` with the nonempty root-sign cones: signs are constant
on connected sets, and each such cone is open and convex. Under the compact real realization
identify them with the `W`-translates of the open dominant chamber of the abstract root system on
the dual Cartan carrier, including the unrestricted `𝔷(𝔤)` factor (Tau Ceti
`TauCeti.existsUnique_mem_orbit_inter_dominantChamber`,
`TauCeti.stabilizer_eq_closure_wallReflections`). Prove the reflection, action and cone-intersection
comparisons before applying abstract transitivity to these components. Each component `G/T × C`
then covers `𝔤_reg` diffeomorphically, so the geometric Weyl group acts freely on the chambers; the
abstract reflection group acts transitively, which gives the reverse inclusion. In the case with no
roots prove both Weyl groups trivial directly. No chamber or centralizer theorem of
HamiltonianReduction R2, no period theorem of ConvexityToric T1, no complexification of Layer 7 and
no flag theorem of Layer 8 is an input. Export the equivariant linear, root and coroot maps and the
reflection evaluations.
*Needs:* §§6.1–6.6; DifferentialGeometry 10.2; Mathlib `RootPairing.weylGroup`; Tau Ceti as named.

**Checks.**
- `U(n)`: `C(T) = T`, the Weyl group is `S_n` acting by permuting the diagonal entries, and it is
  the Weyl group of the root system `A_{n−1}`, generated by the transpositions, the reflections in
  the roots `e_j − e_k`.
- `SU(2)`: `𝔱_reg = 𝔱 ∖ {0}` has two components, swapped by the Weyl group `C₂`; `𝔤_reg = 𝔰𝔲(2) ∖ {0}`,
  which is connected and simply connected (a punctured `ℝ³`), and the singular set `{0}` has
  dimension `0 = dim 𝔤 − 3`.
- For the disconnected `O(2)` with `T = SO(2)`: `C(T) = T`, `N(T) = O(2)` and the Weyl group has order
  two, but the reflections are conjugate into no torus; the conclusions of §6.3 need connectedness
  even where `C(T) = T` holds.

### 6.8 Invariant volume and Haar

Construct the left-invariant Riemannian volume from §5A.1's `Ad`-invariant form, prove that it is
bi-invariant, and identify its normalization with the Haar probability of
[CompactGroups](../CompactGroups/README.md) §0.1 (Tau Ceti `TauCeti.haarProb`) by uniqueness. Prove
the quotient and product integration formulas and the orientation and Jacobian comparisons used in
§6.9.
(Bröcker–tom Dieck, Chs. IV–VI.)
*Needs:* §5A.1, §6.2; CompactGroups §0.1; Mathlib `MeasureTheory.Measure.haar`.

**Checks.**
- On the circle, the volume of the invariant metric `dθ²` is `2π`, and the normalized measure is
  `dθ/2π`, Mathlib's `AddCircle.haarAddCircle` through `AddCircle 2π ≅ Circle`.

### 6.9 The Weyl integration formula

For compact connected `G` and maximal torus `T`, use the normalized Haar probabilities `μ_G`, `μ_T`
and the quotient probability `μ_{G/T}`, the pushforward of `μ_G`. Let `c : G/T × T → G`,
`c([g], t) = g t g⁻¹`, and let `D` be the Weyl density `TauCeti.Lie.weylDensity T`,
`D(t) = |det((Ad(t⁻¹) − 1) on 𝔤/𝔱)|`, which is well defined because `Ad(t⁻¹) − 1` preserves `𝔱`
(`TauCeti.Lie.lieSubalgebraOfSubgroup_le_comap_Ad_sub_id`) and continuous
(`TauCeti.Lie.continuous_weylDensity`). Prove the Borel measure identity
`c_*((D/|W|) · (μ_{G/T} ⊗ μ_T)) = μ_G` (`weyl_conjugation_pushforward`), with its determinant and
Jacobian computation, measurability, the singular locus as a null set, the normalizations and the
rank-zero case. Prove `weyl_integration_formula`: for a continuous class function
`f : G → ℝ`, `∫_G f dμ_G = |W|⁻¹ ∫_T f(t) D(t) dμ_T` (Bröcker–tom Dieck, Ch. IV, §1). Deduce by
change of variables and the Tonelli and absolute-value comparison that a conjugation-invariant real
or complex `L¹(μ_G)` function has integrable weighted restriction `f|_T · D` with respect to `μ_T`,
and the same formula for it; the measure identity also compares almost-everywhere representatives
in these weighted spaces. The unweighted restriction need not be integrable, and boundedness of `D`
alone does not justify restricting an `L¹` class: first prove the continuous formula, then derive the
`L¹` extension from the measure identity. Prove the positive-root form
`D(t) = ∏_{α>0} |1 − α(t)⁻¹|²` of the density through §6.5, and derive the orthogonality of compact
Weyl characters with the torus Fourier analysis and the Haar interfaces of CompactGroups §6.2.
For `SU(2)` this recovers CompactGroups §E.4 (Tau Ceti `TauCeti.SU2.weyl_integration_formula`).
*Needs:* §§6.1–6.8; Tau Ceti as named; Mathlib `MeasureTheory.Measure.map`,
`MeasureTheory.Measure.withDensity`; CompactGroups §§0.1, 6.2.

**Checks** for the Weyl density `TauCeti.Lie.weylDensity`.
- `SU(2)`, `t = diag(z, z̄)`, `z = e^{iθ}`: `Ad(t⁻¹)` on `𝔤/𝔱 ≅ ℂ` is rotation by `−2θ`, so
  `det(R − 1) = 2 − 2cos 2θ = 4 sin²θ = |1 − z²|²`; `(1/2π)∫₀^{2π} 4 sin²θ dθ = 2 = |W|`, and the formula
  with `f = 1` gives `1`.
- Rank zero (`G = 1`) and tori (`G = T`): `𝔤/𝔱 = 0`, the determinant is the empty product `1`,
  `|W| = 1`, and the formula reads `∫_G f = ∫_T f`.
- Taking the determinant on `𝔤` instead of on `𝔤/𝔱` gives `0` whenever `dim T > 0`, since
  `Ad(t⁻¹) − 1` kills `𝔱`, and the formula would read `1 = 0` for `f = 1`. (Using `Ad(t)` in place of
  `Ad(t⁻¹)` gives the same value, because the roots come in pairs `α, −α` with
  `|1 − α(t)| = |1 − α(t)⁻¹|`; the convention is not load-bearing.)
- The `L¹` extension on `SU(2)`: `f = 1/sin²θ` off the two central elements, `f = 0` there, is in
  `L¹(G)` with `∫_G f = ½ · (1/2π)∫₀^{2π} 4 dθ = 2`, while its unweighted restriction to `T` is not
  integrable and `f · D = 4` is.

### Examples

- `U(n)`: `T` the diagonal unitary matrices `≅ (Circle)^n`; every unitary matrix is conjugate into
  `T`; all maximal tori are conjugate; the Weyl group is `S_n`; and the Weyl integration formula is
  the classical eigenvalue density `|Δ(z)|² = ∏_{j<k} |z_j − z_k|²`.
- `SU(2)` and `SO(3)`: one-dimensional tori, Weyl group `C₂`, densities `4 sin²θ` and `2 − 2cos θ`.

### Dependencies

Layers 0–5A; §2.4 and §4.3 for §6.6. CompactGroups §§0.1, 6.2 and E.1–E.4.
SmoothBundlesConnections B1.1 and B1.4. DifferentialGeometry 10.2–10.5. RootSystems through Tau
Ceti's chamber theorems. Mathlib root pairings, Killing Lie algebras and Haar measure.

## Layer 7: complexification and real forms

### 7.1 Compact real forms of semisimple Lie algebras

Before the group-level statements, construct the compact real form of a complex semisimple Lie
algebra. Use the split Chevalley–Serre presentation of [LieHighestWeight](../LieHighestWeight/README.md)
§7.1, not an unstated normalization of all root vectors. Define the conjugate-linear involution `τ`
through the Serre universal property into the conjugate Lie algebra: its integer relations permit
`h_i ↦ −h_i`, `e_i ↦ −f_i`, `f_i ↦ −e_i` together with conjugation of scalars, so that `τ` is the
Chevalley involution `TauCeti.serreChevalleyInvolution` composed with the conjugation of the split
real form. Prove bracket
compatibility and `τ² = 1`. Construct the full normalization of root vectors by induction on height
with the `𝔰𝔩₂`-strings (§6.5's Tau Ceti inputs), proving the real structure constants and the
opposite-root sign relations used in the Killing computation. For `H_τ(x, y) = −B_ℂ(x, τy)` (linear in
`x`), prove Hermitian symmetry and `ad(e_i)† = ad(f_i)`, positivity on the Cartan subalgebra, and
positivity on root spaces by induction on height. Deduce that the real Killing form is
negative-definite on the fixed real form, comparing the real and complex Killing forms explicitly,
and prove real-form descent. Prove also the compatibility with an arbitrary real form: for a real
semisimple Lie algebra `𝔤₀` with conjugation `σ` on `𝔤 = 𝔤₀ ⊗ ℂ`, conjugate `τ` by an inner
automorphism so that `στ = τσ`, and define the Cartan involution `θ` as the restriction of `στ` to
`𝔤₀`, with its positive form `−B(X, θY)` (Knapp, Ch. VI, §2). Layer 9 uses this `θ`.
*Needs:* LieHighestWeight §7.1; Mathlib `killingForm`, `LieAlgebra.IsKilling`; Tau Ceti
`TauCeti.serreChevalleyInvolution` and the `𝔰𝔩₂`-string results of §6.5.

**Checks** for the compact real form `τ` and the Cartan involution `θ`.
- `𝔰𝔩₂(ℂ)` with `h, e, f`: `τ(h) = −h`, `τ(e) = −f`, `τ(f) = −e`, conjugate-linear; the fixed real form
  is `span_ℝ(ih, e − f, i(e + f)) = 𝔰𝔲(2)`; with the Killing values `B(e, f) = 4`, `B(h, h) = 8`,
  `H_τ(e, e) = −B(e, τe) = B(e, f) = 4 > 0` and `H_τ(h, h) = B(h, h) = 8 > 0`.
- The split form `𝔤₀ = 𝔰𝔩₂(ℝ)` with entrywise conjugation `σ`: `στ = τσ` holds without conjugating `τ`, and
  `θ = στ|_{𝔤₀}` is `X ↦ −Xᵀ`, with `𝔨 = 𝔰𝔬(2)`, `𝔭` the symmetric trace-zero matrices and
  `−B(X, θX) = B(X, Xᵀ) = 4 tr(XXᵀ) > 0` for `X ≠ 0`.
- The complex-linear Chevalley involution `h ↦ −h`, `e ↦ −f`, `f ↦ −e` without conjugation of scalars
  is a Lie automorphism, but its fixed set is a complex subalgebra (not a real form of half real
  dimension) and `−B(x, ·)` composed with it is bilinear, not Hermitian; conjugate-linearity is what
  makes `H_τ` Hermitian and positive.

### 7.2 Complex tangent carriers, realification and exponential compatibility

For a finite-dimensional complex Lie group `H` modelled on `𝓘(ℂ, E)`, use `GroupLieAlgebra 𝓘(ℂ, E) H`
with its complex bracket of left-invariant tangent vector fields. Use
[ComplexManifolds](../../ComplexManifolds/README.md) Milestone 1 to construct `H_ℝ` on the same
carrier with the realified model `I_R`, including multiplication and inversion. Construct the natural
real-linear equivalence from the underlying real vector space of `GroupLieAlgebra 𝓘(ℂ, E) H` to
`GroupLieAlgebra I_R H_ℝ`, and prove that it preserves brackets by comparing the real and complex
derivatives of the invariant fields in realified charts. Apply
`leftInvariantDerivationLieEquivGroupLieAlgebra` only to `H_ℝ`, with its real finite-dimensional
smooth model and interior identity. Transport multiplication by `i` to that real derivation algebra;
prove `J² = −1` and complex bilinearity `[JX, Y] = J[X, Y] = [X, JY]`. This gives the
complex-structured real derivation comparison without asserting a derivation equivalence on
arbitrary complex smooth-function algebras. Prove naturality under holomorphic homomorphisms, adjoint
maps and embedded real forms, including `Lie(K) ⊗_ℝ ℂ ≃ Lie(H)` for a specified real form and its
Cartan and central restrictions. For such a real form require the complexified differential to be an
isomorphism, with `dim_ℝ Lie(K) = dim_ℂ Lie(H)`; the realification of `Lie(H)` has twice that real
dimension and is not the algebra being complexified in this map.

Define the global `exp_H : Lie(H) → H` by transporting `lieExp` of `H_ℝ` along the preceding
equivalence. Prove that it is holomorphic: the integral of §1.4 commutes with multiplication by `i`
because `ad X` is complex-linear, and complex translations have complex-linear derivatives, so `exp_H`
has complex-linear real derivative everywhere, and finite-dimensional complex calculus gives
holomorphy. Its derivative at `0` is the identity; use the holomorphic inverse function theorem on
complex manifolds of [ComplexKahlerGeometry](../../ComplexKahlerGeometry/README.md) Layer 1 (K1), with
the strict-derivative inverse over `ℂ`, to obtain holomorphic charts near `0` and `1`. Naturality gives
compatibility with included real subgroups. Compare holomorphic matrix groups with the unit
exponential through the realified finite-dimensional algebra and `lieExp_eq_expUnit`, under its
hypotheses. For arbitrary source and target universes prove the universe-polymorphic transport: use
`ULift` type copies to transport the group, charted-space and Lie-group structures,
`GroupLieAlgebra` and the tangent equivalences, and prove that the transports commute with the
character and period maps and with the universal properties of §§7.3 and 7.6. Export the totally real
chart of a specified real form. This global map on a given complex group is independent of the
construction of a new complex group by convergent complex BCH in §7.3.
(Knapp, Chs. I, IV–VII.)
*Needs:* §§0.1–0.4, 1.4; ComplexManifolds Milestone 1; ComplexKahlerGeometry Layer 1; Mathlib
`GroupLieAlgebra`, `ULift`; Tau Ceti `leftInvariantDerivationLieEquivGroupLieAlgebra`,
`lieExp_eq_expUnit`.

**Checks.**
- `H = ℂˣ`: `Lie(H) = ℂ`, `exp_H = exp`, holomorphic; its realification has real dimension 2, and the
  real form `S¹` has `Lie(S¹) ⊗_ℝ ℂ = iℝ ⊗ ℂ ≅ ℂ`, of complex dimension 1 = `dim_ℝ Lie(S¹)`.
- On `GL_n(ℂ)`, `J` is multiplication by `i` on matrices and `[iX, Y] = i[X, Y]`; the realified group
  `GL_n(ℂ)_ℝ` has real Lie algebra `𝔤𝔩_n(ℂ)` of real dimension `2n²`.

### 7.3 Universal complexification and its periods

First construct the complex form of the integration theorem of Layer 4: holomorphic exponential
charts from convergent complex BCH give the simply connected complex integration of a
finite-dimensional complex Lie algebra, and complex-linear Lie homomorphisms integrate
holomorphically; include the convergence, chart transitions and holomorphic multiplication and
inversion. The smooth local BCH germ of §3.3 alone is not this analytic result. For a connected real
Lie group `G`, let `p : G̃ → G` be the universal cover of §5.1, `H` the simply connected complex
integration of `𝔤 ⊗_ℝ ℂ`, and `j : G̃ → H` the integrated real inclusion. Construct the smallest
closed complex subgroup `N` containing `j(ker p)`, prove it central, construct the complex quotient
`H/N`, and descend `j` to `η : G → G_ℂ = H/N`. Prove `exists_connected_complexification`: for every
connected `G` there are a complex Lie group `G_ℂ` and a continuous homomorphism `η : G → G_ℂ` through
which every continuous homomorphism of `G` into a complex Lie group factors uniquely by a holomorphic
homomorphism. No injectivity of `η` is claimed. Prove uniqueness, functoriality and the quotient
Lie-algebra formula `Lie(G_ℂ) ≅ (𝔤 ⊗_ℝ ℂ)/Lie(N)`. A reductive Lie algebra alone does not remove `N` or
make `η` injective. The construction covers connected real reductive groups and their non-linear
covers. For groups with finitely many components extend the construction from `G⁰`: choose
component representatives, extend their conjugation automorphisms to `(G⁰)_ℂ`, transport the
component multiplication cocycle, prove its compatibility equations, and glue the corresponding
copies of `(G⁰)_ℂ`; prove independence of the representatives and the same universal property. The
connected period-quotient construction is recorded in Heins, *Entire functions on Lie groups*,
arXiv 2512.07479, Prop. 2.1; construct the quotient and all its descent laws here.
*Needs:* §§4.2–4.3, 5.1, 7.2; Tau Ceti `TauCeti.UniversalCover.exists_universalCover`.

**Checks.**
- `G = ℝ`: `G_ℂ = ℂ`; `G = Circle`: `G_ℂ = ℂˣ` with `η` the inclusion; `G = ℝ/ℤ × ℝ`: `ℂˣ × ℂ`.
- The universal cover `G` of `SL₂(ℝ)`: `𝔤 ⊗ ℂ = 𝔰𝔩₂(ℂ)`, `H = SL₂(ℂ)`, and `j` has image `SL₂(ℝ)`, so
  `η : G → SL₂(ℂ)` has the infinite kernel `ker(G → SL₂(ℝ))`: the universal complexification exists
  but is not injective. Without the universal property, the trivial group would satisfy the bare
  existence statement.

### 7.4 Compact semisimple integration

Integrate a compact semisimple real Lie algebra `𝔨_s` to its simply connected group by §4.2. The
negative of its Killing form gives a bi-invariant metric; compute all geodesics as the one-parameter
groups, defined for all time, and `Ric = ¼ g`. Use completeness of left-invariant metrics (Tau Ceti
`TauCeti.completeSpace_leftInvariantMetric`; [HopfRinow](../../../Completed/HopfRinow/README.md)
Layer 3) and Bonnet–Myers ([RiemannianGeometry](../../RiemannianGeometry/README.md) R4.5) to prove
that this integration is compact; the zero algebra gives a point. Its centre is discrete and compact,
hence finite. Deduce that a connected compact semisimple group has finite fundamental group and
compact universal cover, through the central kernel of §5.1. These precede the compact
complexification and the algebraic descent of compact forms.
(Knapp, Chs. I, IV–VII.)
*Needs:* §§4.2, 5.1–5.2, 5A.1; HopfRinow Layer 3; RiemannianGeometry R4.5; Tau Ceti
`TauCeti.completeSpace_leftInvariantMetric`.

**Checks.**
- `𝔨_s = 𝔰𝔲(2)` with `g = −B`: the simply connected group is `SU(2) ≅ S³`, compact, with `Ric = ¼ g > 0`.
- Semisimplicity is needed: `𝔨 = ℝ` carries the bi-invariant metric `dx²` with `Ric = 0`, and its
  simply connected integration `ℝ` is not compact.

### 7.5 Finite faithful representations and compact-case polar geometry

For every compact Lie group `G`, including all its components, use the point separation by
representative functions of [CompactGroups](../CompactGroups/README.md) §5.2 (Tau Ceti
`TauCeti.representativeStarSubalgebra_separatesPoints`) and its unitarization §1.2 (Tau Ceti
`ContRepresentation.isUnitarizable`). Prove the finite Lie-group consequence: intersect finitely many
derivative kernels to get an injective differential, leaving a discrete compact, hence finite,
residual kernel; add finitely many representations separating its nonidentity elements. This
constructs a faithful finite-dimensional unitary `ρ : G → U(V)`, smooth by §2.3. Extend `ρ` to
`ρ_ℂ : G_ℂ → GL(V)` by the finite-dimensional universal property of §7.3, before any
representation-equivalence theorem. Since `ρ = ρ_ℂ ∘ η`, `η` is injective, and compactness makes it a
topological embedding. The differential is injective after complexification because `dρ(𝔤) ⊂ 𝔲(V)`
is totally real, and the quotient formula of §7.3 then makes `dη_ℂ` an isomorphism. For `K = ρ(G)`
construct `P = K exp(i𝔨) ⊂ GL(V)`. Use the ambient complex unitary–positive polar decomposition and
logarithm of [CotangentLagrangian](../../SymplecticGeometry/CotangentLagrangian/README.md) C2.0 (Tau
Ceti `Matrix.GeneralLinearGroup.cartanHomeomorph`), and prove that `P` is a closed embedded
submanifold with unique smooth polar coordinates `K × 𝔨`. Its left-trivialized tangent spaces are
`𝔨_ℂ` by §1.4. Construct its complex subgroup structure and holomorphic atlas by local exponential and
leaf uniqueness; `K` normalizes `𝔨_ℂ`, so the construction includes all components. Prove the
universal property of `P`: polar coordinates give `π₁(K⁰) ≅ π₁(P⁰)`, so extension of the
differential descends through exactly the compact periods; then check the finite component
representatives, conjugation and multiplication cocycle. Identify `P` with `G_ℂ` by uniqueness of the
universal property and prove naturality under faithful representations. This compact case uses no
general theorem of Layer 9.
(Bump, Parts I–III.)
*Needs:* §§2.3, 4.1, 5.1, 7.3; CompactGroups §§1.2, 5.2; CotangentLagrangian C2.0; Tau Ceti as named.

**Checks.**
- `G = Circle`, `ρ` the identity character on `V = ℂ`: `K = U(1)`, `P = U(1) · exp(i · iℝ) = U(1) · ℝ_{>0} = ℂˣ`,
  with polar coordinates `z = e^{iφ} · r`.
- `G = SO(3)`, `ρ` the defining representation: `P = SO(3) exp(i𝔰𝔬(3)) = SO₃(ℂ)`, and `π₁(SO(3)) = π₁(SO₃(ℂ)) = ℤ/2`.

### 7.6 The compact complexification theorem

For every compact Lie group `G` obtain the smooth polar diffeomorphism `G × 𝔤 → G_ℂ`,
`(g, X) ↦ η(g) exp(i dη(X))`, with `η` an injective embedding; for compact connected `G` prove
`exists_complexification`, the statement of §7.3 with `Function.Injective η` added. Every compact
subgroup containing `η(G)` equals it: divide by the compact polar factor, then bounded positive and
negative powers of a positive Hermitian exponential force `X = 0`. So `η(G)` is a maximal compact
subgroup; keep the toral lattices, the finite semisimple centres and the identification
`π₀(G) ≅ π₀(G_ℂ)`. Prove the identifications `U(n)_ℂ ≅ GL_n(ℂ)`, `SU(n)_ℂ ≅ SL_n(ℂ)`,
`SO(n)_ℂ ≅ SO_n(ℂ)` and `Sp(n)_ℂ ≅ Sp_{2n}(ℂ)`, with their embeddings and differentials; the
Lie-algebra halves of the first three are Tau Ceti's `TauCeti.Lie.unitaryComplexificationLieEquiv`,
`TauCeti.Lie.specialUnitaryComplexificationLieEquiv` and `TauCeti.Lie.specialOrthogonalBaseChangeLieEquiv`,
and the maximal compactness of `U(n)` in `GL_n(ℂ)` is
`Matrix.GeneralLinearGroup.eq_unitarySubgroup_of_isCompact_of_le`. For the compact
`Sp(n) = Sp_{2n}(ℂ) ∩ U(2n)` the Lie-algebra half `𝔰𝔭(n) ⊗_ℝ ℂ ≅ 𝔰𝔭(2n, ℂ)` is part of this target
(`𝔰𝔭(2n, ℂ)` is closed under the conjugate transpose, so the skew-Hermitian splitting of the `SU(n)`
case applies); Tau Ceti's `TauCeti.Lie.symplecticBaseChangeLieEquiv` is the statement for the split
real form, `𝔰𝔭(2l, ℝ) ⊗_ℝ ℂ ≅ 𝔰𝔭(2l, ℂ)`, which is a different real form (for `n = l = 1`, `𝔰𝔩₂(ℝ)`
rather than `𝔰𝔲(2)`).
Noncompact groups and non-linear covers keep the general universal construction and its kernel and
period data; they are not asserted compact or maximal compact in their complexifications.
(Bump, Parts I–III.)
*Needs:* §§7.3, 7.5; Tau Ceti as named.

**Checks.**
- `U(1)` in `SL₂(ℂ)` by `z ↦ diag(z, z̄)` is an injective continuous homomorphism into a complex Lie
  group, but `SL₂(ℂ)` is not the complexification of `U(1)`: the weight-one character of `U(1)` extends
  to no holomorphic character of `SL₂(ℂ)`, which has none but the trivial one. The universal property
  is what identifies `G_ℂ`.
- `dim_ℝ 𝔲(n) = n² = dim_ℂ 𝔤𝔩_n(ℂ)`; the realification of `𝔤𝔩_n(ℂ)` has real dimension `2n²`.

### 7.7 Algebraic realization of compact complexifications

Before Layer 8 applies algebraic Bruhat theory or Borel–Weil to the complexification of a compact
group, construct for every compact connected `K` a connected affine reductive algebraic group `𝐊`
over `ℂ` and an analytic group isomorphism `𝐊(ℂ) ≃ K_ℂ` to the universal complexification of §7.3.
Route: take a faithful unitary representation `ρ : K → U(V)` (§7.5), extend it by the universal
property to `ρ_ℂ : K_ℂ → GL_ℂ(V)`, and let `𝐊` be the Zariski closure of `ρ(K)` in `GL_ℂ(V)`. Prove that
`𝐊` is connected and reductive and that `ρ_ℂ` identifies `K_ℂ` analytically with `𝐊(ℂ)`: establish
the image and kernel of the extension, surjectivity onto the complex points, and the differential
and period comparisons; Zariski density or a Lie-algebra comparison alone is insufficient. Transport
the maximal torus, the root subgroups and the full character and cocharacter lattice, including the
central and isogeny data. This construction is independent of Layer 8 and of
[ReductiveGroups](../../ReductiveGroups/README.md) Layer 7; ReductiveGroups Layer 7 then supplies the
single generic algebraic Bruhat theorem used in Layer 8.
(Bump, Parts I–III.)
*Needs:* §§7.3, 7.5–7.6, 7.9; ReductiveGroups Layers 0–4 and 6.

**Checks.**
- `K = U(1) ⊂ GL₁(ℂ)`: the Zariski closure is `𝔾_m` and `𝔾_m(ℂ) = ℂˣ = K_ℂ`. `K = SU(2) ⊂ GL₂(ℂ)`: the
  Zariski closure is `SL₂` and `SL₂(ℂ) = SU(2)_ℂ`.

### 7.8 Real forms and global descent

A real form of a complex Lie group `H` consists of a real Lie group `R`, a specified smooth
homomorphism `R → H` that is a closed embedding, and the induced complex Lie-algebra isomorphism
`Lie(R) ⊗_ℝ ℂ ≅ Lie(H)`. Define the identity-component and full fixed-subgroup variants for an
antiholomorphic group involution; prove that its fixed identity component is an embedded real form,
and compare the full fixed subgroup through its component group. For a connected complex `H` with
universal cover `H̃` and period subgroup `D`, integrate the conjugation of a real Lie-algebra form to
the antiholomorphic involution `σ̃` of `H̃`; prove that it descends to `H` exactly when `σ̃(D) = D`,
then identify the connected embedded real form with the fixed identity component, and require the
inclusion `R ⊂ H^σ` together with equality of the displayed component image for a full
fixed-group identification; abstract component-group data alone do not supply that inclusion.
Include the regression `H = ℂ/(ℤ + (√2 + i)ℤ)`, `R = ℝ/ℤ`: `R` is a closed embedded real form, but its
conjugation does not preserve the period lattice, so no antiholomorphic group involution fixes `R`
pointwise; component conditions alone do not give descent.
(Bump, Parts I–III; Knapp, Chs. I, IV–VII.)
*Needs:* §§4.3, 5.1, 7.2.

**Checks** for real forms.
- `H = ℂˣ`: `R = ℝ_{>0}` and `R = S¹` are both closed embedded real forms with `Lie(R) ⊗ ℂ = ℂ`; they are
  not conjugate, and only the second is compact.
- `H = ℂˣ`, `R = ℝˣ`, the full fixed group of `z ↦ z̄`: a real form with two components whose identity
  component `ℝ_{>0}` is the embedded connected real form; the identity-component and full-fixed-group
  variants differ here. In the regression above, `√2 − i = a + b(√2 + i)` forces `b = −1` and
  `a = 2√2 ∉ ℤ`, so the conjugate lattice is different.
- The closed embedded subgroup `{2ⁿ : n ∈ ℤ} ⊂ ℂˣ` has `Lie = 0`, and `0 ⊗ ℂ ≠ ℂ`: the Lie-algebra
  isomorphism, not closedness, is what makes a subgroup a real form.

### 7.9 The lower analytic dictionary

For a connected complex Lie group `H` with a specified biholomorphic group isomorphism `H ≃ G(ℂ)`,
take `G` smooth, connected, affine and reductive over `ℂ` as in ReductiveGroups Layer 6, with
ReductiveGroups Layer 1's faithful closed algebraic immersion `G → GL(V)`. The complex Lie group
`G(ℂ)` on the complex points of ReductiveGroups Layer 0's functor of points, its structure as a closed
embedded complex subgroup of `GL(V)(ℂ)` (the subspace topology and complex atlas), the holomorphy of
the homomorphisms induced by homomorphisms of group schemes, and the identification of its tangent
Lie algebra with ReductiveGroups Layer 2's `Lie(G)` and its bracket are ReductiveGroups §3A.5e's.
Build on them the lower analytic dictionary of the reductive case: identify `Z(G)⁰` with
ReductiveGroups Layer 6's central torus (Layer 4's character lattice gives `Z(G)⁰(ℂ) ≃ (ℂˣ)^m`) and its
tangent algebra with `𝔷(𝔤)`; and realize `G_der(ℂ)` as a closed connected complex subgroup with
tangent algebra `[𝔤, 𝔤]`, connected because the root subgroups and the torus of ReductiveGroups
Layer 7C generate it by path-connected images (`ℂ` and `ℂˣ` are path connected), with the central
multiplication `Z(G)⁰ × G_der → G` surjective on complex points with the finite kernel of
ReductiveGroups Layer 6's central isogeny.
(Knapp, Chs. I, IV–VII.)
*Needs:* ReductiveGroups §3A.5e and Layers 0, 1, 2, 4, 6 and 7C.

**Checks.**
- `G = GL_n`: `G(ℂ) = GL_n(ℂ)` with its usual structure, `Z(G)⁰ = ℂˣ · 1`, `G_der = SL_n`, and the
  multiplication `ℂˣ × SL_n(ℂ) → GL_n(ℂ)` is onto with kernel the `n`-th roots of unity `{(ζ, ζ⁻¹)}`.

### 7.10 Compact real forms of linear reductive groups

Integrate the compact semisimple form by §7.4. Its image in the closed derived subgroup of §7.9 is
compact; combine it with the compact part of the central torus and descend through the finite
kernel; prove that this is a compact real form. Prove conjugacy: for compact semisimple conjugations
`τ, τ'` prove that `σ = ττ'` is positive self-adjoint for `−B(x, τy)`; construct its positive powers as
Lie automorphisms and show that `log σ` is a derivation; use Mathlib's
`LieDerivation.IsKilling.exists_eq_ad` for the finite-dimensional complex Killing semisimple summand to
write `log σ = ad Z`, and realize `σ^{−1/2} τ σ^{1/2} = τ'` by `Ad(exp_H(−Z/2))`. Check the descent
through the central kernel. First prove conjugacy for connected compact real forms, treating the
central algebraic torus by its character lattice. For this connected linear reductive `H`, prove that
the constructed `K₀` has a compact-case polar decomposition onto `H`; prove
`N_H(K₀) = K₀ exp(i𝔷(𝔨₀))`, with quotient a split vector group, from the positive adjoint operator in
polar coordinates. Any compact real form `R` has `R⁰` conjugate to `K₀` and normalizes `R⁰`; its compact
image in that split quotient is trivial, hence `R = R⁰`. So every compact real form of this `H` is
connected and all are conjugate. This connectedness theorem is not asserted for arbitrary connected
complex period quotients.

For a connected `H` whose Lie algebra is only reductive, keep its discrete central subgroup `D` in its
simply connected complex integration. Prove the compact-complexification criterion: `H` is the
universal complexification of a compact Lie group if and only if there is a compact real form `𝔨` of
its Lie algebra whose connected real subgroup `K̃` of that integration contains `D` and has compact
quotient `K̃/D`; construct the resulting compact real form and prove the identification with the
universal complexification in both directions. Distinguish this from the existence of a compact
embedded real form: `ℝ/ℤ` embeds as such a form in `ℂ/(ℤ + iℤ)`, while its universal complexification
is `ℂ/ℤ ≅ ℂˣ` and the induced map onto `ℂ/(ℤ + iℤ)` has a nontrivial discrete kernel. Keep these
quotient maps and lattices. Reductivity of `Lie(H)` alone is not a theorem of existence of a compact
real form.
(Knapp, Chs. I, IV–VII.)
*Needs:* §§7.1, 7.4, 7.6, 7.8–7.9; Mathlib `LieDerivation.IsKilling.exists_eq_ad`.

**Checks.**
- `H = ℂ/(ℤ + iℤ)`: `R = ℝ/ℤ` is a compact embedded real form, but the induced map `ℂ/ℤ → ℂ/(ℤ + iℤ)` has
  kernel `(ℤ + iℤ)/ℤ`, the image of `iℤ`, which is infinite cyclic; so `H` is not the universal
  complexification of `R`.
- `H = SL₂(ℂ)`: the compact real forms are the conjugates of `SU(2)`, all connected, and
  `N_H(SU(2)) = SU(2)` (the centre `𝔷(𝔰𝔲₂)` is `0`).

### 7.11 Representations and holomorphic descent

Representations take values in `GL(V) = (V →L[ℂ] V)ˣ`, holomorphy of group homomorphisms being an
explicit condition. For compact `G`, construct the restriction equivalence between
finite-dimensional holomorphic representations of `G_ℂ` and continuous representations of `G`, with
its action on intertwiners, inverse functor, unit and counit, and compatibility with tensor products
and duals; the extension half is the universal property of `exists_complexification` applied to the
complex Lie group `GL(V)` (every continuous finite-dimensional representation `ρ` of compact
connected `G` is `ρ_ℂ ∘ η` for a unique holomorphic `ρ_ℂ` of `G_ℂ`). For connected `G`, extend the
differential complex-linearly and integrate it on `H` of §7.3; by uniqueness its restriction along `j` is the original representation
pulled back along `p`; hence its closed complex kernel contains `j(ker p)`, and therefore `N`. Descend
through `H/N` and prove uniqueness there. For finitely many components check the extended conjugation
and multiplication-cocycle equations as well. This proves descent from the period law of the given
representation; it does not assume that `G_ℂ` is simply connected. Compare the connected compact
highest-weight classification with [LieHighestWeight](../LieHighestWeight/README.md) and with the
representations and characters of [CompactGroups](../CompactGroups/README.md); Peter–Weyl in general
stays CompactGroups' independent Haar and compact-operator construction.
(Bump, Parts I–III.)
*Needs:* §§7.3, 7.5–7.6; CompactGroups.

**Checks.**
- `G = Circle`, `G_ℂ = ℂˣ`: the continuous characters `z ↦ zⁿ` extend to the holomorphic characters
  `z ↦ zⁿ` of `ℂˣ`, and these are all of them.
- `G = SU(2)`: the irreducibles `Symⁿ(ℂ²)` of CompactGroups §E.2 extend to the holomorphic
  `SL₂(ℂ)`-modules `L(n)`.

### 7.12 Compact-real-form pairs and algebraic morphisms

Construct the category whose objects are a smooth connected affine reductive algebraic group `G` over
`ℂ`, a connected compact Lie group `K`, and a specified smooth homomorphism `ι : K → G(ℂ)` that is a
closed embedding and whose complexified differential is a Lie-algebra isomorphism. A morphism
consists of a regular homomorphism of algebraic groups `F : G → G'` and a continuous homomorphism
`f : K → K'` with `F(ℂ) ∘ ι = ι' ∘ f`. Prove that `f` is unique and identify these morphisms with the
regular `F` carrying `ι(K)` into `ι'(K')`. Construct identities and composition, and the restriction
to connected compact Lie groups with continuous homomorphisms. The compact-form and polar theorem of
§7.10 identifies `G(ℂ)` with the universal complexification of `K`; keep `dim_ℝ Lie(K) = dim_ℂ Lie(G(ℂ))`
and the embedding.

For every `f : K → K'`, construct its unique holomorphic extension by the universal property and prove
it regular algebraic. Form the compact graph `Γ_f ⊂ K × K'` and its Zariski closure `H ⊂ G × G'` (in
ReductiveGroups Layer 1's faithful algebraic models). Unitarize the restricted faithful
representation and apply the compact algebraization, polar and universal-property comparisons of
§§7.5–7.7 to `Γ_f`. Prove that `H(ℂ)` is the analytic graph of the extension and that its first
projection onto `G(ℂ)` is a holomorphic group isomorphism; density or a Lie-algebra comparison alone
does not prove these global assertions. Prove that the algebraic projection `H → G` is an isomorphism:
construct its scheme kernel and image with ReductiveGroups Layers 0–3, use characteristic-zero
smoothness and the point and tangent comparisons to prove the kernel trivial, and prove surjectivity
and faithful flatness; give the quotient and descent argument constructing its regular inverse. This
projection criterion is part of the comparison, not an assumption that an arbitrary analytic inverse
is algebraic. Compose that inverse with `H → G'` to obtain `F`, and prove uniqueness from the Zariski
density of `ι(K)` in `G`; prove compatibility with identities and composition.

Use compact algebraization to construct a quasi-inverse to restriction; construct its unit and counit
from the compact embeddings and unique regular extensions, prove their naturality and the triangle
equations, and conclude that the two categories are equivalent. Prove independence, through these
unique isomorphisms, of the faithful matrix models, the unitarizing metrics and the chosen
algebraizations. Include the point, compact tori and finite central quotients with their full
character and period lattices. This construction uses the lower analytic dictionary of §7.9 and the
compact polar and algebraization theorems of this layer, before Layer 8; it needs no generic
representation reconstruction of ReductiveGroups Layer 10 and no analytic GAGA theorem. The
restriction equivalence of finite-dimensional representations in §7.11 is a separate comparison.
(Bump, Parts I–III.)
*Needs:* §§7.5–7.7, 7.9–7.10; ReductiveGroups Layers 0–3.

**Checks.**
- `G = SL₂(ℂ)`, `K = SU(2)`: conjugation by `diag(2, 1/2)` is a regular automorphism of `SL₂` sending
  `[[0, −1], [1, 0]] ∈ SU(2)` to `[[0, −4], [1/4, 0]]`, which is not unitary; so it is not a morphism of
  pairs `(SL₂, SU(2)) → (SL₂, SU(2))`, and the compact-form condition on morphisms is substantive.
- `G = 𝔾_m`, `K = U(1)`: the morphisms `(𝔾_m, U(1)) → (𝔾_m, U(1))` are the characters `z ↦ zⁿ`, `n ∈ ℤ`,
  matching the continuous endomorphisms of `U(1)`.

### Examples

- `(U(n))_ℂ = GL_n(ℂ)`, `(SU(n))_ℂ = SL_n(ℂ)`, `(SO(n))_ℂ = SO_n(ℂ)`; finite-dimensional representations of
  `SU(n)` extend to holomorphic representations of `SL_n(ℂ)`, matching the highest-weight
  classification of LieHighestWeight and the Peter–Weyl theorem of CompactGroups.
- `ℂˣ` has the two non-conjugate real forms `ℝ_{>0}` (split) and `S¹` (compact).

### Dependencies

Layers 0–6. LieHighestWeight §7.1. ComplexManifolds Milestone 1. ComplexKahlerGeometry Layer 1.
HopfRinow Layer 3. RiemannianGeometry R4.5. CompactGroups §§1.2, 5.2 and E.2. CotangentLagrangian
C2.0. ReductiveGroups §3A.5e and Layers 0–4, 6 and 7C. Tau Ceti: the derivation–tangent and
unit-exponential comparisons, the universal cover, the complexified Lie algebras of the classical
groups, the matrix polar decomposition and maximal compact subgroups, completeness of left-invariant
metrics, the Chevalley involution of a Serre presentation.

## Layer 8: Borel–Weil, flag manifolds, and Bruhat

### 8.1 Borel subgroups and the flag manifold

The inputs are either (i) a compact connected Lie group `K`, its universal complexification `K_ℂ`
(§7.3) and the algebraization `𝐊(ℂ) ≃ K_ℂ` of §7.7, or (ii) a connected affine reductive algebraic
group `𝐆` over `ℂ`, with its analytic group `𝐆(ℂ)` (ReductiveGroups §3A.5e) and the lower analytic
dictionary of §7.9, and its compact form `K` constructed by §7.10 from that dictionary. In either
case work with the resulting affine reductive algebraic group `𝐆`, its full character and
cocharacter lattices, a maximal torus `𝐓` and a positive system of roots. Construct the algebraic
Borel subgroup `𝐁 = 𝐓 ⋉ 𝐍₊`, where `Lie(𝐍₊) = ⊕_{α>0} 𝔤_α`, and use its algebraic characters as
holomorphic characters of `𝐆(ℂ)`. The quotient `𝐆(ℂ)/𝐁(ℂ)` is the compact complex flag manifold, and
the generic algebraic Bruhat theorem of [ReductiveGroups](../../ReductiveGroups/README.md) Layer 7
applies to `𝐆` before transport through the specified analytic isomorphism. The diffeomorphism
`K/T ≅ 𝐆(ℂ)/𝐁(ℂ)` follows from the compact-form and algebraization comparison of Layer 7; it is not
asserted for an unrelated real group. The elliptic curve `ℂ/(ℤ + iℤ)` is not a linear complex
reductive group and is outside these hypotheses.
(Bump, Parts I–III.)
*Needs:* §§6.1, 7.7, 7.9–7.10; ReductiveGroups §3A.5e and Layers 6 and 7; §6.2 for the quotient
manifold.

**Checks.**
- `𝐆 = SL₂`: `𝐁` the upper triangular matrices, `𝐆(ℂ)/𝐁(ℂ) = ℙ¹(ℂ)`, and `K/T = SU(2)/U(1) = S²`, the same
  two-sphere.
- `𝐆 = GL_n`: the flag manifold is the space of complete flags in `ℂⁿ`, of complex dimension
  `n(n − 1)/2`, the number of positive roots.

### 8.2 Bruhat and Schubert geometry

ReductiveGroups Layer 7 is the single owner of the generic Bruhat theorem `G_ℂ = ⊔_{w∈W} B w B`. The
abstract BN-pair carrier is Tau Ceti's `TauCeti.TitsSystem`, whose Weyl group
`TauCeti.TitsSystem.WeylGroup` is the quotient `N ⧸ (B ∩ N)` and which comes with existence and
uniqueness of the cell (`TauCeti.TitsSystem.existsUnique_mem_bruhatCell`,
`TauCeti.TitsSystem.bruhatCell_injective`, `TauCeti.TitsSystem.disjoint_bruhatCell_iff`); no second
BN-pair record is introduced. Apply ReductiveGroups Layer 7 to the groups of §8.1 as a
`TauCeti.TitsSystem` on `𝐆(ℂ)` with `subgroupB = 𝐁(ℂ)` and `subgroupN = N_{𝐆(ℂ)}(𝐓(ℂ))`; prove
`𝐁(ℂ) ∩ N_{𝐆(ℂ)}(𝐓(ℂ)) = 𝐓(ℂ)` (in the connected solvable group `𝐁` the normalizer of `𝐓` equals its
centralizer, and `C_𝐆(𝐓) = 𝐓` for reductive `𝐆`; Humphreys, *Linear algebraic groups*, §29.1), and
deduce the group isomorphism between the Weyl quotient of the Tits system and the Weyl group of
Layer 6, so that the cells are indexed without repetition by the Weyl group. Then construct the
Schubert cells `BwB/B`, their complex dimensions `ℓ(w)`, the CW structure of the flag manifold and its
cohomology.
*Needs:* §§6.7, 8.1; ReductiveGroups Layer 7; Tau Ceti as named.

**Checks.**
- `GL₂(ℂ)` with upper triangular `B` and diagonal `T`: `B ∩ N(T) = T`, the Weyl quotient has two
  elements, and the two cells are `B` and `B · [[0, 1], [1, 0]] · B`, the latter being the matrices with
  nonzero lower-left entry.
- The intersection axiom matters: in `G = GL₂(𝔽₃) × C₂` with `B = (upper triangular) × C₂` and
  `T = (diagonal) × {1}`, the generation, involution, exchange and non-normalization axioms hold for
  the two classes of the swap matrix in `N(T)/T`, but `B ∩ N(T)` has order 8 while `T` has order 4;
  `N(T)/T` has four elements and there are only two `B`-double cosets. A BN-pair record over
  `N(T)/T` without `B ∩ N(T) = T` cannot index the cells uniquely, whereas `TauCeti.TitsSystem`
  quotients by `B ∩ N`.
- The Borel cannot be replaced by an arbitrary subgroup containing `T`: for `B = T` (diagonal in
  `GL₂(ℂ)`), the union of the double cosets `TnT` over `n ∈ N(T)` is `N(T)`, the monomial matrices, a
  proper subset.

### 8.3 Associated coherent lines and the two Borel conventions

For the connected linear complex groups of §8.1 use the algebraic character lattice `X` of `T` and the
positive Borel `B⁺`. For `χ ∈ X` construct the algebraic associated line `E_χ` by descent, its
`G`-linearization, transition functions, tensor products `E_{χ+ψ}`, duals `E_{−χ}` and base- and
character-change maps. Its analytic line is `(G_ℂ × ℂ)/((gb, z) ∼ (g, χ(b)z))`. Construct its locally
free rank-one coherent sheaf of holomorphic sections, and identify `H⁰` with the holomorphic functions
with `f(gb) = χ(b)⁻¹ f(g)`, with `G` acting by `(a · f)(g) = f(a⁻¹g)`. Compare evaluation, multiplication
of sections, pullback and duals under this identification. The descent construction, its
linearization and the rank-one bundle laws are built here on the flag manifold, from the torsors,
contracted products and twisting of [SchemeAndStackFoundations](../../SchemeAndStackFoundations/README.md)
§§1.15–1.16 and the dictionary of §7.9. [SchubertGeometry](../../SchubertGeometry/README.md) builds
its line `L(λ)` on `G/B⁻` independently, by descent over an arbitrary field (its S3.1) with its
holomorphic model (its S9.8); the two constructions are compared through the identification `φ`
below. Fix also the two Borel conventions: choose a representative `n₀` of the longest element and
construct the `G`-equivariant isomorphism `φ : G/B⁺ → G/B⁻`,
`gB⁺ ↦ g n₀ B⁻`; prove that `φ*` of the negative-Borel line with fibre character `κ` is the
positive-Borel `E_{w₀κ}`, with its linearization, so that a roadmap working with the negative Borel
(SchubertGeometry's `L(λ)` on `G/B⁻`) reads this roadmap's `L_μ := E_{−μ}` as its `L(−w₀μ)`. Record the
change on torus characters, root-curve degrees, actions on sections and highest weights; inversion
without its change of action is not this equivariant identification. Pure central characters remain
group characters.
(Bump, Parts I–III.)
*Needs:* §§8.1–8.2; SchemeAndStackFoundations §§1.15–1.16.

**Checks** for `E_χ` and the two Borel conventions, on `G = SL₂(ℂ)` with `B⁺` upper triangular and
`X = ℤ` by `diag(z, z⁻¹) ↦ zⁿ`.
- `G/B⁺ = ℙ¹`, and `E_n` is the line `O(−n)`: for `n = 1` the map `(g, z) ↦ z · g e₁` identifies `E_1`
  with the tautological line `O(−1)`, since `b e₁ = χ(b) e₁` for `b ∈ B⁺`; hence `L_μ = E_{−μ}` has degree
  `μ`, `H⁰(L_1)` has dimension `2 = dim L(1)*`, and `E_1 = O(−1)` has no sections. With the relation
  `f(gb) = χ(b) f(g)` instead of `χ(b)⁻¹` the degrees of `E_{±n}` would swap.
- `n₀ = [[0, −1], [1, 0]]`, `w₀ = −1` on `X`: `φ*` of the negative-Borel line with character `κ` is
  `E_{w₀κ} = E_{−κ}`, so `L_μ = E_{−μ}` is the negative-Borel line of character `μ = −w₀μ`, the degree-`μ`
  line in both conventions.
- `χ = 0` gives the trivial line with `H⁰ = ℂ` (the flag manifold is compact); on `GL₂(ℂ)` the central
  character `det` gives `E_det`, whose one-dimensional section space is spanned by `g ↦ det(g)⁻¹`.

### 8.4 Sheaf cohomology and equivariant analytification

Use the scheme-module cohomology of Tau Ceti, `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`
(Mathlib's `CategoryTheory.Sheaf.H` on the underlying sheaf of a module `M : X.Modules`), for the
algebraic line, with `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyZeroEquiv` for global
sections. Construct its `ℂ`-module structure and finite-dimensionality on this projective complex
flag variety. On the analytic side use the same sheaf cohomology for the coherent sheaf of sections,
not singular or cellular cohomology. Use [ComplexComparisonPartII](../../ComplexComparisonPartII/README.md)
C-1.1, C0.1 and C0.3–C0.5 and C1.9: the analytification and its ring sheaf, the dictionary between
bundles and locally free sheaves, coherent pullback, and the canonical all-degree GAGA and exchange
maps. Identify the analytification of the algebraic associated line with the holomorphic associated
line of §8.3 through their transition functions and descent maps; this is an application after the
independent analytic constructions, not a premise of generic GAGA.

For every `q ≥ 0` construct the complex-linear action of `G_ℂ` on `H^q` from the linearization and
pullback by `g⁻¹`, and prove the identity and multiplication laws, naturality in maps of lines,
transport under tensor products and characters, and the formula of §8.3 for `H⁰`. Construct the
finite-dimensional algebraic representation on algebraic `H^q`, using the proper projection
`G × X → G`, coherent base change and the linearization cocycle; its analytification is the
holomorphic action just constructed. Prove that the canonical GAGA isomorphism is equivariant in
every degree, using its naturality with those translations and, over the parameter space `G`, the
relative proper exchange map. A dimension equality or unrelated isomorphisms degree by degree do not
supply this comparison. SchubertGeometry uses the compact flags of this layer and their homogeneous
complex comparisons afterwards and supplies nothing here.
(Bump, Parts I–III.)
*Needs:* §8.3; ComplexComparisonPartII C-1.1, C0.1, C0.3–C0.5, C1.9; SchemeAndStackFoundations
(scheme cohomology); Tau Ceti as named.

**Checks.**
- On `ℙ¹`, `H¹(O(−2))` is one-dimensional and carries the trivial `SL₂(ℂ)`-action (it is dual to
  `H⁰(O) = ℂ` by Serre duality), while `H⁰(O(2))` is the three-dimensional adjoint representation: an
  equivariant comparison must respect these actions, which a bare equality of dimensions does not
  see.

### 8.5 Borel–Weil in degree zero

For dominant `λ ∈ X` keep `L_λ = E_{−λ}` and prove `H⁰(G_ℂ/B⁺, L_λ) ≃ L(λ)* = L(−w₀λ)`, through the
coefficient map `ℓ ↦ (g ↦ ℓ(g v_λ))`, intertwining the actions. Prove the equivalent realizations
`H⁰(G_ℂ/B⁻, E_{+λ}) ≃ L(λ)` and `H⁰(G_ℂ/B⁺, E_{w₀λ}) ≃ L(λ)` with their comparisons of Borel and character.
For `B⁺` and fibre character `+λ`, some positive simple-coroot pairing gives negative degree on the
corresponding rank-one curve and hence no sections. Pure central characters give their
one-dimensional section spaces. The representation `L(λ)` is LieHighestWeight's irreducible module
(Tau Ceti `TauCeti.irreducibleQuotient`), transported by the representation comparison of §7.11; do
not replace the character lattice by all abstract weights of the Lie algebra.
(Bump, Parts I–III.)
*Needs:* §§7.11, 8.3–8.4; LieHighestWeight; Tau Ceti `TauCeti.irreducibleQuotient`.

**Checks.**
- `SL₂(ℂ)`, `λ = n ≥ 0`: `H⁰(ℙ¹, O(n))` is the space of homogeneous polynomials of degree `n` in two
  variables, of dimension `n + 1 = dim L(n)`, and `L(n)* ≅ L(n)` since `w₀ = −1`.
- `GL₃(ℂ)` with `λ = (1, 0, 0)`: `H⁰(L_λ)` is the dual of the standard representation `ℂ³`, and
  `L(λ)* = L(−w₀λ) = L((0, 0, −1))`.

### 8.6 Relative rank-one cohomology and the reflection shift

On the smooth proper map to the minimal parabolic quotient, `p_α : G/B⁺ → G/P_α⁺`, construct its `ℙ¹`
fibres, root coordinates and local trivializations, the relative canonical line
`ω_{p_α} = E_α = L_{−α}`, restricting to `O(−2)`, and the equivariant restriction of `L_μ`, of degree
`m = ⟨μ, α∨⟩`. Specialize the cohomology of line bundles on projective space of
SchemeAndStackFoundations §2.6 (`H^q(ℙ^n_A, O(d))` for every `q`, `d` and base ring `A`) to `n = 1` and
every integer `m`: `H⁰(O(m))` has dimension `m + 1` and `H¹ = 0` for `m ≥ 0`; both vanish for `m = −1`;
for `m ≤ −2`, `H⁰ = 0` and `H¹` has dimension `−m − 1`. Determine the `T`-weights of these groups and the
residue (relative Serre) pairing on the rank-one fibres in the positive-Borel convention. Prove the
vanishing of the higher relative direct images and the bundle identifications over `G/P_α⁺`,
including base change, rather than using only fibre dimensions. Compare the relative canonical
character and the determinant factor to obtain a `G`-equivariant isomorphism
`p_{α*} L_μ ≃ R¹p_{α*} L_{s_α·μ}` for `m ≥ 0`, with the other direct images zero, where
`s_α·μ = μ − (m + 1)α`. Use the Leray spectral sequence with its edge maps and naturality of
SchemeAndStackFoundations §2.2, through the same sheaf carriers and the composition comparison of
ComplexComparisonPartII C0.5; prove its collapse on these two rows and
`H^q(X, L_μ) ≃ H^{q+1}(X, L_{s_α·μ})` for every `q ≥ 0`. For `m = −1` all relative images and all `H^q`
vanish. These are maps of representations, not only identities of Euler characteristics.
(Bump, Parts I–III.)
*Needs:* §§8.3–8.4; SchemeAndStackFoundations §§2.2 and 2.6; ComplexComparisonPartII C0.5.

**Checks.**
- `SL₂(ℂ)`, `μ = m = 0`: `s_α·0 = −α = −2` in `X = ℤ`, and `H⁰(ℙ¹, O) = ℂ ≅ H¹(ℙ¹, O(−2))`, both trivial
  representations; with the unshifted reflection `s_α(0) = 0` the right side would be `H¹(O) = 0`.
- `m = −1`: `L_μ = O(−1)` has no cohomology at all, in either degree.

### 8.7 Dominant vanishing and the Borel–Weil–Bott deduction

Construct the identification `K_X ≃ L_{−2ρ}` of the canonical line with its `G`-linearization from the
weights of the tangent roots; `2ρ` is the sum of the positive roots and lies in `X` even when `ρ`
does not. For dominant `λ`, `L_{λ+2ρ}` is ample on the flag manifold (central twists change the
linearization, not positivity). Construct a positive Hermitian metric from a very ample power and its
Fubini–Study pullback, compare its curvature with those of the powers of the line, and apply the
compact Dolbeault and Hodge comparison and the positive-curvature estimate on top-degree
bundle-valued forms of [ComplexKahlerGeometry](../../ComplexKahlerGeometry/README.md) §5.10 (K5) and
§6.1 (K6.0). Prove this flag application: harmonic forms with values in `K_X ⊗ L_{λ+2ρ} = L_λ` vanish
in degrees `q > 0`, so the coherent `H^q(X, L_λ)` vanishes. The case without roots (`X` a point) and
arbitrary central characters are separate zero-dimensional tests. This is a specialized application
of those general suppliers, not a second general Kodaira or coherent vanishing theorem.

Iterate the equivariant reflection shifts along the Weyl length. For a fibre character `χ` put
`μ = −χ`. If `μ + ρ` is singular, transport to a simple wall with `m = −1` and prove every cohomology
group zero. Otherwise choose the unique `w` with `w(μ + ρ)` strictly dominant, prove that the
successive allowed rank-one shifts give the unique nonzero degree `ℓ(w)`, and identify that
representation as `L(w(μ + ρ) − ρ)*` by dominant vanishing and the degree-zero theorem. Identify the
resulting representation independently of the route of reflections; record the changes of the
chosen intertwiners under rank-two moves instead of asserting equality of unnormalized maps. Define
each simple dot action by `μ ↦ μ − (⟨μ, α∨⟩ + 1)α`, so that the construction preserves `X` without
assuming that `ρ` is a group character. Keep the central characters, all the Borel-change maps and
the representation and component-cocycle applications of Layer 7 for groups with finitely many
components; those groups are not identified with connected highest-weight irreducibles without their
component data.
(Bump, Parts I–III.)
*Needs:* §§8.5–8.6; ComplexKahlerGeometry §§5.10 and 6.1.

**Checks.**
- `SL₂(ℂ)`, `X = ℙ¹`: `K_X = O(−2) = L_{−2ρ}` with `2ρ = α = 2`; `μ = −1` is singular (`μ + ρ = 0`) and
  `O(−1)` has no cohomology; `μ = −3` has `w = s_α`, `s_α(μ + ρ) − ρ = 1`, and `H¹(ℙ¹, O(−3))` has
  dimension `2 = dim L(1)`, in degree `ℓ(s_α) = 1`.

### Examples

- `SL₂(ℂ)`: the flag manifold is `ℙ¹`, the two Bruhat cells are a point and `ℂ`, `H⁰(O(n)) = L(n)*` for
  `n ≥ 0`, and `H¹(O(−n − 2)) = L(n)` up to the dual.
- `GL_n(ℂ)`: complete flags, Bruhat cells indexed by `S_n` with dimensions the numbers of inversions.

### Dependencies

Layers 6 and 7. ReductiveGroups §3A.5e and Layers 6 and 7. SchemeAndStackFoundations §§1.15–1.16,
2.2 and 2.6. ComplexComparisonPartII C-1.1, C0.1, C0.3–C0.5 and C1.9. ComplexKahlerGeometry §§5.10
and 6.1. LieHighestWeight (the modules `L(λ)`). Tau Ceti: Tits systems and the Bruhat uniqueness
theorems, scheme-module cohomology, `TauCeti.irreducibleQuotient`.

## Layer 9: the Cartan, Iwasawa, and KAK decompositions

### 9.1 Global real-reductive inputs

In this layer a global matrix-cover model consists of a closed transpose-stable subgroup
`H ≤ GL_N(ℝ)` with finitely many components, its matrix Lie structure, and a specified finite central
covering `π : G → H`; it is the structure `FiniteCartanMatrixModel`. Construct its Cartan
automorphism as the lift of `h ↦ (hᵀ)⁻¹` that fixes the whole compact preimage `π⁻¹(H ∩ O(N))`
pointwise: use matrix polar coordinates and path lifting in the cover, then prove multiplicativity
and involutivity with the component and kernel data. A merely compatible lift need not fix the kernel
or represent all components, so that weaker datum is not used. This is global input, not only
reductivity of `Lie(G)`. Construct such a model for connected semisimple `G` with finite centre and a
positive integrated Lie Cartan involution: the faithful adjoint image with its Cartan metric gives
`H`, and `G → Ad(G)` is the finite central cover. The inputs are in this roadmap: §7.1 gives the
compact real form of `𝔤 ⊗ ℂ` and the Cartan involution `θ` of the semisimple `𝔤` commuting with its
conjugation; the adjoint image `Ad(G) ⊂ GL(𝔤)` is transpose-stable for the `θ`-compatible inner
product `−B(X, θY)`, and `G → Ad(G)` is the finite central cover of §5.2 (finite because the centre of a
connected semisimple group with finite centre is the kernel of `Ad`). This layer builds the global
matrix-cover model and its polar application, including non-linear finite covers. Construct
compatible models for the finite central products with compact central tori and split vector groups,
and for finite extensions with compatible component data. Identify the central period lattice: `θ`
fixes the compact central torus, negates the split vector factor, and `exp` on that split centre is
injective and proper. Prove the construction of the models and their independence and comparison
before using them. Arbitrary infinite central covers and general period quotients keep their full
theory of Layer 7; no compact-fixed polar theorem is inferred for them.
(Knapp, Chs. I, IV–VII.)
*Needs:* §§2.2–2.3, 5.1–5.2, 7.1; Tau Ceti `Matrix.GeneralLinearGroup.cartanHomeomorph`.

### 9.2 Cartan decomposition

For these global models first prove that matrix polar factors stay in `H`, identify `K_H = H ∩ O(N)`
with its compactness and maximality, and prove that `K_H × 𝔭_H → H` is a diffeomorphism. Transfer
through the finite central cover: construct the compatible involution `θ`, prove `K = π⁻¹(K_H) = G^θ`,
and lift the smooth inverse and factorization with the kernel and component data. Thus
`𝔨 = ker(dθ − 1)`, `𝔭 = ker(dθ + 1)` and `(k, X) ↦ k exp X` gives `K × 𝔭 ≅ G`: prove
`cartan_polar_decomposition`, on the datum `CartanInvolution` (a smooth involutive automorphism `θ`
with a `FiniteCartanMatrixModel`, compact fixed group, and the splitting of `Lie(G)` into its centre
and a semisimple derived algebra), every `g` being `k · lieExp X` for unique `k` with `θ k = k` and `X`
with `dθ X = −X`; `IsRealReductive I G` says that such a datum exists. The connected semisimple
finite-centre specialization proves these conclusions from the integrated positive Cartan involution
through its adjoint model, without assuming maximality first. `GL_n(ℝ)` is the orthogonal–symmetric
polar example (Tau Ceti `Matrix.GeneralLinearGroup.cartanHomeomorph`; CotangentLagrangian C2.0). For
the matrix applications take `H = C_ℝ`, the realification of `GL_n(ℂ)` in `GL_{2n}(ℝ)`, or
`H = Sp_{2n}(ℝ)`, with `π = id`. Establish closedness, transpose stability and connectedness of each
selected `H`, and identify its maximal compact `K_H` with the standard realification of `U(n)`. For both
matrix applications use C2.0's ambient polar coordinates, then
[CotangentLagrangian](../../SymplecticGeometry/CotangentLagrangian/README.md) C2.1's direct
matrix-intersection, subgroup polar preservation, trace-growth and maximal-compact constructions for
the selected `GL` and `Sp` groups (Tau Ceti `Matrix.GeneralLinearGroup.eq_unitarySubgroup_of_isCompact_of_le`,
`TauCeti.GLSymplectic.eq_inf_unitarySubgroup_of_isCompact_of_le`, `SymplecticGroup.polarUnitary_mem`).
The generic theorem of this section is independent of C2.1; only the selected matrix applications use
those results. The compact semisimple finite-centre branch is a separate application of the
integrated positive Cartan involution and its adjoint model, with its own finite-cover hypotheses. A
circle with inversion and compact fixed group `{±1}` is not such compatible central data.
(Knapp, Ch. VI, §3.)
*Needs:* §9.1; CotangentLagrangian C2.0–C2.1 for the matrix applications; Tau Ceti as named.

**Checks** for the Cartan datum (`FiniteCartanMatrixModel`, `CartanInvolution`).
- `G = H = GL_n(ℝ)`, `π = id`, `θ` the transpose-inverse: `K = O(n)`, `𝔭` the symmetric matrices, and
  `K × 𝔭 → G` is the polar decomposition; `Lie(G) = 𝔤𝔩_n` splits as the scalars (centre) plus `𝔰𝔩_n`
  (semisimple), as the reductivity fields require.
- `G = SL₂(ℝ)`, `H = Ad(G) = SO₀(2, 1)`, `π` the double cover: `θ` lifts to `g ↦ (gᵀ)⁻¹` on `SL₂(ℝ)`, which
  fixes `π⁻¹(SO(2)) = SO(2)` pointwise, including the kernel `{±1}`; the mere compatibility
  `π ∘ θ = θ_H ∘ π` would also allow the lift `g ↦ −(gᵀ)⁻¹`, which is not a homomorphism, and this is
  why the datum fixes the whole compact preimage.
- The Euclidean motion group `ℝⁿ ⋊ O(n)` with `n ≥ 2` and `(v, k) ↦ (−v, k)` has compact fixed group
  `O(n)` but a translation radical: `Lie(G) = ℝⁿ ⋊ 𝔰𝔬(n)` has trivial centre and the non-semisimple
  derived algebra containing `ℝⁿ`, so no datum exists. For `n = 1` the group `ℝ ⋊ {±1}` is the
  transpose-stable group generated by `diag(eᵗ, e^{−t})` and `[[0, 1], [1, 0]]`, and the datum does exist.

### 9.3 Connected subgroups of the positive triangular group

For `n ≥ 0`, let `AN ⊂ GL_n(ℂ)` be the real Lie subgroup of upper triangular matrices with strictly
positive real diagonal (`positiveTriangular n`), and `𝔞𝔫` its real Lie algebra of upper triangular
matrices with real diagonal (`triangularRealDiagonal n`). Construct these closed Lie subgroups of
`GL_n(ℂ)`, their tangent identifications, and global inverse smooth maps `exp : 𝔞𝔫 → AN` and `log`;
prove `bijOn_exp_triangular`: `NormedSpace.exp` on matrices maps `triangularRealDiagonal n` bijectively
onto `positiveTriangular n`. The diagonal entries of `log g` are `log g_ii`; recover the off-diagonal
entries recursively in the gap `j − i`: in `exp(X)_ij` the coefficient of `X_ij` is
`(exp(X_ii) − exp(X_jj))/(X_ii − X_jj)`, with value `exp(X_ii) > 0` when the diagonal entries are
equal, and all other terms involve smaller gaps. Prove the smoothness at the removable values,
positivity and both inverse identities, including repeated diagonal entries and complex
off-diagonal entries; compare with the matrix exponential and the Lie-group exponential. This is a
real completely solvable group: prove that its Lie algebra is solvable and that every adjoint
eigenvalue is real, rather than describing the generally non-nilpotent diagonal extension as nilpotent.

For every connected finite-dimensional immersed Lie subgroup `C` of `AN`, with its own Lie-group
topology and injective immersion into the matrix group, prove that `exp_C : Lie(C) → C` is a global
diffeomorphism; no embeddedness or closedness is assumed. Identify `Lie(C)` with its
finite-dimensional real Lie subalgebra `𝔠 ⊂ 𝔞𝔫` and prove exponential naturality. For `X ∈ 𝔠` the
left-trivialized derivative `dexp_X = ∫₀¹ exp(−s ad X) ds` (§1.4) preserves `𝔠`, and ambient
invertibility and finite dimension make its restriction to `𝔠` invertible; so `exp_C` is a local
diffeomorphism at every `X`. Prove `lieExp_bijective_of_immersed_positiveTriangular`: for a connected
Lie group `C` with an injective smooth immersive homomorphism into `GL_m(ℂ)` (as a real Lie group of
units) landing in `positiveTriangular m`, `lieExp` of `C` is bijective. The image `exp(𝔠)` is closed in
`AN` because `𝔠` is a closed subspace and the ambient `exp` and `log` are homeomorphisms; pull this
closedness back along the continuous inclusion of `C`, and use the open image of `exp_C` and
connectedness to prove surjectivity. Ambient injectivity gives injectivity; construct the smooth
inverse and prove that the original immersion is an embedding with closed image. These are
conclusions about the original intrinsic topology, not about a replacement topology.

For every compact subgroup `K ≤ GL_n(ℂ)` prove `K ∩ AN = {1}`. Construct a `K`-invariant positive
Hermitian form by compact averaging (Tau Ceti `Matrix.GeneralLinearGroup.exists_conj_smul_le_unitarySubgroup`);
every element of `K` is unitary for that form, hence diagonalizable with eigenvalues on the unit
circle, while an element of `AN` has positive real eigenvalues, so an element of the intersection has
every eigenvalue `1` and is the identity. Include the trivial group `n = 0` and the real-logarithm case
`n = 1`, and export the inclusion, exponential, logarithm and restriction equations for the Iwasawa
decomposition.
(Knapp, Chs. I, IV–VII.)
*Needs:* §§1.4, 2.2, 4.1; Mathlib `NormedSpace.exp`, `Matrix.BlockTriangular.exp`; Tau Ceti
`Matrix.GeneralLinearGroup.exists_conj_smul_le_unitarySubgroup`.

**Checks** for `triangularRealDiagonal`, `positiveTriangular` and the exponential bijection.
- `n = 0`: both sets are the one-point set and `exp = log = id`; `n = 1`: `AN = ℝ_{>0} ⊂ ℂˣ`, `𝔞𝔫 = ℝ`,
  `exp` the real exponential and `log` its inverse, while the full group `ℂˣ` has the non-injective
  complex exponential, which is why the diagonal is required real.
- `n = 2`, `X = [[a, x], [0, b]]` with `a, b` real: `exp X = [[eᵃ, x(eᵃ − eᵇ)/(a − b)], [0, eᵇ]]`, with the
  removable value `x eᵃ` at `a = b`; at `a = 1`, `b = 0`, `x = 1` this is `[[e, e − 1], [0, 1]]`, and `log`
  recovers `x = g₁₂(a − b)/(eᵃ − eᵇ) = (e − 1)/(e − 1) = 1`.
- Positivity is load-bearing: `diag(−1, 1)` is upper triangular with real diagonal and invertible, but
  is not `exp X` for any `X` with real diagonal (the diagonal of `exp X` is `(e^{X₁₁}, e^{X₂₂})`,
  positive); and for compact `K = U(2)`, `K ∩ AN = {1}` because a unitary upper triangular matrix is
  diagonal with eigenvalues of modulus one, which positivity forces to be `1`, whereas
  `diag(1, −1) ∈ O(2)` lies in the group of upper triangular matrices with nonzero real diagonal.

### 9.4 Iwasawa decomposition

The general theorem keeps its full input: any closed connected subgroup `N` that is the exponential of
its Lie algebra, normalized by `𝔞`, whose Lie algebra complements `𝔨 + 𝔞`. These data, together with
the Cartan datum, a maximal abelian `𝔞 ⊆ 𝔭`, its restricted roots and root spaces, the canonical
root-generated `N₊` and the closed positive chamber, are the structure `IwasawaData`, and
`IsIwasawaTriple K A N` says that `(K, A, N)` come from such data. Prove `iwasawaDecomposition`: for an
Iwasawa triple every `g ∈ G` factors uniquely as `k a n` with `k ∈ K`, `a ∈ A`, `n ∈ N`, together with
the nilpotence of `N` and the global diffeomorphism `K × A × N → G` from exactly these hypotheses
(Knapp, Ch. VI, §4). Separately construct the canonical root-generated `N₊` from the restricted-root
decomposition and prove that it satisfies these hypotheses; do not define the arbitrary complement
`N` to be `N₊`. Route: the simultaneous real `𝔞`-weight decomposition has `𝔤₀ = 𝔪 + 𝔞`, so `𝔫₀ = 0`. Put
`𝔰 = 𝔞 ⋉ 𝔫`; invariance of its own Killing form gives `B_𝔰(𝔰, 𝔫) = 0`: `𝔞` pairs trivially with nonzero
weights, and opposite `𝔫`-weights bracket to `𝔫₀ = 0`. Since `[𝔰, 𝔰] ⊂ 𝔫`, Cartan's solvability criterion
(Mathlib `LieAlgebra.isSolvable_of_killingForm_apply_lie_eq_zero`) proves `𝔰` solvable. Complex Lie
triangularization gives an invariant flag; choose an orthonormal basis of it using the self-adjoint
action of `𝔞`. Then `𝔞` is real diagonal and `𝔫 = [𝔞, 𝔫]` strictly upper triangular, which proves its
nilpotence, the polynomial `exp` and `log`, and the injectivity on `N`. Prove that `AN` is a closed
subgroup of positive-diagonal times unipotent matrices with `K ∩ AN = {1}`, first in the matrix model,
then on its finite cover (`AN` is simply connected), with §9.3. Its action on `G/K` is proper since `AN`
is closed and `K` compact, and its orbit has invertible differential by the complement condition; the
orbit is open and closed, and `G/K` is connected because `K` meets every component. Thus `G = ANK`,
inversion gives `KAN`, and the intersections give uniqueness. Prove smoothness of the inverse from
the local differential and these global identifications. No extra nilpotence or `KAN` conclusion is
assumed as a field. The positive-root `N₊` is a separate distinguished instance; comparing it with an
arbitrary admissible `N` is a theorem. For `GL_n(ℝ)` and `SL_n(ℝ)` this is Gram–Schmidt
(`Matrix.GeneralLinearGroup.existsUnique_iwasawa`, `Matrix.SpecialLinearGroup.existsUnique_iwasawa`).
*Needs:* §§9.2–9.3; Mathlib `LieAlgebra.isSolvable_of_killingForm_apply_lie_eq_zero`.

**Checks** for `IwasawaData` and `IsIwasawaTriple`, on `G = SL₂(ℝ)` with `θ(g) = (gᵀ)⁻¹`, `K = SO(2)`,
`𝔞 = ℝ · diag(1, −1)`.
- The restricted roots are `±α` with `α(diag(1, −1)) = 2`, root spaces `ℝE₁₂` and `ℝE₂₁`, `N₊` the upper
  unipotent group and the chamber `{t · diag(1, −1) : t ≥ 0}`; with `N = N₊`, `(SO(2), A, N₊)` is an Iwasawa
  triple and `g = kan` is Gram–Schmidt on the columns of `g`: `[[1, 1], [0, 1]]` has `k = a = 1`, and
  `[[0, −1], [1, 0]] ∈ K` has `a = n = 1`.
- The lower unipotent group `N⁻` also satisfies every condition on `N` (closed, connected, exponential,
  normalized by `𝔞`, `𝔨 + 𝔞 + 𝔫⁻ = 𝔰𝔩₂`), so `(SO(2), A, N⁻)` is a second Iwasawa triple with a different
  factorization of the same `g`; `N` is not forced to be `N₊`, and the decomposition is a theorem for
  each admissible `N`.
- The discrete subgroup `{[[1, n], [0, 1]] : n ∈ ℤ}` is closed with zero Lie algebra and fails
  `N_connected` and `iwasawa_compl`; the whole line `𝔞` as `chamber` is a closed spanning cone but fails
  `chamber_root_inequalities` at `−diag(1, −1)` (where `α = −2 < 0`), and with it the middle factor of
  `KAK` would no longer be unique modulo the restricted Weyl group `C₂`.

### 9.5 Restricted roots and KAK

Build the possibly non-reduced restricted root system and the normalizer quotient `N_K(𝔞)/Z_K(𝔞)`. Use
the separately constructed `N₊` for the canonical positive chamber and for `KAK`; any relation with the
arbitrary complement `N` of §9.4 is proved, not imposed by definition. Define
`𝔞̄₊ = {X ∈ 𝔞 | α(X) ≥ 0 for every positive restricted root}`; its lineality space contains the whole
split centre. Prove that the compact normalizer representatives give the restricted reflections and
root chambers, and that every orbit meets this closed chamber, including walls and the case without
roots. First prove `Ad(K)𝔞 = 𝔭` by the maximal-abelian argument for symmetric pairs. With the Cartan
decomposition this gives `G = K exp(𝔞̄₊) K`: prove `kakDecomposition` (every `g` is `k₁ a k₂` with
`k₁, k₂ ∈ K` and `a ∈ lieExp(chamber)`, the chamber of the same Iwasawa data), and the uniqueness of the
middle factor modulo the restricted Weyl group (Knapp, Ch. VII, §3). A spanning arbitrary cone is not
the chamber input. Spherical and Harish-Chandra harmonic analysis are outside this roadmap.
*Needs:* §§9.2, 9.4.

**Checks.**
- `GL_n(ℝ)` with `𝔞` the diagonal matrices: `KAK` is the singular value decomposition
  `g = k₁ diag(e^{a₁}, …, e^{aₙ}) k₂` with `a₁ ≥ ⋯ ≥ aₙ`, the singular values being unique and their
  order fixed by the chamber;
  the split centre `ℝ · 1` lies in the lineality space.

### Examples

- `GL_n(ℝ)`: Cartan = polar decomposition, Iwasawa = Gram–Schmidt, `KAK` = singular value decomposition
  (`Matrix.GeneralLinearGroup.existsUnique_pos_antitone_and_eq_unitary_mul_diagonal_mul_unitary`),
  with restricted Weyl group `S_n` (`TauCeti.unitaryNormalizerPosDiagonalQuotientMulEquivPerm`).
- `SL₂(ℝ)`: `K = SO(2)`, `A` the positive diagonal matrices, `N` the upper unipotent group.

### Dependencies

Layers 0–7. CotangentLagrangian C2.0–C2.1 for the matrix applications. Mathlib Cartan's criterion.
Tau Ceti: the matrix Cartan decomposition and maximal compact subgroups, compact averaging,
symplectic polar preservation.

## Worked examples

- **The circle and its exponential.** `Circle` is a one-dimensional compact connected abelian Lie
  group with `Lie(Circle) ≅ ℝ` (`circleLieAlgebraEquiv`); `lieExp` on `Circle` is `Circle.exp`
  (`lieExp_circle`), with `Circle.exp_add` the one-parameter-subgroup law and `Circle.exp_zero` the
  unit. `Circle` is its own maximal torus, its Weyl group is trivial, `Circle_ℂ = ℂˣ`, and the Weyl
  integration formula degenerates to `∫_{Circle} = ∫_T`.
- **`GL_n(ℝ)` and the matrix exponential.** `Matrix.GeneralLinearGroup (Fin n) ℝ = (Matrix (Fin n) (Fin n) ℝ)ˣ`
  has `Lie(GL_n) = Matrix (Fin n) (Fin n) ℝ` and `lieExp` is `NormedSpace.exp` on matrices
  (`lieExp_generalLinearGroup_coe`); `Ad g X = g X g⁻¹`, `ad X Y = XY − YX`, and
  `Ad(exp X) = exp(ad X)` reads `Matrix.exp_conj`. The statements of Layers 0 and 1 restricted to `Rˣ`
  with `R = Matrix (Fin n) (Fin n) ℝ` become the `NormedSpace.exp` identities of the `Matrix.exp_*`
  lemmas, and Layer 9 gives the polar, Gram–Schmidt and singular-value decompositions.
- **`SU(2)`, `SO(3)` and the double cover.** `SU(2) = Matrix.specialUnitaryGroup (Fin 2) ℂ` has Lie algebra
  the skew-Hermitian trace-zero matrices `≅ ℝ³` with the cross-product bracket;
  `SO(3) = Matrix.specialOrthogonalGroup (Fin 3) ℝ` has the same Lie algebra. `Ad : SU(2) → SO(3)` is a
  surjective homomorphism with kernel `{±1}`, exhibiting `SU(2)` as the simply connected double cover of
  `SO(3)` (§§2.4, 5.1), and its Lie map `𝔰𝔲(2) ≅ 𝔰𝔬(3)` is a Lie-algebra isomorphism (§§3.1, 4.3).
  `SU(2)` is simply connected, `SO(3)` is not, and the covering `SU(2) → SO(3)` induces a Lie-algebra
  isomorphism.
- **The maximal torus of `U(n)`.** `T`, the diagonal unitary matrices `≅ (Circle)^n` (Tau Ceti
  `TauCeti.unitaryTorus`), is a maximal torus of `U(n) = Matrix.unitaryGroup (Fin n) ℂ`
  (`TauCeti.isMaximalTorus_unitaryTorus`); every unitary matrix is conjugate into `T`
  (`TauCeti.exists_conj_mem_unitaryTorus`, the spectral theorem as torus exhaustion), all maximal tori
  are conjugate (`TauCeti.exists_map_conj_eq_of_isMaximalTorus`), the Weyl group is `Equiv.Perm (Fin n)`
  permuting the eigenvalues (`TauCeti.unitaryTorusNormalizerQuotientMulEquivPerm`), and the Weyl
  integration formula is the classical eigenvalue density `|Δ|² = ∏_{j<k} |z_j − z_k|²`.
- **Complexification of the classical groups.** `(U(n))_ℂ = GL_n(ℂ)`, `(SU(n))_ℂ = SL_n(ℂ)`,
  `(SO(n))_ℂ = SO_n(ℂ)`; finite-dimensional representations of `SU(n)` extend to holomorphic
  representations of `SL_n(ℂ)`, matching the highest-weight classification of
  [LieHighestWeight](../LieHighestWeight/README.md) and the Peter–Weyl theorem of
  [CompactGroups](../CompactGroups/README.md). The irreducibles `Symⁿ(ℂ²)` of `SU(2)` in CompactGroups
  are the holomorphic `SL₂(ℂ)`-modules `L(n)` of LieHighestWeight, through §7.11.

## Downstream consumers

LieGroupoidsPoisson (Layers 0–5), NoncompactQuantumSymmetry (Layers 2, 5 and 7, and Layer 9's
Cartan decomposition and polar coordinates), HamiltonianReduction R2 and ConvexityToric T1 (Layer 6's
compact real root, chamber and period data), SchubertGeometry (its S2's compact rank-one
representatives from §6.6, and its S7's and S9's flag cellular structure and cohomology and compact
homogeneous flag model from Layer 8, read through the opposite-Borel transport of §8.3) and
FormalConnectionsOpers (Layer 0's exponential map, Layer 6's maximal tori and Weyl group,
Layer 7's complexification and compact real forms, in its §4.3) use this
roadmap, and none of them supplies it; what they build on these layers is theirs. LieGroupsPartII
continues Layer 9 with minimal parabolic subgroups and the Bruhat decomposition of real reductive
groups. RealSemisimpleLieGroups (Layers 0–5, 5A, 7 and 9), ArithmeticLocallySymmetricSpaces (Layers 2
and 9), YangMillsConnectionsAndCaloricGauge (Layers 1, 5A and 6), CharacteristicClasses (Layers 2, 5A
and 7), GeometricQuantization (Layers 6, 7 and 8), GeneralizedCohomology (Layer 2), CompactGroups
(Layer 6) and ReductiveGroups (§§7.9, 7.11 and 7.12) cite it as well.

## Scope and ownership

This roadmap owns the targets of the layers above: the derivative of the exponential map (§1.4); the
Lie algebra of an arbitrary subgroup (§2.1), the transport of the matrix groups to Mathlib's names and
the simple connectedness of `SU(2)` (§§2.3–2.4); the Baker–Campbell–Hausdorff series (§3.3); the
integration theorems (§§4.1–4.4, 5.1); centres, adjoint groups and connected integrations (§5.2); the
nilpotent BCH groups (§5.3); central characters (§5.4); the compact invariant metric (§5A.1); the
maximal-torus theorems, the compact root system, the rank-one representatives, the Weyl group
comparison and the Weyl integration formula (§§6.1, 6.3–6.9); all of Layers 7, 8 and 9. Of the lower
analytic dictionary of §7.9 it owns the reductive part: the central torus, the derived subgroup and
the central multiplication.

**Already in the library.** The following are proved at the pins and are used above by name (the
exact declarations are in the supplier contracts below):
- Layer 0: the derivation–tangent equivalence and its inverse through invariant vector fields
  (every left-invariant derivation is that of a left-invariant vector field), `lieExp` with its
  smoothness, local inverse, derivative at `0` and naturality, the classification of continuous
  one-parameter subgroups, and the unit, matrix and circle comparisons.
- Layer 1: the adjoint representation, its smoothness and differential, `Ad(lieExp X) = exp(ad X)`
  on the derivation carrier as well as on the tangent carrier, and the Banach forms of the derivative
  of the exponential.
- Layer 2: the closed-subgroup theorem with its model space, its Lie-algebra comparison `Lie(K) = 𝔨`
  (the differential of the inclusion is a Lie isomorphism onto `lieSubalgebraOfSubgroup K`), the limit
  criterion, the Lie algebras of Tau Ceti's carriers of the classical groups, automatic smoothness,
  and the simple connectedness of the spheres `S^n`, `n ≥ 2`.
- Layer 3: the Lie functor with its laws, faithfulness on connected groups, and the local
  Baker–Campbell–Hausdorff germ with its naturality and bracket term.
- Layers 4 and 5: the carrier of immersed Lie subgroups with the uniqueness of the image, the
  left-invariant distribution and the integral leaf subgroup of a Lie subalgebra (with the subspace
  topology), the universal covering group with its Lie-group structure, its central kernel `≅ π₁(G)`,
  descent of homomorphisms and its Lie-map form, `ker Ad = Z(G)` for connected `G` (as the centralizer
  criterion for closed connected subgroups), the faithful action of `U(𝔤)` as the left-invariant
  differential operators with the PBW basis, and the covering comparison of higher homotopy groups.
- Layer 6: tori and maximal tori, their classification as products of circles, `lieExp` onto a torus,
  topological generators, existence of maximal tori, the Lie algebras of the centralizer and the
  normalizer of a maximal torus, `𝔱` maximal abelian, the finiteness of the Weyl group
  `N_G(T)/T` (for compact `G`, without connectedness), the Weyl density as a continuous function, the
  chamber theorems of abstract root systems, and the maximal torus and Weyl group of `U(n)`.
- Layers 7 and 9: the complexified Lie algebras of `U(n)`, `SU(n)`, `SO(n)` and `Sp(2l, ℝ)`, the
  Chevalley involution of a Serre presentation, completeness of left-invariant metrics, the matrix
  polar and Cartan decompositions of `GL_n(ℝ)` and `GL_n(ℂ)`, the matrix Iwasawa decompositions of
  `GL_n(ℝ)` and `SL_n(ℝ)`, the matrix `KAK` decompositions of `GL_n` and `SL_n` over `ℝ` and `ℂ` with
  a unique decreasing positive diagonal, the restricted Weyl group `S_n` of `GL_n(ℝ)`, the maximal
  compact subgroups of `GL`, `SL` and `Sp`, and compact averaging into the unitary group.

**Left to other roadmaps.** The flow theory (DifferentialGeometry Layer 3), the Frobenius theorem and
leaves (DifferentialGeometry 4.3–4.4), the smooth structure on covering spaces (DifferentialGeometry
2.3), Sard's theorem (DifferentialGeometry 10.2) and the mapping degree (DifferentialGeometry
10.3–10.5); homogeneous spaces as principal bundles (SmoothBundlesConnections B1.1 and B1.4); Haar
measure, unitarization, Peter–Weyl and characters (CompactGroups); the split Serre presentation, the
modules `L(λ)` and central characters of highest-weight modules (LieHighestWeight); abstract root
systems and their Weyl groups (RootSystems); Ado's theorem (AdoIwasawa); algebraic groups over `ℂ`,
their functor of points, Lie algebras, character lattices, central isogenies, root subgroups and the
generic Bruhat theorem (ReductiveGroups Layers 0–4, 6, 7 and 7C); the complex Lie group `G(ℂ)` of an
algebraic group, its closed embedding in `GL(V)(ℂ)` and its tangent Lie algebra (ReductiveGroups
§3A.5e); the realified model of a complex manifold (ComplexManifolds Milestone 1); the holomorphic
inverse function theorem and the compact Hodge and curvature estimates (ComplexKahlerGeometry Layers
1, 5 and 6); completeness and Bonnet–Myers (HopfRinow Layer 3, RiemannianGeometry R4.5); the ambient
matrix polar maps and the direct matrix maximal-compact arguments (CotangentLagrangian C2.0–C2.1);
torsors, contracted products, the Leray spectral sequence and the cohomology of projective space
(SchemeAndStackFoundations §§1.15–1.16, 2.2, 2.6); analytification and GAGA (ComplexComparisonPartII
C-1.1, C0.1, C0.3–C0.5, C1.9). The compact coadjoint chamber and centralizer application is
HamiltonianReduction R2's, and character periods and integral-lattice refinements are ConvexityToric
T1's. Banach–Lie groups, and spherical and Harish-Chandra harmonic analysis on real reductive groups,
are outside this roadmap.

## Exact supplier contracts

### From Mathlib

- Lie groups and their Lie algebras: `LieGroup` (extending `ContMDiffMul`, with `LieAddGroup` its
  additive form) with `LieGroup.of_le` and its instances (including
  `LieGroup I 0 G` for a topological group and `LieGroup 𝓘(𝕜, R) n Rˣ` on the units of a normed
  algebra); `LeftInvariantDerivation` with its `LieRing` and `LieAlgebra 𝕜` instances and
  `LeftInvariantDerivation.evalAt`; `GroupLieAlgebra` with `mulInvariantVectorField` and its bracket,
  `LieRing` and `LieAlgebra` instances over a nontrivially normed field under its smoothness and
  completeness hypotheses; `VectorField.mlieBracket`, `VectorField.mlieBracketWithin`,
  `VectorField.leibniz_identity_mlieBracket`, `VectorField.mpullback_mlieBracket`.
- Manifold calculus and topology: `mfderiv`, `TangentSpace`, `ContMDiff`, `IsManifold`,
  `ModelWithCorners`, `Manifold.IsImmersion`, `IsLocalDiffeomorphAt`,
  `HasStrictFDerivAt.toOpenPartialHomeomorph`; `IsCoveringMap`, `IsCoveringMapOn`,
  `SimplyConnectedSpace`, `ConnectedSpace`, `LocallyCompactSpace`, `Metric.sphere`.
- Exponentials: `NormedSpace.exp`, `NormedSpace.expSeries`, `NormedSpace.exp_zero`,
  `NormedSpace.exp_add_of_commute`, `NormedSpace.exp_add`, `NormedSpace.exp_sum_of_commute`,
  `NormedSpace.exp_sum`, `NormedSpace.hasFPowerSeriesAt_exp_zero_of_radius_pos`; the matrix lemmas
  `Matrix.exp_transpose`, `Matrix.exp_conjTranspose`, `Matrix.exp_diagonal`, `Matrix.exp_blockDiagonal`,
  `Matrix.exp_add_of_commute`, `Matrix.exp_sum_of_commute`, `Matrix.exp_nsmul`, `Matrix.exp_neg`,
  `Matrix.exp_zsmul`, `Matrix.isUnit_exp`, `Matrix.exp_units_conj`, `Matrix.exp_conj`,
  `Matrix.BlockTriangular.exp`; `Circle`, `Circle.exp`, `Circle.exp_zero`, `Circle.exp_add`, `AddCircle`,
  `AddCircle.haarAddCircle`.
- Lie algebras: `LieRing`, `LieAlgebra`, `LieHom`, `LieEquiv`, `LieSubalgebra`, `LieIdeal`,
  `LieAlgebra.ad` with `LieAlgebra.ad_apply`, `LieDerivation.ad_ker_eq_center`, `LieAlgebra.center`,
  `LieAlgebra.derivedSeries`, `LieRing.IsNilpotent`, `LieAlgebra.IsSemisimple`, `killingForm`,
  `LieAlgebra.IsKilling`, `LieSubalgebra.IsCartanSubalgebra`, `LieAlgebra.IsKilling.rootSystem`,
  `LieAlgebra.IsKilling.finrank_rootSpace_eq_one`, `LieDerivation.IsKilling.exists_eq_ad`,
  `LieAlgebra.isSolvable_of_killingForm_apply_lie_eq_zero` (Cartan's criterion), `RootPairing`,
  `RootPairing.weylGroup`, `FreeLieAlgebra`, `UniversalEnvelopingAlgebra`,
  `UniversalEnvelopingAlgebra.ι`, `UniversalEnvelopingAlgebra.lift`.
- Matrix groups and their Lie algebras: `Matrix.GeneralLinearGroup`, `Matrix.GLPos`,
  `Matrix.SpecialLinearGroup` with `Matrix.SpecialLinearGroup.toGL`, `Matrix.unitaryGroup`,
  `Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`,
  `Matrix.symplecticGroup`, `unitarySubgroup`, `LieAlgebra.SpecialLinear.sl`,
  `LieAlgebra.Orthogonal.so`, `LieAlgebra.Symplectic.sp`.
- Measure theory: `MeasureTheory.Measure.haar`, `MeasureTheory.Measure.IsHaarMeasure`,
  `MeasureTheory.IsProbabilityMeasure`, the instance `MeasureTheory.CompactSpace.isFiniteMeasure`,
  `MeasureTheory.Measure.map`, `MeasureTheory.Measure.withDensity`, Bochner and interval integrals.
- Sheaf cohomology: `CategoryTheory.Sheaf.H`.

### From Tau Ceti

Paths are under `TauCeti/`. All the declarations below are proved at the pin, under the hypotheses
recorded with them; "standing" means a finite-dimensional real model and `LieGroup I ∞ G`, with
`T2Space G` and a boundaryless model where the declaration asks for them.

- *Lie algebra and exponential* (`Geometry/Lie/Tangent/`, `Geometry/Lie/Exponential/`):
  `leftInvariantDerivationEquivGroupLieAlgebra`, `leftInvariantDerivationLieEquivGroupLieAlgebra`
  (finite-dimensional model, `ContMDiffMul I ∞ G`, `T2Space G`, interior identity),
  `leftInvariantDerivationEquivGroupLieAlgebra_symm_apply`, `tangentToLeftInvariantDerivation`,
  `tangentToLeftInvariantDerivation_apply`, `finiteDimensional_leftInvariantDerivation`,
  `finrank_leftInvariantDerivation_eq_modelVectorSpace`; `lieExp`, `lieLog`, `oneParameterSubgroup`,
  `contMDiff_oneParameterSubgroup`, `contMDiff_lieExp`, `isLocalDiffeomorphAt_lieExp_zero`,
  `hasFDerivAt_extChartAt_lieExp_zero` (standing, `T2Space`, boundaryless);
  `existsUnique_eq_oneParameterSubgroup` (every continuous `Multiplicative ℝ →ₜ* G` is
  `oneParameterSubgroup X` for a unique `X`); `TauCeti.closure_range_lieExp_eq_connectedComponentOfOne`,
  `TauCeti.closure_range_lieExp_eq_top`; `unitsLieAlgebraEquiv`, `lieExp_eq_expUnit` (finite-dimensional
  real normed algebra), `TauCeti.expUnit`, `TauCeti.expUnitHom`; `lieExp_generalLinearGroup_coe`,
  `lieExp_generalLinearGroup_diagonal`, `lieExp_generalLinearGroup_transpose`,
  `lieExp_generalLinearGroup_units_conj` (with the scoped `L∞` operator norm); `circleLieAlgebraEquiv`,
  `lieExp_circle`; `ModelWithCorners.t2Space_of_lieGroup`, `ContMDiffMul.boundarylessManifold`.
- *Adjoint* (`Geometry/Lie/Adjoint/`): `TauCeti.Lie.tangentAd`, `TauCeti.Lie.Ad`, `TauCeti.Lie.Ad_one`,
  `TauCeti.Lie.Ad_mul`, `TauCeti.Lie.Ad_inv`, `TauCeti.Lie.continuousAdjointRepresentation`,
  `TauCeti.Lie.contMDiff_continuousAdjointRepresentation`, `TauCeti.Lie.contMDiff_Ad_apply`,
  `TauCeti.Lie.unitsLieAlgebraLieEquiv`, `TauCeti.Lie.unitsLieAlgebraEquiv_Ad`,
  `TauCeti.Lie.groupLieAlgebra_units_ad_apply`, `TauCeti.Lie.mfderiv_Ad_apply_one`,
  `TauCeti.Lie.mfderiv_continuousAdjointRepresentation_one`, `TauCeti.Lie.hasDerivAt_Ad_lieExp_smul_apply_zero`,
  `TauCeti.Lie.conj_lieExp`, `TauCeti.Lie.tangentAd_mulInvariantExp_apply`,
  `LeftInvariantDerivation.Ad_lieExp`, `LeftInvariantDerivation.Ad_lieExp_apply`,
  `TauCeti.Lie.tangentAd_expUnit` (complete real normed algebra), `TauCeti.Lie.commute_lieExp_of_lie_eq_zero`,
  `TauCeti.Lie.lieExp_add_of_lie_eq_zero`; `TauCeti.Lie.banachDexpFactor_eq_integral_exp`,
  `TauCeti.Lie.fderiv_exp_apply_eq_exp_mul_integral` (complete real normed algebra),
  `TauCeti.Lie.fderiv_lieExp_units_coe_eq_exp_mul_banachDexpFactor` (finite-dimensional).
- *Subgroups* (`Geometry/Lie/Subgroup/`): `TauCeti.Lie.lieSubalgebraOfSubgroup` (the Lie subalgebra
  generated by the directions of one-parameter subgroups in `K`, for every subgroup),
  `TauCeti.Lie.mem_lieSubalgebraOfSubgroup` (closed `K`), `TauCeti.Lie.lieSubalgebraOfSubgroup_top`,
  `TauCeti.Lie.lieSubalgebraOfSubgroup_le_comap_Ad_sub_id`; `TauCeti.Lie.EmbeddedLieSubgroupData`,
  `TauCeti.Lie.isEmbeddedLieSubgroup_of_isClosed`,
  `TauCeti.Lie.nonempty_embeddedLieSubgroupData_lieSubalgebraOfSubgroup_of_isClosed`,
  `TauCeti.Lie.EmbeddedLieSubgroupData.range_lieMapSubtypeVal_eq`,
  `TauCeti.Lie.EmbeddedLieSubgroupData.lieEquivLieSubalgebraOfSubgroup`,
  `TauCeti.Lie.mem_lieSubalgebraOfSubgroup_iff_exists_seq` (closed `K`); `TauCeti.Lie.isClosed_range_toGL`,
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_sl`,
  `TauCeti.Lie.isEmbeddedLieSubgroup_unitarySubgroup`,
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_skewAdjoint`,
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_so`,
  `TauCeti.GLSpecialUnitary`, `TauCeti.Lie.isEmbeddedLieSubgroup_GLSpecialUnitary`,
  `TauCeti.Lie.lieSubalgebraOfSubgroup_GLSpecialUnitary`,
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_GLSpecialUnitary_lieSubalgebra_iff_mem_so`,
  `TauCeti.GLSymplectic` (the preimage of `Matrix.symplecticGroup`), `TauCeti.isClosed_GLSymplectic`,
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_sp`,
  `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_realCliffordForm_lieSubalgebra_iff_mem_so`;
  `TauCeti.Lie.contMDiff_of_continuous_monoidHom` and `ContinuousMonoidHom.toContMDiffMonoidMorphism`
  (finite-dimensional real Lie groups); `TauCeti.Lie.mem_centralizer_iff_forall_Ad_apply_eq_self` (closed
  preconnected `K`).
- *Lie functor and BCH* (`Geometry/Lie/Functor.lean`, `ContinuousFunctor.lean`, `Faithfulness.lean`,
  `Exponential/BCH/`, `Analysis/Normed/Algebra/BCH/`): `lieMap`, `lieMap_id`, `lieMap_comp`, `map_lieExp`,
  `continuous_lieMap`, `ContMDiffMonoidMorphism.isLocalDiffeomorphAt_iff_lieMap_bijective`,
  `ContinuousMonoidHom.lieMap`, `ContinuousMonoidHom.lieMap_comp`, `ContinuousMonoidHom.lieMap_injective`,
  `lieMap_injective` (preconnected source); `TauCeti.lieLocalBCH`, `TauCeti.lieLocalBCH_map_lieExp`,
  `TauCeti.map_lieLocalBCH`, `TauCeti.isBigO_lieLocalBCH_representative_sub_bracket`,
  `NormedSpace.localBCH` (complete normed `ℚ`-algebra), `TauCeti.lieLocalBCH_eq_unitsLocalBCH`.
- *Immersed subgroups and leaves* (`Geometry/Lie/Subgroup/Immersed/`, `Geometry/Lie/InvariantVectorField/`,
  `Geometry/Manifold/`): `TauCeti.Lie.ImmersedLieSubgroupData` (connected source on a finite-dimensional
  model, injective, range `K`, `Manifold.IsImmersion`), `TauCeti.Lie.IsImmersedLieSubgroup`,
  `TauCeti.Lie.ImmersedLieSubgroupData.injective_lieMapToHom`,
  `TauCeti.Lie.ImmersedLieSubgroupData.range_lieMapToHom_le`,
  `TauCeti.Lie.ImmersedLieSubgroupData.eq_of_range_lieMapToHom_eq`; `TauCeti.mulInvariantDistribution`,
  `TauCeti.isInvolutiveDistribution_mulInvariantDistribution_iff`, `LieSubalgebra.mulInvariantFoliation`,
  `LieSubalgebra.integralLeafSubgroup` (subspace topology); `TauCeti.IsInvolutiveDistribution`,
  `TauCeti.IntegralManifold`, `TauCeti.flowOf`, `IsLocalHomeomorph.chartedSpaceComap`;
  `TauCeti.fundamentalVectorField`, `TauCeti.isMIntegralCurve_mulInvariantExp_smul_smul`.
- *Universal covers and homotopy* (`AlgebraicTopology/UniversalCover/`, `Geometry/Lie/UniversalCover/`,
  `Geometry/Manifold/Instances/UniversalCover.lean`, `AlgebraicTopology/Sphere/`, `Topology/Homotopy/`):
  `TauCeti.UniversalCover`, `TauCeti.UniversalCover.instLieGroup` (locally path-connected,
  semilocally simply connected Lie group), `TauCeti.UniversalCover.lieMap_projHom_bijective`,
  `TauCeti.UniversalCover.exists_universalCover` (connected standing `G`),
  `TauCeti.UniversalCover.ker_projHom_le_center`, `TauCeti.UniversalCover.kerProjHomEquivFundamentalGroup`,
  `TauCeti.UniversalCover.homEquivKerProjHom` (path-connected topological group),
  `TauCeti.UniversalCover.lieMap_homEquivKerProjHom_symm`; `TauCeti.simplyConnectedSpace_sphere` (rank
  greater than two); `IsCoveringMap.homotopyGroupMulEquiv`; `Quaternion.mem_specialUnitaryGroup_iff_exists_toComplexMatrix`,
  `Quaternion.unitaryHomeomorphSphere`.
- *Enveloping algebra and highest weights* (`Geometry/Lie/EnvelopingAlgebra/`, `Algebra/Lie/`):
  `TauCeti.envelopingAction`, `TauCeti.range_envelopingAction`, `TauCeti.envelopingAction_injective` and
  `TauCeti.envelopingAlgEquivAdjoin` (finite-dimensional real Lie group),
  `LeftInvariantDerivation.hasDerivAt_apply_mul_lieExp_smul`, `Module.Basis.pbwBasis`;
  `TauCeti.vermaCentralCharacter`, `TauCeti.vermaCentralCharacter_casimirElement`,
  `TauCeti.irreducibleQuotient`; `TauCeti.exists_int_of_hasEigenvalue`,
  `TauCeti.finrank_eq_of_hasPrimitiveVectorWith`, `TauCeti.exists_int_apply_coroot`;
  `TauCeti.serreChevalleyInvolution`; `TauCeti.existsUnique_mem_orbit_inter_dominantChamber`,
  `TauCeti.stabilizer_eq_closure_wallReflections` (finite crystallographic reduced root systems over
  ordered fields of characteristic zero).
- *Tori and Weyl groups* (`Geometry/Lie/Subgroup/Torus.lean`, `Geometry/Lie/Subgroup/Weyl/`,
  `Algebra/Group/NormalizerQuotient/`, `Exponential/CommutativeGroup/`, `Analysis/Matrix/UnitaryGroup/`):
  `TauCeti.Lie.IsTorus`, `TauCeti.Lie.IsMaximalTorus`, `TauCeti.Lie.IsTorus.image_lieExp_lieSubalgebraOfSubgroup`,
  `TauCeti.Lie.IsTorus.nonempty_continuousMulEquiv_pi_circle`, `TauCeti.Lie.IsTorus.exists_isMaximalTorus_le`,
  `TauCeti.Lie.exists_isMaximalTorus`, `TauCeti.Lie.IsTorus.exists_closedZpowers_eq`,
  `TauCeti.closedZpowers_lieExp_eq_top_iff` (connected commutative Lie group); for compact `G`:
  `TauCeti.Lie.IsMaximalTorus.lieSubalgebraOfSubgroup_centralizer`,
  `TauCeti.Lie.IsMaximalTorus.lieSubalgebraOfSubgroup_normalizer`,
  `TauCeti.Lie.IsMaximalTorus.eq_lieSubalgebraOfSubgroup_of_isLieAbelian`,
  `TauCeti.Lie.IsMaximalTorus.isOpen_subgroupOf_normalizer`,
  `TauCeti.Lie.IsMaximalTorus.finite_normalizerQuotient`; `Subgroup.normalizerQuotient`,
  `Subgroup.normalizerQuotientMulAut`, `Subgroup.weylAdjointRepresentation`,
  `TauCeti.Lie.lieExp_weylAdjointRepresentation_apply`; `TauCeti.Lie.weylDensity`,
  `TauCeti.Lie.continuous_weylDensity`; `TauCeti.unitaryTorus`, `TauCeti.isMaximalTorus_unitaryTorus`,
  `TauCeti.exists_conj_mem_unitaryTorus`, `TauCeti.exists_map_conj_eq_of_isMaximalTorus`,
  `TauCeti.unitaryTorusNormalizerQuotientMulEquivPerm`.
- *Compact groups* (`RepresentationTheory/Compact/`, `RepresentationTheory/SU2/`): `TauCeti.haarProb`,
  `ContRepresentation.isUnitarizable`, `TauCeti.representativeStarSubalgebra_separatesPoints`
  (`T1Space G`), `TauCeti.SU2.weyl_integration_formula`.
- *Complexification, the polar, Iwasawa and `KAK` decompositions, and maximal compact subgroups*
  (`Geometry/Lie/Subgroup/Complexification.lean`, `Analysis/Matrix/`, `LinearAlgebra/Matrix/`,
  `Geometry/Manifold/Riemannian/LieGroup/`):
  `TauCeti.Lie.unitaryComplexificationLieEquiv`, `TauCeti.Lie.specialUnitaryComplexificationLieEquiv`,
  `TauCeti.Lie.specialOrthogonalBaseChangeLieEquiv`, `TauCeti.Lie.symplecticBaseChangeLieEquiv`;
  `Matrix.GeneralLinearGroup.cartanHomeomorph` (`𝕜 = ℝ` or `ℂ`, `U(n, 𝕜) × selfAdjoint ≃ₜ GL n 𝕜`,
  `(k, X) ↦ k exp X`), `Matrix.GeneralLinearGroup.eq_unitarySubgroup_of_isCompact_of_le`,
  `Matrix.GeneralLinearGroup.exists_conj_smul_le_unitarySubgroup`,
  `Matrix.SpecialLinearGroup.eq_comap_unitarySubgroup_of_isCompact_of_le`,
  `TauCeti.GLSymplectic.eq_inf_unitarySubgroup_of_isCompact_of_le`, `SymplecticGroup.polarUnitary_mem`;
  `TauCeti.iwasawaHomeomorph` (`O(n) × A × N ≃ₜ GL_n(ℝ)`, `(k, a, u) ↦ k a u`, with `A` the positive
  diagonal and `N` the upper unitriangular matrices) and `Matrix.GeneralLinearGroup.existsUnique_iwasawa`,
  `Matrix.SpecialLinearGroup.existsUnique_iwasawa` (the same in `SL_n(ℝ)`, every factor of determinant
  one); `Matrix.GeneralLinearGroup.existsUnique_pos_antitone_and_eq_unitary_mul_diagonal_mul_unitary`
  (`𝕜 = ℝ` or `ℂ`: `g = U · diag(d) · V` with `U, V` unitary and `d` positive, decreasing and unique)
  and its `SL_n` form
  `Matrix.SpecialLinearGroup.existsUnique_pos_antitone_and_eq_specialUnitary_mul_diagonal_mul_specialUnitary`
  (`U, V` special unitary, `∏ dᵢ = 1`); `TauCeti.unitaryNormalizerPosDiagonalQuotientMulEquivPerm`
  (`N_K(A)/Z_K(A) ≃* S_n` in `GL_n` over a linearly ordered star field, `K` unitary, `A` positive
  diagonal); `TauCeti.completeSpace_leftInvariantMetric`.
- *Bruhat and cohomology* (`GroupTheory/TitsSystem/`, `AlgebraicGeometry/Cohomology/`):
  `TauCeti.TitsSystem` with its fields `subgroupB`, `subgroupN` and `simple`,
  `TauCeti.TitsSystem.WeylGroup` (`N ⧸ (B ∩ N)`), `TauCeti.TitsSystem.existsUnique_mem_bruhatCell`,
  `TauCeti.TitsSystem.bruhatCell_injective`, `TauCeti.TitsSystem.disjoint_bruhatCell_iff`;
  `TauCeti.AlgebraicGeometry.Scheme.Modules.Cohomology`,
  `TauCeti.AlgebraicGeometry.Scheme.Modules.cohomologyZeroEquiv`.

### From TauCetiRoadmap.DifferentialGeometry

Layer 3 (3.2–3.3): maximal flows of vector fields and their reconciliation with the invariant integral
curves. 2.3: the smooth structure on covering spaces and smoothness of lifts. 4.3–4.4: the Frobenius
theorem, with integral manifolds and leaves as immersed manifolds. 10.2: Sard's theorem in finite
dimension. 10.3–10.5: oriented degree, regular-value counts, homotopy invariance and
`∫ f*ω = deg(f) ∫ ω` with top cohomology.

### From TauCetiRoadmap.SmoothBundlesConnections

B1.1 (principal bundles) and B1.4 (free proper quotients; `G → G/H` as a principal `H`-bundle for a
closed Lie subgroup `H`, with the tangent quotient description).

### From TauCetiRoadmap.RepresentationTheory.CompactGroups

§0.1 (the normalized Haar probability measure and its bi-invariance), §0.2 (invariance of Bochner
integrals), §1.2 (unitarizability), §5.2 (representative functions separate points), §6.2
(orthonormality of characters), §§E.1–E.4 (the torus of `SU(2)`, its irreducibles and Weyl integration
formula).

### From TauCetiRoadmap.RepresentationTheory.LieHighestWeight

§7.1: the split Serre presentation of a Killing Lie algebra and the central character of
highest-weight modules through the highest-weight line, with the Casimir comparison; the modules
`L(λ)`.

### From TauCetiRoadmap.RepresentationTheory.RootSystems

The abstract root systems, their Weyl groups and chambers, through the declarations listed above.

### From TauCetiRoadmap.RepresentationTheory.AdoIwasawa

Layer 5 (Ado's theorem in characteristic zero, used for `ℝ`) and its Layer 9 interface for Lie's third
theorem.

### From TauCetiRoadmap.ReductiveGroups

Layer 0 (functor of points), Layer 1 (a faithful closed immersion `G → GL(V)`), Layer 2 (`Lie(G)` with
its bracket), Layer 3 (subgroups, kernels, images and quotients), Layer 4 (character lattices), Layer 6
(smooth connected affine reductive groups, central torus and central isogeny), Layer 7 (the generic
Bruhat decomposition as a Tits system), Layer 7C (root subgroups) and §3A.5e (the complex Lie group
`G(ℂ)` of a group scheme of finite type over `ℂ`, holomorphic homomorphisms induced by homomorphisms
of group schemes, the closed embedded complex subgroup `G(ℂ) ⊂ GL(V)(ℂ)` for a closed immersion
`G → GL(V)`, and its tangent Lie algebra identified with Layer 2's `Lie(G)`).

### From TauCetiRoadmap.ComplexManifolds

Milestone 1: the underlying real model of a complex manifold on the same carrier, with model and
atlas transport.

### From TauCetiRoadmap.ComplexKahlerGeometry

Layer 1 (K1, holomorphic implicit and inverse functions on complex manifolds), §5.10 (K5, compact
Dolbeault and Hodge theory) and §6.1 (K6.0, the curvature identities and the positivity estimate on
bundle-valued forms).

### From Completed.HopfRinow

Layer 3: the Hopf–Rinow equivalence.

### From TauCetiRoadmap.RiemannianGeometry

R4.5: the Bonnet–Myers theorem (compactness and finite fundamental group under a positive Ricci
bound).

### From TauCetiRoadmap.SymplecticGeometry.CotangentLagrangian

C2.0 (the ambient real and complex polar decompositions and logarithm) and C2.1 (compact
intersections, symplectic polar preservation and the maximal compact subgroups of the matrix groups).

### From TauCetiRoadmap.SchemeAndStackFoundations

§§1.15–1.16 (torsors, contracted products, twisting), §2.2 (the Leray spectral sequence with edge maps
and naturality), §2.6 (the cohomology `H^q(ℙ^n_A, O(d))` for every `q`, `d` and base ring `A`).

### From TauCetiRoadmap.ComplexComparisonPartII

C-1.1 (analytification and its ring sheaf), C0.1, C0.3 (bundles and locally free sheaves), C0.4
(coherent analytification and pullback), C0.5 (higher direct images in all degrees, with the
composition law) and C1.9 (projective GAGA).

## References

- A. Kirillov Jr., *An Introduction to Lie Groups and Lie Algebras*, Cambridge Studies in Advanced
  Mathematics 113 (2008): the exponential map, one-parameter subgroups, `Ad` and `ad`, the
  closed-subgroup theorem, the Lie functor and BCH, and the correspondence with Lie algebras
  (Chs. 2–3). Theorem numbers above
  refer to the [author's online copy](https://www.math.stonybrook.edu/~kirillov/mat552/liegroups.pdf):
  Thm. 2.5 (universal cover), Thm. 2.8 (closed subgroups), Cor. 2.9 (generation by a neighbourhood of
  `1`), Prop. 3.1 (one-parameter subgroups), Lemma 3.14 (`ad` as the differential of `Ad`),
  Thm. 3.17 (the Lie functor, faithful on connected groups),
  Thm. 3.32 (`Z(G) = ker Ad`), Thm. 3.34 (BCH), Thms. 3.38, 3.43, 3.46, 3.48 and Cors. 3.49–3.50 (the
  three fundamental theorems and the equivalence of categories).
- D. Bump, *Lie Groups*, 2nd ed., Springer GTM 225 (2013): the matrix-group exponential, maximal tori,
  the Weyl group and Weyl integration formula, complexification and real forms, the Borel–Weil theorem
  and the Bruhat decomposition, and the Iwasawa and Cartan decompositions (Parts I–III).
- A. W. Knapp, *Lie Groups Beyond an Introduction*, 2nd ed., Birkhäuser (2002): the closed-subgroup
  theorem, the structure theory, complexification, restricted roots, and the Cartan, Iwasawa and `KAK`
  decompositions (Chs. I, IV–VII); Ch. VI, §2 for Cartan involutions, Ch. VI, §3 for the global Cartan
  decomposition, Ch. VI, §4 for the Iwasawa decomposition, Ch. VII, §3 for `KAK`.
- T. Bröcker, T. tom Dieck, *Representations of Compact Lie Groups*, Springer GTM 98 (1985): maximal-torus
  conjugacy and exhaustion, the Weyl group, the Weyl integration and character formulas, and the
  reduction of a compact connected group to its torus (Chs. IV–VI).
- B. C. Hall, *Lie Groups, Lie Algebras, and Representations*, 2nd ed., Springer GTM 222 (2015): the
  matrix Lie group development of the exponential map, `Ad`, BCH and the group–algebra correspondence,
  with `SU(2)` and `SO(3)` as the running example (Chs. 2–5); Thm. 5.4 for the derivative of the
  exponential.
- J.-P. Serre, *Lie Algebras and Lie Groups*, Springer LNM 1500 (1992): the formal-group and BCH
  treatment of the local correspondence and Lie's third theorem.
- V. S. Varadarajan, *Lie Groups, Lie Algebras, and Their Representations*, Springer GTM 102 (1984): the
  exponential map, the closed-subgroup theorem, Ado's theorem, and Lie's third theorem with the simply
  connected integration in full detail (Chs. 2–3).
- J. E. Humphreys, *Linear Algebraic Groups*, Springer GTM 21 (1975): §29.1, the Tits system of a
  connected reductive group, with `B ∩ N = T` and Weyl group `N/T`, used in §8.2.
- J. M. Lee, *Introduction to Smooth Manifolds*: Thm. 9.12, the fundamental theorem of flows (in the
  conventions).
- Heins, *Entire functions on Lie groups*, arXiv 2512.07479: Prop. 2.1, the connected period-quotient
  construction of the universal complexification (§7.3).
- K.-H. Neeb, *Towards a Lie theory of locally convex groups*, arXiv 1501.06269 (Japan. J. Math. 1
  (2006)): Rem. II.6.5(b) and Problem IV.1, the Lie subalgebra `{X | exp(ℝX) ⊆ H}` of an arbitrary
  subgroup `H` of a finite-dimensional Lie group, through Yamabe's theorem (§2.1).
