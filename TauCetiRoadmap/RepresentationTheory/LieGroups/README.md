# Roadmap: Lie groups and the Lie algebra correspondence

The whole representation-theory family presupposes a smooth-Lie-group theory that Mathlib does not have.
[The compact-groups roadmap](../CompactGroups/README.md) reduces a compact connected group "to its
maximal torus and rank-one `SU(2)` subgroups" and proves the Weyl integration formula by hand for
`SU(2)`; [the highest-weight roadmap](../LieHighestWeight/README.md) builds the representation theory of
the Lie *algebra* `𝔤` and remarks that its Weyl formulas are "the compact-group specializations that a
later general-compact-Lie-group roadmap (maximal tori, roots, the Weyl group) would abstract";
[the reductive-groups roadmap](../../ReductiveGroups/README.md) works with algebraic groups over a field.
None of them builds the object that ties `G` to `𝔤`: the **exponential map**, the **Lie functor**
`G ↦ Lie(G)`, the **closed-subgroup theorem**, **Lie's third theorem**, and the structure theory
(maximal tori, complexification, Borel-Weil, the Cartan/Iwasawa decompositions) of a general Lie group.
This roadmap builds it.

Mathlib's smooth side is genuinely thin. It has the **class of Lie groups** itself
(`Geometry/Manifold/Algebra/LieGroup.lean`: `LieGroup I n G`, a group that is a `C^n` manifold with
smooth multiplication and inversion, with the instance `LieGroup I 0 G` for any topological group and a
worked `LieGroup 𝓘(𝕜, R) n Rˣ` on the units of a normed algebra), the **Lie algebra of a Lie group** as
left-invariant derivations (`Geometry/Manifold/Algebra/LeftInvariantDerivation.lean`:
`LeftInvariantDerivation I G` with its `LieRing` and `LieAlgebra 𝕜` instances and the evaluation
`LeftInvariantDerivation.evalAt` into point derivations), the **Lie bracket of vector fields on a
manifold** (`Geometry/Manifold/VectorField/LieBracket.lean`: `VectorField.mlieBracket`), and the
manifold-calculus toolkit (`ContMDiff`, `mfderiv`, `TangentSpace`, `ModelWithCorners`). On the analytic
side it has the **exponential of a Banach algebra** in full (`Analysis/Normed/Algebra/Exponential.lean`:
`NormedSpace.exp 𝕂`, `exp_zero`, `exp_add_of_commute`, `exp_sum_of_commute`), specialized to the **matrix
exponential** (`Analysis/Normed/Algebra/MatrixExponential.lean`: `Matrix.exp_transpose`,
`Matrix.exp_diagonal`, `Matrix.exp_add_of_commute`, `Matrix.isUnit_exp`, `Matrix.exp_conj`) and to the
**circle exponential** `Circle.exp : C(ℝ, Circle)` (`Analysis/Complex/Circle.lean`, with `exp_zero`,
`exp_add`). On the abstract-algebra side it has the whole theory of Lie algebras
(`Algebra/Lie/*`: `LieRing`, `LieAlgebra R L`, `LieHom` (`→ₗ⁅R⁆`), `LieEquiv` (`≃ₗ⁅R⁆`),
`LieAlgebra.ad : L →ₗ⁅R⁆ Module.End R L`, `UniversalEnvelopingAlgebra K L`, Cartan subalgebras, root
systems via `LieAlgebra.IsKilling.rootSystem`). And it has the concrete **matrix groups**
(`Matrix.GeneralLinearGroup`, `Matrix.SpecialLinearGroup`, `Matrix.unitaryGroup`,
`Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`,
`Matrix.SymplecticGroup`, `Circle`), the topology of **covering maps** (`Topology/Covering/Basic.lean`:
`IsCoveringMap`) and **simple connectedness** (`SimplyConnectedSpace`).

What Mathlib does **not** have is everything that connects the group `G` to its Lie algebra `𝔤`. There
is no **Lie-group exponential map** `𝔤 → G` (only `NormedSpace.exp` on an algebra, which is its
`GL`-shadow), no **one-parameter subgroups** as integral curves, no **`Ad`/`ad`** relating conjugation
to the bracket, no **closed-subgroup (Cartan) theorem**, no **Lie functor** turning a homomorphism of
groups into a homomorphism of algebras, no **Baker-Campbell-Hausdorff** formula, no
**subalgebra ↔ immersed-subgroup** correspondence or **Frobenius integrability**, no **Lie's third
theorem** or the **equivalence of categories** it yields, no **simply-connected covers** of Lie groups,
no **maximal-torus conjugacy and exhaustion** for compact connected groups (the compact-groups roadmap
has it only for `SU(2)`), no **Weyl group** `N(T)/T` or **general Weyl integration formula**, no
**complexification** `G ↝ G_ℂ` or **real forms**, no **Borel-Weil theorem** or **flag manifolds** or
**Bruhat decomposition**, and no **Cartan/Iwasawa/KAK decompositions** or **restricted roots**. A search
for `oneParameterSubgroup`, `closedSubgroup`, `BakerCampbellHausdorff`, `maximalTorus`, `BorelWeil`, or
`Iwasawa` in Mathlib's Lie-group theory returns nothing.

This roadmap builds that theory, from the exponential map up to the structure theory of compact and
reductive Lie groups, with the matrix groups and the circle as the worked engine. It is organized into
three deliverables:

- **A. The Lie functor: from groups to algebras** (Layers 0-3): the exponential map, one-parameter
  subgroups, `Ad`/`ad`, the closed-subgroup theorem, the functor `G ↦ Lie(G)`, and
  Baker-Campbell-Hausdorff. This is the differentiation direction, `G ⟶ 𝔤`.
- **B. Integrating algebras to groups** (Layers 4-5): the subalgebra ↔ immersed-subgroup correspondence
  and Frobenius, Lie's third theorem, the equivalence of categories (simply-connected Lie groups ≃
  finite-dimensional Lie algebras), simply-connected covers, and the universal enveloping algebra. This
  is the integration direction, `𝔤 ⟶ G`.
