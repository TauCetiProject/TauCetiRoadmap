# Roadmap: rational homotopy models

**Summary.** Build the algebraic models of rational homotopy theory over a field `K` of
characteristic zero, on Tau Ceti's internally `ℤ`-graded DG algebras (`TauCeti.IsDGAlgebra`,
`TauCeti.DGAlgHom`, `TauCeti.DGAlgHom.cohomologyMap`), and compare them with spaces. Sullivan's
side: free graded-commutative algebras `ΛV` and their universal property (1.1); Sullivan algebras,
minimality and indecomposables (1.2); maps out of `ΛV` (1.3); polynomial homotopies (2.1, 2.3),
the lifting lemma through a surjective quasi-isomorphism (2.2), the bijection `[M, A] ≅ [M, B]`
induced by a quasi-isomorphism `A → B` for a Sullivan algebra `M` (2.4) and the model structure on
commutative DG algebras (2.5); every graded-commutative DG algebra concentrated in degrees `≥ 0`
with `H⁰ = K` has a minimal Sullivan model and an `i`-minimal model for each `i` (3.1, 3.2), a
quasi-isomorphism between minimal Sullivan algebras is an isomorphism (3.3), minimal models are
unique up to isomorphism (3.4) and compatible with extension of scalars (3.5). Polynomial forms:
the simplicial commutative DG algebra `A_PL(Δ•)` (4.1), its Poincaré lemma and extendability
(4.2), `A_PL(X)` for a simplicial set `X` (4.3), and the polynomial de Rham theorem
`H(A_PL(X; K)) ≅ H*(X; K)` as graded algebras (4.4), for spaces through the singular simplicial
set (4.5). Quillen's side: differential graded Lie algebras with Koszul signs (5.1), the
Chevalley–Eilenberg cochain algebra of a graded Lie algebra of finite type as a Sullivan algebra
(5.2), the homotopy Lie algebra of a minimal Sullivan algebra (5.3), Quillen's functors between
cocommutative DG coalgebras and DG Lie algebras (5.4). The comparison with spaces: the spatial
realization and its adjunction with `A_PL` (6.1); for a simply connected space `X` of finite
rational type with minimal model `(ΛV, d)`, `Vⁿ ≅ Hom(πₙ(X), ℚ)` (6.2); Sullivan's
classification of rational homotopy types of simply connected spaces of finite rational type by
minimal Sullivan algebras (6.3); Quillen's equivalence between the localization of simply
connected spaces at rational homotopy equivalences and the localization of reduced DG Lie
algebras over `ℚ` at quasi-isomorphisms (6.4). Formality (Layer 7): definition (7.1), the
Deligne–Griffiths–Morgan–Sullivan sufficient criterion for minimal algebras (7.2), formality of a
DG algebra satisfying the `ddᶜ`-lemma (7.3), hence of the real de Rham algebra of a compact Kähler
manifold (7.4), and the non-formal Heisenberg and five-dimensional examples.

Suggested home: `TauCeti/AlgebraicTopology/RationalHomotopy/`, beside Tau Ceti's
`TauCeti/Algebra/Homology/DG/Algebra/`.

## Scope and ownership

**Owned here.** Free graded-commutative algebras `ΛV` presented by homogeneous generators;
Sullivan algebras, relative Sullivan algebras and Hirsch extensions; minimality, indecomposables
and `i`-minimal models; the polynomial interval `Λ(t, dt)` and polynomial homotopies of maps out of
Sullivan algebras; the lifting lemma; existence, rigidity, uniqueness and scalar extension of
minimal models; the projective model structure on commutative DG algebras over a field of
characteristic zero; the simplicial commutative DG algebra of polynomial forms, `A_PL` of
simplicial sets and spaces and the polynomial de Rham theorem; differential graded Lie algebras with
Koszul signs, their Chevalley–Eilenberg cochain algebras as Sullivan algebras, the homotopy Lie
algebra of a minimal Sullivan algebra, Quillen's functors; the spatial realization, the
identification of the generators of a minimal model with dual rational homotopy, Sullivan's
classification and Quillen's equivalence for simply connected spaces; formality of commutative DG
algebras (commutative zigzags), its criteria and the `ddᶜ`-lemma argument.

**The boundary with AlgebraicTopologyPartII.** EllAdicHomotopyTypesAndWeights requests five
contracts, `polynomial-forms-de-rham`, `sullivan-minimal-models`,
`sullivan-quasi-isomorphism-rigidity`, `sullivan-homotopy-lifting` and `sullivan-scalar-extension`,
from AlgebraicTopologyPartII Layer 4. That layer consists of §§4.1–4.6 (tame polynomials, the
bouquet theorem, Hilton's decomposition, rational homotopy of spheres through the Serre spectral
sequence and rational Hurewicz, wedge ranks, the double-loop model) and contains neither `A_PL` nor
Sullivan algebras. The five contracts are owned here, with the statements requested there:
`polynomial-forms-de-rham` is §§4.1–4.4; `sullivan-minimal-models` is §§1.1–1.3, 3.1 and 3.2;
`sullivan-quasi-isomorphism-rigidity` is §3.3; `sullivan-homotopy-lifting` is §§2.1–2.4;
`sullivan-scalar-extension` is §3.5. Nothing of AlgebraicTopologyPartII §§4.1–4.6 is restated
here: the rational homotopy groups of spheres and bouquets and the double-loop model stay there,
and the models of spheres below are Examples of 3.1 and 6.2.

**Left to other roadmaps.**

- *DG carriers.* The DG algebra carrier, its morphisms, cohomology, tensor product and base
  change are Tau Ceti's (supplier contracts) and DGAInfinity Layer 1's. Strict graded
  commutativity and odd squares zero on that carrier are DerivedDeRhamCohomology §2.21's
  predicates; this roadmap uses them and defines no second one.
- *`A∞` structures.* `A∞` minimal models, homological transfer and `A∞` formality are DGAInfinity
  Layer 3; Massey products and their relation to formality are DGAInfinity Layer 8. A minimal
  Sullivan algebra (decomposable differential on a free graded-commutative algebra) and a minimal
  `A∞` algebra (`m₁ = 0`) are different notions; 7.1 notes that a formal commutative DG algebra is
  formal as a DG algebra.
- *Lie algebra cochains of ordinary Lie algebras.* The Chevalley–Eilenberg cochain complex of a
  Lie algebra over a field of characteristic zero, in all degrees, is
  ArithmeticLocallySymmetricSpaces §ALS.F.5; 5.2 extends it to graded Lie algebras of finite type in
  positive degrees with their Sullivan structure, and for an ordinary finite-dimensional Lie algebra
  placed in degree `1` the two agree (5.2, Checks).
- *Topology.* Singular sets, realization, homotopy groups, Hurewicz and Whitehead theorems and
  singular cohomology with its cup product are AlgebraicTopology's (Stages 4, 6, 8) and Mathlib's;
  the Kan–Quillen model structure on simplicial sets is GeneralizedCohomology G2.1; rational
  homotopy of H-spaces and Serre classes are StableHomotopyKTheory §§3.36–3.37.
- *Geometry.* The `∂∂̄`-lemma on compact Kähler manifolds is ComplexKahlerGeometry §6.3, and smooth
  forms with their wedge product are DifferentialGeometry 0.1; 7.4 combines them with 7.3. Weights,
  mixed Hodge structures on homotopy and the `ℓ`-adic homotopy algebra of a variety are
  EllAdicHomotopyTypesAndWeights.

The boundary in one sentence: algebraic models of rational homotopy types (Sullivan algebras, DG
Lie algebras, polynomial forms) and their comparison with simply connected spaces are here;
`A∞` structures, ordinary Lie cohomology, unlocalized topology and geometry are elsewhere.

## Conventions

- **Ground field.** `K` is a field. Every theorem about Sullivan algebras, polynomial forms or DG
  Lie algebras assumes `[CharZero K]`; spaces use `K = ℚ` unless `K` is named. Witness: over `𝔽₂`
  the algebra `𝔽₂[e]`, `|e| = 1`, is graded-commutative (all signs are `+1`) with `e² ≠ 0`, so
  graded commutativity alone does not give odd squares zero; over `ℚ`, `e² = −e²` gives `e² = 0`.
- **Grading of commutative DG algebras.** Cohomological: `d` has degree `+1`,
  `d(ab) = da · b + (−1)ᵖ a · db` for `a ∈ Aᵖ` (Tau Ceti's `IsDGAlgebra.leibniz`), and graded
  commutativity is `ab = (−1)^(pq) ba` for `a ∈ Aᵖ`, `b ∈ A^q`. Witness: in `Λ(x, y, z)`,
  `|x| = |y| = 1`, `xy = −yx` and `d(xz) = −x · dz` when `dx = 0`; for `|x| = 2`, `|y| = 3`,
  `xy = yx`.
- **Connected.** A commutative DG algebra `A` concentrated in degrees `≥ 0` is connected when
  `H⁰(A) = K`, without requiring `A⁰ = K` (Morgan, §5). Witness: `A_PL(Δ¹) = Λ(t, dt)` has
  `A⁰ = K[t]` and `H⁰ = K` (4.2).
- **Quasi-isomorphisms.** A DG map `f` is a quasi-isomorphism when `f.cohomologyMap` is bijective,
  that is, an isomorphism in every degree, products included.
- **Sullivan generators.** Generators `x i` are indexed by a well-ordered type, have degree `≥ 1`,
  and `d (x i)` lies in the subalgebra generated by the `x j`, `j < i` (Hess, Definition 1.10).
  Félix– Halperin–Thomas index the same condition by an exhaustive filtration `V(0) ⊆ V(1) ⊆ ⋯`; the
  two agree, since `d (x i)` involves finitely many generators and the level of `x i` (one more than
  the largest level of a generator in `d (x i)`) is finite by well-founded induction. Witness:
  `Λ(x₁, y₁, z₁)`, `dx = yz`, `dy = zx`, `dz = xy`, has a free underlying algebra but no such order,
  so it is not a Sullivan algebra (Hess, Example 1.12).
- **DG Lie algebras.** Homological: `L = ⊕ Lₙ`, `d` of degree `−1`,
  `[x, y] = −(−1)^(|x||y|) [y, x]`, `[x, [y, z]] = [[x, y], z] + (−1)^(|x||y|) [y, [x, z]]`,
  `d[x, y] = [dx, y] + (−1)^|x| [x, dy]`; reduced means `Lₙ = 0` for `n ≤ 0` (Quillen). Witness: for
  `x` of even degree `[x, x] = 0`; for `x` odd, `[x, x]` need not vanish but `3 [x, [x, x]] = 0` by
  the Jacobi identity, so `[x, [x, x]] = 0`.
- **Degree shift.** The homotopy Lie algebra of a space `X` is `L_X = π_*(ΩX) ⊗ ℚ`, with
  `(L_X)ₙ = πₙ₊₁(X) ⊗ ℚ`, and a minimal model has `Vⁿ ≅ Hom(πₙ(X), ℚ)` (6.2); so `Vⁿ` is dual to
  `(L_X)ₙ₋₁`. Witness: for `S²`, `V = ⟨x₂, y₃⟩` and `L` has basis `a` in degree `1` and `[a, a]` in
  degree `2`.
- **Polynomial forms.** `A_PL(Δⁿ) = Λ(t₀, …, tₙ, y₀, …, yₙ) / (∑ tᵢ − 1, ∑ yⱼ)`, `|tᵢ| = 0`,
  `dtᵢ = yᵢ`, with faces `∂ᵢ` setting `tᵢ = 0` and reindexing and degeneracies `sᵢ tᵢ = tᵢ + tᵢ₊₁`
  (Hess, Definition 1.19). Witness: `A_PL(Δ⁰) = K`; `A_PL(Δ¹) ≅ Λ(t, dt)` with `t = t₁`, and
  `∂₀, ∂₁ : A_PL(Δ¹) → A_PL(Δ⁰)` send `t₁` to `1` and `0` (∂₀ sets `t₀ = 0`, leaving `t₁ = 1`).

## Exact supplier contracts

**From Mathlib** (at the pinned revision).

- `Mathlib/RingTheory/GradedAlgebra/Basic.lean`: `GradedAlgebra`, `GradedRing.proj`;
  `Mathlib/RingTheory/GradedAlgebra/TensorProduct.lean`: the instance `GradedAlgebra.baseChange`
  on `fun i ↦ (𝒜 i).baseChange S`; `Submodule.baseChange`, `LinearMap.baseChange`.
- `Mathlib/LinearAlgebra/TensorProduct/Graded/Internal.lean`: `GradedTensorProduct` (`𝒜 ᵍ⊗[R] ℬ`),
  the Koszul-signed tensor product used by Tau Ceti's DG tensor product.
- `Int.negOnePow`; `Finsupp`, `Finset.sort`, `List.prod`; `Algebra.adjoin`, `LinearIndependent`,
  `Submodule.span`, `Submodule.map`, the product of submodules `Submodule.mul`, `IsCompl`,
  `Module.finrank`, `Ideal.span`, `LinearMap.ker`, `LinearMap.range`; `AlgHom`.
- `Mathlib/AlgebraicTopology/SimplicialSet/Basic.lean`: `SSet`; `SimplexCategory`;
  `Mathlib/AlgebraicTopology/SingularSet.lean`: `TopCat.toSSet`, `SSet.toTop`, `sSetTopAdj`;
  `Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean`: `SSet.chainComplex`;
  `Mathlib/CategoryTheory/Abelian/Ext.lean`: `ChainComplex.linearYonedaObj`.
- `Mathlib/Topology/Homotopy/HomotopyGroup.lean`: `HomotopyGroup`, `π_`;
  `Mathlib/AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean`: `SimplyConnectedSpace`.
- `Mathlib/AlgebraicTopology/ModelCategory/Basic.lean`: `HomotopicalAlgebra.ModelCategory`;
  `Mathlib/CategoryTheory/Localization/Construction.lean`: `MorphismProperty.Localization`,
  `MorphismProperty.Q`; `CategoryTheory.Functor.IsEquivalence`.
- `Mathlib/Algebra/Lie/Basic.lean`: `LieRing`, `LieAlgebra`; `Mathlib/Algebra/Lie/Free.lean`:
  `FreeLieAlgebra`; `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean`: `ExteriorAlgebra`;
  `Mathlib/Algebra/Lie/Graded.lean`: `GradedLieAlgebra` (unsigned, used only in 5.1, Checks).

**From Tau Ceti** (at the pinned revision).

- `TauCeti/Algebra/Homology/DG/Algebra/Defs.lean`: `TauCeti.IsDGAlgebra` (degree `+1`, square zero,
  graded Leibniz rule on an internally `ℤ`-graded algebra; no commutativity, no sign of degree),
  `TauCeti.isDGAlgebra_zero`.
- `TauCeti/Algebra/Homology/DG/Algebra/Hom/Basic.lean`: `TauCeti.DGAlgHom`, `TauCeti.DGAlgHom.id`,
  `TauCeti.DGAlgHom.comp`.
- `TauCeti/Algebra/Homology/DG/Algebra/Cohomology.lean`: `TauCeti.IsDGAlgebra.Cohomology`,
  `TauCeti.IsDGAlgebra.cohomologyGrading` and its `GradedAlgebra` instance;
  `TauCeti/Algebra/Homology/DG/Algebra/Hom/Cohomology.lean`: `TauCeti.DGAlgHom.cohomologyMap`,
  `TauCeti.DGAlgHom.cohomologyMap_comp`.
- `TauCeti/Algebra/Homology/DG/Algebra/BaseChange.lean`: `TauCeti.IsDGAlgebra.baseChange`;
  `TauCeti/Algebra/Homology/DG/Algebra/TensorProduct.lean`:
  `TauCeti.isDGAlgebra_gradedTensorGrading`, `TauCeti.dgTensorLift`.
- `TauCeti/AlgebraicTopology/SimplicialSet/AlexanderWhitney.lean`: `SSet.alexanderWhitney`;
  `TauCeti/Algebra/Homology/Monoidal/Cup.lean`: `TauCeti.ChainComplex.cupCochain`;
  `TauCeti/AlgebraicTopology/Cohomology/Basic.lean`: `SSet.cochainComplexMap`,
  `TopCat.singularCochainComplex`, `TopCat.singularCohomology`;
  `TauCeti/AlgebraicTopology/Cohomology/Cup.lean`: `TopCat.singularCup`.

**From DGAInfinity.** Layer 1: DG algebras, morphisms, tensor products and cohomology with the
`+1` convention. Layer 3: the formality predicate for DG and `A∞` algebras (7.1). Layer 8: Massey
products (7.2, Examples).

**From DerivedDeRhamCohomology.** §2.21: strict graded commutativity and odd squares zero on the
nonnegative unital DG carrier. Suggested.lean writes the defining identity
`a * b = (p * q).negOnePow • (b * a)` in place as a hypothesis, since the predicate is not at the
pins.

**From ArithmeticLocallySymmetricSpaces.** §ALS.F.5: the Chevalley–Eilenberg cochain complex of a
Lie algebra over a field of characteristic zero (5.2).

**From AlgebraicTopology.** §4.7: realization of simplicial sets; §6.2: the singular cup product
and its graded commutativity; §§8.3 and 8.5: Hurewicz and Whitehead theorems (6.2, 6.3).

**From GeneralizedCohomology.** G2.1: the Kan–Quillen model structure on simplicial sets (6.1).

**From StableHomotopyKTheory.** §3.36: Serre classes, used for rational homotopy equivalences
(6.4).

**From ComplexKahlerGeometry.** §6.3: the `∂∂̄`-lemma on compact Kähler manifolds (7.4).

**From DifferentialGeometry.** 0.1: smooth differential forms, wedge product and exterior
derivative (7.4).

## How to read the build

Layer 1 defines `ΛV` by homogeneous generators and Sullivan algebras on Tau Ceti's DG carrier.
Layer 2 builds the polynomial interval and the homotopy theory of maps out of Sullivan algebras:
lifting (2.2), homotopy (2.3), the bijection on homotopy classes (2.4), and the model structure
(2.5). Layer 3 proves the theorems on minimal models: existence (3.1, 3.2) by adding generators
degree by degree, with the lifting of 2.2 and 2.4; rigidity (3.3) by induction on the generators;
uniqueness (3.4) from 2.4 and 3.3; scalar extension (3.5). Layer 4 builds polynomial forms and the
polynomial de Rham theorem from the Poincaré lemma and extendability (4.2). Layer 5 is the algebra
of DG Lie algebras and Quillen's functors; it uses Layer 1 (5.2, 5.3). Layer 6 compares with spaces
through Layers 3 and 4 (6.1–6.3) and Layer 5 (6.4). Layer 7 is formality, on Layers 1 and 3. The
hardest targets are 4.4, 6.3 and 6.4.

## Layer 1: free graded-commutative algebras and Sullivan algebras

### 1.1 Free graded-commutative algebras

For an internally `ℤ`-graded `K`-algebra `(A, 𝒜)`, a linearly ordered `ι`, generators `x : ι → A`
and degrees `deg : ι → ℕ`, define `IsFreeGradedCommutative 𝒜 x deg`: `x i ∈ A^(deg i)`; the
generators commute with the Koszul sign, `x i * x j = (−1)^(deg i · deg j) x j * x i`; and the
standard monomials `standardMonomial x f = x_{i₁}^{f i₁} ⋯ x_{i_k}^{f i_k}` (`i₁ < ⋯ < i_k` the
support of `f`) over the exponent vectors `f ∈ ExponentVector deg` (finitely supported, `f i ≤ 1`
when `deg i` is odd) form a basis of `A`. Then `A ≅ ΛV = Sym(V_even) ⊗ Λ(V_odd)` for `V` the span
of the `x i` (Félix–Halperin–Thomas, §3; Hess, §1, before Definition 1.10). Prove
`IsFreeGradedCommutative.existsUnique_algHom`: over `K` of characteristic zero, for every
graded-commutative `(B, ℬ)` and `b : ι → B` with `b i ∈ ℬ (deg i)` there is a unique algebra map
`φ : A → B` with `φ (x i) = b i`. *Needs:* Tau Ceti's grading convention
(`GradedAlgebra`); DerivedDeRhamCohomology §2.21 (graded commutativity of `B`); Mathlib
`Finsupp`, `Finset.sort`, `LinearIndependent`, `Submodule.span`, `AlgHom`, `Int.negOnePow`.

**Checks.**

- `ι` empty: the only exponent vector is `0`, whose monomial is `1`; `A = K`. A definition that
  omitted the empty monomial would make `K` not free on no generators.
- One generator of degree `1`: the exponent vectors are `0` and `single i 1`, so
  `A = Λ(e) = K ⊕ Ke`, two-dimensional. A definition allowing `f i = 2` for odd generators would
  require `e²` to be independent, contradicting `e² = −e²` in characteristic zero.
- One generator of degree `2`: the exponent vectors are all `single i n`, so `A = K[x]` with
  `dim A^(2n) = 1` and `A^odd = 0`; the universal property sends `x` to any `b ∈ B²`, while for
  `|x| = 1` and `B = K[s]`, `|s| = 1` with `s² ≠ 0` (not graded-commutative), `x ↦ s` extends to no
  algebra map, since `x² = 0`.

### 1.2 Sullivan algebras and minimality

Define `IsSullivanAlgebra 𝒜 d x deg` for a well-ordered `ι`: `IsFreeGradedCommutative 𝒜 x deg`,
`0 < deg i` for all `i`, and `d (x i) ∈ Algebra.adjoin K (x '' Set.Iio i)` (Hess, Definition 1.10;
Félix–Halperin–Thomas, §12). Define `positivePart 𝒜 = ⨆_{p > 0} Aᵖ` and
`IsMinimalSullivanAlgebra 𝒜 d x deg`: Sullivan, and every `d (x i)` lies in
`positivePart 𝒜 * positivePart 𝒜` (Morgan, Definition 5.2). A Hirsch extension `B ⊆ B ⊗ ΛW` is a
DG inclusion with `d(W) ⊆ B` (Morgan, Definition 5.1); a Sullivan algebra is a well-ordered union
of Hirsch extensions of `K`. Prove `IsSullivanAlgebra.isMinimal_iff`: for a Sullivan algebra,
minimality is equivalent to `d (A⁺) ⊆ A⁺ · A⁺`, that is, to the vanishing of the differential
induced on the indecomposables `Q(A) = A⁺ / A⁺ · A⁺ ≅ V` (Morgan, note after Definition 5.2).
*Needs:* 1.1; Tau Ceti `TauCeti.IsDGAlgebra` (Leibniz rule); Mathlib `Algebra.adjoin`,
`Submodule.mul`, `Submodule.map`.

**Checks.**

- The sphere models: `Λ(x₃)`, `dx = 0`, is minimal; `Λ(x₂, y₃)`, `dy = x²`, is minimal, with
  `H = K[x]/(x²)`; dropping `y` leaves `K[x]` with the class `x² ≠ 0` in `H⁴`, which is not the
  cohomology of `S²`.
- `Λ(u₁, v₂)`, `du = v`, ordered `v < u`, is Sullivan but not minimal: `du = v` is not in
  `A⁺ · A⁺`, and its indecomposable differential `Q(d)(u) = v` is nonzero; its cohomology is `K`,
  so it is a non-minimal Sullivan model of `K`.
- Hess's `Λ(x₁, y₁, z₁)` with `dx = yz`, `dy = zx`, `dz = xy` has a decomposable differential and a
  free underlying algebra, yet is not Sullivan: no generator has zero differential, so no ordering
  starts. A minimality notion not requiring Sullivan would accept it; it is the Chevalley–Eilenberg
  algebra of the Lie algebra with brackets `[X, Y] = Z` and cyclic, and its cohomology is
  `Λ(ω₃)`, `ω = xyz`.

### 1.3 Maps out of free graded-commutative algebras

Prove `IsFreeGradedCommutative.exists_dgAlgHom_iff`: for a DG algebra `(A, d)` free on `x`, a DG
algebra `(B, dB)` and an algebra map `φ : A → B` with `φ (x i) ∈ B^(deg i)`, `φ` is a DG map exactly
when `dB (φ (x i)) = φ (d (x i))` for every `i`. With 1.1, a DG map out of a Hirsch extension
`B ⊗ ΛW` is determined by its restriction to `B` and by the images of a basis of `W`, which must
satisfy the differential equation (Morgan, Definition 5.1 and the note after it). *Needs:* 1.1;
Tau Ceti `TauCeti.DGAlgHom`, `TauCeti.IsDGAlgebra`.

**Checks.**

- `A = Λ(e₁)`, `de = 0`, `B = Λ(a₁)`, `da = 0`: `e ↦ a` and `e ↦ 2a` are DG maps, inducing `1` and
  `2` on `H¹`; they are distinct maps, so the generator images are not determined by the
  cohomology class alone.
- `A = Λ(x₂, y₃)`, `dy = x²`, `B = K[s]/(s²)` with `|s| = 2`, `dB = 0`: `x ↦ s`, `y ↦ 0` is a DG
  map, since `dB(0) = 0 = φ(x²) = s²`; sending `x ↦ s` in `B = K[s]` instead fails,
  `φ(x²) = s² ≠ 0`.
- The condition on generators suffices: both `dB ∘ φ` and `φ ∘ d` are `φ`-derivations of degree
  `+1`, so they agree everywhere once they agree on generators; a condition checked only on
  closed generators would accept `x ↦ s` in `K[s]` above.

### Examples

- `S^(2k+1)`: `Λ(x_{2k+1})`, `d = 0`. `S^(2k)`: `Λ(x_{2k}, y_{4k−1})`, `dy = x²`. `ℂPⁿ`:
  `Λ(x₂, y_{2n+1})`, `dy = x^(n+1)`.
- The Heisenberg algebra `Λ(x₁, y₁, z₁)`, `dx = dy = 0`, `dz = xy`, ordered `x < y < z`: minimal
  Sullivan, with `H¹ = ⟨x, y⟩`, `H² = ⟨xz, yz⟩`.

### Dependencies

Tau Ceti's DG carrier; DerivedDeRhamCohomology §2.21; Mathlib graded algebras and linear algebra.

## Layer 2: homotopy and lifting

### 2.1 The polynomial interval and homotopies

Define the polynomial interval `I = Λ(t, dt)` (`|t| = 0`, `d(t) = dt`) with evaluations
`ε₀, ε₁ : I → K`, `t ↦ 0, 1`, `dt ↦ 0`; it is `A_PL(Δ¹)` (4.1). For DG algebras `M`, `A`, a
polynomial homotopy is a DG map `H : M → A ⊗ I` (Tau Ceti's Koszul-signed tensor product); `H` is a
homotopy from `(id ⊗ ε₀) ∘ H` to `(id ⊗ ε₁) ∘ H` (Hess, Proposition 1.14; Morgan, §5 before
Proposition 5.5).
*Needs:* 1.1; Tau Ceti `TauCeti.isDGAlgebra_gradedTensorGrading`; Mathlib `GradedTensorProduct`.

**Checks.**

- `H⁰(I) = K` and `H¹(I) = 0`: `d(p(t)) = p′(t) dt`, and every `q(t) dt` is `d` of an integral of
  `q` in characteristic zero; over `𝔽_p`, `t^(p−1) dt` is not exact, so the characteristic
  hypothesis is used.
- `ε₀` and `ε₁` are quasi-isomorphisms; an interval with `d t = 0` (two closed generators) would
  have `H¹ ≠ 0` and `ε₀ ≠ ε₁` on cohomology.
- The constant homotopy `m ↦ f(m) ⊗ 1` goes from `f` to `f`; for `A = Λ(a₁)`, `da = 0`, the maps
  `e ↦ a` and `e ↦ 2a` from `Λ(e₁)` are not homotopic, since homotopic maps agree on cohomology
  (2.3).

### 2.2 The lifting lemma

Prove `IsSullivanAlgebra.exists_lift`: for a Sullivan algebra `M`, a graded-commutative DG algebra
`B`, a DG algebra `C`, a surjective quasi-isomorphism `π : B → C` and a DG map `g : M → C`, there is
a DG map `h : M → B` with `π ∘ h = g` (Hess, Proposition 1.13; Sullivan, Proposition (3.5)). The
relative form: for a relative Sullivan algebra `A → A ⊗ ΛV`, a lift extending a given map on `A`
exists when `π` is a surjective quasi-isomorphism, and two lifts are homotopic relative to `A`
(Hess, Proposition 1.13). Route: extend over the generators in order; the obstruction for `x i`
lies in `H(ker π) = 0`. *Needs:* 1.2, 1.3; Tau Ceti `TauCeti.DGAlgHom.comp`,
`TauCeti.DGAlgHom.cohomologyMap`; DerivedDeRhamCohomology §2.21.

**Checks.**

- `M = K`: `h` is the unit; the statement is the identity `π ∘ unit = unit`.
- Surjectivity is needed: the unit `π : K → Λ(t, dt)` is a quasi-isomorphism and not surjective;
  for `M = Λ(e₁)`, `de = 0`, and `g(e) = dt`, a lift `h` sends `e` into `K¹ = 0`, so
  `π ∘ h = 0 ≠ g`.
- The quasi-isomorphism is needed: `π : Λ(u₁, v₂) → Λ(u₁)` (`du = v` in the source, `d = 0` in the
  target), `u ↦ u`, `v ↦ 0`, is a surjective DG map with `H¹` going from `0` to `K`; for
  `M = Λ(e₁)` and `g(e) = u`, a lift sends `e` to a closed element of `⟨u⟩`, and `d(cu) = cv` forces
  `c = 0`, so no lift exists.

### 2.3 Homotopy of maps out of Sullivan algebras

For a Sullivan algebra `M` and a graded-commutative `A`, prove: polynomial homotopy is an
equivalence relation on DG maps `M → A`, transitivity being realised by a single homotopy;
homotopic maps induce the same map on cohomology; homotopy is compatible with pre- and
post-composition (Morgan, Proposition 5.5; Sullivan, Corollary (3.4); Hess, Proposition 1.14).
*Needs:* 2.1, 2.2; Tau Ceti `TauCeti.DGAlgHom.cohomologyMap`.

**Checks.**

- Reflexivity uses the constant homotopy; symmetry uses `t ↦ 1 − t` on `I`, a DG automorphism
  exchanging `ε₀` and `ε₁`.
- Equal cohomology maps: `∫₀¹ (H(a)) + ∫₀¹ (H(da)) = f₁(a) − f₀(a)` (Morgan, Proposition 5.5), a
  chain homotopy on underlying complexes; for `M = Λ(e₁)` and `e ↦ a`, `e ↦ 2a` into `Λ(a₁)` the
  cohomology maps `1` and `2` differ, so these maps are not homotopic.
- Transitivity uses that `M` is Sullivan: two homotopies glue through the lifting lemma 2.2 applied
  to the surjective quasi-isomorphism `A ⊗ A_PL(Δ²) → (A ⊗ I) ×_A (A ⊗ I)`, restriction to the horn
  `Λ²₁`, which is a single homotopy `M → A ⊗ A_PL(Δ²)` restricting to the composite on the third
  edge.

### 2.4 Homotopy classes and automorphisms

For a Sullivan algebra `M` and a quasi-isomorphism `ψ : A → B` of graded-commutative DG algebras
concentrated in degrees `≥ 0`, prove that `ψ ∘ − : [M, A] → [M, B]` is a bijection on homotopy
classes (Sullivan, Corollary (3.6); Morgan, Theorem 5.7). For a minimal model `ρ : M → A` of a
connected `A` and a DG automorphism `α` of `A`, prove that there is an automorphism `β` of `M`
with `ρ ∘ β` homotopic to `α ∘ ρ`, unique up to homotopy; no compatible choice of actual lifts is
asserted (Morgan, Theorem 5.6 and its uniqueness argument). *Needs:* 2.2, 2.3; 3.3 for `β` an
isomorphism.

**Checks.**

- `A = B`, `ψ = id`: the identity bijection.
- For `M = Λ(e₁)` and `A = Λ(a₁)`, `da = 0`, `[M, A] = H¹(A) = K` (a map is a closed element of
  degree `1`, a homotopy changes it by a coboundary). The inclusion `Λ(a₁) → Λ(a₁, u₁, v₂)`,
  `du = v`, is a quasi-isomorphism and `[M, Λ(a, u, v)] = K` again, while the augmentation
  `Λ(a₁) → K`, not a quasi-isomorphism, collapses `K` to `[M, K] = 0`.
- Automorphisms: for the model `Λ(x₂, y₃) → K[x]/(x²)`, `dy = x²`, the automorphism `x ↦ λx`
  (`λ ≠ 0`) of the target lifts to `β(x) = λx`, `β(y) = λ²y`; a lift with `β(y) = λy` fails
  `dβ(y) = β(dy) = λ²x²` unless `λ = 1`.

### 2.5 The model structure on commutative DG algebras

Prove that commutative DG algebras over `K` concentrated in degrees `≥ 0` form a model category
(`HomotopicalAlgebra.ModelCategory`) whose weak equivalences are the quasi-isomorphisms and
fibrations the surjections; cofibrant objects are the retracts of Sullivan algebras, and the
homotopy category is the localization at quasi-isomorphisms (Bousfield–Gugenheim, the model
category of commutative DG algebras; Hess, §1, before Proposition 1.13). *Needs:* 2.2, 2.3; Mathlib
`HomotopicalAlgebra.ModelCategory`, `MorphismProperty.Localization`.

**Checks.**

- `K → Λ(t, dt)` is an acyclic cofibration (a Sullivan extension by `t`, `dt`, with `H = K`), and
  `Λ(t, dt) → K × K`, `(ε₀, ε₁)`, is a fibration: `A ⊗ I` is a path object.
- A surjection that is not a quasi-isomorphism, `Λ(a₁) → K`, is a fibration but not acyclic.
- Hess's `Λ(x₁, y₁, z₁)` (1.2, Checks) is not a Sullivan algebra, and `Λ(ω₃) → Λ(x, y, z)`,
  `ω ↦ xyz`, is a quasi-isomorphism from a Sullivan algebra: its cofibrant replacement.

### Examples

- Homotopy classes `[Λ(x_n), A] = Hⁿ(A)` for `n` odd: a map is the choice of a cocycle, a homotopy
  changes it by a coboundary.

### Dependencies

Layer 1; Tau Ceti DG tensor product; Mathlib model categories and localization.

## Layer 3: minimal models

### 3.1 Existence

Prove `exists_minimalModel`: over `K` of characteristic zero, every graded-commutative DG algebra
`A` with `Aᵖ = 0` for `p < 0` and `H⁰(A)` one-dimensional has a minimal Sullivan model: a minimal
Sullivan algebra `M`, with generators indexed by a well-ordered type in the universe of `K` and `A`,
and a quasi-isomorphism `M → A` (Morgan, Theorem 5.6 with `i = ∞`; Sullivan, §5). No nilpotence or
simple connectivity is assumed; with degree-one cohomology the generators are added in an order of
type `ω²` and then reindexed (Morgan, proof of Theorem 5.6). *Needs:* 1.2, 1.3, 2.2;
DerivedDeRhamCohomology §2.21; Tau Ceti `TauCeti.IsDGAlgebra.cohomologyGrading`; Mathlib
`Module.finrank`.

**Checks.**

- `A = K`: the model is `K` with no generators, and the empty well-order.
- `A = H*(S²; ℚ) = ℚ[x]/(x²)`, `d = 0`: the model `Λ(x₂, y₃)`, `dy = x²`; stopping after `x` gives
  `ℚ[x]` with `H⁴ ≠ 0`, so the construction must kill the kernel `x²` in degree `4`.
- `H⁰` must be `K`: for `A = K × K` (`d = 0`, degree `0`), `H⁰ = K²`, and no connected `M` has a
  quasi-isomorphism to it since `H⁰(M) = K`.

### 3.2 `i`-minimal models

Prove `exists_iMinimalModel`: for each `i : ℕ` the same `A` has an `i`-minimal model, a minimal
Sullivan algebra generated in degrees `≤ i` with a DG map inducing isomorphisms on `Hᵖ` for `p ≤ i`
and an injection on `H^(i+1)` (Morgan, Definition 5.3 and Theorem 5.6). For `i = 1` this is the
`1`-minimal model: an isomorphism on `H¹` and an injection on `H²`, not an isomorphism on `H²`.
*Needs:* 3.1 (the same construction stopped at degree `i`).

**Checks.**

- `i = 0`: no generators, `M = K`; `H⁰` is an isomorphism and `H¹(K) = 0` injects.
- `A = H*(T²) = Λ(a₁, b₁)`, `d = 0`, `i = 1`: `M = Λ(a, b)`, already a quasi-isomorphism.
- `A = H*(S¹ ∨ S¹)` (`H¹ = ⟨a, b⟩`, `H² = 0`, `ab = 0`), `i = 1`: `M` is the minimal model of the
  free group's Malcev Lie algebra, with infinitely many degree-one generators (`dz = ab`, then
  `dw = az`, …); a finite truncation is not `1`-minimal since `H²` of it is nonzero and maps to `0`.

### 3.3 Rigidity

Prove `IsMinimalSullivanAlgebra.bijective_of_bijective_cohomologyMap`: a quasi-isomorphism between
minimal Sullivan algebras over `K` of characteristic zero is an isomorphism (Morgan, Proposition 5.9
with `i = ∞`; Sullivan, Corollary (4.2); Hess, Proposition 1.18 for the relative form). Route: by
2.4 the map has a homotopy inverse; homotopic maps between minimal algebras induce the same map on
indecomposables (1.2), so the map is an isomorphism on `Q(M)` and hence on `M`. *Needs:* 1.2, 2.3,
2.4.

**Checks.**

- Minimality is needed: `K → Λ(u₁, v₂)`, `du = v`, is a quasi-isomorphism and not surjective.
- `Λ(e₁) → Λ(e₁)`, `e ↦ 2e`: a quasi-isomorphism and an isomorphism, with inverse `e ↦ e/2`, which
  uses `2` invertible.
- The projection `Λ(x₂, y₃) → K[x]/(x²)`, `y ↦ 0`, is a quasi-isomorphism and not injective; its
  target is not a Sullivan algebra, which is where the theorem fails.

### 3.4 Uniqueness

Prove `exists_iso_of_minimalModels`: two minimal Sullivan models `M → A`, `N → A` of the same
graded-commutative `A` concentrated in degrees `≥ 0` are isomorphic as DG algebras; the
isomorphism can be chosen compatible with the two maps up to homotopy and is then unique up to
homotopy (Morgan, Theorem 5.6; Hess,
Proposition 1.18). *Needs:* 2.4, 3.3; DerivedDeRhamCohomology §2.21.

**Checks.**

- `A = Λ(e₁)` with the models `id` and `e ↦ 2e`: the isomorphism `e ↦ 2e` intertwines them.
- Without minimality: `Λ(x₃)` and `Λ(x₃, u₁, v₂)`, `du = v`, are both Sullivan models of `Λ(x₃)`
  (the second through `u, v ↦ 0`) and are not isomorphic (different dimensions in degree `1`).
- For `ℂP²` the model `Λ(x₂, y₅)`, `dy = x³`, is unique: a second model `Λ(x′₂, y′₅)` with
  `dy′ = c x′³`, `c ≠ 0`, is isomorphic by `y′ ↦ c⁻¹ y′`.

### 3.5 Extension of scalars

Prove `IsMinimalSullivanAlgebra.baseChange`: for a field extension `K → L`, the base change
`L ⊗_K M` with differential `1 ⊗ d` (Tau Ceti `TauCeti.IsDGAlgebra.baseChange`) is a minimal
Sullivan algebra on the generators `1 ⊗ x i`; and a full or `i`-minimal model `M → A` gives a full
or `i`-minimal model `L ⊗_K M → L ⊗_K A`, since `L` is flat over `K` and
`H(L ⊗_K A) = L ⊗_K H(A)` (Morgan, Definition 5.3). *Needs:* 1.2, 3.2; Tau Ceti
`TauCeti.IsDGAlgebra.baseChange`; Mathlib `GradedAlgebra.baseChange`, `LinearMap.baseChange`.

**Checks.**

- `K = ℚ`, `L = ℝ`, `M = Λ(x₂, y₃)`, `dy = x²`: `L ⊗ M = Λ_ℝ(x, y)` with the same differential.
- Decomposability is preserved: `d(1 ⊗ x i) = 1 ⊗ d(x i) ∈ L ⊗ (A⁺ · A⁺) = (L ⊗ A)⁺ · (L ⊗ A)⁺`; a
  definition of minimality by a basis-dependent condition on coefficients would need checking again.
- Flatness: `H¹` of `Λ(e₁) → Λ(a₁)`, `e ↦ 2a`, is `2`, an isomorphism over every `L` of
  characteristic zero; over `𝔽₂` it would be `0` (excluded by the standing hypothesis).

### Examples

- The `1`-minimal model of the Heisenberg nilmanifold `M³` is its full minimal model
  `Λ(x₁, y₁, z₁)`, `dz = xy` (Deligne–Griffiths–Morgan–Sullivan, p. 261).
- The minimal model of `S² × S³` is `Λ(x₂, y₃, z₃)`, `dy = x²`, `dz = 0`.

### Dependencies

Layers 1 and 2; DerivedDeRhamCohomology §2.21; Tau Ceti base change.

## Layer 4: polynomial forms and the de Rham theorem

### 4.1 Polynomial forms on simplices

Define the simplicial graded-commutative DG algebra `A_PL(Δ•)` of Conventions (Hess,
Definition 1.19; Sullivan, §7), with faces and degeneracies as there, and the simplex filtration
`F_k A_PL(Δⁿ)` spanned by monomials of total degree `≤ k` in the `tᵢ` and `dtᵢ`, preserved by `d`,
faces and degeneracies. *Needs:* 1.1; Mathlib `SimplexCategory`, `SSet`.

**Checks.**

- `n = 0`: `A_PL(Δ⁰) = K`. `n = 1`: `A_PL(Δ¹) = Λ(t, dt)`; a presentation forgetting `∑ dtⱼ = 0`
  would leave `dt₀ + dt₁` as a nonzero closed `1`-form with `H¹ ≠ 0`.
- Faces of `Δ²`: `∂₂` sets `t₂ = 0`, so `t₀ + t₁ = 1` and `dt₀ + dt₁ = 0` hold on the edge
  `[0, 1]`; a face map that kept `t₂` free would not land in `A_PL(Δ¹)`.
- The filtration: `d(t₀²) = 2t₀ dt₀` keeps total degree `2`, faces send `tᵢ` to `0` or a `tⱼ` and
  degeneracies send `tᵢ` to `tᵢ + tᵢ₊₁`, so none raises total degree; a filtration counting only the
  `dtᵢ` is not preserved by `d`, which sends `t₀²` (count `0`) to `2t₀ dt₀` (count `1`).

### 4.2 The Poincaré lemma and extendability

Prove: `H(A_PL(Δⁿ)) = K` in degree `0` (the polynomial Poincaré lemma), and the restriction
`A_PL(Δⁿ) → A_PL(∂Δⁿ)` is surjective in every degree (extendability) (Félix–Halperin–Thomas, §10;
Sullivan, §7). *Needs:* 4.1; [CharZero K].

**Checks.**

- `n = 1`: `H¹(Λ(t, dt)) = 0` (2.1, Checks); over `𝔽_p` it fails.
- Extendability for `n = 1`: a form on `∂Δ¹` is a pair `(a, b) ∈ K²`, extended by
  `a + (b − a) t`.
- Extendability needs polynomials, not homogeneous forms: the pair `(1, 0)` on the two vertices has
  no extension by constants.

### 4.3 Polynomial forms on simplicial sets

For a simplicial set `X`, define `A_PL(X) = Hom_SSet(X, A_PL(Δ•))`, compatible families of
polynomial forms on the simplices of `X`, with pointwise product and differential; it is a
contravariant functor `SSetᵒᵖ → cdga`, an equality of forms is detected by evaluating on
simplices, and it sends colimits of simplicial sets to limits, in particular wedges to fibre
products over `K` (Hess, Definition 1.20 and the wedge computation in §2.1). The full compatible
family algebra allows unbounded polynomial degree on the simplices of an infinite `X`. *Needs:*
4.1; Mathlib `SSet`.

**Checks.**

- `X = Δ⁰`: `A_PL(X) = K`; `X = Δⁿ` (representable): `A_PL(Δⁿ)` by Yoneda.
- `X = ∂Δ¹` (two points): `A_PL(X) = K × K` in degree `0`.
- `X = Δ¹/∂Δ¹` (the simplicial circle): `A_PL(X) = {ω ∈ Λ(t, dt) : ε₀ ω = ε₁ ω}`, with
  `H¹ = K` spanned by `dt`; a definition by forms of bounded degree per simplex would agree here, as
  `X` is finite.

### 4.4 The polynomial de Rham theorem

Define the integration map `∮ : A_PL(X) → C*(X; K)`, `∮(ω)(σ) = ∫_{Δⁿ} σ*ω` on `n`-simplices, with
values in the simplicial cochains `(X.chainComplex K).linearYonedaObj K K`. Prove that `∮` is a
cochain map inducing an isomorphism of graded algebras `H(A_PL(X; K)) ≅ H*(X; K)`, natural in `X`,
where `H*(X; K)` carries the cup product of `TauCeti.ChainComplex.cupCochain` along
`SSet.alexanderWhitney` (Hess, Theorem 1.21; Sullivan, Theorem (7.1); Félix–Halperin–Thomas,
§10). *Needs:* 4.2, 4.3; Tau Ceti `SSet.alexanderWhitney`, `TauCeti.ChainComplex.cupCochain`,
`SSet.cochainComplexMap`; Mathlib `SSet.chainComplex`, `ChainComplex.linearYonedaObj`.

**Checks.**

- `X = Δ¹/∂Δ¹`: `∮(dt)` evaluates the nondegenerate `1`-simplex to `∫₀¹ dt = 1`, the generator of
  `H¹(S¹)`; with the opposite orientation convention it would be `−1`.
- `∮` is not multiplicative on cochains: on `Δ¹` with `t = t₁`, `∮(t · dt)` on the edge is
  `∫₀¹ t dt = 1/2`, while the cup products `∮(t) ⌣ ∮(dt)` and `∮(dt) ⌣ ∮(t)` give `t(v₀) · 1 = 0`
  and `1 · t(v₁) = 1`; only the cohomology map is multiplicative.
- `X = ∂Δ²` (a triangle boundary): `H(A_PL) = K` in degrees `0` and `1`, matching simplicial
  cohomology of a circle; a theory with `H¹ = 0` would be detected.

### 4.5 Spaces

For a topological space `T`, set `A_PL(T) = A_PL(TopCat.toSSet T)`; 4.4 gives
`H(A_PL(T; ℚ)) ≅ H*(T; ℚ)` as graded algebras, with the singular cup product
`TopCat.singularCup` (AlgebraicTopology §6.2) (Hess, Definition 1.20 and Theorem 1.21). *Needs:*
4.4; Mathlib `TopCat.toSSet`; Tau Ceti `TopCat.singularCochainComplex`, `TopCat.singularCup`.

**Checks.**

- `T` a point: `A_PL(T)` has `H = ℚ`.
- `T = S²`: `H(A_PL(S²)) = ℚ[x]/(x²)`, `|x| = 2`, whose minimal model is `Λ(x₂, y₃)` (1.2).
- `T = S¹ × S¹`: the cup square of each degree-one class is zero and `ab = −ba ≠ 0`, matching
  `Λ(a₁, b₁)`.

### Examples

- `A_PL` of a finite simplicial complex is the algebra of piecewise polynomial forms; for the
  boundary of `Δ³` its cohomology is that of `S²`.

### Dependencies

Layer 1; Mathlib simplicial sets; Tau Ceti simplicial cochains and cup products; AlgebraicTopology
§6.2.

## Layer 5: DG Lie algebras and Quillen's functors

### 5.1 DG Lie algebras

Define DG Lie algebras over `K` with the sign conventions of Conventions, morphisms, homology, and
show that the homology of a DG Lie algebra is a graded Lie algebra (Quillen, Part I; Félix–Halperin–
Thomas, §21). *Needs:* Mathlib `LieAlgebra` (degree zero), `GradedLieAlgebra` (comparison only).

**Checks.**

- A Lie algebra concentrated in degree `0` with `d = 0` is an ordinary Lie algebra; Mathlib's
  `GradedLieAlgebra`, unsigned, agrees with this one exactly when all degrees are even.
- Odd elements: `[x, x]` may be nonzero (the free graded Lie algebra on one generator of degree `1`
  has basis `x`, `[x, x]`), while the unsigned convention would force `[x, x] = 0`.
- `d[x, y] = [dx, y] + (−1)^|x| [x, dy]`: for `x` of degree `1` and `dy ≠ 0`, the sign is `−1`;
  the plus sign would contradict `d² = 0` on `[x, [x, x]]`.

### 5.2 Chevalley–Eilenberg cochains as Sullivan algebras

For a DG Lie algebra `L` of finite type with `Lₙ = 0` for `n ≤ 0`, define
`C*(L) = (Λ(sL)^∨, d₀ + d₁)`, `d₀` dual to `d_L` and `d₁` dual to the bracket; prove that it is a
Sullivan algebra with generators `(sL)^∨` of degree `n + 1` dual to `Lₙ`, minimal exactly when
`d_L = 0` (Félix–Halperin–Thomas, §23). For a finite-dimensional Lie algebra `𝔤` in degree `0`,
the same formula gives the Chevalley–Eilenberg cochain algebra `Λ𝔤^∨` of
ArithmeticLocallySymmetricSpaces §ALS.F.5, generated in degree `1`, with
`dxᵢ = ∑ cⁱⱼₖ xⱼ xₖ` for `[eⱼ, eₖ] = ∑ cⁱⱼₖ eᵢ` (Sullivan, §2, (2.1), the degree one case); prove
that it is a Sullivan algebra exactly when `𝔤` is nilpotent. *Needs:* 5.1, 1.2;
ArithmeticLocallySymmetricSpaces §ALS.F.5.

**Checks.**

- The Lie algebra with `[X, Y] = Z` and cyclic (`𝔰𝔬(3)`), not nilpotent, gives Hess's
  `Λ(x, y, z)`, `dx = yz` and cyclic, which is not a Sullivan algebra (1.2, Checks).
- The Heisenberg Lie algebra `[X, Y] = Z`, nilpotent, gives `Λ(x, y, z)` with `dz = ±xy` and
  `dx = dy = 0`, the Heisenberg Sullivan algebra (Layer 1, Examples).
- `L` abelian with `d_L = 0`: `C*(L) = Λ(sL)^∨` with `d = 0`, minimal; `L = ⟨u₁, v₂⟩` with
  `d_L v = u` gives `Λ(u′₂, v′₃)` with `du′ = ±v′`, a linear differential: not minimal, and
  `H = K`.

### 5.3 The homotopy Lie algebra of a minimal Sullivan algebra

For a minimal Sullivan algebra `(ΛV, d)` with `V` of finite type, define `L_V` with
`(L_V)ₙ = (V^(n+1))^∨` and the bracket dual to the quadratic part `d₁ : V → Λ²V`; prove that it is a
graded Lie algebra, the Jacobi identity coming from `d² = 0` (Sullivan, §2, Theorem (2.1);
Félix–Halperin–Thomas, §21). *Needs:* 1.2, 5.1.

**Checks.**

- `Λ(x₂, y₃)`, `dy = x²`: `L` has basis `a` (degree `1`, dual to `x`) and `b` (degree `2`, dual to
  `y`) with `[a, a] = ±2b ≠ 0`; the factor `2` comes from `x² = x · x`.
- `Λ(x₃)`: `L = ⟨a₂⟩`, abelian.
- The Heisenberg algebra: `L₀ = ⟨X, Y, Z⟩` with `[X, Y] = ±Z`, the Heisenberg Lie algebra.

### 5.4 Quillen's functors

Define Quillen's functors `𝓛` from `2`-reduced cocommutative DG coalgebras to reduced DG Lie
algebras (free Lie algebra on the desuspended reduced coalgebra) and `𝓒` back (Chevalley–Eilenberg
chains); prove that they are adjoint, preserve quasi-isomorphisms, and that the unit and counit are
quasi-isomorphisms, so that the localizations at quasi-isomorphisms are equivalent (Quillen,
Part I and Appendix B; Félix–Halperin–Thomas, §22). *Needs:* 5.1; Mathlib `FreeLieAlgebra`,
`MorphismProperty.Localization`.

**Checks.**

- `L` abelian on one generator `a` of degree `1`: `𝓒(L) = Λ(sa)` with `|sa| = 2`, the coalgebra
  dual to `K[x]`, `|x| = 2`, the cohomology of `ℂP^∞`.
- `𝓛(𝓒(L)) → L` for `L = 𝕃(a)` (free on `a`, degree `1`) is a quasi-isomorphism, not an
  isomorphism: `𝓛𝓒(L)` is much larger.
- `2`-reduced matters: a coalgebra with `C₁ ≠ 0` would give Lie generators in degree `0`, outside
  the reduced category.

### Examples

- The DG Lie model of `S²` is `𝕃(a)` with `|a| = 1`, `d = 0`; its homology `⟨a, [a, a]⟩` is
  `π_*(ΩS²) ⊗ ℚ`.

### Dependencies

Layer 1; ArithmeticLocallySymmetricSpaces §ALS.F.5; Mathlib Lie algebras and localization.

## Layer 6: rational homotopy types of spaces

### 6.1 Spatial realization

Define the spatial realization `⟨A⟩ = Hom_cdga(A, A_PL(Δ•))`, a simplicial set, and prove the
adjunction `Hom_SSet(X, ⟨A⟩) ≅ Hom_cdga(A, A_PL(X))` (Hess, Definition 1.22; Sullivan, §8;
Bousfield–Gugenheim); `A_PL` and `⟨−⟩` form a Quillen pair between `SSet` (Kan–Quillen) and
`cdgaᵒᵖ` (2.5). *Needs:* 2.5, 4.3; GeneralizedCohomology G2.1.

**Checks.**

- `⟨K⟩ = Δ⁰`; `⟨Λ(x_n)⟩`, `d = 0`, is a `K(ℚ, n)` for `n ≥ 2`.
- `Hom_SSet(Δ⁰, ⟨A⟩) = Hom_cdga(A, K)`: points are augmentations.
- `⟨Λ(t, dt)⟩` is contractible, `Λ(t, dt)` being quasi-isomorphic to `K` (2.1, Checks).

### 6.2 Generators and rational homotopy

For a simply connected Sullivan algebra `(ΛV, d)` of finite type, prove that the unit
`ΛV → A_PL⟨ΛV⟩` is a quasi-isomorphism and `π_n⟨ΛV⟩ ≅ Hom(Vⁿ, ℚ)` (Hess, Theorem 1.24;
Félix–Halperin–Thomas, §17). For a simply connected space `X` of finite rational type with minimal
model `(ΛV, d) → A_PL(X)`, prove `Vⁿ ≅ Hom(πₙ(X), ℚ)` (Hess, after Definition 1.27). *Needs:*
3.1, 4.5, 6.1; Mathlib `HomotopyGroup`, `SimplyConnectedSpace`; AlgebraicTopology §§8.3, 8.5.

**Checks.**

- `X = S³`: `V = ⟨x₃⟩`, `π₃ ⊗ ℚ = ℚ`, all other rational groups `0`.
- `X = S²`: `V = ⟨x₂, y₃⟩`, so `π₂ ⊗ ℚ = π₃ ⊗ ℚ = ℚ` and `πₙ ⊗ ℚ = 0` for `n ≥ 4`, although
  `π₄(S²) = ℤ/2 ≠ 0`.
- `X = ℂP²`: `V = ⟨x₂, y₅⟩`, so `π₅(ℂP²) ⊗ ℚ = ℚ` (from `S⁵ → ℂP²`), and `π₃(ℂP²) ⊗ ℚ = 0`.

### 6.3 Sullivan's classification

Prove: rational homotopy types of simply connected spaces of finite rational type correspond
bijectively to isomorphism classes of simply connected minimal Sullivan algebras of finite type;
homotopy classes of maps between simply connected rational spaces of finite type correspond to
homotopy classes of DG maps between their models (Hess, Corollary 1.26; Sullivan, §8;
Bousfield–Gugenheim). A simply connected space is rational when its homotopy groups are
`ℚ`-vector spaces (Hess, Definition 1.1). *Needs:* 2.4, 3.4, 6.2.

**Checks.**

- `S³` and `K(ℚ, 3)` have the same model `Λ(x₃)`; they are rationally equivalent but not homotopy
  equivalent.
- `S² × S⁴` and `ℂP³` have equal Betti numbers, but the square of the degree-`2` generator is `0`
  in the first and nonzero in the second; their models `Λ(x₂, y₃, z₄, w₇)`, `dy = x²`, `dw = z²`,
  and `Λ(x₂, y₇)`, `dy = x⁴`, are not isomorphic.
- Simple connectivity matters: `S¹ ∨ S¹` has a `1`-minimal model with infinitely many generators in
  degree `1` (3.2, Checks), outside the simply connected finite-type range of the theorem.

### 6.4 Quillen's equivalence

Prove that the localization of the category of simply connected pointed simplicial sets at the
maps inducing isomorphisms on `π_* ⊗ ℚ` is equivalent to the localization of reduced DG Lie
algebras over `ℚ` at quasi-isomorphisms, and to that of `2`-reduced cocommutative DG coalgebras,
with `H(λX) ≅ π_*(ΩX) ⊗ ℚ` as graded Lie algebras for the Samelson product (Quillen, Theorem I;
Félix–Halperin–Thomas, §24). *Needs:* 5.4, 6.1; StableHomotopyKTheory §3.36; Mathlib
`MorphismProperty.Localization`, `Functor.IsEquivalence`.

**Checks.**

- `X = S²`: `λX` is quasi-isomorphic to `𝕃(a)`, `|a| = 1`, and `H = ⟨a, [a, a]⟩` gives
  `π₂ ⊗ ℚ = π₃ ⊗ ℚ = ℚ` with `[a, a]` the Whitehead square.
- `X = S³`: `𝕃(a₂)`, `[a, a] = 0` since `a` is even: `ΩS³` is rationally `K(ℚ, 2)`.
- Rational equivalences are inverted: `S³ → K(ℚ, 3)` becomes an isomorphism, although `π₃` changes
  from `ℤ` to `ℚ`.

### Examples

- The product `S² × S³` and the wedge `S² ∨ S³` have models `Λ(x₂, y₃, z₃)`, `dy = x²`, `dz = 0`,
  and a minimal model with infinitely many generators; they are distinguished by the cup product of
  the classes of degrees `2` and `3`, nonzero for the product and zero for the wedge.

### Dependencies

Layers 2–5; AlgebraicTopology §§4.7, 6.2, 8.3, 8.5; GeneralizedCohomology G2.1;
StableHomotopyKTheory §3.36; Mathlib homotopy groups and localization.

## Layer 7: formality

### 7.1 Formal commutative DG algebras

Define `IsFormal hA`: there are a graded-commutative DG algebra `M` and quasi-isomorphisms `M → A`
and `M → (H(A), 0)` (Deligne–Griffiths–Morgan–Sullivan, §4, Definition; Hess, Definition 2.1). For
connected `A` this is equivalent to a zigzag of quasi-isomorphisms of commutative DG algebras, by
3.1 and 2.4; a formal commutative DG algebra is formal in DGAInfinity Layer 3's sense, forgetting
commutativity. A space is formal when `A_PL(X)` is. *Needs:* 3.1, 2.4; Tau Ceti
`TauCeti.isDGAlgebra_zero`, `TauCeti.IsDGAlgebra.cohomologyGrading`; DGAInfinity Layer 3.

**Checks.**

- A DG algebra with `d = 0` is formal (`M = A`, both maps the identity and
  `TauCeti.algEquivCohomologyOfZero`).
- `Λ(x₂, y₃)`, `dy = x²`, is formal: `x ↦ [x]`, `y ↦ 0` is a quasi-isomorphism to
  `K[x]/(x²)` (3.3, Checks).
- The Heisenberg algebra `Λ(x₁, y₁, z₁)`, `dz = xy`, is not formal: `xz` is closed and not exact,
  while in an algebra with `d = 0` the corresponding product would lie in the ideal of `x`, and
  `x · H¹ = 0` (`x · x = 0`, `xy = dz`), so `xz` would be cohomologous to `0`
  (Deligne–Griffiths–Morgan–Sullivan, p. 261).

### 7.2 A criterion for minimal algebras

Prove `IsMinimalSullivanAlgebra.isFormal_of_complement`: let `M` be minimal Sullivan with
generators `x`, `Vₚ` the span of the generators of degree `p` and `Cₚ = Vₚ ∩ ker d`; if there are
complements `Nₚ` with `Nₚ ∩ Cₚ = 0`, `Nₚ + Cₚ = Vₚ`, such that every closed element of the ideal
generated by `⋃ Nₚ` is exact, then `M` is formal (Deligne–Griffiths–Morgan–Sullivan, Theorem 4.1,
the "if" half: the map `M → H(M)` is `Cₚ ∋ c ↦ [c]`, `Nₚ ↦ 0`). *Needs:* 1.2, 7.1; Mathlib
`Ideal.span`, `LinearMap.ker`, `LinearMap.range`.

**Checks.**

- `Λ(x₂, y₃)`, `dy = x²`: `N₃ = ⟨y⟩`; the ideal `(y) = y · K[x]` has no nonzero closed element,
  since `d(xᵏ y) = x^(k+2) ≠ 0`, so the criterion holds.
- The Heisenberg algebra: `N₁ = ⟨z⟩` is forced (`C₁ = ⟨x, y⟩`) and `xz ∈ (z)` is closed and not
  exact, so the criterion fails, consistent with 7.1, Checks.
- `Λ(x₂, y₂, ψ₃, φ₃)`, `dψ = x²`, `dφ = xy`: `N₃ = ⟨ψ, φ⟩`, and `xφ − yψ` lies in the ideal, is
  closed (`x · xy − y · x² = 0`) and is not exact (all degree-`4` elements are polynomials in
  `x, y`, which are closed, so nothing in degree `5` is exact); the criterion fails
  (Deligne–Griffiths–Morgan– Sullivan, p. 261).

### 7.3 The `ddᶜ`-lemma

Prove `isFormal_of_ddc`: let `(A, d)` be graded-commutative over `K` of characteristic zero, with a
second differential `dᶜ` (`TauCeti.IsDGAlgebra 𝒜 dᶜ`) anticommuting with `d`, such that every `a`
with `da = dᶜa = 0` that is `d`-exact or `dᶜ`-exact is `ddᶜ`-exact. Then `A` is formal: the maps
`(ker dᶜ, d) → (A, d)` and `(ker dᶜ, d) → (H_{dᶜ}(A), 0)` are quasi-isomorphisms
(Deligne–Griffiths–Morgan–Sullivan, §6, proof of the Main Theorem, the `dᶜ`-diagram method,
Claims 1 and 2). *Needs:* 7.1; Tau Ceti `TauCeti.IsDGAlgebra`, `TauCeti.DGAlgHom.cohomologyMap`;
DerivedDeRhamCohomology §2.21.

**Checks.**

- `dᶜ = 0`: the hypothesis says that every `d`-exact element is `d(dᶜ e) = 0`, so `d = 0`, and `A`
  is formal by the first Check of 7.1.
- The lemma is sufficient, not necessary: `Λ(u₁, v₂)`, `du = v`, with `dᶜ = 0` fails it (`v` is
  closed, `dᶜ`-closed and `d`-exact, but `ddᶜ = 0`), yet its cohomology is `K` and it is formal.
- No `dᶜ` on the Heisenberg algebra satisfies the hypotheses, since that algebra is not formal
  (7.1, Checks).

### 7.4 Compact Kähler manifolds

Prove that the real de Rham DG algebra of a compact Kähler manifold, with `dᶜ = J⁻¹ d J`, satisfies
the hypotheses of 7.3 and is formal; hence the real homotopy type of a compact Kähler manifold is a
formal consequence of its real cohomology ring and all Massey products vanish
(Deligne–Griffiths–Morgan–Sullivan, §6, Main Theorem (i) and Corollary 1; Sullivan, Theorem
(12.1)). *Needs:* 7.3; ComplexKahlerGeometry §6.3; DifferentialGeometry 0.1.

**Checks.**

- `ℂPⁿ`: formal, with model `Λ(x₂, y_{2n+1})`, `dy = x^(n+1)`.
- A complex torus `ℂⁿ/Λ`: its de Rham cohomology is `Λ(H¹)` with `d = 0` on invariant forms.
- The Kodaira–Thurston surface `M³ × S¹` is a compact complex surface with `b₁ = 3`, odd, hence not
  Kähler; its model `Λ(x₁, y₁, z₁, w₁)`, `dz = xy`, is not formal, by the argument of 7.1.

### Examples

- Wedges and products of formal spaces are formal (Hess, after Definition 2.1).

### Dependencies

Layers 1–3; DGAInfinity Layers 3 and 8; ComplexKahlerGeometry §6.3; DifferentialGeometry 0.1.

## Downstream consumers

No roadmap on main or in the open pull requests cites RationalHomotopyModels.
EllAdicHomotopyTypesAndWeights consumes, in its open pull request, the five contracts
`polynomial-forms-de-rham`, `sullivan-minimal-models`, `sullivan-quasi-isomorphism-rigidity`,
`sullivan-homotopy-lifting` and `sullivan-scalar-extension`, addressed there to
AlgebraicTopologyPartII Layer 4; they are §§4.1–4.4, 1.1–1.3 with 3.1–3.2, 3.3, 2.1–2.4 and 3.5
here (Scope and ownership).

## Research context

Rational homotopy theory has two algebraic models: Quillen's DG Lie algebras (Quillen 1969) and
Sullivan's minimal models of the polynomial forms `A_PL` (Sullivan 1977), the latter put in model
category form by Bousfield and Gugenheim (1976); Halperin's lectures (1983), Griffiths–Morgan
(1981; second edition 2013) and Félix–Halperin–Thomas (2001) are the standard accounts. Formality
holds for compact Kähler manifolds (Deligne–Griffiths–Morgan–Sullivan 1975) and is not detected by
Massey products alone: Crowley and Nordström (2020) give closed non-formal manifolds all of whose
Massey products vanish, and Etingof, Henriques, Kamnitzer and Rains (2010) study the cohomology
ring of the real locus of `M̄_{0,n}`. The rational homotopy type of a simply connected space of
finite type is recovered from the `C∞` structure on its cohomology (Kadeishvili 2009); Toën (2006)
replaces commutative DG algebras by affine stacks beyond the nilpotent case; the simply connected
manifolds realising a given rational homotopy type with Poincaré duality are characterised by
Barge (1976) and Sullivan (1977, §13).

A simply connected space of finite rational type is either elliptic, with finite-dimensional
`π_* ⊗ ℚ`, or hyperbolic, with exponential growth of its rational homotopy (Félix–Halperin 1982;
Félix–Halperin–Jacobsson–Löfwall–Thomas 1988); Halperin (1977) and Friedlander–Halperin (1979)
give the constraints on elliptic spaces. Several questions on elliptic spaces are open. Halperin's
conjecture asks that for a simply connected positively elliptic fibre `F` every fibration with fibre
`F` have a degenerate Serre spectral sequence (see Lupton 1998 for equivalent forms); it is known
for homogeneous spaces (Shiga–Tezuka 1987) and in formal dimension at most `20` (Kennard–Wu 2023),
and fibrations with formal elliptic fibres are studied by Amann and Kapovitch (2012). The toral rank
conjecture asks that a space with an almost free action of an `n`-torus have
`dim H*(X; ℚ) ≥ 2ⁿ` (Halperin 1985; see Félix–Oprea–Tanré 2008); it is known for `n ≤ 3`
(Allday–Puppe 1993) and in further cases listed by Amann and Zoller (2023), whose introduction calls
it highly open and notes that the general lower bounds are linear in `n`; free torus actions on
two-stage spaces are studied by Jessup and Lupton (2004) and multiplicative aspects by Puppe
(2009); Walker's theorem on total Betti numbers (2017) and the examples of Iyengar–Walker (2018)
concern its algebraic analogues, and a generalised version fails for torus bundles (Amann,
preprint arXiv:2011.13411). Hilali's conjecture asks that `dim π_*(X) ⊗ ℚ ≤ dim H*(X; ℚ)` for a
simply connected elliptic `X`; it is known for hyperelliptic spaces (Fernández de Bobadilla–Fresán–
Muñoz–Murillo 2014) and up to formal dimension `20` (Cattalani–Milivojević 2020).

In geometry, the Bott–Grove–Halperin conjecture predicts that closed simply connected manifolds of
non-negative sectional curvature are rationally elliptic (Grove–Halperin 1982; stated in
Amann–Zoller 2023, §6.2). The Gromoll–Meyer criterion (1969) together with Vigué-Poirrier and
Sullivan (1976) gives infinitely many closed geodesics on a closed simply connected Riemannian
manifold whose rational cohomology algebra is not generated by one class; the existence of
infinitely many closed geodesics on every closed Riemannian manifold is listed as open by Burns
and Matveev (2021). The Bott–Samelson theorem (1953), `H_*(ΩΣX) ≅ T(H̃_*(X))`, is the starting
point of the Lie models of loop spaces. None of these questions is a target here.

## References

- D. Quillen, « Rational homotopy theory », *Ann. of Math.* (2) 90 (1969), 205–295.
  doi:10.2307/1970725; Zbl 0191.53702.
- D. Sullivan, « Infinitesimal computations in topology », *Publ. Math. IHÉS* 47 (1977), 269–331.
  doi:10.1007/BF02684341; Numdam: PMIHES_1977__47__269_0.
- J. W. Morgan, « The algebraic topology of smooth algebraic varieties », *Publ. Math. IHÉS* 48
  (1978), 137–204. doi:10.1007/BF02684316; Numdam: PMIHES_1978__48__137_0.
- P. Deligne, P. Griffiths, J. Morgan, D. Sullivan, « Real homotopy theory of Kähler manifolds »,
  *Invent. Math.* 29 (1975), 245–274. doi:10.1007/BF01389853; Zbl 0312.55011.
- A. K. Bousfield, V. K. A. M. Gugenheim, *On PL de Rham theory and rational homotopy type*, Mem.
  Amer. Math. Soc. 8 (1976), no. 179. doi:10.1090/memo/0179; Zbl 0338.55008.
- Y. Félix, S. Halperin, J.-C. Thomas, *Rational homotopy theory*, Graduate Texts in Mathematics
  205, Springer, 2001. doi:10.1007/978-1-4613-0105-9.
- K. Hess, « Rational homotopy theory: a brief introduction », in *Interactions between homotopy
  theory and algebra*, Contemp. Math. 436, Amer. Math. Soc., 2007, 175–202. arXiv:math/0604626
  (numbering of arXiv version 1).
- S. Halperin, *Lectures on minimal models*, Mém. Soc. Math. France (N.S.) 9–10 (1983).
  Zbl 0536.55003.
- P. Griffiths, J. Morgan, *Rational homotopy theory and differential forms*, Progress in
  Mathematics 16, Birkhäuser, 1981; 2nd ed. 2013. doi:10.1007/978-1-4614-8468-4.
- Y. Félix, J. Oprea, D. Tanré, *Algebraic models in geometry*, Oxford Graduate Texts in
  Mathematics 17, Oxford University Press, 2008. doi:10.1093/oso/9780199206513.001.0001.
- Y. Félix, S. Halperin, « Formal spaces with finite-dimensional rational homotopy », *Trans. Amer.
  Math. Soc.* 270 (1982), 575–588. doi:10.1090/S0002-9947-1982-0645331-9.
- Y. Félix, S. Halperin, « Rational LS category and its applications », *Trans. Amer. Math. Soc.*
  273 (1982), 1–37. doi:10.1090/S0002-9947-1982-0664027-0.
- Y. Félix, S. Halperin, C. Jacobsson, C. Löfwall, J.-C. Thomas, « The radical of the homotopy Lie
  algebra », *Amer. J. Math.* 110 (1988), 301–322. doi:10.2307/2374504.
- S. Halperin, « Finiteness in the minimal models of Sullivan », *Trans. Amer. Math. Soc.* 230
  (1977), 173–199. doi:10.1090/S0002-9947-1977-0461508-8.
- J. B. Friedlander, S. Halperin, « An arithmetic characterization of the rational homotopy groups
  of certain spaces », *Invent. Math.* 53 (1979), 117–133. doi:10.1007/BF01390029.
- S. Halperin, « Rational homotopy and torus actions », in *Aspects of topology*, London Math. Soc.
  Lecture Note Ser. 93, Cambridge University Press, 1985, 293–306. Zbl 0562.57015.
- C. Allday, V. Puppe, *Cohomological methods in transformation groups*, Cambridge Stud. Adv. Math.
  32, Cambridge University Press, 1993. doi:10.1017/CBO9780511526275.
- V. Puppe, « Multiplicative aspects of the Halperin–Carlsson conjecture », *Georgian Math. J.* 16
  (2009), 369–379. doi:10.1515/GMJ.2009.369; Zbl 1190.57023.
- B. Jessup, G. Lupton, « Free torus actions and two-stage spaces », *Math. Proc. Cambridge Philos.
  Soc.* 137 (2004), 191–207. doi:10.1017/S0305004103007242.
- M. Amann, L. Zoller, « The toral rank conjecture and variants of equivariant formality », *J.
  Math. Pures Appl.* 173 (2023), 43–95. doi:10.1016/j.matpur.2023.02.002; arXiv:1910.04746.
- M. E. Walker, « Total Betti numbers of modules of finite projective dimension », *Ann. of Math.*
  (2) 186 (2017), 641–646. doi:10.4007/annals.2017.186.2.6.
- S. B. Iyengar, M. E. Walker, « Examples of finite free complexes of small rank and small
  homology », *Acta Math.* 221 (2018), 143–158. doi:10.4310/ACTA.2018.v221.n1.a4.
- G. Lupton, « Variations on a conjecture of Halperin », in *Homotopy and geometry* (Warsaw, 1997),
  Banach Center Publ. 45, 1998, 115–135. Zbl 0931.55007; arXiv:math/0010124.
- L. Kennard, Y. Wu, « Halperin's conjecture in formal dimensions up to 20 », *Comm. Algebra* 51
  (2023), 3606–3622. doi:10.1080/00927872.2023.2186705; arXiv:2104.04086.
- H. Shiga, M. Tezuka, « Cohomology automorphisms of some homogeneous spaces », *Topology Appl.* 25
  (1987), 143–150. doi:10.1016/0166-8641(87)90007-1; erratum, ibid. 34 (1990), 207,
  doi:10.1016/0166-8641(90)90082-D.
- M. Amann, V. Kapovitch, « On fibrations with formal elliptic fibers », *Adv. Math.* 231 (2012),
  2048–2068. doi:10.1016/j.aim.2012.07.022.
- J. Fernández de Bobadilla, J. Fresán, V. Muñoz, A. Murillo, « The Hilali conjecture for
  hyperelliptic spaces », in *Mathematics without boundaries*, Springer, 2014.
  doi:10.1007/978-1-4939-1106-6_2; Zbl 1322.55004.
- S. Cattalani, A. Milivojević, « Verifying the Hilali conjecture up to formal dimension twenty »,
  *J. Homotopy Relat. Struct.* 15 (2020), 323–331. Zbl 1444.55005; arXiv:2210.00607.
- K. Grove, S. Halperin, « Contributions of rational homotopy theory to global problems in
  geometry », *Publ. Math. IHÉS* 56 (1982), 171–177. Zbl 0508.55013.
- D. Gromoll, W. Meyer, « Periodic geodesics on compact Riemannian manifolds », *J. Differential
  Geom.* 3 (1969), 493–510. doi:10.4310/jdg/1214429070.
- M. Vigué-Poirrier, D. Sullivan, « The homology theory of the closed geodesic problem », *J.
  Differential Geom.* 11 (1976), 633–644. doi:10.4310/jdg/1214433729.
- K. Burns, V. S. Matveev, « Open problems and questions about geodesics », *Ergodic Theory Dynam.
  Systems* 41 (2021), 641–684. doi:10.1017/etds.2019.73; arXiv:1308.5417.
- R. Bott, H. Samelson, « On the Pontryagin product in spaces of paths », *Comment. Math. Helv.* 27
  (1953), 320–337. doi:10.1007/BF02564566.
- J. Barge, « Structures différentiables sur les types d'homotopie rationnelle simplement
  connexes », *Ann. Sci. ÉNS* (4) 9 (1976), 469–501. doi:10.24033/asens.1315.
- T. Kadeishvili, « Cohomology C∞-algebra and rational homotopy type », in *Algebraic topology—old
  and new*, Banach Center Publ. 85, 2009, 225–240. doi:10.4064/bc85-0-16.
- D. Crowley, J. Nordström, « The rational homotopy type of (n−1)-connected manifolds of dimension
  up to 5n−3 », *J. Topol.* 13 (2020), 539–575. doi:10.1112/topo.12133; arXiv:1505.04184.
- P. Etingof, A. Henriques, J. Kamnitzer, E. Rains, « The cohomology ring of the real locus of the
  moduli space of stable curves of genus 0 with marked points », *Ann. of Math.* (2) 171 (2010),
  731–777. doi:10.4007/annals.2010.171.731; arXiv:math/0507514.
- B. Toën, « Champs affines », *Selecta Math. (N.S.)* 12 (2006), 39–134.
  doi:10.1007/s00029-006-0019-z.
- M. Amann, « Counter-examples to a generalised toral rank conjecture », preprint,
  arXiv:2011.13411.