- **C. The structure of compact and reductive Lie groups** (Layers 6-9): maximal-torus conjugacy and
  exhaustion, the Weyl group and the general Weyl integration formula, complexification and real forms,
  the Borel-Weil theorem with flag manifolds and the Bruhat decomposition, and the
  Cartan/Iwasawa/KAK decompositions with restricted roots.

Suggested home: `TauCeti/Geometry/Lie/` (the general theory) and `TauCeti/Geometry/Lie/Matrix/` (the
matrix-group engine), mirroring Mathlib's `Geometry/Manifold/Algebra/`.

## Standing conventions

- **The group, and its two settings.** A **Lie group** is Mathlib's `LieGroup I n G`: a `Group G` that
  is a `C^n` manifold on a `ModelWithCorners I` with `C^n` multiplication and inversion. The default
  throughout is a **real, finite-dimensional, `C^∞`** Lie group: base field `ℝ`, model
  `I : ModelWithCorners ℝ E H` with `E` finite-dimensional, smoothness `n = ∞`, and `[IsManifold I ∞ G]`.
  State each result at the generality it needs, in the unbundled Zulip house style: the exponential map
  and `Ad` need only a `LieGroup`; the closed-subgroup theorem needs local compactness (automatic in
  finite dimensions); the structure theory of Deliverable C needs `[CompactSpace G]` and `[ConnectedSpace G]`
  or, for the reductive statements, a complex or reductive hypothesis. **Do not** bundle "real,
  finite-dimensional, compact, connected, semisimple" into one mega-class; spell the hypotheses each
  theorem uses. Complexifications and real forms are **complex** Lie groups (base field `ℂ`), introduced
  in Layer 7 and named as such.
- **The Lie algebra is `LeftInvariantDerivation I G`; the tangent space at `1` is its concrete face.**
  Reuse Mathlib's `LeftInvariantDerivation I G` (with its `LieRing`/`LieAlgebra ℝ` instances) as
  `Lie(G) = 𝔤`, never a private synonym. Pin the linear isomorphism
  `LeftInvariantDerivation I G ≃ₗ[ℝ] TangentSpace I (1 : G)` (Mathlib's `LeftInvariantDerivation.evalAt`
  at `1`, upgraded to an equivalence), so a tangent vector at the identity and a left-invariant
  derivation are interchangeable and `Lie(G)` is finite-dimensional with `finrank ℝ 𝔤 = finrank ℝ E`.
  The bracket is the derivation commutator already in Mathlib; do not reintroduce it.
- **The exponential map is built here; Mathlib's `NormedSpace.exp` is its `GL`-shadow.** The general
  `lieExp : 𝔤 → G` is a **new** object (Layer 0), the time-one flow of the left-invariant vector field.
  On `G = Rˣ` (units of a Banach algebra, `Lie(Rˣ) = R`) it must coincide with `NormedSpace.exp ℝ`, on
  matrix groups with `Matrix.exp`, and on the circle with `Circle.exp`; those coincidences are
  acceptance criteria, not definitions. Reuse Mathlib's `NormedSpace.exp`, `Matrix.exp` lemmas, and
  `Circle.exp` for the worked arena; never redefine the matrix exponential.
- **`ad` is Mathlib's; `Ad` and `ad = d(Ad)` are built here.** For the Lie algebra `𝔤`, the adjoint
  `ad = LieAlgebra.ad ℝ 𝔤 : 𝔤 →ₗ⁅ℝ⁆ Module.End ℝ 𝔤` is already in Mathlib (`Algebra/Lie/OfAssociative.lean`,
  `LieAlgebra.ad_apply : ad x y = ⁅x, y⁆`); reuse it. The group adjoint `Ad : G → (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)`
  (conjugation differentiated at `1`) is new, and the identity `ad = d(Ad)_1` and
  `Ad (lieExp X) = exp (ad X)` are the milestones that connect them.
- **Matrix groups are the computable engine; the abstract manifold theory is the general statement.**
  Every abstract milestone has a matrix-group shadow that is Mathlib-native and where norms exist:
  `Matrix.GeneralLinearGroup (Fin n) ℝ = (Matrix (Fin n) (Fin n) ℝ)ˣ`, `Matrix.SpecialLinearGroup`,
  `Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup`/`specialOrthogonalGroup`. Where a smooth-manifold
  signature is fragile, `Suggested.lean` states the milestone over a matrix or normed group instead and
  the README records the general form; the two are kept in step, exactly as
  [../CompactGroups](../CompactGroups/README.md) keeps `SU(2)` beside the abstract compact group. Use
  Mathlib's matrix-group names, never a private matrix group.
- **Root systems and the Weyl group are the root-systems roadmap's; we consume them.** For the
  reductive/complex structure theory (Layers 8-9) the root system is `LieAlgebra.IsKilling.rootSystem`
  and the abstract Weyl group is `RootPairing.weylGroup`, the province of
  [../RootSystems](../RootSystems/README.md) and [../LieHighestWeight](../LieHighestWeight/README.md).
  The **geometric** Weyl group `N(T)/T` built here (Layer 6) is proved isomorphic to that abstract Weyl
  group in the reductive case, not reintroduced. The highest-weight modules `L(λ)` that Borel-Weil
  realizes are [../LieHighestWeight](../LieHighestWeight/README.md)'s `irreducibleQuotient`; we cite them.
- **Haar and Peter-Weyl are the compact-groups roadmap's.** The Weyl integration formula (Layer 6) is an
  identity of integrals against `MeasureTheory.Measure.haar`; the normalized Haar probability measure,
  its bi-invariance, and the character orthogonality it feeds are
  [../CompactGroups](../CompactGroups/README.md)'s `haarProb` and `character_orthonormal`, cited rather
  than rebuilt. This roadmap supplies the **general** maximal-torus reduction that the compact-groups
  roadmap proved only for `SU(2)`; specializing back to `SU(2)` recovers its `weyl_integration_formula`.

## What Mathlib already has (consume)

- **The class of Lie groups.** `Geometry/Manifold/Algebra/LieGroup.lean` — `LieGroup I n G` (and
  `LieAddGroup`), extending `ContMDiffMul I n G` with `contMDiff_inv`; `LieGroup.of_le`, the instance
  `LieGroup I 0 G` for `[IsTopologicalGroup G]`, and the units instance
  `Geometry/Manifold/Instances/UnitsOfNormedAlgebra.lean`: `ChartedSpace R Rˣ` and `LieGroup 𝓘(𝕜, R) n Rˣ`.
- **The Lie algebra of a Lie group.** `Geometry/Manifold/Algebra/LeftInvariantDerivation.lean` —
  `LeftInvariantDerivation I G` with `instLieRing`/`instLieAlgebra` (`𝕜`), `LeftInvariantDerivation.evalAt`
  (`→ₗ[𝕜] PointDerivation I g`), and the bracket `⁅X, Y⁆` as the derivation commutator.
- **The Lie bracket of vector fields.** `Geometry/Manifold/VectorField/LieBracket.lean` —
  `VectorField.mlieBracket I V W`, `mlieBracketWithin`, `leibniz_identity_mlieBracket`,
  `mpullback_mlieBracket`.
- **The exponential of a Banach algebra.** `Analysis/Normed/Algebra/Exponential.lean` —
  `NormedSpace.exp 𝕂 : 𝔸 → 𝔸`, `expSeries`, `exp_zero`, `exp_add_of_commute`, `exp_add` (commutative
  `𝔸`), `exp_sum_of_commute`, `exp_sum`, `hasFPowerSeriesAt_exp_zero_of_radius_pos`.
- **The matrix exponential.** `Analysis/Normed/Algebra/MatrixExponential.lean` — `Matrix.exp_transpose`,
  `Matrix.exp_conjTranspose`, `Matrix.exp_diagonal`, `Matrix.exp_blockDiagonal`,
  `Matrix.exp_add_of_commute`, `Matrix.exp_sum_of_commute`, `Matrix.exp_nsmul`, `Matrix.exp_neg`,
  `Matrix.exp_zsmul`, `Matrix.isUnit_exp`, `Matrix.exp_units_conj`, `Matrix.exp_conj`.
- **The circle and its exponential.** `Analysis/Complex/Circle.lean` — `Circle` (`= Submonoid.unitSphere ℂ`,
  a group), `Circle.exp : C(ℝ, Circle)` (`t ↦ exp (t * I)`), `Circle.exp_zero`, `Circle.exp_add`; and
  `AddCircle`, `AddCircle.haarAddCircle`.
- **Abstract Lie algebras.** `Algebra/Lie/Basic.lean` — `LieRing`, `LieAlgebra R L`, `LieHom` (`→ₗ⁅R⁆`),
  `LieEquiv` (`≃ₗ⁅R⁆`), `LieSubalgebra`, `LieIdeal`; `Algebra/Lie/OfAssociative.lean` —
  `LieAlgebra.ad R L : L →ₗ⁅R⁆ Module.End R L`, `LieAlgebra.ad_apply`; `Algebra/Lie/UniversalEnveloping.lean`
  — `UniversalEnvelopingAlgebra K L`, `UniversalEnvelopingAlgebra.ι`, `.lift`; the structure theory
  (`CartanSubalgebra`, `IsKilling`, `IsSemisimple`, `rootSystem`) consumed by
  [../LieHighestWeight](../LieHighestWeight/README.md).
- **Matrix groups.** `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean`
  (`Matrix.GeneralLinearGroup n R = (Matrix n n R)ˣ`, `GLPos`), `LinearAlgebra/Matrix/SpecialLinearGroup.lean`
  (`Matrix.SpecialLinearGroup`, `SL(n, R)`), `LinearAlgebra/UnitaryGroup.lean` (`Matrix.unitaryGroup`,
  `Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup` with their
  `Group` instances), `LinearAlgebra/SymplecticGroup.lean` (`Matrix.SymplecticGroup`).
- **Manifold calculus.** `Geometry/Manifold/MFDeriv/Defs.lean` (`mfderiv`, `TangentSpace`),
  `Geometry/Manifold/ContMDiff/Defs.lean` (`ContMDiff`), `Geometry/Manifold/IsManifold/Basic.lean`
  (`IsManifold`), `ModelWithCorners`.
- **Topology of covers and connectedness.** `Topology/Covering/Basic.lean`
  (`IsCoveringMap`, `IsCoveringMapOn`), `Topology/Homotopy/Lifting.lean`,
  `AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean` (`SimplyConnectedSpace`), `ConnectedSpace`,
  `LocallyCompactSpace`.
- **Haar measure (for Layer 6).** `MeasureTheory/Measure/Haar/Basic.lean` (`Measure.haar`),
  `CompactSpace.isFiniteMeasure`, and the uniqueness/normalization consumed by
  [../CompactGroups](../CompactGroups/README.md).

## What is missing (build here)

The **Lie-group exponential map** `lieExp : 𝔤 → G` as the time-one flow of a left-invariant vector field,
its smoothness and local-diffeomorphism-at-`0` property, and the **one-parameter subgroups**
`t ↦ lieExp (t • X)` as the smooth homomorphisms `ℝ → G`; the **adjoint representations** `Ad : G → (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)`
and its derivative `ad = d(Ad)`, with `Ad (lieExp X) = exp (ad X)`; the **closed-subgroup (Cartan)
theorem** that a closed subgroup of a Lie group is an embedded Lie subgroup, with its Lie subalgebra
`{X | ∀ t, lieExp (t • X) ∈ H}`; the **Lie functor** `G ↦ Lie(G)` on objects and its action
`Hom(G, G') → Hom(𝔤, 𝔤')` on smooth homomorphisms, functorial and natural against `lieExp`; the
**Baker-Campbell-Hausdorff** series and the local identity `lieExp X · lieExp Y = lieExp (BCH X Y)`; the
**subalgebra ↔ immersed-subgroup** correspondence via **Frobenius integrability** of the left-invariant
distribution; **Lie's third theorem**, integrating a finite-dimensional real Lie algebra to a
simply-connected Lie group, and the **equivalence of categories** simply-connected Lie groups ≃
finite-dimensional Lie algebras it yields (the functor of Deliverable A is fully faithful and essentially
surjective on simply-connected targets); **simply-connected covers** `G̃ → G` of a connected Lie group as
covering homomorphisms inducing an isomorphism of Lie algebras; the **universal enveloping algebra of
`Lie(G)`** as the left-invariant differential operators (PBW itself is
[../LieHighestWeight](../LieHighestWeight/README.md)'s target, cited); **maximal-torus conjugacy and
exhaustion** for a compact connected `G` (every element lies in a maximal torus, all maximal tori are
conjugate), the **Weyl group** `N(T)/T` as a finite group, and the **general Weyl integration formula**
reducing an integral over `G` to one over `T` weighted by the Weyl density; the **complexification**
`G ↝ G_ℂ` with its universal property, **real forms**, and the equivalence between finite-dimensional
representations of a compact `G` and holomorphic representations of `G_ℂ`; the **Borel-Weil theorem**
realizing `L(λ)` as holomorphic sections of a line bundle over the **flag manifold** `G_ℂ/B`, with the
**Bruhat decomposition** `G_ℂ = ⨆_{w ∈ W} BwB`; and the **Cartan** (`G = K exp(𝔭)`), **Iwasawa**
(`G = KAN`), and **KAK** decompositions with the **restricted root system** (structure only, stopping
before harmonic analysis). None of this is upstream.

`Suggested.lean` pins the load-bearing objects (`lieExp`, `oneParameterSubgroup`, `Ad`, `adjointAction`,
`IsEmbeddedLieSubgroup`, `lieSubalgebraOfSubgroup`, `lieMap` (the functor), `bch`, `integralSubgroup`,
`IsMaximalTorus`, `weylGroup`, `Complexification`, `borelWeilSpace`, `iwasawaDecomposition`) and the named
milestones below as `sorry`-targets, so each is claimable and the summit statements are machine-checked to
be expressible against the pinned Mathlib.

---

## The build, in layers

The ordering is the dependency order. Deliverable A (Layers 0-3) differentiates: it builds the
exponential map, the adjoint representations, the closed-subgroup theorem, and the Lie functor.
Deliverable B (Layers 4-5) integrates: Frobenius, Lie's third theorem, the equivalence of categories, and
the enveloping algebra. Deliverable C (Layers 6-9) is the structure theory of compact and reductive Lie
groups. As each layer makes the next layer's *types* expressible, its milestones go into `Suggested.lean`
(with `sorry`).

## A. The Lie functor: from groups to algebras

### Layer 0: the exponential map and one-parameter subgroups

- **The Lie algebra and the tangent space at `1`.** Reuse `LeftInvariantDerivation I G` as `𝔤`, and pin
  the linear isomorphism `𝔤 ≃ₗ[ℝ] TangentSpace I (1 : G)` (from `LeftInvariantDerivation.evalAt 1`), so
  `finrank ℝ 𝔤 = finrank ℝ E`. Every left-invariant derivation is a left-invariant vector field; state
  that dictionary.
- **The exponential map.** `lieExp : 𝔤 → G`, `lieExp X = γ_X 1` where `γ_X : ℝ → G` is the integral curve
  through `1` of the left-invariant vector field `X` (equivalently the unique one-parameter subgroup with
  velocity `X` at `0`). Its basic theory: `lieExp 0 = 1`, `lieExp` is **smooth**, and its derivative at
  `0` is the identity of `𝔤`, so (inverse function theorem) `lieExp` is a **local diffeomorphism at `0`**
  and provides the canonical chart at `1`.
- **One-parameter subgroups.** `oneParameterSubgroup X : ℝ → G`, `t ↦ lieExp (t • X)`, is a **smooth
  group homomorphism** `(ℝ, +) → G`: `lieExp ((s + t) • X) = lieExp (s • X) * lieExp (t • X)` and
  `lieExp (0 • X) = 1`. Conversely, **every** continuous homomorphism `ℝ → G` is `oneParameterSubgroup X`
  for a unique `X` (a continuous one-parameter subgroup is automatically smooth). This bijection
  `Hom_cont(ℝ, G) ≃ 𝔤` is the definition's justification.
- **The matrix and circle shadows.** On `G = Rˣ` for a Banach algebra `R` (with `Lie(Rˣ) ≅ R`),
  `lieExp = NormedSpace.exp ℝ` landing in `Rˣ` (`isUnit_exp`); on matrix groups it is `Matrix.exp`, whose
  `Matrix.exp_diagonal`, `Matrix.exp_transpose`, `Matrix.exp_conj` are the computational identities; on
  the circle it is `Circle.exp`, with `Circle.exp_add` its one-parameter-subgroup law. These are proved
  here as the coincidence lemmas that ground the abstract `lieExp`.

### Layer 1: the adjoint representations `Ad` and `ad`

- **The group adjoint.** `Ad : G → (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)`, `Ad g = d(c_g)_1` the differential at `1` of conjugation
  `c_g : x ↦ g x g⁻¹`. It is a Lie-algebra automorphism, and `Ad : G →* (𝔤 ≃ₗ⁅ℝ⁆ 𝔤)` is a **smooth
  representation** of `G` on `𝔤`, the **adjoint representation**. On matrix groups `Ad g X = g X g⁻¹`.
- **The infinitesimal adjoint.** The Lie-algebra adjoint is Mathlib's
  `ad = LieAlgebra.ad ℝ 𝔤 : 𝔤 →ₗ⁅ℝ⁆ Module.End ℝ 𝔤`, `ad X = ⁅X, ·⁆` (`LieAlgebra.ad_apply`). The
  milestone is that it is the derivative of `Ad`: `ad = d(Ad)_1`, i.e.
  `mfderiv Ad 1 X = LieAlgebra.ad ℝ 𝔤 X`. This *is* the geometric meaning of the bracket.
- **The conjugation formulas.** `Ad (lieExp X) = NormedSpace.exp ℝ (ad X)` (the exponential of the
  endomorphism `ad X`), `g · lieExp X · g⁻¹ = lieExp (Ad g X)`, and the derivative-of-`lieExp` formula
  `d(lieExp)_X = d(L_{lieExp X})_1 ∘ (1 - exp(-ad X))/ad X` (the source of the singularities of `lieExp`,
  and the first place BCH will need `ad`). State the naturality `Ad_lieExp` as the headline.

### Layer 2: the closed-subgroup (Cartan) theorem

- **The Lie subalgebra of a subgroup.** For a subgroup `H ≤ G`, `lieSubalgebraOfSubgroup H = {X : 𝔤 | ∀ t : ℝ, lieExp (t • X) ∈ H}`
  is a **Lie subalgebra** of `𝔤` (closed under bracket, by a difference-quotient argument on
  `lieExp`). This is well-defined for any subgroup and is the candidate `Lie(H)`.
- **The closed-subgroup theorem.** If `H ≤ G` is **closed**, then `H` is an **embedded Lie subgroup**:
  `IsEmbeddedLieSubgroup H`, i.e. `H` carries a (unique) smooth structure making the inclusion a smooth
  embedding and `H` a Lie group, with `Lie(H) = lieSubalgebraOfSubgroup H` and `lieExp_H` the restriction
  of `lieExp`. The proof is the classical one: `lieSubalgebraOfSubgroup H` is exactly the set of `X` with
  `lieExp (tₙ Xₙ) ∈ H`, `Xₙ → X`, and `lieExp` restricted to a complement gives a chart in which `H` is
  a linear subspace near `1`. This is the theorem that makes every matrix group below a Lie group.
- **Consequences.** The **matrix groups are Lie groups**: `Matrix.SpecialLinearGroup`,
  `Matrix.unitaryGroup`, `Matrix.specialUnitaryGroup`, `Matrix.orthogonalGroup`,
  `Matrix.specialOrthogonalGroup`, and `Matrix.SymplecticGroup` are closed subgroups of
  `Matrix.GeneralLinearGroup`, hence embedded Lie subgroups, with Lie algebras the trace-zero,
  skew-Hermitian, skew-symmetric, etc. matrices. State each `Lie(-)` explicitly; these are the acceptance
  criteria that give the compact-groups and classical-groups roadmaps their smooth structures. **Cartan's
  automatic-smoothness corollary**: every continuous homomorphism between Lie groups is smooth (its graph
  is a closed subgroup), so "Lie group homomorphism" may be stated as "continuous homomorphism".

### Layer 3: the Lie functor and Baker-Campbell-Hausdorff

- **The functor on morphisms.** For a smooth (equivalently, by Layer 2, continuous) homomorphism
  `φ : G →* G'`, `lieMap φ = d(φ)_1 : 𝔤 →ₗ⁅ℝ⁆ 𝔤'` is a **Lie-algebra homomorphism**, natural against the
  exponential: `φ (lieExp X) = lieExp (lieMap φ X)`. Functoriality: `lieMap (id) = id`,
  `lieMap (ψ ∘ φ) = lieMap ψ ∘ lieMap φ`. Together with Layer 0 this is the **Lie functor**
  `G ↦ (𝔤, Lie(G))`, `φ ↦ lieMap φ`, from Lie groups to finite-dimensional real Lie algebras.
- **Injectivity on connected groups.** If `G` is **connected**, `lieMap` determines `φ`: two smooth
  homomorphisms with the same differential at `1` agree (they agree on `lieExp 𝔤`, which generates a
  connected `G`). So the functor is **faithful on connected groups**, and a connected Lie group is
  generated by any neighborhood of `1`.
- **Baker-Campbell-Hausdorff.** The **BCH series** `bch X Y = X + Y + ½⁅X, Y⁆ + 1/12(⁅X,⁅X,Y⁆⁆ - ⁅Y,⁅X,Y⁆⁆) + ⋯`,
  a formal Lie series in `X, Y`, converges for `X, Y` near `0` and satisfies
  `lieExp X · lieExp Y = lieExp (bch X Y)` there. State it over a **Banach algebra / matrix group** first,
  where `NormedSpace.exp` and the operator norm make convergence and the smallness hypothesis concrete
  (`bch X Y = NormedSpace.exp`-log of `exp X · exp Y`), then transport to the abstract `lieExp` via a
  chart. BCH shows the **local group law is determined by the bracket**, the analytic heart of the
  equivalence of categories in Layer 4.

## B. Integrating algebras to groups

### Layer 4: Frobenius, Lie's third theorem, and the equivalence of categories

- **The subalgebra ↔ immersed-subgroup correspondence.** For a Lie subalgebra `𝔥 ≤ 𝔤`, the left-invariant
  distribution `x ↦ d(L_x)_1 𝔥 ⊆ TangentSpace I x` is **involutive** (`⁅𝔥, 𝔥⁆ ⊆ 𝔥`), so by **Frobenius
  integrability** it is integrable; the leaf through `1` is a **connected immersed Lie subgroup**
  `integralSubgroup 𝔥` with `Lie(integralSubgroup 𝔥) = 𝔥`. State the Frobenius theorem
  (`VectorField.mlieBracket`-involutive ⇒ integrable) as the named analytic prerequisite. The map
  `𝔥 ↦ integralSubgroup 𝔥` is a **bijection** between Lie subalgebras of `𝔤` and connected immersed
  subgroups of `G` (the closed ones are Layer 2's embedded subgroups).
- **Lie's third theorem.** Every **finite-dimensional real Lie algebra** `L` is `Lie(G)` for some
  **simply-connected** Lie group `G`: `∃ G, [LieGroup] ∧ SimplyConnectedSpace G ∧ Nonempty (Lie(G) ≃ₗ⁅ℝ⁆ L)`.
  Prove it via **Ado's theorem** (every finite-dimensional Lie algebra embeds in `𝔤𝔩_n = Matrix n n ℝ`;
  named as its own algebraic target) reducing to the subalgebra `L ↪ 𝔤𝔩_n`, integrating by the Frobenius
  correspondence to an immersed subgroup of `GL_n`, and passing to its simply-connected cover (Layer 5).
- **The equivalence of categories.** The Lie functor of Layer 3, restricted to **simply-connected** Lie
  groups, is an **equivalence** onto finite-dimensional real Lie algebras. Concretely: for simply-connected
  `G` and any Lie group `G'`, `lieMap : Hom(G, G') ≃ Hom(𝔤, 𝔤')` is a **bijection** (existence lifts a
  Lie-algebra homomorphism to a group homomorphism using simple connectedness and the local BCH group law;
  uniqueness is Layer 3's faithfulness). Combined with Lie's third theorem (essential surjectivity), this
  is the categorical statement `SimplyConnLieGrp ≃ FinDimLieAlg`.

### Layer 5: simply-connected covers and the enveloping algebra

- **Simply-connected covers.** Every **connected** Lie group `G` has a **universal cover** `G̃` that is a
  simply-connected Lie group with a **covering homomorphism** `p : G̃ →* G` (`IsCoveringMap p`), and
  `lieMap p : Lie(G̃) ≃ₗ⁅ℝ⁆ Lie(G)` is an **isomorphism** (a covering is a local diffeomorphism). The
  kernel `ker p` is a discrete central subgroup isomorphic to `π₁(G)`. So Lie-group homomorphisms out of a
  connected `G` correspond to homomorphisms out of `G̃` trivial on `ker p`, refining Layer 4's bijection
  to connected (not just simply-connected) sources.
- **The universal enveloping algebra.** `UniversalEnvelopingAlgebra ℝ 𝔤` (Mathlib) is the algebra of
  **left-invariant differential operators** on `G`; state the isomorphism, extending `lieExp`'s derivative
  action, and its universal property `UniversalEnvelopingAlgebra.lift`. The **PBW theorem** and the PBW
  basis are [../LieHighestWeight](../LieHighestWeight/README.md)'s targets (its Layer 3 owns "the PBW
  basis is the missing piece"); we cite it and use the resulting monomial basis to describe the
  center `Z(U(𝔤))` and the Casimir, the bridge to the highest-weight theory. The center acts on each
  irreducible by a scalar (infinitesimal character), matching [../LieHighestWeight](../LieHighestWeight/README.md)'s
  Casimir eigenvalue.

## C. The structure of compact and reductive Lie groups

### Layer 6: maximal tori, the Weyl group, and Weyl integration

- **Tori and maximal tori.** A **torus** in `G` is a compact connected abelian Lie subgroup; by the
  structure of compact connected abelian Lie groups it is `(Circle)^r` for `r = rank`. `IsMaximalTorus T`:
  a torus maximal under inclusion. Its Lie algebra `𝔱 = Lie(T)` is a **maximal abelian subalgebra** of
  `𝔤`, and `T = lieExp 𝔱` with `lieExp|𝔱` surjective onto `T`.
- **Conjugacy and exhaustion.** For **compact connected** `G`: **every** element lies in some maximal
  torus (`⋃_{g} g T g⁻¹ = G`, the **torus exhaustion** theorem, proved from the fixed-point/degree
  argument on `G/T`), and **all** maximal tori are **conjugate**. Hence the rank is well-defined and
  `lieExp : 𝔤 → G` is **surjective** for compact connected `G`. This is the general form of the fact
  [../CompactGroups](../CompactGroups/README.md) proves only for `SU(2)` ("every element of `SU(2)` is
  conjugate into `T`").
- **The Weyl group.** `weylGroup T = N_G(T) / T`, the quotient of the normalizer by `T`; it is a **finite**
  group acting faithfully on `T` and on `𝔱`. In the reductive case it is isomorphic to the abstract
  `RootPairing.weylGroup` of [../RootSystems](../RootSystems/README.md) (`N(T)/T ≃ W(root system)`), the
  identification being a stated milestone.
- **The Weyl integration formula.** For a compact connected `G` with maximal torus `T` and normalized
  Haar `μ_G`, `μ_T`, and any class function (conjugation-invariant integrable) `f`,
  `∫_G f dμ_G = |W|⁻¹ ∫_T f(t) · |Δ(t)|² dμ_T(t)` with Weyl density `|Δ(t)|² = ∏_{α > 0} |1 - α(t)⁻¹|²`
  over the positive roots. This reduces integration over `G` to the torus, the general form of
  [../CompactGroups](../CompactGroups/README.md)'s `weyl_integration_formula` for `SU(2)`; specializing to
  `SU(2)` with `T = Circle` recovers `|Δ|² = 4 sin²θ` exactly. Consequence: **Weyl character
  orthogonality** for compact `G`, via the formula and the torus Fourier theory.

### Layer 7: complexification and real forms

- **The complexification.** For a compact (or real reductive) Lie group `G`, the **complexification**
  `Complexification G = G_ℂ` is a complex Lie group with a homomorphism `G →* G_ℂ` universal among
  homomorphisms of `G` into complex Lie groups; `Lie(G_ℂ) = 𝔤 ⊗_ℝ ℂ` (the complexified Lie algebra), and
  `G` is a **maximal compact subgroup** of `G_ℂ`. On matrix groups: `(U(n))_ℂ = GL_n(ℂ)`,
  `(SU(n))_ℂ = SL_n(ℂ)`, `(SO(n))_ℂ = SO_n(ℂ)`, `(Sp(n))_ℂ = Sp_{2n}(ℂ)` — stated as the worked
  identifications.
- **Real forms.** A **real form** of a complex Lie group `G_ℂ` is a real Lie subgroup `G_ℝ` with
  `Lie(G_ℝ) ⊗_ℝ ℂ = Lie(G_ℂ)`; the compact real form (existence and uniqueness up to conjugacy for
  reductive `G_ℂ`) is `G`. State the compact-real-form existence as a milestone.
- **Reps of `G` ↔ holomorphic reps of `G_ℂ`.** The functor "restrict to `G`" is an **equivalence** between
  finite-dimensional **holomorphic** representations of `G_ℂ` and finite-dimensional **continuous**
  representations of the compact `G` (**Weyl's unitary trick** at the group level: every finite-dimensional
  representation of `G` extends uniquely holomorphically to `G_ℂ`, because its differential extends
  ℂ-linearly to `𝔤 ⊗ ℂ` and integrates by simple connectedness / Layer 4). This is what lets the
  highest-weight classification of [../LieHighestWeight](../LieHighestWeight/README.md) govern the compact
  group, and it feeds [../CompactGroups](../CompactGroups/README.md)'s Peter-Weyl.

### Layer 8: Borel-Weil, flag manifolds, and Bruhat

- **Borel subgroups and the flag manifold.** For a complex reductive `G_ℂ` with maximal torus `T_ℂ` and a
  choice of positive roots, the **Borel subgroup** `B = T_ℂ · N` (`N` the unipotent radical, `Lie(N) = ⨁_{α>0} 𝔤_α`)
  is a maximal connected solvable subgroup; the **flag manifold** `flagManifold = G_ℂ / B` is a compact
  complex manifold, and `G / T ≅ G_ℂ / B` (the compact picture). State it as a `G_ℂ`-homogeneous space.
- **The Bruhat decomposition.** `G_ℂ = ⨆_{w ∈ W} B w B` (disjoint over the Weyl group `W`), the **Bruhat
  decomposition**, giving the **Schubert cells** `BwB/B` of `G_ℂ/B` (a cell of complex dimension
  `ℓ(w)`), hence the cell structure and cohomology of the flag manifold. State the decomposition and the
  cell-dimension formula.
- **The Borel-Weil theorem.** For a dominant integral weight `λ`, the holomorphic line bundle `L_λ` over
  `G_ℂ/B` associated to the character `λ` of `B` has space of **holomorphic sections**
  `borelWeilSpace λ = H⁰(G_ℂ/B, L_λ)` isomorphic, as a `G_ℂ`-representation, to the **irreducible**
  `L(λ)` of [../LieHighestWeight](../LieHighestWeight/README.md) (`irreducibleQuotient`), with highest
  weight `λ`. This is the **geometric realization** of the highest-weight modules, the summit of Layer 8;
  the Borel-Weil-Bott extension (higher cohomology and non-dominant `λ`) is stated as its refinement.

### Layer 9: the Cartan, Iwasawa, and KAK decompositions

- **The Cartan decomposition.** For a real reductive `G` with maximal compact subgroup `K` and Cartan
  involution `θ`, `𝔤 = 𝔨 ⊕ 𝔭` (`+1` and `-1` eigenspaces of `dθ`), and the map `K × 𝔭 → G`,
  `(k, X) ↦ k · lieExp X` is a **diffeomorphism** (`G = K · lieExp 𝔭`). On `GL_n(ℝ)` this is polar
  decomposition `A = (orthogonal) · exp(symmetric)`.
- **The Iwasawa decomposition.** `G = KAN` (`iwasawaDecomposition`): with `A = lieExp 𝔞` (`𝔞 ⊆ 𝔭` a
  maximal abelian subspace) and `N` the unipotent group of the **restricted roots**, the multiplication
  `K × A × N → G` is a **diffeomorphism**. On `GL_n(ℝ)` / `SL_n(ℝ)` this is Gram-Schmidt: (orthogonal) ·
  (positive diagonal) · (upper unitriangular).
- **Restricted roots and the KAK decomposition.** The **restricted root system**
  `restrictedRootSystem`: the roots of `𝔞` acting on `𝔤` (a root system, possibly non-reduced, with its
  restricted Weyl group `W(𝔞) = N_K(𝔞)/Z_K(𝔞)`); and the **KAK (Cartan) decomposition**
  `G = K · closure(A⁺) · K`, `g = k₁ a k₂` with `a` in the closed positive Weyl chamber of `A`, unique up
  to `W(𝔞)`. Structure only: harmonic analysis on `G` (spherical functions, the Harish-Chandra transform)
  is beyond this roadmap and is named as downstream work, not built here.

---

## Worked examples (acceptance criteria)

- **The circle `Circle` and its exponential.** `Circle` is a one-dimensional compact connected abelian Lie
  group with `Lie(Circle) ≅ ℝ`; `lieExp` specialized to `Circle` **is** Mathlib's `Circle.exp`, with
  `Circle.exp_add` the one-parameter-subgroup law and `Circle.exp_zero` the unit. `Circle` is its own
  maximal torus, `weylGroup = 1`, and `Circle_ℂ = ℂˣ`. Acceptance: `lieExp = Circle.exp` up to the
  identification `Lie(Circle) ≅ ℝ`, and the Weyl integration formula degenerates to `∫_{Circle} = ∫_T`.
- **`GL_n(ℝ)` and the matrix exponential.** `Matrix.GeneralLinearGroup (Fin n) ℝ = (Matrix (Fin n) (Fin n) ℝ)ˣ`
  has `Lie(GL_n) = Matrix (Fin n) (Fin n) ℝ` and `lieExp = Matrix.exp`; `Ad g X = g X g⁻¹`,
  `ad X Y = X*Y - Y*X`, and `Ad (exp X) = exp(ad X)` are checked directly via
  `Matrix.exp_conj`, `Matrix.exp_add_of_commute`. Acceptance: the abstract Layer-0/1 statements, restricted
  to `Rˣ` with `R = Matrix (Fin n) (Fin n) ℝ`, become the `NormedSpace.exp` / `Matrix.exp` identities.
- **`SU(2)`, `SO(3)`, and the double cover.** `SU(2) = Matrix.specialUnitaryGroup (Fin 2) ℂ` has
  `Lie(SU(2)) = ` skew-Hermitian trace-zero matrices `≅ ℝ³` with the cross-product bracket;
  `SO(3) = Matrix.specialOrthogonalGroup (Fin 3) ℝ` has the same Lie algebra. `Ad : SU(2) → SO(3)` (the
  adjoint on `𝔰𝔲(2) ≅ ℝ³`) is a **surjective** homomorphism with kernel `{±1}`, exhibiting `SU(2)` as the
  **simply-connected double cover** of `SO(3)` (Layer 5), and `lieMap Ad : 𝔰𝔲(2) ≅ 𝔰𝔬(3)` is the
  Lie-algebra isomorphism of Layers 3-5. Acceptance: `SU(2)` is simply connected, `SO(3)` is not, and the
  covering `SU(2) → SO(3)` induces a Lie-algebra isomorphism.
- **The maximal torus of `U(n)`.** `T = ` diagonal unitary matrices `≅ (Circle)^n` is a maximal torus of
  `U(n) = Matrix.unitaryGroup (Fin n) ℂ`; every unitary matrix is conjugate into `T` (spectral theorem =
  torus exhaustion), all maximal tori are conjugate, `weylGroup T ≅ Equiv.Perm (Fin n)` (permuting the
  eigenvalues), and the Weyl integration formula is the classical `U(n)` eigenvalue-density formula
  `|Δ|² = ∏_{i<j} |z_i - z_j|²`. Acceptance: torus exhaustion for `U(n)` is the spectral theorem, and
  `weylGroup ≅ S_n`.
- **Complexification on the classical groups.** `(U(n))_ℂ = GL_n(ℂ)`, `(SU(n))_ℂ = SL_n(ℂ)`,
  `(SO(n))_ℂ = SO_n(ℂ)`; finite-dimensional representations of `SU(n)` extend to holomorphic
  representations of `SL_n(ℂ)`, matching [../LieHighestWeight](../LieHighestWeight/README.md)'s
  highest-weight classification and [../CompactGroups](../CompactGroups/README.md)'s Peter-Weyl. Acceptance:
  the `SU(2)` irreducibles `Sym^n(ℂ²)` of the compact-groups roadmap are the holomorphic `SL_2(ℂ)`-modules
  `L(n)` of the highest-weight roadmap, via Layer 7.

## Ordering

Layer 0 (the exponential map, one-parameter subgroups) is the foundation and comes first; it needs only
Mathlib's `LeftInvariantDerivation`, `LieGroup`, and the manifold calculus. Layer 1 (`Ad`, `ad = d(Ad)`)
needs Layer 0's `lieExp` and Mathlib's `LieAlgebra.ad`. Layer 2 (the closed-subgroup theorem) needs
Layer 0's `lieExp` chart and gives every matrix group its Lie structure, so it precedes all concrete
examples. Layer 3 (the Lie functor, BCH) needs Layers 0-2 (BCH is proved on matrix groups first). Layer 4
(Frobenius, Lie's third, the equivalence of categories) needs Layer 3's functor and BCH and the Frobenius
theorem named within it; Ado's theorem is a named algebraic prerequisite. Layer 5 (simply-connected
covers, the enveloping algebra) needs Layer 4 and Mathlib's covering-space and enveloping-algebra API, and
cites [../LieHighestWeight](../LieHighestWeight/README.md) for PBW. Deliverable C needs all of A-B: Layer 6
(maximal tori, Weyl group, Weyl integration) needs `lieExp` surjectivity and Haar
([../CompactGroups](../CompactGroups/README.md)); Layer 7 (complexification) needs Layer 4's integration
and Layer 6's tori; Layer 8 (Borel-Weil) needs Layer 7's `G_ℂ`, the root systems of
[../RootSystems](../RootSystems/README.md), and the `L(λ)` of
[../LieHighestWeight](../LieHighestWeight/README.md); Layer 9 (Cartan/Iwasawa/KAK) needs Layer 7's real
forms and Layer 6's tori. A contributor can complete Layers 0-3 (the exponential map and the Lie functor)
as a self-contained first deliverable, well before the integration theorems of Layer 4 or the structure
theory of Deliverable C.

## References

- A. Kirillov Jr., *An Introduction to Lie Groups and Lie Algebras*, Cambridge Studies in Advanced
  Mathematics 113 (2008) — the exponential map, one-parameter subgroups, `Ad`/`ad`, the closed-subgroup
  theorem, the Lie functor and BCH, and the correspondence with Lie algebras (Chs. 2-3), the structure of
  compact groups and complexification (Chs. 5-8).
- D. Bump, *Lie Groups*, 2nd ed., Springer GTM 225 (2013) — the matrix-group exponential, maximal tori,
  the Weyl group and Weyl integration formula, complexification and real forms, the Borel-Weil theorem and
  the Bruhat decomposition, and the Iwasawa and Cartan decompositions (Parts I-III).
- A. W. Knapp, *Lie Groups Beyond an Introduction*, 2nd ed., Birkhäuser (2002) — the definitive treatment
  of the closed-subgroup theorem, the structure theory, complexification, restricted roots, and the
  Cartan/Iwasawa/KAK decompositions (Chs. I, IV-VII).
- T. Bröcker, T. tom Dieck, *Representations of Compact Lie Groups*, Springer GTM 98 (1985) — maximal-torus
  conjugacy and exhaustion, the Weyl group, the Weyl integration and character formulas, and the reduction
  of a compact connected group to its torus (Chs. IV-VI).
- B. C. Hall, *Lie Groups, Lie Algebras, and Representations*, 2nd ed., Springer GTM 222 (2015) — the
  matrix-Lie-group development of the exponential map, `Ad`, BCH, and the group-algebra correspondence,
  with `SU(2)`/`SO(3)` as the running example (Chs. 2-5).
- J.-P. Serre, *Lie Algebras and Lie Groups*, Springer LNM 1500 (1992) — the formal-group and BCH
  treatment of the local correspondence and Lie's third theorem.
- V. S. Varadarajan, *Lie Groups, Lie Algebras, and Their Representations*, Springer GTM 102 (1984) — the
  exponential map, the closed-subgroup theorem, Ado's theorem, and Lie's third theorem with the
  simply-connected integration in full detail (Chs. 2-3).
