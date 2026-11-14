# Roadmap: continuous cohomology of profinite groups, part II — Massey products and unipotent lifting

**Summary.** This roadmap extends ProfiniteCohomology from continuous cohomology and its cup
products to degree-one Massey products, read through finite unipotent groups. It builds the strict
continuous cochain algebra of a profinite group and its defining systems, proves Dwyer's dictionary
between Massey products and lifts to unitriangular groups, and develops the finite group theory of
the unitriangular group `Uₙ₊₁(𝔽_p)` that the homogeneous-space approach of Harpaz–Wittenberg (HW
below) needs: the abelianized stabilizer `B = U¹/U³` with its explicit conjugation action, outer
exponents, the vanishing of the Bogomolov multiplier of the derived subgroup `U¹`, cyclically
trivial cohomology of the boundary module, and the examples that show where these computations
stop. It then proves refined lifting through the two-boundary subgroups `P_(r,s)` at every local
field, archimedean or not, for constant and for rank-one twisted coefficients, and constructs three
characters of `Γ_ℚ` with values in `ℤ/8` whose triple Massey product is defined and does not
contain zero. The end theorems are Dwyer's criteria (`masseyDefined_iff_exists_lift`,
`masseyContainsZero_iff_exists_lift`), outer powering on the conjugacy classes of `U¹` in rank at
most six (`isConj_pow_superdiagonalSubgroup_two`), the vanishing of the Bogomolov multiplier of `U¹`
(`bogomolovMultiplier_superdiagonalSubgroup_two_eq_bot`), refined local lifting
(`refinedLocalLifting`, HW Proposition 5.3 extended to `ℝ` and `ℂ`), local Massey vanishing
(`localMasseyVanishing`), its rank-one twisted form (`twistedRefinedLocalLifting`), and the `ℤ/8`
counterexample (`exists_masseyDefined_not_masseyContainsZero_zmod_eight`, HW Theorem 7.5).

## Scope and ownership

ProfiniteCohomology stops at continuous cohomology in all degrees, its low-degree and graded cup
products, cohomological dimension, the Evens norm and the Galois interface (Hilbert 90, Kummer
theory); it defines no Massey product and no lifting theory for unitriangular groups. This roadmap
is its Part II in that direction. It owns:

- the strict continuous inhomogeneous cochain algebra of a profinite group with coefficients in a
  discrete commutative ring with action, its comparison with continuous cohomology, its
  specialization of DGAInfinity's degree-one defining systems, and the trivial-coefficient defining
  systems `DefiningSystem`, `MasseyDefined`, `MasseyContainsZero` (Layer 0);
- the increasing-distance factorization of `Uₙ₊₁(R)`, exact superdiagonal commutators, the adjacent
  quotient, the corner extension and Dwyer's correspondence and criteria (Layer 1);
- the finite group theory of `Uₙ₊₁(𝔽_p)` used by HW §§3, 4 and 6: the stabilizer module `B`, its
  boundary submodule, sparse conjugation, the reversal involution, support submodules, outer
  exponents, the Bogomolov multiplier with its commutativity-preserving exterior-square description,
  cyclically trivial first cohomology, conjugacy-power evaluation and fixed-class generation, with
  their sharpness examples (Layers 2–6);
- refined lifting at every local field and local Massey vanishing for `𝔽_p` coefficients
  (Layers 7–8);
- defining systems with coefficients in a system of Hom modules, filtered automorphism groups, the
  twisted Dwyer correspondence and rank-one twisted refined lifting (Layers 9–10);
- the defined non-vanishing `ℤ/8` triple Massey product over `ℚ` (Layer 11).

It leaves to named owners, and imports:

- ProfiniteCohomology, Layers 0, 1, 2, 3, 5, 6, 8, 9, 10, 11 and 12: discrete modules, the canonical
  carrier, the explicit `H⁰, H¹, H²`, the comparisons, long exact sequences, corestriction, Shapiro,
  the low-degree and graded cups, Hilbert 90 and Kummer theory, cohomological dimension. The
  characteristic-`p` vanishing used in Layer 7 is declared as a gap of its Layer 9.
- DGAInfinity, Layers 1 and 8: DG algebras and DG categories, and the generic matric Massey products
  with their defining systems. Layer 0 specializes them and builds no second generic Massey theory;
  the integral independence of representatives is declared as a gap of its Layer 8.
- ProfiniteProPGroups, Layer 5, implemented by Tau Ceti's `TauCeti.FiniteEmbeddingProblem`: finite
  embedding problems and the obstruction class of an abelian kernel. InverseGaloisAndArithmeticFundamentalGroups
  §IG.4.1 extends the criterion to maps that need not be surjective and adds the torsor of lifts;
  its §IG.4.2 owns twisting of solutions and the two independent cyclic degree-eight lifts used in
  Layer 11.
- ClassFieldTheory, Layer 5, implemented by Tau Ceti's
  `TauCeti.ClassFieldTheory.dualityMap1_kummerCoeff_bijective` and its companions in degrees 0
  and 2: local Tate duality for finite modules over every nonarchimedean local field, in the
  explicit low-degree model.
- ArithmeticGaloisDuality §R02.1.4: the pointwise Hom, the splitting torsor of an additively split
  sequence and the connecting map as cup product with its class; §R02.3.0d: the Tate–Shafarevich
  kernels `Ш^i(K, A)`; §R02.4.5a: the perfect pairing `Ш²(K, A) × Ш¹(K, A^D) → ℚ/ℤ`, natural in
  `A` by §R02.4.3; §R02.4.5b:
  the Grunwald–Wang alternative, `Ш¹(ℚ, μ₈) = 0` and `Ш²(ℚ, ℤ/8) = 0`.
- K2SymbolsBrauer §6.14: unique factorization of `Uₘ(A)` into elementary matrices in lexicographic
  order, for a commutative ring `A` and `m ≥ 3`. Layer 1 keeps the factorization in increasing
  distance, which differs in the order of the factors and is the one adapted to the superdiagonal
  filtration.
- Tau Ceti: the unitriangular and upper triangular groups, the superdiagonal filtration with the
  forward commutator inclusion, transvections and their commutators, the Heisenberg criterion
  `ContCohomology.explicitCup11_eq_zero_iff` for a vanishing `(1,1)` cup, and all-degree Shapiro and
  corestriction.

Two notions here have namesakes elsewhere and are kept with their difference stated: the cyclically
trivial cohomology `H¹_cyc(G, M)` of Layer 5 is the kernel of restriction to the cyclic subgroups of
a finite group, not an arithmetic kernel of localization maps like ArithmeticGaloisDuality's `Ш^i`;
the outer exponent of Layer 3 uses ordinary powers in a finite group and Mathlib's `ConjClasses`,
not profinite powering.

The global Massey vanishing theorem for number fields (HW Theorems 1.3 and 7.4) needs homogeneous
spaces, unramified Brauer groups and the Brauer–Manin obstruction. It is not stated here; this
roadmap supplies its finite-group and local inputs (see Downstream consumers).

## Conventions

**Groups and cohomology.** `Γ` is a profinite group unless a statement says otherwise; Dwyer's
criteria hold for every topological group. Coefficient modules are discrete. `H^q(Γ, M)` is the
parent's continuous cohomology; in degrees `1` and `2` it is computed by Tau Ceti's explicit
`ContCohomology.H1` and `ContCohomology.H2`, quotients of continuous cocycles by coboundaries. For a
field `K`, `Γ_K` is Tau Ceti's `TauCeti.AbsoluteGaloisGroup K = Gal(Kˢ/K)` with its Krull topology
and `H^q(K, M) = H^q(Γ_K, M)`. A homomorphism from `Γ` to a finite or discrete group is continuous
exactly when its kernel is open, and the Lean statements write continuity that way, as Tau Ceti's
`TauCeti.FiniteEmbeddingProblem` does. All lifts are weak: a lift need not be surjective.

**Cochains, cups and signs.** Inhomogeneous cochains have the differential

```text
(d f)(g₁, …, g_{q+1}) = g₁·f(g₂, …, g_{q+1})
                        + Σ_{i=1}^{q} (−1)^i f(g₁, …, g_i g_{i+1}, …, g_{q+1})
                        + (−1)^{q+1} f(g₁, …, g_q),
```

so `d⁰m(g) = g·m − m` and `(d¹a)(g, h) = g·a(h) − a(gh) + a(g)`, as in Tau Ceti's
`ContCohomology.d0` and `ContCohomology.d1`. The cup product of cochains of degrees `r` and `s` for a
pairing `M ⊗ M′ → M″` is `(f ∪ f′)(g₁, …, g_{r+s}) = f(g₁, …, g_r) · (g₁⋯g_r)·f′(g_{r+1}, …, g_{r+s})`;
in bidegree `(1,1)` this is `(a ∪ b)(g, h) = a(g)·(g·b(h))`, the cochain of
`ContCohomology.explicitCup11` (HW, Remark 7.1, p. 25). Defining systems follow Kraines' sign: the
entries satisfy `d a_ij = −Σ_{i<m<j} a_im ∪ a_mj` and the value is the class of
`−Σ_{0<m<n} a_0m ∪ a_mn` (HW, Introduction, p. 1, footnote 1). Witness: for `n = 2` the product is
`{−α₀ ∪ α₁}`, while the factor set of the corner-zero section of `U₃` is `+a₀₁(g)a₁₂(h)`, so the
Massey value is the negative of the pulled-back extension class (Layer 1). With trivial coefficients
the Massey product "is defined" when a defining system exists and "contains zero" when some value is
a coboundary; these are different conditions, and the Lean predicates are `MasseyDefined` and
`MasseyContainsZero`.

**Matrices.** Matrices are indexed by `0, …, n`. `U = Uₙ₊₁(R)` is Tau Ceti's
`TauCeti.upperUnitriangularGroup (Fin (n + 1)) R` and `T = Tₙ₊₁(R)` is
`TauCeti.upperTriangularGroup (Fin (n + 1)) R`, with diagonal homomorphism
`TauCeti.UpperTriangularGroup.diag`. `E_ij` is the matrix unit and `e_ij(t) = 1 + tE_ij`, Tau Ceti's
`TauCeti.transvectionUnit`, for `i < j`. Commutators are `[x, y] = xyx⁻¹y⁻¹`; with this convention
`[e_ij(c), e_jl(d)] = e_il(cd)` (Tau Ceti `TauCeti.commutatorElement_transvectionUnit`), witnessed by
`[e₀₁(1), e₁₂(1)] = e₀₂(1)`. We use HW's indexing of the filtration: `Uᵐ` is the subgroup of
matrices whose first `m` superdiagonals vanish, which is Tau Ceti's
`UpperUnitriangularGroup.superdiagonalSubgroup (m + 1)`. Thus `U⁰ = U`, `U¹ = [U, U]`,
`U³ = [U¹, U¹]` (Layer 1), `U^{n−1} = Z` is the corner subgroup `{e₀ₙ(t)}`, which is the centre
of `U` for `n ≥ 1`, and `Uⁿ = 1`. Write `A = U/U¹`, and over `𝔽_p` write `B = U¹/U³` and `B_bdry` for
its boundary submodule (HW's `B₀`, renamed so as not to clash with the Bogomolov multiplier
`B_Bog(H)` of Layer 4). In Layers 7–10, `r, s ≥ 1` and `n = r + s + 1`, so that `n ≥ 3` and
`r, s ≤ n − 2`, unless a statement says otherwise; `P_(r,s)` is the two-boundary subgroup, whose
support condition is `IsTwoBoundary n r s`.

**Local fields.** A local field is a field satisfying `IsLocalField`: a nonarchimedean local field
in Mathlib's sense (`IsNonarchimedeanLocalField` for some valuative relation and compatible
topology), or a field isomorphic to `ℝ` or `ℂ`. HW (p. 19) reserve the name for the nonarchimedean
case; the archimedean fields are added because every completion of a number field is used.

**Duals.** For a finite group `G` and a finite `𝔽_p[G]`-module `V`, `V^∨ = Hom(V, 𝔽_p)` with the
contragredient action `(g·f)(v) = f(g⁻¹v)`. For a Galois module `M`, `M^D = Hom(M, μ_∞)` is the
Cartier dual with `(σf)(m) = σ(f(σ⁻¹m))`; it differs from `M^∨` by the cyclotomic action.

**Universes.** Fields in the local statements live in `Type`, the universe of Tau Ceti's local
duality theorems; groups whose Bogomolov multiplier is taken live in `Type`, as Mathlib's
`groupCohomology` requires the coefficient ring `ℤ` and the group in one universe.

## Exact supplier contracts

### From Mathlib

- `IsNonarchimedeanLocalField` (`NumberTheory/LocalField/Basic.lean`), assumed to provide the
  standard consequences listed there (local compactness, a discrete valuation ring of integers, a
  finite residue field); `Field.absoluteGaloisGroup`, identified with Tau Ceti's
  `TauCeti.AbsoluteGaloisGroup` as a topological group by Tau Ceti's
  `TauCeti.absoluteGaloisGroupRestrictEquiv`.
- `continuousCohomology`, `TopRep.homogeneousCochains` and `TopRep.resolutionX`
  (`RepresentationTheory/Homological/ContCohomology/Basic.lean`), the canonical carrier of ProfiniteCohomology;
  `ContinuousCohomology.tateShafarevich`, through ArithmeticGaloisDuality §R02.3.0d.
- `groupCohomology`, `groupCohomology.map`, `Rep.trivial` and `Rep.res`: the cohomology of a group
  with trivial coefficients `ℚ/ℤ` and restriction to a subgroup, used to define
  `bogomolovMultiplier`.
- `ConjClasses` and `IsConj.pow` (powering on conjugacy classes, Layer 3); `FreeGroup` and
  `PresentedGroup` (the exterior square of Layer 4); `CharacterModule.dual_surjective_of_injective`
  (extension of characters into `ℚ/ℤ`, Layer 4).
- `Subgroup.center`, `Subgroup.normalClosure`, `QuotientGroup.mk`, `ContinuousMap` and
  `ContinuousMap.ext`, `Finset.Ioo`, `IsConj`.

### From Tau Ceti

- Unitriangular matrices: `Matrix.IsUpperUnitriangular` (`LinearAlgebra/Matrix/Triangular.lean`).
- DG carriers: `TauCeti.IsDGAlgebra` (`Algebra/Homology/DG/Algebra/Defs.lean`: a degree-raising,
  square-zero differential with the graded Leibniz rule on an internally `ℤ`-graded algebra),
  `TauCeti.DGCategoryData` (`CategoryTheory/DG/HomComplexData.lean`: Hom complexes, bilinear
  composition, Leibniz rule, associativity and units) and `TauCeti.DGCategory`
  (`CategoryTheory/DG/Basic.lean`). These are the generic carriers of DGAInfinity Layer 1; the
  cochain algebra of Layer 0 and the Hom-coefficient category of Layer 9 are constructed here as
  objects of them.
- Unitriangular and triangular groups: `TauCeti.upperUnitriangularGroup`,
  `TauCeti.UpperUnitriangularGroup.ext` (equality from strictly upper entries),
  `TauCeti.UpperUnitriangularGroup.map`, `TauCeti.UpperUnitriangularGroup.superdiagonalSubgroup`
  with `mem_superdiagonalSubgroup_iff`, `superdiagonalSubgroup_eq_bot_of_le` and
  `commutator_superdiagonalSubgroup_le` (only the inclusion `[U⁽ʳ⁾, U⁽ˢ⁾] ≤ U⁽ʳ⁺ˢ⁾` in Tau Ceti's
  indexing); `TauCeti.upperTriangularGroup` with `TauCeti.UpperTriangularGroup.diag`,
  `TauCeti.UpperTriangularGroup.diagonalHom`, `TauCeti.UpperTriangularGroup.ker_diag` and
  `TauCeti.UpperTriangularGroup.upperUnitriangularGroup_le_upperTriangularGroup`.
- Transvections: `TauCeti.transvectionUnit`, `TauCeti.commutatorElement_transvectionUnit`,
  `TauCeti.commutatorElement_transvectionUnit_reverse`, `TauCeti.commute_transvectionUnit`,
  `TauCeti.transvectionUnit_mem_upperTriangularGroup`.
- The explicit cohomology of ProfiniteCohomology Layer 2: `TauCeti.ContCohomology.C1`, `d0`, `d1`,
  `Z1`, `Z2`, `B1`, `B2`, `H1`, `H2`, `DiscreteH1`, `B1_eq_bot_of_smul_eq_self`; the comparisons
  `ContCohomology.explicitH1AddEquivContinuousCohomology` and
  `ContCohomology.explicitH2AddEquivContinuousCohomology`; the cup `ContCohomology.explicitCup11`
  with `ContCohomology.explicitCup11_eq_zero_iff` and `ContCohomology.IsHeisenbergCochain`; cyclic
  groups `ContCohomology.H1pi_eq_zero_iff_exists_smul_sub_eq` and
  `ContCohomology.explicitH2CyclicEquiv`; the duality map `ContCohomology.dualityMap1`.
- All degrees: `TauCeti.ContinuousCohomology.corestriction_res` (`cor ∘ res = [G : U]`) and
  `TauCeti.ContinuousCohomology.isIso_shapiroMap`.
- Extensions and embedding problems: `TauCeti.FactorSet.exists_cohomologyClass_eq`,
  `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`,
  `TauCeti.exists_continuous_section`, `TauCeti.FiniteEmbeddingProblem`,
  `TauCeti.FiniteEmbeddingProblem.obstruction` and
  `TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero` (an embedding problem
  with abelian kernel and surjective `π` is solvable exactly when its obstruction vanishes).
- Internal Hom: `TauCeti.InternalHom`, `TauCeti.homAction`, `TauCeti.InternalHom.evalPairing`.
- Local fields: `TauCeti.AbsoluteGaloisGroup`, `TauCeti.absoluteGaloisGroupEquivFixingSubgroup`,
  `TauCeti.finiteExtension_isNonarchimedeanLocalField`, `TauCeti.KummerCoeff`,
  `TauCeti.ClassFieldTheory.dualityMap0_kummerCoeff_bijective`,
  `TauCeti.ClassFieldTheory.dualityMap1_kummerCoeff_bijective`,
  `TauCeti.ClassFieldTheory.dualityMap2_kummerCoeff_bijective` (for a nonarchimedean local field
  `K`, `n` invertible in `K` and a finite discrete module killed by `n`, Tate's duality maps are
  bijective; no hypothesis on the residue characteristic beyond invertibility of `n`) and
  `TauCeti.ClassFieldTheory.h2MuEquivZMod`.

### From TauCetiRoadmap.ProfiniteCohomology

- Layer 0 (discrete modules and continuous sections), Layer 1 (the canonical carrier and the
  coefficient dictionary `ofDiscreteModule`), Layer 2 (the explicit low-degree complex), Layer 3
  (the comparison isomorphisms, including the comparison with discrete `groupCohomology` for finite
  groups), Layer 5 (long exact sequences and their connecting maps, with their sign conventions),
  Layer 6 (low-degree corestriction), Layer 8 (the six low-degree cups, the evaluation pairing and
  the connecting-map compatibilities), Layer 9 (Hilbert 90 and Kummer theory,
  `H¹(K, μ_m) ≅ Kˣ/Kˣᵐ` for `m` invertible in `K`), Layer 10 (all-degree long exact sequences,
  corestriction with `cor ∘ res = [G : U]`, Shapiro), Layer 11 (cohomological dimension `cd_p`) and
  Layer 12 (the graded cup product with associativity and graded commutativity on cohomology).
- What ProfiniteCohomology must provide (gap:char-p-galois-h2-vanishing): for every field `K` of
  characteristic `p`, the second continuous cohomology `H²(Γ_K, ℤ/p)` of the trivial module vanishes,
  so that `cd_p(Γ_K) ≤ 1`, from the Artin–Schreier sequence `0 → ℤ/p → Kˢ → Kˢ → 0` and the vanishing
  of `H^q(Γ_K, Kˢ)` for `q ≥ 1`. HW use this fact in the proof of Proposition 5.3 (p. 19, citing
  Koch, *Galois theory of p-extensions*, Theorem 9.1).

### From TauCetiRoadmap.DGAInfinity

- Layer 1: unital DG algebras and DG categories over a commutative ring, with the Leibniz sign
  `d(ab) = d(a)b + (−1)^{|a|} a d(b)`, implemented at the pin by Tau Ceti's `TauCeti.IsDGAlgebra`
  and `TauCeti.DGCategoryData`; the cochain algebra of Layer 0 and the Hom-coefficient DG category
  of Layer 9 are objects of these carriers.
- Layer 8: matric Massey products and their defining systems, defined only when lower products and
  defining systems make them defined, with their indeterminacy recorded. Layer 0 uses them with all
  degrees one and Kraines' sign.
- What DGAInfinity must provide (gap:integral-gauge-massey-independence): for a unital DG algebra or
  DG category over any commutative ring, the set of values of a degree-one matric Massey product
  depends only on the cohomology classes of its adjacent inputs, proved by the finite unipotent
  gauge transformation `A ↦ G⁻¹AG + G⁻¹dG` with `G = 1 + U` and no rational coefficients.

### From TauCetiRoadmap.ProfiniteProPGroups

- Layer 5: extensions of a profinite group by a finite abelian module and their classification by
  `H²`, splitting of an extension exactly when its class vanishes, and finite embedding problems
  with their weak solutions, implemented by `TauCeti.FiniteEmbeddingProblem` and
  `TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero`. No surjectivity of a
  solution is assumed or produced.

### From TauCetiRoadmap.ClassFieldTheory

- Layer 5: local Tate duality for finite modules, consumed through the Tau Ceti theorems listed above
  and `TauCeti.ClassFieldTheory.h2MuEquivZMod` (`H²(Γ_K, μ_n) ≅ ℤ/n`).

### From TauCetiRoadmap.ArithmeticGaloisDuality

- §R02.1.4, *Pointwise Hom of discrete modules*, *The splitting torsor*, *The connecting map is cup
  product with the torsor class* and *Finitely generated `C`: the discrete case*: for an additively
  split exact sequence `0 → A → B → C → 0` of discrete modules with `C` finite, the additive sections
  form a torsor under the discrete module `Hom(C, A)`, its class `[γ] ∈ H¹(Γ, Hom(C, A))` vanishes
  exactly when an equivariant section exists, and the connecting map `H^m(Γ, C) → H^{m+1}(Γ, A)` is
  `[c] ↦ [γ ∪ c]`, on cochains `d(s ∘ c)(g₀, …, g_m) = γ(g₀)(g₀·c(g₁, …, g_m))`.
- §R02.3.0d, *Finite Galois localization and Sha kernels*: `Ш^i(K, A)` for a number field `K` and a
  finite module `A`, the Cartier dual `A^D`, and naturality in `A`.
- §R02.4.5a, *Finite-coefficient Poitou–Tate input*, statement (3): the perfect pairing
  `Ш²(K, A) × Ш¹(K, A^D) → ℚ/ℤ`. It is the pairing of §R02.4.3, *Poitou–Tate duality*, part (a),
  with the set of places taken to be all places of `K`, and that part states its naturality in the
  module: for a map `f : A → B` of finite modules, `⟨f_* a, b⟩ = ⟨a, f^D_* b⟩`.
- §R02.4.5b, *Grunwald–Wang and its exceptional class*: `Ш¹(K, μ_m)` is zero or of order two for
  every number field `K`, and `Ш¹(ℚ, μ₈) = 0`, `Ш²(ℚ, ℤ/8) = 0`.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

- §IG.4.1, *Finite abelian-kernel obstruction and pullback*: for an extension `1 → A → E → Q → 1` of
  finite groups with `A` abelian and a continuous `π : Γ → Q`, a continuous lift exists exactly when
  the pulled-back class vanishes, with no surjectivity hypothesis on `π`; the lifts up to
  `A`-conjugacy form a torsor under `H¹(Γ, A_π)`.
- §IG.4.2, *Twisting abelian-kernel solutions*: every weak solution is `zβ` for a unique crossed
  homomorphism `z`; and *Two independent cyclic degree-eight lifts*: for distinct primes
  `p ≡ q ≡ 1 (mod 8)`, characters `ψ₁, ψ₂ : Γ_ℚ → ℤ/8` lifting the quadratic characters of `ℚ(√p)`
  and `ℚ(√2q)`, with `(ψ₁, ψ₂)` surjective onto `(ℤ/8)²` and compositum `L` of degree `64` whose
  quadratic subfields are `ℚ(√p)`, `ℚ(√2q)`, `ℚ(√2pq)`.

### From TauCetiRoadmap.K2SymbolsBrauer

- §6.14, *The upper unipotent subgroup `T_n(A)` maps isomorphically onto `U_n(A)`*: for a commutative
  ring `A` and `m ≥ 3`, every element of `Uₘ(A)` is uniquely a product of elementary matrices in
  lexicographic order of the positions, with uniquely determined parameters. Layer 1 uses the same
  elimination for the increasing distance order.

## How to read the build

Layer 0 builds the continuous cochain algebra and its defining systems. Layer 1 turns defining
systems into lifts to unitriangular groups (Dwyer). Layers 2–6 are finite group theory of
`Uₙ₊₁(𝔽_p)`: the conjugation module `B` (Layer 2), powers and exponents (Layer 3), the Bogomolov
multiplier (Layer 4), cyclically trivial cohomology and fixed conjugacy classes (Layer 5) and the
examples that bound these results (Layer 6); they are what a homogeneous-space proof of global
Massey vanishing consumes, and Layers 7–11 do not use them. Layer 7 proves refined lifting at nonarchimedean local fields, Layer 8 at `ℝ` and `ℂ` and derives
local Massey vanishing. Layers 9–10 redo Layers 1 and 7–8 for coefficients in a system of Hom
modules and prove the rank-one twisted local lifting theorem. Layer 11 is independent of Layers
2–10: it uses Layers 0–1 and the arithmetic duality suppliers to build the `ℤ/8` counterexample.

## Layer 0: continuous cochains and degree-one defining systems

### 0.1 The continuous inhomogeneous cochain algebra

Let `Γ` be profinite and `R` a discrete commutative ring on which `Γ` acts continuously by ring
automorphisms. Define the continuous cochain algebra `C•_cts(Γ, R)` by `C^q = C(Γ^q, R)`, the
continuous maps, with `C⁰ = R`, the differential of the Conventions and the cup product
`(f ∪ g)(g₁, …, g_{r+s}) = f(g₁, …, g_r)·(g₁⋯g_r)·g(g_{r+1}, …, g_{r+s})`. Prove that it is a
strictly associative unital DG algebra over `ℤ`, and over the invariant subring `R^Γ`: `d² = 0`,
`d(f ∪ g) = df ∪ g + (−1)^r f ∪ dg` for arbitrary cochains of degree `r` and `s`,
`(f ∪ g) ∪ h = f ∪ (g ∪ h)` on the nose, and the constant `1 ∈ C⁰` is a two-sided unit. When the
action is trivial it is an `R`-DG algebra; in general the differential is not `R`-linear. Construct
it as an object of DGAInfinity Layer 1's DG algebra carrier: the internal direct sum `⊕_q C^q` with
this grading, differential and cup satisfies Tau Ceti's `TauCeti.IsDGAlgebra`. Give every `C^q` and the cohomology
groups the discrete topology; for compact `Γ^q` and discrete `R` this is the compact-open topology of
`C(Γ^q, R)`. In degrees at most two the cochains and differentials are the parent's:
`ContCohomology.C1`, `ContCohomology.d0`, `ContCohomology.d1`. (HW, Introduction, p. 1, for DG rings
and defining systems; HW, Remark 7.1, p. 25, for the translated cup.)
*Needs:* ProfiniteCohomology Layers 0 and 2; DGAInfinity Layer 1; Mathlib `ContinuousMap`; Tau Ceti
`TauCeti.IsDGAlgebra`, `ContCohomology.C1`, `ContCohomology.d0`, `ContCohomology.d1`.

- The degree-`q` cochains are the continuous maps `Γ^q → R` with pointwise addition, `C⁰ = R`, and
  two cochains are equal when they agree on every `q`-tuple (Mathlib `ContinuousMap.ext`).
- The differential is given on each degree by the displayed formula; in degree zero it is
  `d⁰m(g) = g·m − m` and in degree one `(d¹a)(g, h) = g·a(h) − a(gh) + a(g)`, the parent's maps.
- The cup product is strictly associative for arbitrary cochains, with no cocycle hypothesis, and
  the constant cochain `1` is a two-sided unit.
- For cochains of degrees `r` and `s` the Leibniz rule holds with the sign `(−1)^r`.
- A continuous homomorphism `Γ′ → Γ` together with an equivariant ring map `R → R′` induces a
  morphism of DG algebras `C•_cts(Γ, R) → C•_cts(Γ′, R′)`, compatibly with composition.

**Checks.**

- For trivial `Γ` every `C^q` is `R`, the differential out of an odd degree is the identity and out
  of an even degree is zero, so `H⁰ = R` and `H^q = 0` for `q ≥ 1`. A model with zero differential
  would give `H^q = R` in every degree.
- In bidegree `(1,1)`, `(a ∪ b)(g, h) = a(g)·(g·b(h))`, and for cocycles its class is
  `ContCohomology.explicitCup11` of the two classes with the multiplication pairing. Omitting the
  translation changes the value: for `Γ = ℤ/2 = ⟨σ⟩` acting on `𝔽₉ = 𝔽₃(i)` by `i ↦ −i`, with
  `a(σ) = 1` and `b(σ) = i`, the cup at `(σ, σ)` is `−i` while `a(σ)b(σ) = i`.
- For arbitrary `f, g, h ∈ C¹`, both bracketings of `f ∪ g ∪ h` at `(x, y, z)` equal
  `f(x)·(x·g(y))·(xy·h(z))`.
- The sign in the Leibniz rule is visible on non-cocycles: for `Γ = ℤ/3 = ⟨σ⟩`, `R = 𝔽₃` with
  trivial action and `f = g` the cochain with `f(σ) = 1`, `f(1) = f(σ²) = 0`, one has
  `(f ∪ dg)(σ, σ, σ) = 1·(1 − 0 + 1) = 2`, so the unsigned rule `d(f ∪ g) = df ∪ g + f ∪ dg` is off
  by `2(f ∪ dg) ≠ 0`.
- For `Γ = ∏_ℕ ℤ/2` and `R = 𝔽₂` with trivial action, `H¹` is the space `⊕_ℕ 𝔽₂` of continuous
  characters; in the pointwise topology inherited from all functions `Γ → 𝔽₂`, a finite set of
  evaluations never isolates the zero character, so the comparison uses the discrete topology, as
  `ContCohomology.DiscreteH1` does.

### 0.2 The comparison with continuous cohomology

Prove that for every `q ≥ 0` the `q`-th cohomology of `C•_cts(Γ, R)` is isomorphic, as a discrete
object of `TopModuleCat ℤ`, to `continuousCohomology` in degree `q` of `R` regarded as a discrete
module through the parent's coefficient dictionary, naturally in compatible pairs; that in degrees
`1` and `2` the isomorphism is `ContCohomology.explicitH1AddEquivContinuousCohomology` and
`ContCohomology.explicitH2AddEquivContinuousCohomology` (in degree `0`, the invariants); and that it
carries the cup product of 0.1 to the graded cup of ProfiniteCohomology Layer 12, agreeing in
bidegree `(1,1)` with `ContCohomology.explicitCup11`. Route: send an inhomogeneous cochain `f` to the
homogeneous cochain `F(g₀, …, g_q) = g₀·f(g₀⁻¹g₁, …, g_{q−1}⁻¹g_q)`, with inverse
`f(h₁, …, h_q) = F(1, h₁, h₁h₂, …, h₁⋯h_q)`; compact-open currying, available because `Γ` and its
finite powers are locally compact, identifies continuous equivariant homogeneous cochains with the
complex `TopRep.homogeneousCochains` that defines `continuousCohomology`; check the
two chain-map identities and the identity augmentation, and translate the Alexander–Whitney formula
of the parent's cup into the inhomogeneous cup. This is the explicit comparison with Mathlib's
`TopRep.resolutionX` and `TopRep.homogeneousCochains`
(`RepresentationTheory/Homological/ContCohomology/Basic.lean`), extending the degree-one and
degree-two comparisons of Tau Ceti (`RepresentationTheory/Homological/ContCohomology/CohomologyComparison.lean`,
`ContCohomology.explicitH1AddEquivContinuousCohomology` and
`ContCohomology.explicitH2AddEquivContinuousCohomology`); the chain maps in all degrees and their
compatibility with the cups are proved here.
*Needs:* 0.1; ProfiniteCohomology Layers 1, 3, 10 and 12; Mathlib `continuousCohomology`,
`TopRep.resolutionX`, `TopRep.homogeneousCochains`; Tau Ceti
`ContCohomology.explicitH1AddEquivContinuousCohomology`,
`ContCohomology.explicitH2AddEquivContinuousCohomology`, `ContCohomology.explicitCup11`.

**Checks.**

- In degree one the round trip is the identity: `F(1, h) = 1·f(1⁻¹h) = f(h)`.
- For trivial `Γ` both sides are `R` in degree `0` and zero above, by the first Check of 0.1.
- For a finite discrete `Γ` the comparison agrees with the parent's comparison with discrete
  `groupCohomology` (ProfiniteCohomology Layer 3), since every cochain is continuous.

### 0.3 Degree-one defining systems and Massey products

For `n ≥ 1` and continuous `1`-cocycles `a₀₁, …, a_{n−1,n}` with values in `R`, a defining system is
a family of continuous `1`-cochains `a_ij`, `0 ≤ i < j ≤ n`, `(i, j) ≠ (0, n)`, with the given
adjacent entries and `d a_ij = −Σ_{i<m<j} a_im ∪ a_mj`; its value is the class in `H²(Γ, R)` of the
`2`-cocycle `−Σ_{0<m<n} a_0m ∪ a_mn`. For classes `α_i ∈ H¹(Γ, R)` the Massey product
`⟨α₀, …, α_{n−1}⟩ ⊆ H²(Γ, R)` is the set of values of the defining systems whose adjacent entries
represent the `α_i`; it is defined when nonempty and contains zero when some value vanishes. This is
DGAInfinity Layer 8's degree-one matric defining system specialized to `C•_cts(Γ, R)` with every
pairing the ring multiplication, in Kraines' sign (HW, Introduction, p. 1 and footnote 1; Dwyer's
convention differs by a sign). When `Γ` acts trivially on `R`, `d⁰ = 0` (Tau Ceti
`ContCohomology.B1_eq_bot_of_smul_eq_self`), so every class of `H¹(Γ, R)` has exactly one
representative, a continuous homomorphism `Γ → (R, +)`; the definition then reads as the structure
`DefiningSystem` of `Suggested.lean` (for a discrete commutative ring `R`), with fields
`DefiningSystem.entry`, `DefiningSystem.continuous_entry`, `DefiningSystem.entry_castSucc_succ`, the
defining equation `DefiningSystem.entry_mul`, which is `d a_ij = −Σ a_im ∪ a_mj` written out:
`a_ij(gh) = a_ij(g) + a_ij(h) + Σ_{i<m<j} a_im(g)a_mj(h)`, and the normalization
`DefiningSystem.entry_eq_zero`: the entries with `j ≤ i`, and for `n ≥ 2` the corner `(0, n)`, are
zero. For `n = 1` the corner is the adjacent entry and is not normalized. Its value is `DefiningSystem.value`,
`(g, h) ↦ −Σ_{0<m<n} a_0m(g)a_mn(h)`, and `MasseyDefined` and `MasseyContainsZero` are the two
conditions, the second asking that some value be the coboundary `(g, h) ↦ f(h) − f(gh) + f(g)` of a
continuous cochain `f`.
*Needs:* 0.1, 0.2; DGAInfinity Layer 8; ProfiniteCohomology Layer 2; Tau Ceti `ContCohomology.Z1`,
`ContCohomology.Z2`, `ContCohomology.B2`, `ContCohomology.B1_eq_bot_of_smul_eq_self`;
Mathlib `Finset.Ioo`.

- DGAInfinity Layer 8's degree-one defining systems in `C•_cts(Γ, R)` correspond to families of
  continuous cochains with the displayed equations; for trivial coefficients these families are the
  structures `DefiningSystem`.
- The adjacent entries of a defining system are continuous cocycles, and every other permitted entry
  satisfies the defining equation.
- The value of a defining system is a continuous `2`-cocycle, by strict associativity and the
  Leibniz rule of 0.1, and its class is transported to `continuousCohomology` by 0.2.
- `MasseyDefined` holds exactly when the Massey product is nonempty, and `MasseyContainsZero` exactly
  when it contains zero.
- Restriction along a continuous homomorphism `Γ′ → Γ` carries defining systems to defining systems
  and values to restricted values, so it maps the Massey product into the Massey product of the
  restricted classes.
- Two defining systems over the same adjacent cocycles are equal when their permitted entries agree:
  the other entries are zero by the normalization, and the equations and continuity are
  propositions.

**Checks.**

- For `n = 2` there is exactly one defining system over given cocycles and the product is
  `{−α₀ ∪ α₁}`. Over `Γ = (ℤ/3)²` with `R = 𝔽₃` and the coordinate characters `x, y`, the value is
  `−x ∪ y ≠ x ∪ y`, so a definition in Dwyer's sign gives a different set.
- For `n = 4` and all four inputs zero over the same `Γ`, the entries `a₀₂ = x`, `a₂₄ = y` and all
  other entries zero form a defining system with value `−x ∪ y ≠ 0`, while the all-zero family has
  value `0`. So zero inputs give a product containing zero, not a product equal to `{0}`.
- For `n = 3` a defining system exists exactly when `α₀ ∪ α₁ = 0` and `α₁ ∪ α₂ = 0`; when either
  cup is nonzero the product is empty and no value is assigned.
- For finite discrete `Γ` every cochain is continuous and the definition is the ordinary
  inhomogeneous one.
- For `n = 1` the structure `DefiningSystem` imposes no equation and its value is the empty sum, so
  `MasseyContainsZero` holds for every cochain, homomorphism or not. This is why Dwyer's criteria
  assume `n ≥ 2`.
- For `Γ = 1`, `R = 𝔽₂`, `n = 2` and `χ = 0` there is exactly one defining system, all of whose
  entries are zero. Without the normalization, setting the diagonal entry `(0,0)` to the constant
  `1` would give a second family with the same permitted entries and the same lift, and the
  correspondence of 1.5 would not be injective.

### 0.4 Independence of representatives

Prove that for a discrete commutative `Γ`-ring `R` the set of values of the defining systems over
adjacent cocycles `a_{i,i+1}` depends only on their classes: if `a′_{i,i+1} = a_{i,i+1} + du_i`, the
two sets of values agree. In particular whether the product is defined, and whether it contains
zero, depends only on the classes. Route: write a defining system as a strictly upper triangular
matrix `A` of `1`-cochains with zero corner, so that `dA + A²` is supported at the corner; for the
degree-zero gauge `G = 1 + U` with `U_{i,i+1} = u_i`, whose inverse is a finite geometric series,
`A′ = G⁻¹AG + G⁻¹dG` has adjacent entries `a′_{i,i+1}` and curvature `G⁻¹(dA + A²)G`, which has the
same corner because `G⁻¹E₀ₙG = E₀ₙ`; clearing the corner of `A′` changes the value by a coboundary;
the inverse gauge gives the reverse inclusion. Only finite sums and products occur, so the argument
works over `𝔽_p` and `ℤ/8` and preserves continuity. This is the specialization to `C•_cts(Γ, R)` of
the statement DGAInfinity must provide (gap:integral-gauge-massey-independence). For trivial
coefficients the statement is empty, every class having one representative. (HW, §7, p. 26, which
records that changing the cocycles conjugates the adjacent character.)
*Needs:* 0.3; DGAInfinity Layer 8 (gap:integral-gauge-massey-independence); ProfiniteCohomology
Layer 2.

**Checks.**

- For `n = 2` the gauge changes the value by
  `−(du₀ ∪ a₁₂ + a₀₁ ∪ du₁ + du₀ ∪ du₁) = −d(u₀ ∪ a₁₂ − a₀₁ ∪ u₁ + u₀ ∪ du₁)`, a coboundary, as `a₀₁`
  and `a₁₂` are cocycles: the class `−α₀ ∪ α₁` depends only on the classes. The middle sign comes
  from `d(a₀₁ ∪ u₁) = −a₀₁ ∪ du₁` (Leibniz rule with `(−1)¹`): for `Γ = ℤ/2` acting on `𝔽₉` by
  `i ↦ −i`, `u₀ = a₁₂ = 0`, `u₁ = i` and `a₀₁ = d⁰i`, both sides are `−1 = 2` at `(σ, σ)`, while
  `+a₀₁ ∪ u₁` would give `1`.
- For `Γ = ℤ/2` acting on `𝔽₉ = 𝔽₃(i)` by `i ↦ −i`, the coboundary `d⁰u(σ) = σ(u) − u` is `−2i = i`
  for `u = i`, so a class of `H¹` has several representatives and the statement has content; for
  trivial action `d⁰ = 0` and it is empty.
- The gauge never divides: over `ℤ/8`, `G⁻¹ = 1 − U + U² − ⋯ ± Uⁿ` is a polynomial in `U`, since
  `Uⁿ⁺¹ = 0`.

### Examples

- Over `Γ = (ℤ/p)²`, `R = 𝔽_p`, `p` odd, with coordinate characters `x, y`, the triple product
  `⟨x, 0, y⟩` is defined, and its values are the classes `−(x ∪ v + u ∪ y)` for all homomorphisms
  `u = a₀₂` and `v = a₁₃`: it contains `0` (take `u = v = 0`) and the nonzero class `−x ∪ y`
  (take `u = x`, `v = 0`).
- For `Γ = ℤ/2 = ⟨σ⟩` and `R = 𝔽₂`, `⟨χ, χ⟩ = {χ ∪ χ}` for the nonzero character `χ`, and
  `χ ∪ χ ≠ 0` in `H²(ℤ/2, 𝔽₂) = 𝔽₂`: `MasseyDefined` holds and `MasseyContainsZero` fails at `n = 2`.

### Dependencies

ProfiniteCohomology Layers 0, 1, 2, 3, 10 and 12; DGAInfinity Layers 1 and 8 (with
gap:integral-gauge-massey-independence); Mathlib `continuousCohomology`, `ContinuousMap`; Tau Ceti's
explicit low-degree cohomology and `ContCohomology.explicitCup11`.

## Layer 1: unitriangular quotients and Dwyer's criteria

### 1.1 Factorization in increasing distance

Prove that for every commutative ring `R` and `n ≥ 0` the elementary matrices `e_ij(t)`, `i < j`,
lie in `Uₙ₊₁(R)`, and that the map sending a family `(t_ij)_{i<j}` to the product of the `e_ij(t_ij)`,
ordered by increasing distance `j − i` and, within one distance, by increasing `i`, is a bijection
`R^{n(n+1)/2} → Uₙ₊₁(R)`. The parameters of distance `d` are the entries of distance `d` minus
polynomials in the parameters of smaller distance; they are not the entries themselves. Restricting
the product to the factors of distance greater than `m` gives a bijection onto `Uᵐ`. Route:
eliminate the superdiagonals in order of distance, using the additivity and commutator formulas of
Tau Ceti's transvections; uniqueness because the distance-`d` entry of the ordered product is
`t_ij` plus a polynomial in parameters of smaller distance. The lexicographic version is
K2SymbolsBrauer §6.14. (HW, §2, p. 4, for generation of `Uᵐ` by elementary matrices; Michailov,
§3, p. 5.)
*Needs:* Tau Ceti `TauCeti.upperUnitriangularGroup`, `TauCeti.UpperUnitriangularGroup.ext`,
`TauCeti.transvectionUnit`, `TauCeti.commutatorElement_transvectionUnit`,
`TauCeti.commute_transvectionUnit`, `Matrix.IsUpperUnitriangular`.

**Checks.**

- In `U₃(R)`, `e₀₁(a)e₁₂(b)e₀₂(c)` has `(0,2)` entry `c + ab`: computed over `𝔽₇` with
  `(a, b, c) = (2, 3, 5)` it is `4`, not `5`. Raw entries cannot be the parameters in this order.
- For the zero ring both sides are one-point sets; for `n = 0` the product is empty and `U₁ = 1`.
- In `U₄(R)` the factors of distance at least two are `e₀₂, e₁₃, e₀₃`, and their products are
  exactly `U¹`, which has `|R|³` elements for finite `R`.

### 1.2 Exact superdiagonal commutators

Prove that for every commutative ring `R`, `n ≥ 0` and `a, b ≥ 0`, `[Uᵃ, Uᵇ] = U^{a+b+1}` in
`Uₙ₊₁(R)` (HW indexing; in Tau Ceti's indexing `[U⁽ʳ⁾, U⁽ˢ⁾] = U⁽ʳ⁺ˢ⁾` for `r, s ≥ 1`). The
inclusion `≤` is Tau Ceti's `commutator_superdiagonalSubgroup_le`. For the reverse inclusion write
`e_ij(t) = [e_ik(t), e_kj(1)]` with `k = i + a + 1` for every `j − i ≥ a + b + 2`, by
`TauCeti.commutatorElement_transvectionUnit`, and generate `U^{a+b+1}` by 1.1. Consequently the
lower central series of `U` is `γ_k(U) = U^{k−1}` for `k ≥ 1`; `[U, U] = U¹` and `[U¹, U¹] = U³`;
`γₙ(U) = U^{n−1} = Z` and `γₙ₊₁(U) = 1`. (HW, §2, p. 4, over `𝔽_p`; Michailov, (3.2), p. 5, over
`𝔽_p`. The proof works over every commutative ring.)
*Needs:* 1.1; Tau Ceti `UpperUnitriangularGroup.superdiagonalSubgroup`,
`UpperUnitriangularGroup.commutator_superdiagonalSubgroup_le`,
`TauCeti.commutatorElement_transvectionUnit`.

**Checks.**

- In `U₅(𝔽₂)` the subgroup generated by commutators of `U⁰` with `U⁰`, `U⁰` with `U¹`, `U⁰` with
  `U²`, `U¹` with `U¹` has `64, 8, 2, 2` elements, the orders of `U¹, U², U³, U³`, by exhaustive
  computation.
- In `U₃(𝔽_p)`, `[e₀₁(1), e₁₂(1)] = e₀₂(1) ≠ 1`, so `γ₂(U₃) = Z` is not trivial. The statement that
  `γ_{m−1}(Uₘ)` is trivial (Michailov, p. 5) fails here; `γₘ(Uₘ)` is the trivial term.
- The forward inclusion alone does not identify `[U¹, U¹]`: in `U₅(𝔽_p)`,
  `[e₀₂(1), e₂₄(1)] = e₀₄(1)` exhibits the distance-four generator.

### 1.3 The adjacent quotient

Define the adjacent quotient `A = U/U¹` and prove that for every commutative ring `R` and `n ≥ 1` the
adjacent-entry map `U → (Rⁿ, +)`, `g ↦ (g_{i,i+1})_i`, is a surjective homomorphism with kernel `U¹`,
so that `A ≅ Rⁿ`; for finite `R` all three groups are finite and discrete. Over `𝔽_p`, 1.2 identifies
`A` with the abelianization of `U`. (HW, §2, p. 4.)
*Needs:* 1.1, 1.2; Tau Ceti `TauCeti.upperUnitriangularGroup`.

- The coordinate isomorphism `A ≅ Multiplicative (Rⁿ)` sends the class of `g` to its adjacent
  entries.
- The `i`-th coordinate of the class of `g` is `g_{i,i+1}`, and the kernel of the coordinate map is
  exactly `U¹`.
- A ring map `R → R′` commutes with the quotient and with every coordinate (Tau Ceti
  `UpperUnitriangularGroup.map`).

**Checks.**

- The adjacent entries of `gh` are `g_{i,i+1} + h_{i,i+1}` even though the `(0,2)` entry of `gh` has
  the cross term `g₀₁h₁₂`.
- In `U₃(R)` the kernel consists exactly of the corner elements `e₀₂(t)`.
- For the zero ring `U` and `A` both have one element; for `n = 1`, `U¹ = 1` and `A = U ≅ R`.

### 1.4 The corner extension

For `n ≥ 1` and every commutative ring `R`, prove that the centre `Z` of `U` (Mathlib
`Subgroup.center`) is the corner subgroup `{e₀ₙ(t) : t ∈ R} = U^{n−1}`, isomorphic to `(R, +)`.
Define the corner extension `1 → Z → U → U/Z → 1` with its normalized section `s` that sets the
corner entry to zero, and prove that its factor set is

```text
s(x) s(y) s(xy)⁻¹ = e₀ₙ( Σ_{0<m<n} x₀ₘ y_{mn} ),
```

with a plus sign, so that its class `u ∈ H²(U/Z, R)`, trivial action, classifies the extension.
(HW, §2, pp. 4–5.)
*Needs:* 1.1, 1.3; ProfiniteProPGroups Layer 5; Mathlib `Subgroup.center`; Tau Ceti
`TauCeti.FactorSet.exists_cohomologyClass_eq`.

- `t ↦ e₀ₙ(t)` is an injective homomorphism `R → U` with image the centre.
- The section `s` is normalized, `s(1) = 1`, and its factor set has the displayed positive sum.
- The class `u` is the canonical extension class in `H²(U/Z, R)`, natural under ring maps
  `R → R′`.

**Checks.**

- For `[[1, a, c], [0, 1, b], [0, 0, 1]]` in `U₃(R)` the factor set is `a·b′` for the pair of classes
  `(a, b)`, `(a′, b′)`: computed over `𝔽₅` with `(2, 3)` and `(4, 1)` it is `2`.
- `e₀ₙ(t) = 1` exactly when `t = 0`.
- In `U₄(𝔽_p)` the element `e₀₂(t)`, `t ≠ 0`, is not central: `[e₀₂(t), e₂₃(1)] = e₀₃(t)`. So `Z` is
  not the subgroup of matrices vanishing off the first row.
- For `n = 1`, `Z = U ≅ R`, `U/Z = 1` and `u = 0`.

### 1.5 Dwyer's correspondence

Let `Γ` be a topological group, `R` a discrete commutative ring with trivial action, `n ≥ 2`, and
`χ₀, …, χ_{n−1} : Γ → R` continuous homomorphisms, with `α = (χ_i) : Γ → A`. Prove: (1) defining
systems with adjacent entries `χ_i` (structures `DefiningSystem` over `χ`) correspond bijectively to
continuous homomorphisms `β : Γ → U/Z` lifting `α`, by `a_ij(g) = β(g)_ij` for `i < j`,
`(i, j) ≠ (0, n)`, the other entries being zero by `DefiningSystem.entry_eq_zero`, which is well
defined because multiplying by `Z` changes only the corner; (2) the value of the
defining system attached to `β` is `−β*u`. (HW, Proposition 2.2, p. 5; Dwyer, Theorem 2.4, in the
opposite sign convention.) Route: the `(i, j)` entry of `β(gh) = β(g)β(h)` is the equation
`DefiningSystem.entry_mul`; continuity of every entry into the discrete `R` is openness of the kernel
of `β`, as `U/Z` is discrete; the corner of `s(β(g))s(β(h))` is `+Σ a₀ₘ(g)a_{mn}(h)`, the negative of
the value.
*Needs:* 0.3, 1.3, 1.4.

**Checks.**

- For `n = 2` the value is `−χ₀ ∪ χ₁`, while the pulled-back extension class `β*u` is `+χ₀ ∪ χ₁`.
- For `n = 2`, `U/Z = A` and the unique lift is `α` itself, matching the unique defining system.
- The trivial homomorphism `Γ → U/Z` corresponds to the all-zero defining system over zero inputs.

### 1.6 Dwyer's criteria

Prove `masseyDefined_iff_exists_lift` and `masseyContainsZero_iff_exists_lift`: for a topological
group `Γ`, a discrete commutative ring `R` with trivial action, `n ≥ 2` and cochains
`χ₀, …, χ_{n−1} : Γ → R`, the Massey product is defined exactly when there is a continuous
homomorphism `β : Γ → U/Z` whose adjacent entries are the `χ_i`, and contains zero exactly when there
is such a continuous homomorphism `Γ → U`. Neither side asks for surjectivity, and neither side needs
the `χ_i` to be assumed homomorphisms: both force it. For the second criterion, a lift `Γ → U` gives a
defining system by its noncorner entries, and its corner entry `f` satisfies
`value(g, h) = f(h) − f(gh) + f(g)`; conversely a continuous primitive of a value is a corner entry.
For profinite `Γ` and finite `R` the second criterion also reads: some lift `β` to `U/Z` has
`β*u = 0`, that is, the pulled-back central extension splits (Tau Ceti
`TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero` when `β` is surjective,
InverseGaloisAndArithmeticFundamentalGroups §IG.4.1 in general). The quantifier is over lifts: one
lift to `U/Z` can fail to lift to `U` while another lifts (HW, Corollary 2.3 and Remark 2.4, p. 5).
At `n = 2` the second criterion is Tau Ceti's `ContCohomology.explicitCup11_eq_zero_iff` with the
multiplication pairing: a Heisenberg cochain (`ContCohomology.IsHeisenbergCochain`) is the corner
entry of a lift to `U₃(R)`.
*Needs:* 0.3, 1.5; ProfiniteProPGroups Layer 5; InverseGaloisAndArithmeticFundamentalGroups
§IG.4.1; Tau Ceti `TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero`,
`ContCohomology.explicitCup11_eq_zero_iff`; Mathlib `Subgroup.center`, `QuotientGroup.mk`.

**Checks.**

- For `n = 3` over `Γ = (ℤ/p)²`, `p` odd, inputs `(x, 0, y)`: the lift with `a₀₂ = x`, `a₁₃ = 0` has
  value `−x ∪ y ≠ 0` and does not lift to `U₄`, while the lift with `a₀₂ = a₁₃ = 0` has value `0` and
  lifts. A criterion "every lift to `U/Z` lifts to `U`" is false.
- For `n = 3`, a lift to `U/Z` exists exactly when both adjacent cups vanish, by 0.3.
- Zero inputs give the trivial lift to `U`, so `MasseyContainsZero` holds for them.

### Examples

- Over `Γ = ℤ/2` and `R = 𝔽₂` with the nonzero character `χ`, the pair `(χ, χ)` lifts to
  `U₃(𝔽₂)/Z ≅ (ℤ/2)²` but not to `U₃(𝔽₂) ≅ D₈`, because an element of `D₈` mapping to `(1, 1)` has
  order four; this is `χ ∪ χ ≠ 0`.
- Over `Γ = ℤ/4` and `R = 𝔽₂` with the surjective character `χ`, `(χ, χ)` lifts to `U₃(𝔽₂) ≅ D₈`
  (an element of order four maps to `(1, 1)`), and `χ ∪ χ = 0` in `H²(ℤ/4, 𝔽₂)`.

### Dependencies

Layer 0; ProfiniteProPGroups Layer 5; InverseGaloisAndArithmeticFundamentalGroups §IG.4.1;
K2SymbolsBrauer §6.14; Tau Ceti unitriangular groups, transvections, factor sets and
`TauCeti.FiniteEmbeddingProblem`.

## Layer 2: abelianized stabilizers and explicit conjugation

Throughout, `p` is prime, `R = 𝔽_p`, `n ≥ 2` and `U = Uₙ₊₁(𝔽_p)`.

### 2.1 The abelianized stabilizer `B`

Define `B = U¹/U³`, an `𝔽_p`-vector space with basis the classes `e_ij` of the elementary matrices of
distance `j − i ∈ {2, 3}`, of dimension `(n − 1) + (n − 2) = 2n − 3`. Prove that the coordinate of the
class of `g ∈ U¹` at `(i, j)` is the entry `g_ij`, that `B` is the abelianization of `U¹` (by 1.2,
`[U¹, U¹] = U³`), and that conjugation in `U` induces an action of `A` on `B`. (HW, §4, p. 12.)
Route: products in `U¹` add distance-two and distance-three entries, since a product of two terms of
distance at least two has distance at least four; 1.1 gives surjectivity.
*Needs:* 1.1, 1.2, 1.3.

- `B` is the quotient `U¹/U³` with its `𝔽_p`-module structure and the basis `e_ij`,
  `j − i ∈ {2, 3}`.
- The `(i, j)` coordinate of the class of `g` is `g_ij`.
- Conjugation in `U` induces a linear action `A → GL(B)`; inner conjugation by `U¹` acts trivially.
- The basis has exactly `2n − 3` elements.

**Checks.**

- For `n = 2`, `U¹` is the corner and `B = 𝔽_p`, spanned by `e₀₂`.
- For `n = 3`, `U³ = 1`, `B = U¹` has basis `e₀₂, e₀₃, e₁₃` and dimension three.
- Every `e_ij(t)` with `j − i ≥ 4` maps to zero in `B`.
- Over `𝔽₃` with `n = 4`, `e₀₂(1)e₂₄(1) = 1 + E₀₂ + E₂₄ + E₀₄` has corner entry `1`, while
  `e₂₄(1)e₀₂(1) = 1 + E₀₂ + E₂₄` has corner entry `0`; both have image `e₀₂ + e₂₄` in `B`, the
  corner being of distance `4`. The raw entries of a representative are not an invariant of `B`.
- Two representatives of the same class of `A` induce the same linear map of `B`.

### 2.2 The action formula

Prove that for an adjacent generator `e_{i,i+1}` and a basis vector `e_kl` of `B`,

```text
e_{i,i+1} · e_kl = e_kl + e_il   if i + 1 = k,
e_{i,i+1} · e_kl = e_kl − e_kj   if i = l, where j = i + 1,
e_{i,i+1} · e_kl = e_kl          otherwise,
```

where `e_il` and `e_kj` are read as zero when their distance is at least four, and that for the
parameter `t` the added term is multiplied by `t`. (HW, (4.2), p. 12.) Route: the forward and reverse
chaining commutator formulas of Tau Ceti; extend linearly and compose to get the action of every
`a ∈ A`. The action on `B` is not trivial although `B` is abelian.
*Needs:* 2.1; Tau Ceti `TauCeti.commutatorElement_transvectionUnit`,
`TauCeti.commutatorElement_transvectionUnit_reverse`.

**Checks.**

- For `n = 5` over `𝔽₃` the formula agrees with conjugation by the sparse lifts of the adjacent
  generators on all seven basis vectors of `B`, by direct matrix multiplication.
- `e₁₂·e₂₄ = e₂₄ + e₁₄` and `e₂₃·e₀₂ = e₀₂ − e₀₃`, with the minus sign.
- `e₀₁·e₁₄ = e₁₄` in `B`, since the added term `e₀₄` has distance four.

### 2.3 The boundary submodule

For `n ≥ 3`, define `B_bdry ⊆ B` as the span of `e₀₂, e₀₃, e_{n−3,n}, e_{n−2,n}` (HW's `B₀`, §4,
p. 15). Prove that it is `A`-stable; that for `n = 3` the vectors `e₀₃` and `e_{n−3,n}` coincide and
`B_bdry = B` has dimension three; and that for `n > 3` the four vectors are distinct and `B_bdry`
has dimension four. Restriction `B^D → B_bdry^D` is equivariant for the contragredient action
twisted by the cyclotomic character.
*Needs:* 2.1, 2.2.

- `B_bdry` is the submodule generated by the four displayed vectors, not their external direct sum.
- The inclusion `B_bdry → B` is injective and `A`-equivariant.
- Its deduplicated basis has three elements for `n = 3` and four for `n > 3`.
- Restriction of characters `B^D → B_bdry^D` is equivariant.

**Checks.**

- At `n = 3` the corner `e₀₃` occurs twice in the list and once in the basis.
- At `n = 4` the basis is `e₀₂, e₀₃, e₁₄, e₂₄`, of dimension four inside the five-dimensional `B`.
- At `n = 5`, `e₁₃ ∈ B` lies outside `B_bdry`.
- For `n > 3`, `A` moves the left block `⟨e₀₂, e₀₃⟩` only through the coordinate `a₂`
  (`e₂₃·e₀₂ = e₀₂ − e₀₃`) and the right block `⟨e_{n−3,n}, e_{n−2,n}⟩` only through `a_{n−3}`.

### 2.4 Sparse conjugation

For `a = (a₀, …, a_{n−1}) ∈ A` let `S = 1 + Σ a_i E_{i,i+1}` be its sparse lift. Prove that
`(S⁻¹)_ij = (−1)^{j−i} Π_{i≤l<j} a_l` for `i ≤ j`, and that for `Q ∈ U¹` the matrix `M = SQS⁻¹` has

```text
M_ij = Q_ij + Σ_{m=i+2}^{j−1} (−1)^{j−m} (Q_im a_m − a_i Q_{i+1,m+1}) Π_{l=m+1}^{j−1} a_l,
```

with empty sums zero and empty products one. In particular `M_ij = Q_ij` for `j − i ≤ 2` and
`M_{i,i+3} = Q_{i,i+3} − Q_{i,i+2}a_{i+2} + a_iQ_{i+1,i+3}`. This exact formula, not only the action
on `B`, is what the fixed-class arguments of Layer 5 use. (HW, Remark 4.10, (4.8), p. 15.)
*Needs:* 1.1, 2.1, 2.2.

**Checks.**

- Over `𝔽₃`, for `n = 3, …, 6` and forty random pairs `(a, Q)` each, all `1360` entries of `SQS⁻¹`
  above the adjacent diagonal agree with the formula, and `S⁻¹` agrees with the product formula.
- The distance-three term keeps its minus sign: over `𝔽₃` with `a₂ = 1`, `Q₀₂ = 1` and the other
  entries zero, `M₀₃ = −1 = 2`, not `1`.
- If all `a_i = 0` then `S = 1` and `M = Q`.

### 2.5 The reversal involution

Let `P` be the permutation matrix of `i ↦ n − i`. Define `τ(g) = (P g⁻¹ P⁻¹)ᵗ` and prove that it is
an involutive automorphism of `U` with `τ(e_ij(t)) = e_{n−j,n−i}(−t)`, that it preserves every `Uᵐ`,
and that it induces involutions of `A` and `B` and of the set of conjugacy classes of `U¹`
compatible with the actions: `τ(a·b) = τ(a)·τ(b)`. The sparse lift of `τ(a)` is in general not
`τ` of the sparse lift of `a`; the discrepancy is a conjugation and disappears on conjugacy classes.
(HW, Remark 4.11, p. 15.)
*Needs:* 1.1, 1.2, 2.1.

- `τ` is a group automorphism of `U` with `τ ∘ τ = id`.
- `τ(e_ij(t)) = e_{n−j,n−i}(−t)`.
- `τ` maps each `Uᵐ` onto itself.
- The induced maps on `A` and `B` satisfy `τ(a·b) = τ(a)·τ(b)`.

**Checks.**

- `τ(τ(g)) = g` and `τ(gh) = τ(g)τ(h)` for twenty random pairs in `U₅(𝔽₂)` and in `U₅(𝔽₃)`; the
  identity holds at `p = 2`, where `−t = t`.
- In `U₄(𝔽₃)`, `τ(e₀₂(1)) = e₁₃(−1) = e₁₃(2)`.
- In `U₃(𝔽_p)` with both adjacent entries one, `τ(S)₀₂ = 1 ≠ 0`, so `τ(S)` is not the sparse lift
  of its class.

### Examples

- For `n = 4` and `a = (1, 1, 0, 1)` over `𝔽₂`, the action on `B` in the basis
  `(e₀₂, e₀₃, e₁₃, e₁₄, e₂₄)` is an involution, computed in Layer 6.
- For `n = 3` and every `a`, `B = B_bdry` and `e₀₃` is fixed by `A`.

### Dependencies

Layer 1; Tau Ceti transvection commutators.

## Layer 3: nilpotent support and outer exponents

### 3.1 Support submodules

For a commutative ring `R`, `n ≥ 0` and `d ≥ 0`, define `N_d` as the `R`-submodule of
`(n+1) × (n+1)` matrices `M` with `M_ij = 0` whenever `j < i + d`. Prove `N_r N_s ⊆ N_{r+s}`,
`N_d = 0` for `d > n`, and that `g ∈ U` lies in `Uᵐ` exactly when `g − 1 ∈ N_{m+1}`; the last is
Tau Ceti's `mem_superdiagonalSubgroup_iff` read as a submodule statement. Tau Ceti's proof of the
filtration uses the same support condition internally; this target is its public linear-algebra
form, not a second filtration. (HW, §4, p. 13.)
*Needs:* Tau Ceti `UpperUnitriangularGroup.mem_superdiagonalSubgroup_iff`.

- `N_d` is a submodule of the matrices, with membership the displayed vanishing condition.
- `M ∈ N_r` and `M′ ∈ N_s` imply `MM′ ∈ N_{r+s}`.
- `g ∈ Uᵐ` exactly when `g − 1 ∈ N_{m+1}`.
- `N_d = 0` for `d > n`.

**Checks.**

- `N₀` contains the identity and is the upper triangular submodule, not the strictly upper one.
- `N_n` is the corner line `R·E₀ₙ` and `N_{n+1} = 0`.
- `E₀₂E₂₄ = E₀₄ ∈ N₄`, while `E₂₄E₀₂ = 0`.
- `g − 1 ∈ N₁` for every `g ∈ U`.

### 3.2 The exponent bound for `U¹`

Prove that for `p` prime, `g ∈ U¹ ⊆ Uₙ₊₁(𝔽_p)` and `m ≥ 0` with `2p^m > n`, `g^{p^m} = 1`. Route:
`g = 1 + M` with `M ∈ N₂`; in the commutative subalgebra generated by `M`,
`(1 + M)^{p^m} = 1 + M^{p^m}`, and `M^{p^m} ∈ N_{2p^m} = 0`. The binomial step uses commutativity of
`1` and `M` only. (HW, Lemma 4.6, p. 14.)
*Needs:* 3.1; 1.2.

**Checks.**

- At `p = 3`, `n = 6`, `g = 1 + E₀₂ + E₂₄ + E₄₆` has `g³ = 1 + E₀₆ ≠ 1` and `g⁹ = 1`: the bound with
  `2·3 = 6 > 6` fails and the bound with `m = 2` holds.
- At `p = 2` and `n ≤ 6` the exponent of `U¹` divides `4`.
- For `2 ≤ n ≤ 2p − 1` the exponent of `U¹` is exactly `p`: it divides `p` by the bound with
  `m = 1`, and `e₀₂(1)` has order `p`. For `n ≤ 1`, `U¹ = 1` and the exponent is `1`, not `p`.

### 3.3 The outer exponent

For a finite group `H` of exponent `d`, the units `(ℤ/d)ˣ` act on Mathlib's `ConjClasses H` by
`[h] ↦ [h^a]` (well defined by `IsConj.pow` and `h^d = 1`). Define the outer exponent of `H` as the
least positive divisor `e` of `d` such that units congruent modulo `e` act in the same way, so that
the action factors through the surjective reduction `(ℤ/d)ˣ → (ℤ/e)ˣ`. Record factorization and
minimality separately; `e = d` is always admissible, and the outer exponent need not equal the
exponent. (HW, Definition 3.2, p. 9.)
*Needs:* Mathlib `ConjClasses`, `IsConj.pow`.

- The outer exponent divides the exponent of `H`.
- If `a ≡ b` modulo the outer exponent and `a, b` are prime to `d`, then `[h^a] = [h^b]` for all `h`.
- Every admissible divisor is at least the outer exponent.
- Isomorphic finite groups have the same outer exponent.

**Checks.**

- The outer exponents of `C₁, C₂, C₄, C₆` are `1, 1, 4, 3`, computed from the definition. For `C₂`
  the unit group modulo two is trivial; for `C₄` inversion is nontrivial and does not factor through
  units modulo `1` or `2`; for `C₆` it factors through `(ℤ/3)ˣ` although the exponent is `6`.
- For a nontrivial elementary abelian `p`-group with `p` odd the outer exponent is `p`; for `p = 2`
  it is `1`, smaller than the exponent `2`; for the trivial group it is `1` for every `p`.
- The outer exponent depends on the conjugacy classes, not only on element orders: `C₄` and the
  quaternion group `Q₈` both have exponent `4`, but in `Q₈` every element is conjugate to its inverse,
  so its outer exponent is `1`, while that of `C₄` is `4`.

### 3.4 Outer powering in small rank

Prove `isConj_pow_superdiagonalSubgroup_two`: for every prime `p`, every `n ≤ 6`, every `Q` in
`U¹ = UpperUnitriangularGroup.superdiagonalSubgroup 2 ⊆ Uₙ₊₁(𝔽_p)` and every natural number
`a ≡ 1 (mod p)`, `Qᵃ` is conjugate to `Q` in `U¹` (Mathlib `IsConj`). Equivalently the powering
action on the conjugacy classes of `U¹` factors through `(ℤ/p)ˣ`; hence for `2 ≤ n ≤ 6` the outer
exponent of `U¹` is `p` for `p` odd and `1` for `p = 2`. For `n ≤ 1`, `U¹ = 1`. Route: if `2p > n` the exponent of `U¹` is `p` (3.2) and there is nothing to prove.
At `p = 3`, `n = 6`, the exponent divides `9` (3.2), `(Q − 1)³ = Q₀₂Q₂₄Q₄₆ E₀₆`, so
`Q⁴ = Q + Q₀₂Q₂₄Q₄₆ E₀₆`, and `e₂₆(t) Q⁴ e₂₆(t)⁻¹ = Q` for `t = Q₂₄Q₄₆`. At `p = 2`, `4 ≤ n ≤ 6`, the
exponent divides `4`; the block-diagonal part `D` of `Q` with blocks of sizes `4` and `n − 3` and
`O = D⁻¹Q` are involutions in `U¹`, so `Q⁻¹ = OD = D⁻¹(DO)D` is conjugate to `Q`. For `p` odd no
smaller divisor is admissible, since the image of `Q` in `B` is multiplied by `a` under `Q ↦ Qᵃ` and
conjugation in `U¹` fixes it. (HW, Lemma 4.7, p. 14, which states the value `p` also for `p = 2` and
quotes the exponent bound as divisibility by `9`; the factorization through `(ℤ/p)ˣ`, which is what is
used, is unchanged.)
*Needs:* 3.1, 3.2, 3.3; 1.1, 2.1; Mathlib `IsConj`.

**Checks.**

- For fifty random `Q ∈ U¹ ⊆ U₇(𝔽₃)`, `Q⁴ = Q + Q₀₂Q₂₄Q₄₆E₀₆`, `e₂₆(t)Q⁴e₂₆(t)⁻¹ = Q` and
  `e₂₆(t)⁻¹Qe₂₆(t) = Q⁴` with `t = Q₂₄Q₄₆`.
- For `Q = 1 + E₀₂ + E₂₄ + E₄₆` over `𝔽₃`, `Q⁴` differs from `Q` at `(0, 6)`: the cubic corner cannot be
  omitted.
- For thirty random `Q ∈ U¹ ⊆ Uₙ₊₁(𝔽₂)`, `n = 4, 5, 6`, the blocks of sizes `4` and `n − 3` give
  `D² = O² = 1`, `D, O ∈ U¹` and `Q⁻¹ = OD`. For `n = 2, 3` the block sizes do not fit, and none is
  needed: `U¹` has exponent dividing `2` (3.2), so `Q⁻¹ = Q`; for `Q = 1 + E₀₂` in `U₃(𝔽₂)`,
  `Q² = 1`.

### Examples

- In `U₄(𝔽_p)`, `U¹` is elementary abelian of rank three, so its conjugacy classes are its elements
  and its outer exponent is `p` for odd `p` and `1` for `p = 2`.

### Dependencies

Layers 1 and 2; Mathlib `ConjClasses`; Tau Ceti `UpperUnitriangularGroup.mem_superdiagonalSubgroup_iff`.

## Layer 4: Bogomolov vanishing for the derived stabilizer

### 4.1 The Bogomolov multiplier

Define `bogomolovMultiplier H` for a group `H`: the subgroup of `H²(H, ℚ/ℤ)`, trivial coefficients,
of the classes whose restriction to every abelian subgroup `A` (Mathlib's `IsMulCommutative A`)
vanishes, where `ℚ/ℤ` is `ℚ ⧸ ℤ·1` and restriction is `groupCohomology.map` along the inclusion. For finite `H` prove that it suffices to
test the bicyclic subgroups (abelian subgroups with at most two generators), and that the
continuous `H²` of the finite discrete group `H` gives the same subgroup through ProfiniteCohomology
Layer 3. (Moravec, (3.0.1), p. 4; HW, (4.1), p. 12; Michailov, §1, p. 1.) Route for bicyclic tests:
for finite abelian `A`, `H²(A, ℚ/ℤ)` is detected by the alternating commutator pairing, which is
detected on two-generator subgroups.
*Needs:* Mathlib `groupCohomology`, `groupCohomology.map`, `Rep.trivial`, `Rep.res`;
ProfiniteCohomology Layer 3.

- A class lies in `bogomolovMultiplier H` exactly when its restriction to every abelian subgroup `A`
  (Mathlib's `IsMulCommutative A`) is zero.
- For finite `H`, the bicyclic subgroups suffice.
- A homomorphism `H′ → H` pulls `B_Bog(H)` into `B_Bog(H′)`, since abelian subgroups have abelian
  images.
- A group isomorphism induces mutually inverse isomorphisms of the multipliers.

**Checks.**

- For abelian `H` the multiplier is zero, since `H` itself is among the tests.
- For `H = C₂ × C₂`, `H²(H, ℚ/ℤ) ≅ ℤ/2` and the nonzero class restricts to zero on every cyclic
  subgroup (cyclic groups have trivial Schur multiplier), but it is not in `B_Bog(H)`: tests by
  cyclic subgroups alone are not enough.
- For `H = D₈ = U₃(𝔽₂)`, `B_Bog(H) = 0` although `H²(H, ℚ/ℤ) ≅ ℤ/2`: the nonzero class is the
  push-out of the central extension `1 → C₂ → Q₁₆ → D₈ → 1` along `C₂ ↪ ℚ/ℤ`, and on the abelian
  subgroup `⟨ā², b̄⟩ ≅ C₂²` its preimage in `Q₁₆ = ⟨a, b | a⁸, b² = a⁴, bab⁻¹ = a⁻¹⟩` has
  `[a², b] = a⁴ ↦ 1/2 ≠ 0`. A definition by restriction to cyclic subgroups only, or the whole
  `H²`, would keep this class.

### 4.2 The commutativity-preserving exterior square

Define `H ⋏ H`, for a group `H`, as the group presented (Mathlib `FreeGroup`, `PresentedGroup`) by
generators `x ⋏ y`, `x, y ∈ H`, and the relations, with `ˣy = xyx⁻¹`,

```text
(xx′) ⋏ y = (ˣx′ ⋏ ˣy)(x ⋏ y),     x ⋏ (yy′) = (x ⋏ y)(ʸx ⋏ ʸy′),     x ⋏ y = 1 if xy = yx.
```

Prove that `κ̃(x ⋏ y) = xyx⁻¹y⁻¹` defines a surjective homomorphism `κ̃ : H ⋏ H → [H, H]` with
central kernel, and the universal property: every pairing satisfying these relations (a
`B̃₀`-pairing) factors uniquely through `H ⋏ H`. (Moravec, §2, pp. 3–4, and §4, (4.0.1), pp. 9–10.)
*Needs:* Mathlib `FreeGroup`, `PresentedGroup`.

- The canonical pairing `H × H → H ⋏ H` kills commuting pairs.
- Every pairing with the three displayed properties factors uniquely through a homomorphism from
  `H ⋏ H`.
- `κ̃` is surjective onto `[H, H]` and its kernel is central.
- A homomorphism `H → K` induces `H ⋏ H → K ⋏ K` commuting with `κ̃`.

**Checks.**

- For abelian `H` every generator is killed and `H ⋏ H = 1`.
- For `H = S₃`, `s = (12)`, `r = (123)`: `κ̃(s ⋏ r) = srs⁻¹r⁻¹ = r⁻² = r`, while the convention
  `x⁻¹y⁻¹xy` would give `r²`; and `κ̃ : H ⋏ H → A₃` is an isomorphism, its kernel `B̃₀(S₃)` being
  zero since the Schur multiplier of `S₃` is.
- In `U₃(𝔽_p)`, `κ̃(e₀₁(a) ⋏ e₁₂(b)) = e₀₂(ab)`, which is nontrivial for `ab ≠ 0`.

### 4.3 Character duality

Prove that for finite `H` there is a natural isomorphism `B_Bog(H) ≅ Hom(ker κ̃, ℚ/ℤ)`; in particular
`κ̃` injective implies `B_Bog(H) = 0`. Route: evaluate a central extension of `H` by `ℚ/ℤ` on lifted
commutators; commuting pairs evaluate to `1` exactly when the restrictions to the abelian subgroups
split; for a free presentation `F/R`, `H ⋏ H ≅ [F, F]/⟨[x, y] : [x, y] ∈ R⟩`; extend a character of
the kernel across `R` using injectivity of `ℚ/ℤ` (Mathlib `CharacterModule.dual_surjective_of_injective`)
and push out the presentation extension. This is a natural duality, not a chosen self-duality of a
finite abelian group, and it uses no Schur cover. (Moravec, Lemma 3.1 and Theorem 3.2, pp. 4–5, and
§4, p. 10, where `ker κ̃ = B̃₀(H)`.)
*Needs:* 4.1, 4.2; Mathlib `CharacterModule.dual_surjective_of_injective`; Tau Ceti
`TauCeti.FactorSet.exists_cohomologyClass_eq`, `TauCeti.FactorSet.nonempty_splitting_iff_cohomologyClass_eq_zero`.

**Checks.**

- For `H = C₂ × C₂`, `H ⋏ H = 1` (abelian) and `B_Bog(H) = 0`, while the Schur multiplier
  `H₂(H, ℤ)` is `ℤ/2`: the duality is with `ker κ̃`, not with the Schur multiplier.
- For `H = U₃(𝔽_p)`, `κ̃` is injective (4.4) and `B_Bog(U₃(𝔽_p)) = 0`.
- Naturality: an isomorphism `H ≅ H′` transports both sides compatibly.

### 4.4 Endpoint collection

Let `G = U⁽ℓ⁾ ≤ Uₘ(𝔽_p)` be the superdiagonal subgroup of matrices with `g − 1` supported at distance
at least `ℓ ≥ 1`. Prove that every element of `G ⋏ G` is a product `Π c_ik^{a_ik}`, ordered by
increasing `k − i` and then `i`, over `k − i ≥ 2ℓ`, with `a_ik ∈ 𝔽_p` and
`c_ik = e_{i,i+ℓ}(1) ⋏ e_{i+ℓ,k}(1)`; that every wedge `e_ij(a) ⋏ e_jk(b)` with both distances at least
`ℓ` equals `c_ik^{ab}`; and that `κ̃` sends the collected product to the identically ordered product
of the `e_ik(a_ik)`, so that `κ̃` is injective by 1.1. Route: expand wedges by the crossed relations
and 1.1; compare two intermediate indices for the same endpoints by expanding the wedge of the
commuting pair `e_ij e_rk` and `e_jk e_ir` with `r = k − ℓ`; parameter additivity gives linearity and
order dividing `p`; exchanging two wedges introduces terms of strictly larger distance, so collection
terminates. If `2ℓ ≥ m` the group `G` is abelian and both `G ⋏ G` and the kernel are trivial.
(Michailov, Theorem 3.1, Cases I and II, pp. 5–8; the minimal-distance wedge in Case II uses the
two distance-`ℓ` elements `e_{i,i+ℓ}, e_{i+ℓ,i+2ℓ}` of `G`, not a distance-one element.)
*Needs:* 4.2; 1.1, 1.2; Tau Ceti `TauCeti.commutatorElement_transvectionUnit`.

**Checks.**

- For `ℓ = m − 1`, `G` is the corner line, abelian, and `G ⋏ G = 1`.
- For `m = 5`, `ℓ = 2`, the wedge `e₀₂(1) ⋏ e₂₄(1)` maps to `e₀₄(1) ≠ 1`, so `G ⋏ G ≠ 1`.
- For `ℓ = 1` and `m = 3`, `G ⋏ G` is generated by `c₀₂` and `κ̃(c₀₂) = e₀₂(1)`.

### 4.5 The Bogomolov multiplier of `U¹`

Prove `bogomolovMultiplier_superdiagonalSubgroup_two_eq_bot`: for every prime `p` and `n ≥ 0`,
`B_Bog(U¹) = 0` for `U¹ = UpperUnitriangularGroup.superdiagonalSubgroup 2 ⊆ Uₙ₊₁(𝔽_p)`. Route: 4.3
and 4.4 with `ℓ = 2` and `m = n + 1`. For `n ≤ 3` the group `U¹` is abelian (trivial, cyclic of order
`p`, elementary of rank three); for `n = 4` it is not, `[e₀₂(1), e₂₄(1)] = e₀₄(1)`, and the endpoint
collection, not an abelian shortcut, covers it. This is the finite input of HW, Proposition 4.1
(p. 11, proof p. 12); the identification of unramified Brauer groups of homogeneous spaces with
Bogomolov multipliers is outside this roadmap. (Michailov, Theorem 3.1, p. 5.)
*Needs:* 4.1, 4.3, 4.4; 1.2; Tau Ceti `UpperUnitriangularGroup.superdiagonalSubgroup`.

**Checks.**

- In `U₅(𝔽_p)`, `e₀₂(1), e₂₄(1) ∈ U¹` have commutator `e₀₄(1) ≠ 1`: `U¹` is not abelian from
  `n = 4` on.
- For `n ≤ 1`, `U¹ = 1`; for `n = 2`, `U¹` is cyclic of order `p`; both multipliers vanish trivially.
- The vanishing is for `U¹`, not for every subgroup of `U`; it does not say that `H²(U¹, ℚ/ℤ) = 0`,
  which fails for `n = 3` where `U¹ ≅ 𝔽_p³` has Schur multiplier `𝔽_p³`.

### Examples

- `B_Bog(U₃(𝔽_p)) = 0` for the Heisenberg group, by 4.3 and 4.4 with `m = 3`, `ℓ = 1` (Michailov,
  Theorem 3.1); `B_Bog(U¹) = 0` in `U₄(𝔽_p)` because `U¹ ≅ 𝔽_p³` is abelian.

### Dependencies

Layers 1–2; Mathlib group cohomology, presentations and character modules; Tau Ceti factor sets.

## Layer 5: cyclic cohomology and fixed conjugacy classes

### 5.1 Cyclically trivial first cohomology

For a finite group `G` and a `G`-module `M`, define `H¹_cyc(G, M)` as the kernel of the restriction
map `H¹(G, M) → Π_C H¹(C, M)` over all cyclic subgroups `C`. Prove that a cocycle `b` represents a
class of `H¹_cyc(G, M)` exactly when `b(σ) ∈ (σ − 1)M` for every `σ ∈ G`, independently of the
representative, and that restriction to subgroups and equivariant coefficient maps preserve these
kernels. This is a finite-group restriction kernel, distinct from ArithmeticGaloisDuality's
`Ш^i`. (HW, Definition 4.3, p. 13.) Route: on `⟨σ⟩` a cocycle is a coboundary exactly when its value
at `σ` is a `(σ − 1)`-image (Tau Ceti `ContCohomology.H1pi_eq_zero_iff_exists_smul_sub_eq`).
*Needs:* ProfiniteCohomology Layers 2 and 3; Tau Ceti
`ContCohomology.H1pi_eq_zero_iff_exists_smul_sub_eq`.

- `H¹_cyc(G, M)` is the kernel subgroup of `H¹(G, M)`.
- Membership is the pointwise criterion `b(σ) ∈ (σ − 1)M` for all `σ`.
- Restriction to a subgroup carries `H¹_cyc` into `H¹_cyc`.
- An equivariant coefficient map carries `H¹_cyc` into `H¹_cyc`.

**Checks.**

- For cyclic `G` the kernel is zero, since `G` itself is tested.
- For trivial action `(σ − 1)M = 0`, so a cyclically trivial cocycle vanishes and the kernel is zero.
- If the action factors through a cyclic quotient `G/N`, the kernel is zero: a cyclically trivial
  cocycle vanishes on `N`, descends to `G/N`, and is a coboundary there.
- For `G = C₂ × C₂` acting on `B^∨` as in 6.2 the kernel is `ℤ/2`: it is not always zero.

### 5.2 Conjugacy-power evaluation

Let `H` be a finite group of exponent `d` with an outer action of a finite group `G`, let
`χ : G → (ℤ/d)ˣ` be a cyclotomic character, and let `D = Hom(H^ab, μ_d)` carry the contragredient
action twisted by `χ`. If `σ[h] = [h^{χ(σ)}]` in the conjugacy classes, the image `h̄ ∈ H^ab`
satisfies `σh̄ = χ(σ)h̄`, so evaluation at `h̄` is an invariant map `D → μ_d` for the action of `ℤ`
through `1 ↦ σ` with trivial action on the target. Define the conjugacy-power evaluation
`H¹(G, D) → μ_d` as pullback along `ℤ → G`, `1 ↦ σ`, followed by this evaluation and
`H¹(ℤ, μ_d) = μ_d`; on a cocycle `b` it is `b(σ)(h̄)`. Prove that it depends only on the class of `b`
and the conjugacy class of `h`, and that a unit lift of `χ` modulo the outer exponent gives the same
test. (HW, §3, pp. 9–10, preceding Proposition 3.3.)
*Needs:* 3.3, 5.1; ProfiniteCohomology Layer 8; Tau Ceti `TauCeti.homAction`.

- The evaluation is a homomorphism `H¹(G, D) → μ_d` for each `σ` and each class `[h]` with
  `σ[h] = [h^{χ(σ)}]`.
- On a cocycle `b` it is `b(σ)(h̄)`, with additive zero corresponding to the root `1`.
- Cohomologous cocycles and conjugate `h` give the same value.
- If `χ` is only given modulo the outer exponent, any unit lift gives the same condition.

**Checks.**

- For `χ = 1` every allowed `h̄` is a `σ`-fixed vector of `H^ab`, but the converse fails: for
  `H = U¹ ⊆ U₇(𝔽₂)` and `σ` acting through `a = (1, 1, 0, 0, 0, 1)` (6.1), `e₂₅` is fixed in
  `H^ab = B` but is not the image of any `σ`-fixed conjugacy class.
- The target `H¹(ℤ, μ_d)` carries the trivial action; keeping the cyclotomic action on `μ_d` would
  change the invariant condition and the value.
- For `H = C₃ = ⟨h⟩`, `G = C₃ = ⟨σ⟩` acting trivially and `χ = 1`, `D = Hom(C₃, μ₃)` has trivial
  action, cocycles are homomorphisms `G → D`, and the cocycle with `b(σ)(h) = ζ₃` evaluates to `ζ₃`
  on `[h]`, to `ζ₃²` on `[h²]` and to `1` on `[1]`; every class is allowed.
- For `H = C₃ = ⟨h⟩` and `G = C₃ × C₂`, the first factor acting trivially and the second by
  inversion, with `χ` the sign character of the second factor, the twist cancels the inversion on
  `D = Hom(C₃, μ₃)`, which has trivial action. For `σ = (s, τ)` with `τ` the inversion,
  `σ[h] = [h⁻¹] = [h^{χ(σ)}]`, so `[h]` is allowed; the cocycle `b` with `b(s) = φ`, `φ(h) = ζ₃`, and
  `b(τ) = 0` evaluates to `φ(h) = ζ₃`. With the sign action kept on the target `μ₃`, equivariance of
  evaluation at `h̄` would require `ζ₃ = ζ₃⁻¹`, which fails.
- The zero class evaluates to `1` on every allowed class.

### 5.3 Pointwise scalar maps

Prove that for vector spaces `V, W` over a field `F` and linear maps `T, T₀ : V → W` with
`T(v) ∈ F·T₀(v)` for every `v`, there is one `c ∈ F` with `T = cT₀`; no dimension hypothesis is
needed, and `T₀ = 0` forces `T = 0`. Route: the hypothesis kills `ker T₀`, so `T` factors through
`im T₀` by a map for which every vector is an eigenvector; compare two independent images and their
sum. (HW, proof of Lemma 4.15, p. 18.)
*Needs:* Mathlib `LinearMap`.

**Checks.**

- `T₀ = 0` gives `T = 0`.
- Over `𝔽₂` with `V = W = 𝔽₂²` and `T₀ = id`, `T = diag(1, 0)` fails the hypothesis at `v = (1, 1)`;
  so the hypothesis is needed at every vector, not only on a basis.
- If `im T₀` is a line the scalar is read off on any vector not in `ker T₀`.

### 5.4 Fixed second-diagonal lifts

Prove that for `n ≥ 3`, `a ∈ A` with sparse lift `S`, and an `a`-fixed `b = Σ b_i e_{i,i+2}` in the
second-diagonal span of `B`, the matrix `Q = 1 + Σ b_i E_{i,i+2}` satisfies `SQS⁻¹ = Q` exactly, so
`b` lifts to an `a`-fixed conjugacy class of `U¹`. Fixedness of `b` is
`−b_i a_{i+2} + a_i b_{i+1} = 0` for every `i` (by 2.2), and these equations kill every correction in
the formula of 2.4. (HW, Lemma 4.12, p. 16.)
*Needs:* 2.2, 2.4.

**Checks.**

- For `a = 0` every `b` is fixed and `S = 1`.
- For `n = 3` over `𝔽₃` and `a = (1, 1, 1)`, `b = e₀₂ + e₁₃` satisfies the fixedness equation
  `−b₀a₂ + a₀b₁ = 0` and `SQS⁻¹ = Q`.
- A second-diagonal vector that is not fixed, `b = e₀₂` with `a₂ = 1`, gives `(SQS⁻¹)₀₃ = −1 ≠ 0`.

### 5.5 Boundary fixed-class generation

Prove that for `n ≥ 3` and `a ∈ A` the subgroup of `B^a` generated by the images of the `a`-fixed
conjugacy classes of `U¹` contains `B_bdry^a`. This is generation, not surjectivity of the map from
fixed classes. Route: 5.4 handles the distance-two boundary vectors; for `e₀₃` distinguish `a₃ = 0`
(then `e₀₃` itself is fixed), `a₃ ≠ 0` with `a₂ = 0` (write `e₀₃` as `(e₀₃ + e₀₂) − e₀₂` and conjugate
`e₀₃e₀₂` back by a product of `e_{2,j}`), and `a₂ ≠ 0` (use `b_i = a_i a_{i+1}`, the lift `Q` with
`Q_{i,i+2} = b_i` and `Q₀₃ = a₂`, and the factorization `Q = e_{n−2,n}(b_{n−2})⋯e₀₂(b₀)e₀₃(a₂)`);
the reversal 2.5 handles `e_{n−3,n}`. (HW, Lemma 4.13, pp. 16–17, whose displayed factorization has
`e₀₃` with parameter `1`; the parameter is `a₂`, matching `Q₀₃ = a₂`, which matters over `𝔽₃` with
`a₂ = 2`.)
*Needs:* 2.3, 2.4, 2.5, 5.4.

**Checks.**

- For `n = 3`, `U¹ = B` and every fixed vector is the image of its own class.
- Over `𝔽₃` with `a₂ = 2`, the factorization with `e₀₃(1)` has `(0,3)` entry `1` while `Q₀₃ = 2`; the
  parameter `a₂` is needed.
- For `a = 0` every class is fixed and the images span `B`.

### 5.6 Boundary dual cyclic vanishing

Let `n ≥ 3`, let `G` be a finite group with a homomorphism `G → A × 𝔽_pˣ`, and let `G` act on
`B_bdry` through `A` and on its dual `B_bdry^D = Hom(B_bdry, μ_p)` by the contragredient action times
the character `G → 𝔽_pˣ`. Prove `H¹_cyc(G, B_bdry^D) = 0`. Route: restrict to the kernel `H` of the
character, of index prime to `p`; restriction is injective on the `p`-torsion module by `cor ∘ res`.
For `n > 3`, `B_bdry = ⟨e₀₂, e₀₃⟩ ⊕ ⟨e_{n−3,n}, e_{n−2,n}⟩` as `H`-modules, each block with action
through one coordinate `A → 𝔽_p`, a cyclic quotient, so 5.1 applies. For `n = 3`, dualize
`0 → 𝔽_p → B_bdry → 𝔽_p² → 0`; cyclic triviality makes the remaining map `H → 𝔽_p²` pointwise a
multiple of the boundary map, and 5.3 makes it a coboundary. (HW, Lemma 4.15, pp. 17–18.)
*Needs:* 2.3, 5.1, 5.3; ProfiniteCohomology Layers 5 and 10 (`cor ∘ res`, Tau Ceti
`TauCeti.ContinuousCohomology.corestriction_res`).

**Checks.**

- For `n = 4`, `p = 2` and `G = C₂ × C₂` acting through `s = (1,1,0,1)`, `t = (1,0,1,1)`, the
  cyclically trivial cocycles with values in `B_bdry^∨` are exactly the four coboundaries.
- For the full `B` in the same situation the kernel is `ℤ/2` (6.2), so the boundary submodule cannot
  be replaced by `B`.
- For `n = 3`, `B_bdry = B` and the statement covers the whole dual.

### 5.7 Fixed-class generation for `n = 4, 5`

Prove that for `n = 4` or `5` and every `a ∈ A` the images of the `a`-fixed conjugacy classes of `U¹`
generate `B^a`. Route: for `n = 4` the boundary contains every distance-three vector, so 5.4 and 5.5
suffice. For `n = 5` only `e₁₄` remains. If `a₄ = 0` (or `a₀ = 0`) the subgroup on the indices
`0, …, 4` (or `1, …, 5`), a copy of the size-five case, is stable and the case `n = 4` applies. If
`a₀, a₄ ≠ 0`, choose a fixed `b` in the second-diagonal span with `b₀b₁`, `b₂b₃` or `b₀b₃` nonzero
(cases `a₂ = 0`; `a₂ ≠ 0, a₃ = 0`; `a₂ ≠ 0, a₁ = 0`; `a₁a₂a₃ ≠ 0`); for `Q` lifting `e₁₄ + b`, `U³` is
central in `U¹` and `Θ_Q(x̄) = x⁻¹QxQ⁻¹ : B → U³` takes `e₂₄, e₂₅, e₃₅, e₀₂, e₀₃, e₁₃` to
`e₀₄(b₀), e₀₅(b₀), e₁₅(b₁), e₀₄(−b₂), e₀₅(−b₃), e₁₅(−b₃)`, hence is onto; so the fibre of `e₁₄ + b` is
one conjugacy class, fixed by `a`, and `e₁₄ = (e₁₄ + b) − b`. (HW, Proposition 6.1, pp. 23–24; the
copy in the endpoint-zero reduction is of size five, not four as printed.)
*Needs:* 5.4, 5.5; 1.2, 2.2, 2.4.

**Checks.**

- For `n = 4`, `p = 2`, `a = (1, 1, 0, 1)`, the fixed-class images generate `B^a`, while the
  cyclically trivial kernel of 6.2 is nonzero: generation in `B` does not control `H¹_cyc(G, B^∨)`.
- For `n = 5` and `a = 0`, every class is fixed.
- At `n = 6` the statement fails (6.1).

### Examples

- For `n = 3` and every `G → A × 𝔽_pˣ`, `H¹_cyc(G, B^D) = 0`, as `B = B_bdry`.

### Dependencies

Layers 2–3; ProfiniteCohomology Layers 2, 3, 5, 8 and 10; Tau Ceti
`ContCohomology.H1pi_eq_zero_iff_exists_smul_sub_eq`, `TauCeti.ContinuousCohomology.corestriction_res`,
`TauCeti.homAction`.

## Layer 6: sharpness and explicit obstruction modules

### 6.1 Failure of fixed-class generation at `n = 6`

Prove that for `p = 2`, `n = 6` and `a = (1, 1, 0, 0, 0, 1) ∈ A`, the fixed space `B^a` has dimension
six, with basis `e₀₂, e₄₆, e₀₃, e₁₄, e₂₅, e₃₆`, while the images of the `a`-fixed conjugacy classes of
`U¹` span the five-dimensional subspace where the `(2,5)` coordinate vanishes: `e₂₅` is fixed but not
in the span. The class of `Q` is fixed exactly when some `T ∈ U` with adjacent entries `a` commutes
with `Q`, a linear condition on the entries of `T` above the adjacent diagonal; the `(0,3)`, `(1,4)`
and `(3,6)` entries of `TQ = QT` force `Q₁₃ = Q₂₄ = Q₃₅ = 0` and then the `(1,5)` entry forces
`Q₂₅ = 0`. Of the `2¹²` elements of `U¹` with image in `B^a`, exactly `1036` have a fixed class.
This is an explicit witness for the failure at `n = 6` stated in HW, Remark 4.17, p. 18, and §6,
p. 24.
*Needs:* 2.2, 2.4; 5.7.

**Checks.**

- Exhaustive computation: `B^a` has dimension `6`; among the `4096` candidates, `1036` admit a
  commuting lift of `a`; their images span dimension `5`, all with zero `(2,5)` coordinate.
- The span is not all of `B^a`, although by 5.7 it would be for `n ≤ 5`.
- The images need not each be basis vectors: the span is taken of all images.

### 6.2 A nonzero cyclically trivial kernel

Prove that for `n = 4`, `p = 2` and `G = C₂ × C₂` acting on `B` through `s = (1, 1, 0, 1)` and
`t = (1, 0, 1, 1)` in `A` (the image of the classes `([ab], [a], [b], [ab])` of HW, Example 6.3),
`H¹_cyc(G, B^∨) ≅ 𝔽₂` while `H¹_cyc(G, B_bdry^∨) = 0`. In the basis `(e₀₂, e₀₃, e₁₃, e₁₄, e₂₄)` derive
the contragredient matrices from 2.2; the cocycle conditions for `x = b(s)`, `y = b(t)` and the
cyclic conditions `x ∈ (s − 1)B^∨`, `y ∈ (t − 1)B^∨`, `x + s·y ∈ (st − 1)B^∨` leave eight cyclically
trivial cocycles and four coboundaries. (HW, Example 6.3, p. 24.)
*Needs:* 5.1, 2.2, 5.6.

**Checks.**

- Exhaustive computation: `s` and `t` are commuting involutions of `B`; `8` cyclically trivial
  cocycles, `4` coboundaries; for `B_bdry`, `4` and `4`.
- Identifying `B^∨` with `B` without the inverse transpose gives a different module; the computation
  uses the contragredient action. Since `s` and `t` are involutions, their inverse transposes are
  their transposes, so this example does not separate those two formulas either.
- Restricting to either cyclic factor kills the class, as the definition requires.

### 6.3 A five-dimensional obstruction module

Let `V = 𝔽₂a ⊕ 𝔽₂b ⊕ 𝔽₂c ⊕ 𝔽₂d ⊕ 𝔽₂e` and `Q = C₂(s) × C₄(t) × C₂(r)`. Define the representation
`s = 1 + N_s`, `t = 1 + N_t`, `r = 1` with `N_s(b) = d + e`, `N_s(c) = e`, `N_t(a) = d`,
`N_t(b) = d + e`, and all other basis images zero. Prove `N_s² = N_t² = N_sN_t = N_tN_s = 0`, so this
is a representation of `Q` in which `t` acts with order two. This explicit module and the cocycle
of 6.4 are this roadmap's own finite example of a nonzero `H¹_cyc` for an action through a
non-cyclic quotient, in the sense of HW, Definition 4.3, p. 13, and of the same kind as HW,
Example 6.3, p. 24; they are not HW's examples.
*Needs:* 2.2; Tau Ceti `TauCeti.InternalHom`, `TauCeti.homAction`.

- The action matrices of `s`, `t`, `r` in the basis `(a, b, c, d, e)` and their normal-form products
  `s^i t^j r^l`.
- The contragredient action on the dual basis `a*, …, e*`.
- The evaluation pairing `V^∨ × V → 𝔽₂` is equivariant.

**Checks.**

- The invariants are `V^Q = ⟨d, e⟩`, of dimension two: `N_s v = 0` forces the `b`- and
  `c`-coordinates to vanish and `N_t v = 0` then forces the `a`-coordinate to vanish.
- The kernel of the action is `⟨t², r⟩`, of order four: `s^i t^j` acts as `1 + iN_s + jN_t`, which
  is the identity only for `i, j` even. In particular `t²` acts trivially although it is a
  nontrivial element of `Q`.
- On the dual, `(s − 1)d* = b*` and `(t − 1)e* = b*`: `s` fixes `d` but moves `d*`, so the dual
  action is not the primal action read on the dual basis. The pairing is equivariant,
  `(s·d*)(s·b) = d*(b) = 0` whereas `d*(s·b) = 1`. Every element of `Q` acts on `V` by an
  involution (`s^i t^j` acts as `1 + iN_s + jN_t`, whose square is `1`), so here the inverse
  transpose equals the transpose: this example does not separate the two formulas.
- There is a cocycle `γ : Q → V` with `γ(s) = a`, `γ(t) = b + c`, `γ(r) = 0`, the relations holding
  because `(1 + s)a = 0`, `(1 + t + t² + t³)(b + c) = 0` and `N_s(b + c) = N_t(a) = d`; its value
  `γ(t²) = (1 + t)(b + c) = d + e` is nonzero although `t²` acts trivially, so a cocycle on `Q` is
  not determined by the action of `Q/⟨t², r⟩`, and over `C₂(t)` this `γ` would not exist.
- All four products of `N_s, N_t` vanish, by direct computation.

### 6.4 An explicit cyclically trivial class

Prove that `b*` is `Q`-invariant and that `β(s^i t^j r^l) = (i + j mod 2)·b*` is a cocycle whose class
is a nonzero element of `H¹_cyc(Q, V^∨)`. For the parities `(i, j) = (1, 0)` and `(0, 1)`, `d*` and `e*`
are cyclic coboundary witnesses; for `(0, 0)` and `(1, 1)`, `β = 0`. A global coboundary `m` with
`d*, e*` coefficients `u, v` would need `(s − 1)m = (u + v)b* + vc* = b*` and
`(t − 1)m = ua* + (u + v)b* = b*`, forcing `v = 0, u = 1` and `u = 0`. (HW, Definition 4.3, p. 13, for `H¹_cyc`.)
*Needs:* 6.3, 5.1.

**Checks.**

- The cocycle identity holds on all `256` pairs of elements of `Q`.
- `β(g) ∈ (g − 1)V^∨` for all `16` elements `g`.
- None of the `32` elements `m ∈ V^∨` has `(g − 1)m = β(g)` for every `g`.

### Examples

- For `n = 4`, the module `B^∨` of 6.2 and the module `V^∨` of 6.3 both have nonzero `H¹_cyc`, for
  groups `C₂ × C₂` and `C₂ × C₄ × C₂` acting through non-cyclic quotients.

### Dependencies

Layers 2 and 5; Tau Ceti internal Hom.

## Layer 7: refined nonarchimedean lifting

Throughout, `p` is prime, `r, s ≥ 1`, `n = r + s + 1` and `U = Uₙ₊₁(𝔽_p)`, unless stated.

### 7.1 The two-boundary subgroup

For `n ≥ 3`, `1 ≤ r, s ≤ n − 2` and a commutative ring `R`, define `P_(r,s) ⊆ Uₙ₊₁(R)` as the set of
matrices that agree with the identity except in row `0` at columns `j ≥ n − s` and in column `n` at
rows `i ≤ r`, above the diagonal; the support condition is `IsTwoBoundary n r s`. Prove that it is a
subgroup (products and inverses only add terms at the corner `(0, n)`), normal in `U`, containing
`Z`, with `P_(r,s)/Z ≅ (R^{r+s}, +)`; over `𝔽_p` it is the subgroup generated by the `e_in`,
`0 ≤ i ≤ r`, and the `e_0j`, `n − s ≤ j ≤ n`. If `r + s ≤ n − 1`, `P_(r,s)` is abelian, isomorphic to
`(R^{r+s+1}, +)` by its coordinates, and `0 → Z → P_(r,s) → P_(r,s)/Z → 0` splits as abelian groups.
(HW, Definition 5.2, p. 18, and observations (1)–(3), p. 19.)
*Needs:* 1.1, 1.4.

- `P_(r,s)` is a normal subgroup of `U` containing `Z = Subgroup.center U`.
- Its coordinates are the first-row entries `j ≥ n − s`, the last-column entries `i ≤ r`, and the
  corner counted once.
- `P_(r,s)/Z ≅ R^{r+s}` by the noncorner coordinates.
- For `r + s ≤ n − 1` the coordinate map `P_(r,s) → R^{r+s+1}` is a group isomorphism, and conjugation
  by `U` induces an action of `U/P_(r,s)` on `P_(r,s)`.

**Checks.**

- For `n = 3`, `r = s = 1`, `P_(1,1)` has the three coordinates `(0,2), (0,3), (1,3)`, not four.
- The first-row and last-column parts meet exactly in `Z`.
- At `r + s = n − 1`, `P_(r,s)` is abelian, but conjugation by `U` is nontrivial on it: for `n = 3`,
  `e₀₁ e₁₃ e₀₁⁻¹ = e₀₃ e₁₃`.
- If `R` is nontrivial and `r + s ≥ n`, there is `j` with `n − s ≤ j ≤ r` and `0 < j < n`, and
  `[e₀ⱼ(1), e_jn(1)] = e₀ₙ(1) ≠ 1`: for `n = 4`, `r = s = 2` over `𝔽₂`, `e₀₂` and `e₂₄`.
  Abelianness is not asserted in that range. For the zero ring `U` and every `P_(r,s)` are trivial.
- Over `𝔽₃` with `n = 4, r = 2, s = 1`, `P_(r,s)` has `3⁴ = 81` elements, by enumeration.

### 7.2 The twisted boundary sequence

Let `Γ` be profinite and `α̃ : Γ → U/Z` a continuous homomorphism. Conjugation by any lift of `α̃(g)`
makes `0 → Z → P_(r,s) → P_(r,s)/Z → 0` an exact sequence of finite discrete `Γ`-modules, the action
factoring through `U/P_(r,s)` because `P_(r,s)` is abelian, and trivial on `Z`. It splits additively,
so its additive sections form a torsor under the discrete module `Hom(P_(r,s)/Z, Z)`, with class
`[γ] ∈ H¹(Γ, Hom(P_(r,s)/Z, Z))` that vanishes exactly when the sequence splits equivariantly
(ArithmeticGaloisDuality §R02.1.4, *The splitting torsor* and *Finitely generated `C`: the discrete
case*). Finiteness of `P_(r,s)/Z` makes the Hom module discrete; no discreteness claim is made for an
infinite domain. (HW, §5, pp. 19–20, and Lemma 5.5, p. 19, whose discrete Hom requires a finitely
generated domain.)
*Needs:* 7.1; ArithmeticGaloisDuality §R02.1.4; Tau Ceti `TauCeti.InternalHom`, `TauCeti.homAction`.

- The finite equivariant exact sequence attached to `α̃`.
- The action of `g` is conjugation by any lift of `α̃(g)` to `U`.
- The splitting class `[γ]` is the class of the imported torsor.
- Restriction to a closed subgroup of `Γ` commutes with the sequence and the class.

**Checks.**

- For `α̃ = 1` the action is trivial and `[γ] = 0`.
- Changing the lift of `α̃(g)` by an element of `Z` does not change the action, `Z` being central.
- For `Γ = ∏_ℕ ℤ/2`, `A = 𝔽₂` and `C = ⊕_ℕ 𝔽₂` with trivial action, and `B = A ⊕ C` with
  `g·(a, c) = (a + Σ gᵢcᵢ, c)`, the splitting cocycle `g ↦ (c ↦ Σ gᵢcᵢ)` is not continuous into the
  discrete `Hom(C, A)`: its zero fibre is `{0}`, which is not open (ArithmeticGaloisDuality
  §R02.1.4, the third Check of *The splitting torsor*). With trivial action on `B` as well the
  cocycle is zero; the middle action is what matters. The finite quotient here avoids this.
- A nonsplit instance of the sequence itself: `p = 2`, `n = 3`, `r = s = 1`, `Γ = ℤ/2` generated by
  `σ`, and `α̃(σ) = e₀₁(1)` modulo `Z`. Conjugation by `e₀₁(1)` fixes `e₀₂` and `e₀₃` and sends
  `e₁₃(t)` to `e₁₃(t)e₀₃(t)`, so for the section `(x, y) ↦ e₀₂(x)e₁₃(y)` of `P_(1,1) → P_(1,1)/Z`
  the cocycle is `γ(σ)(x, y) = y`, a nonzero homomorphism `Γ → Hom(P_(1,1)/Z, Z) = 𝔽₂²` (both
  actions are trivial), hence `[γ] ≠ 0`; indeed the `σ`-fixed elements of `P_(1,1)` are those with
  `(1, 3)`-entry zero, whose image in `P_(1,1)/Z` is the line `{(x, 0)}`, so no equivariant section
  exists. For `α̃ = 1` the same section is equivariant and `γ = 0`.

### 7.3 The connecting map as a cup product

Prove that the connecting map `δ : H¹(Γ, P_(r,s)/Z) → H²(Γ, Z)` of 7.2 is `[c] ↦ [γ ∪ c]` for the
evaluation pairing `Hom(P_(r,s)/Z, Z) ⊗ P_(r,s)/Z → Z`, on cochains `d(s ∘ c)(g, h) = γ(g)(g·c(h))`;
with the pairing flipped it is `−[c ∪ γ]`, by graded commutativity on cohomology. Keep this sign in
7.5. (ArithmeticGaloisDuality §R02.1.4, *The connecting map is cup product with the torsor class*;
HW, Lemma 5.5, p. 19.)
*Needs:* 7.2; ArithmeticGaloisDuality §R02.1.4; ProfiniteCohomology Layers 5, 8 and 12; Tau Ceti
`ContCohomology.explicitCup11`, `TauCeti.InternalHom.evalPairing`.

**Checks.**

- In degree zero the formula is `∂c = (g ↦ γ(g)(c))` for an invariant `c`.
- For a split sequence, `γ = 0` and `δ = 0`.
- For `Γ = ℤ/2 = ⟨σ⟩` acting on `𝔽₂²` by `[[1, 1], [0, 1]]` with sub `𝔽₂e₁`, `γ(σ)` is the identity of
  `𝔽₂` and `δ : 𝔽₂ → H¹(Γ, 𝔽₂)` is an isomorphism (ArithmeticGaloisDuality §R02.1.4).

### 7.4 The easy local cases

Prove that for a nonarchimedean local field `K` and a prime `p`, `H²(K, ℤ/p) = 0` when the
characteristic of `K` is `p`, or when it is not `p` and `μ_p(K) = 1`; in these cases every continuous
`Γ_K → U/Z` lifts to `U`. The characteristic-`p` case is the gap declared in ProfiniteCohomology
Layer 9 (Artin–Schreier, not Kummer theory); the other case is local duality,
`H²(K, ℤ/p) ≅ Hom(H⁰(K, μ_p), H²(K, μ_p)) = 0` (Tau Ceti
`TauCeti.ClassFieldTheory.dualityMap2_kummerCoeff_bijective`); the lifting follows from 1.4 and the
splitting criterion. (HW, proof of Proposition 5.3, p. 19, whose easy case lifts to `U`, the
statement "lifts to `Z`" there being a slip.)
*Needs:* ProfiniteCohomology Layer 9 (gap:char-p-galois-h2-vanishing); Tau Ceti
`TauCeti.ClassFieldTheory.dualityMap2_kummerCoeff_bijective`,
`TauCeti.FiniteEmbeddingProblem.exists_isSolution_iff_obstruction_eq_zero`; 1.4;
InverseGaloisAndArithmeticFundamentalGroups §IG.4.1.

**Checks.**

- `K = ℚ₂`, `p = 3`: `μ₃(ℚ₂) = 1`, so `H²(ℚ₂, ℤ/3) = 0`.
- `K = ℚ₇`, `p = 3`: `μ₃ ⊆ ℚ₇` and `H²(ℚ₇, ℤ/3) ≅ ℤ/3 ≠ 0`; this case is not easy.
- `K = 𝔽₂((t))`, `p = 2`: `H²(K, ℤ/2) = 0` by the characteristic-`p` case, although `μ₂(K) = 1`
  trivially; for `p = 2` and characteristic not `2`, `μ₂ ⊆ K` always and the easy case never applies.

### 7.5 Nonsplit obstruction cancellation

Let `K` be a nonarchimedean local field of characteristic not `p` with `μ_p ⊆ K`, and
`α̃ : Γ_K → U/Z` continuous with twisted boundary sequence not equivariantly split. Prove that
`δ : H¹(K, P_(r,s)/Z) → H²(K, Z)` is onto: identifying `Z ≅ 𝔽_p ≅ μ_p` by a primitive root, local
duality pairs `H¹(K, Hom(P_(r,s)/Z, Z))` perfectly with `H¹(K, P_(r,s)/Z)` into
`H²(K, μ_p) ≅ ℤ/p` (Tau Ceti `TauCeti.ClassFieldTheory.dualityMap1_kummerCoeff_bijective`,
`TauCeti.ClassFieldTheory.h2MuEquivZMod`), so cup with `[γ] ≠ 0` is a nonzero functional to a line.
Choose `c` with `δc = −o(α̃)`, `o(α̃)` the corner obstruction; for cochain lifts `ĉ` of `c` and `α̂` of
`α̃`, and a cochain `ξ` with values in `Z` correcting the remaining coboundary, `ĉ·α̂·ξ` is a
continuous homomorphism `Γ_K → U` lifting the image `α` of `α̃` in `U/P_(r,s)`. It need not lift `α̃`
itself. (HW, proof of Proposition 5.3, pp. 19–20.)
*Needs:* 7.2, 7.3; Tau Ceti `TauCeti.ClassFieldTheory.dualityMap1_kummerCoeff_bijective`,
`TauCeti.ClassFieldTheory.h2MuEquivZMod`; ProfiniteProPGroups Layer 5.

**Checks.**

- If `[γ] = 0` the functional is zero and the argument does not apply; the split case is 7.7.
- The constructed lift agrees with `α` in `U/P_(r,s)` and in general not with `α̃` in `U/Z`.
- The sign: with `δc = +o(α̃)` the product `ĉα̂` has obstruction `2o(α̃)`, which is nonzero when
  `o(α̃) ≠ 0` and `p` is odd; with `o(α̃) = 0` both signs give `0`.
- Nonsplitting of the boundary sequence does not force `o(α̃) ≠ 0`: for `K = ℚ₇`, `p = 3`, `n = 3`,
  `r = s = 1` and `α̃ = e₀₁(χ)` modulo `Z` with `χ : Γ_K → 𝔽₃` the nonzero unramified character,
  `e₀₁(χ)` itself is a continuous lift to `U`, so `o(α̃) = 0`; but conjugation by `e₀₁(χ(g))` sends
  `e₁₃(t)` to `e₁₃(t)e₀₃(χ(g)t)` and fixes `e₀₂`, so the splitting cocycle of 7.2 is
  `γ(g)(x, y) = χ(g)y`, a nonzero homomorphism `Γ_K → Hom(P_(1,1)/Z, Z)` (both actions trivial), and
  `[γ] ≠ 0`.

### 7.6 Boundary retractions

Let `W = 𝔽_p^{n+1}` be columns, `W*` rows, `W^m` the columns supported in `0, …, m` and `W*_m` the
rows supported in `n − m, …, n`. For a row `u` and a column `v` define
`ρ_(u,v) : P_(r,s) → Z ≅ 𝔽_p`, `ρ_(u,v)(Q) = u(Q − 1)v`. Prove: `ρ_(u,v)` is a homomorphism retracting
`Z` exactly when `u₀vₙ = 1`; every retraction `P_(r,s) → Z` is `ρ_(u,v)` with `u₀ = vₙ = 1`; and two
normalized pairs give the same retraction exactly when `u − u′ ∈ W*_{n−r−1}` and `v − v′ ∈ W^{n−s−1}`.
The row argument stays first: `ρ_(u,v)(e_in(t)) = t·u_i vₙ` and `ρ_(u,v)(e_0j(t)) = t·u₀v_j`. (HW,
§5, p. 21, (5.5) and (i)–(iii); two later occurrences in HW interchange the arguments.)
*Needs:* 7.1.

- `ρ_(u,v)` is the linear map `P_(r,s) → Z` given by `u(Q − 1)v`.
- Its restriction to `Z` is the identity when `u₀ = vₙ = 1`.
- Every additive retraction has a normalized pair.
- Two normalized pairs agree exactly modulo `W*_{n−r−1}` and `W^{n−s−1}`.

**Checks.**

- For `u = (1, 0, …, 0)` and `v = (0, …, 0, 1)`, `ρ` is the corner entry.
- Changing `u` only at indices `> r`, or `v` only at indices `< n − s`, leaves `ρ` unchanged.
- The corner contributes once, `ρ(e₀ₙ(t)) = t`; treating the row and column as an external direct sum
  would count it twice.
- Over `𝔽₃` with `n = 3`, `r = s = 1`, the normalized pair `u = (1, 2, 0, 0)`, `v = (0, 0, 1, 1)` and
  `Q = 1 + E₀₂ + E₁₃ ∈ P_(1,1)`: `ρ_(u,v)(Q) = u₀v₂ + u₁v₃ = 1 + 2 = 0`, whereas omitting the row
  term gives `2` and omitting the column term gives `1`.
- An arbitrary retraction is obtained by prescribing its values on the `r + s` noncorner coordinates.

### 7.7 Retraction stabilizers split

For a normalized `ρ = ρ_(u,v)`, let `S = {M ∈ U : ρ(MQM⁻¹) = ρ(Q) for all Q ∈ P_(r,s)}`. Prove that
`P_(r,s) ≤ S`, that `M ∈ S` exactly when `u(M − 1) ∈ W*_{n−r−1}` and `(M − 1)v ∈ W^{n−s−1}`, and that
`ρ̃(M) = u(M − 1)v` is a homomorphism `S → Z` retracting `Z`, because for `M, N ∈ S` the row
`u(M − 1)` is supported after `r` and the column `(N − 1)v` at or before `n − s − 1 = r`, so
`u(M − 1)(N − 1)v = 0`. Hence `S → S/Z` has the section `ker ρ̃ ≅ S/Z`, and an `α̃ : Γ → U/Z` that
preserves `ρ` (an equivariant retraction) lands in `S/Z` and lifts to `U`. (HW, proof of
Proposition 5.3, p. 21.)
*Needs:* 7.1, 7.6; 1.4.

**Checks.**

- Over `𝔽₃` with `n = 4`, `r = 2`, `s = 1`, `u = (1, 2, 1, 0, 2)`, `v = (1, 0, 2, 1, 1)`, the stabilizer
  computed directly has `2187` elements and equals the set cut out by the two support conditions, and
  `ρ̃` is multiplicative on it, by enumeration.
- `P_(r,s) ≤ S` because `P_(r,s)` is abelian.
- For `n = 3`, `r = s = 1`, `u = (1, 0, 0, 0)`, `v = (0, 0, 0, 1)`: `S` is the set of `M` with
  `M₀₁ = 0` and `M₂₃ = 0`, and `ρ̃` is the corner entry.

### 7.8 Refined lifting at nonarchimedean local fields

Prove the nonarchimedean case of `refinedLocalLifting`: for a nonarchimedean local field `K`, every
continuous `ρ : Γ_K → U/Z` agrees modulo `P_(r,s)` with a continuous homomorphism `Γ_K → U`; that is,
every continuous `Γ_K → U/P_(r,s)` that lifts to `U/Z` lifts to `U`. All residue characteristics,
including `p`, are allowed. Route: in the cases of 7.4 the corner obstruction vanishes; otherwise use
7.5 if the twisted boundary sequence is not split and 7.7 if it is. The full lift induces the given
map to `U/P_(r,s)`, not necessarily the chosen lift to `U/Z`. This is stronger than local Massey
vanishing, and it is the form a homogeneous-space argument consumes. (HW, Proposition 5.3, p. 19,
proof pp. 19–21.)
*Needs:* 7.2, 7.4, 7.5, 7.7.

**Checks.**

- For `n = 3`, `r = s = 1`, `P_(1,1)` has three coordinates and `U/P_(1,1) ≅ 𝔽_p³`.
- For `α̃` trivial the lift is trivial.
- The statement with `U¹` in place of `P_(r,s)` is local Massey vanishing (HW, Remark 5.4, p. 19);
  since `Z ⊆ P_(r,s) ⊆ U¹` the statement here implies it.

### Examples

- `K = ℚ₇`, `p = 3`, `n = 3`: `μ₃ ⊆ ℚ₇`, `H²(ℚ₇, ℤ/3) = ℤ/3`, and either 7.5 or 7.7 is needed.

### Dependencies

Layer 1; ArithmeticGaloisDuality §R02.1.4; ProfiniteCohomology Layers 5, 8, 9 (with
gap:char-p-galois-h2-vanishing) and 12; ProfiniteProPGroups Layer 5; ClassFieldTheory Layer 5 through
Tau Ceti's local duality.

## Layer 8: real places and local Massey vanishing

### 8.1 The `C₂` pairing

Prove that for every finite `𝔽₂[C₂]`-module `V`, with `t = σ − 1` (so `t² = 0`),
`H¹(C₂, V) = ker t / im t`, and evaluation induces a perfect pairing

```text
H¹(C₂, V^∨) × H¹(C₂, V) → H²(C₂, 𝔽₂) = 𝔽₂.
```

Route: a cocycle is determined by its value at `σ`, in `ker(1 + σ) = ker t`, and coboundaries are
`im t`; the cup of two classes is read at `(σ, σ)`; `(im t)^⊥ = ker t^∨` and `(ker t)^⊥ = im t^∨` in
the finite dual. These are ordinary cohomology groups in positive degree, agreeing with Tate
cohomology there. The nonarchimedean local duality theorem is not used at the real place. (Milne,
II, Example 1.20, p. 66: for a finite cyclic group with generator `σ`, `H¹` is `ker N/(σ − 1)M`, which
for `C₂` and an `𝔽₂`-module is `ker t/im t`; Proposition 3.4, p. 81, for the period-two
identification `H²(C₂, 𝔽₂) = Ĥ⁰(C₂, 𝔽₂) = 𝔽₂`; the perfectness of the pairing is the finite
linear algebra of the route.)
*Needs:* ProfiniteCohomology Layers 2 and 8; Tau Ceti
`ContCohomology.H1pi_eq_zero_iff_exists_smul_sub_eq`, `ContCohomology.explicitH2CyclicEquiv`,
`ContCohomology.explicitCup11`, `TauCeti.InternalHom.evalPairing`.

**Checks.**

- For the trivial module `𝔽₂`, both `H¹` are `𝔽₂` and the pairing is `x ∪ x ≠ 0`.
- For the free module `𝔽₂[C₂]`, `ker t = im t` (both of order two, computed) and both `H¹` vanish.
- For `V = 𝔽₂ ⊕ 𝔽₂[C₂]`, both `H¹` are `𝔽₂`, coming from the trivial summand.

### 8.2 Local fields

Define `IsLocalField K` for a field `K` in `Type`: `K` is a nonarchimedean local field for some
valuative relation and compatible topology, or `K ≅ ℝ`, or `K ≅ ℂ`. Prove that every finite
extension of a local field is a local field (Tau Ceti
`TauCeti.finiteExtension_isNonarchimedeanLocalField`, which asks for no separability, in the
nonarchimedean case; a finite extension of a field isomorphic to `ℝ` is isomorphic to `ℝ` or `ℂ`),
and that `Γ_K` is trivial for `K ≅ ℂ` and of order two for `K ≅ ℝ`.
*Needs:* Mathlib `IsNonarchimedeanLocalField`; Tau Ceti `TauCeti.finiteExtension_isNonarchimedeanLocalField`,
`TauCeti.AbsoluteGaloisGroup`.

- The nonarchimedean disjunct provides `IsNonarchimedeanLocalField K` for some valuative relation
  and topology, with its consequences (finite residue field, discrete valuation ring of integers).
- `ℝ` and `ℂ` are local fields, and so is every field isomorphic to one of them.
- A finite extension of a local field is a local field; over `ℝ` it is `ℝ` or `ℂ` up to isomorphism.

**Checks.**

- `ℚ` is not a local field: it is countable, while `ℝ`, `ℂ` and every nonarchimedean local field are
  uncountable.
- `ℚ_p` and `𝔽_q((t))` are local fields; the definition includes equal characteristic.
- `Γ_ℂ` is trivial, so every statement about lifting is trivial over `ℂ`.

### 8.3 Archimedean refined lifting

Prove the archimedean case of `refinedLocalLifting`: for `K ≅ ℝ` or `ℂ`, every continuous
`Γ_K → U/Z` agrees modulo `P_(r,s)` with a continuous homomorphism `Γ_K → U`. Route: over `ℂ`, `Γ_K`
is trivial; over `ℝ` with `p` odd, a homomorphism `C₂ → U/Z`, a `p`-group, is trivial; over `ℝ` with
`p = 2`, repeat 7.2–7.7 with 8.1 in place of local duality for the nonsplit case, the split case being
unchanged. Together with 7.8 this proves `refinedLocalLifting` for every field satisfying
`IsLocalField`. (HW apply Proposition 5.3 at every place in the proof of Theorem 5.1, p. 22, while
the proposition is proved for nonarchimedean fields; this target supplies the archimedean case.)
*Needs:* 7.2, 7.3, 7.7, 7.8, 8.1, 8.2.

**Checks.**

- Over `ℝ` with `p = 2` and `n = 3`, `H²(ℝ, 𝔽₂) = 𝔽₂`, so the obstruction can be nonzero and the
  nonsplit argument is needed.
- Over `ℝ` with `p = 3`, every homomorphism from `Γ_ℝ ≅ C₂` to the `3`-group `U/Z` is trivial.
- Over `ℂ` the group `Γ_ℂ` is trivial and the conclusion holds with `ρ′ = 1`.

### 8.4 Local Massey vanishing

Prove `localMasseyVanishing`: for every local field `K`, every prime `p` and every `n ≥ 3`, a
defined `n`-fold Massey product of classes of `H¹(K, 𝔽_p)` contains zero. Route: by
`masseyDefined_iff_exists_lift` there is a continuous lift `Γ_K → U/Z`; choose `r, s ≥ 1` with
`r + s + 1 = n`, which needs `n ≥ 3`; `refinedLocalLifting` gives a continuous `Γ_K → U` agreeing with
it modulo `P_(r,s) ⊆ U¹`, hence with the same adjacent entries; conclude by
`masseyContainsZero_iff_exists_lift`. (Mináč–Tân for nonarchimedean `K`, as recalled in HW,
Introduction, p. 3, item (2), and Remark 5.4, p. 19; the archimedean case by 8.3.)
*Needs:* 1.6, 7.8, 8.3.

**Checks.**

- Over `ℝ` with `p = 2` and `n = 2`, `⟨χ, χ⟩ = {χ ∪ χ}` for the sign character and `χ ∪ χ ≠ 0`
  (the class of Hamilton's quaternions): the hypothesis `n ≥ 3` cannot be dropped.
- If `H²(K, 𝔽_p) = 0` (7.4) every value is zero and the statement is immediate.
- Over `ℂ` every class is zero and every product is `{0}`.

### Examples

- Over `ℝ` with `p = 2`, `⟨χ, χ, χ⟩` is not defined, since `χ ∪ χ ≠ 0`; `⟨χ, 0, χ⟩` is defined and
  contains zero.

### Dependencies

Layers 1 and 7; ProfiniteCohomology Layers 2 and 8; Mathlib `IsNonarchimedeanLocalField`; Tau Ceti
finite extensions of local fields.

## Layer 9: filtered modules and the twisted Dwyer correspondence

Throughout, `R` is a finite commutative ring, `N₀, …, Nₙ` are finite `R`-modules with continuous
`R`-linear `Γ`-actions `χ_i : Γ → Aut_R(N_i)`, and `M_ij = Hom_R(N_j, N_i)`.

### 9.1 The Hom-coefficient DG category

Define the continuous Hom-coefficient DG category with objects `0, …, n`, Hom complexes
`C•_cts(Γ, M_ij)` with the action `g·f = χ_i(g) f χ_j(g)⁻¹`, and the composition cup
`(a ∪ b)(g, h) = a(g) ∘ (g·b(h))` for `a ∈ C¹(Γ, M_ij)`, `b ∈ C¹(Γ, M_jk)` (in general, the formula of
0.1 with composition as the pairing). Prove strict associativity and the Leibniz rule as in 0.1, and
specialize DGAInfinity Layer 8's degree-one matric defining systems: entries `a_ij ∈ C¹(Γ, M_ij)`,
`d a_ij = −Σ a_im ∪ a_mj`, value the class of `−Σ a_0m ∪ a_mn` in `H²(Γ, M_0n)`. (HW, §7, pp. 24–25,
Remark 7.1 and Example 7.2.)
*Needs:* 0.1; DGAInfinity Layers 1 and 8; Tau Ceti `TauCeti.DGCategoryData`, `TauCeti.homAction`,
`TauCeti.InternalHom`.

- The DG category with the displayed Hom complexes, an object of DGAInfinity Layer 1's carrier,
  given by Tau Ceti's `TauCeti.DGCategoryData`.
- The coefficient action on `M_ij` is `f ↦ χ_i f χ_j⁻¹`.
- The composition cup has the translated formula above.
- Degree-one defining systems and their values are DGAInfinity's, specialized.

**Checks.**

- With every `N_i = R` and trivial actions this is the cochain algebra of 0.1.
- For one-dimensional `𝔽_p`-modules with characters `χ_i`, the action on `M_ij ≅ 𝔽_p` is
  `χ_i χ_j⁻¹`.
- If `N_i = 0`, every Hom group into or out of `i` is zero.
- The cup of `a_ij` and `a_jk` at `(g, h)` is `a_ij(g) ∘ g·a_jk(h)`; dropping the translation does not
  give the twisted defining equation of 9.5.

### 9.2 Filtered automorphism groups

For `W = ⊕ N_i` with the filtration `W_i = ⊕_{j≤i} N_j`, define `T(W)` as the group of `R`-linear
automorphisms preserving every `W_i`, the diagonal map `T(W) → Π Aut_R(N_i)` with its block-diagonal
section, its kernel `U(W)`, and `U¹(W)`, the subgroup acting as the identity on every `W_i/W_{i−2}`.
Prove that `U(W)` and `U¹(W)` are normal in `T(W)` and that, when every `N_i` is free of rank one with
a chosen basis, `U(W)` is `Uₙ₊₁(R)`, `U¹(W)` its subgroup `U¹`, and `T(W)` the invertible upper
triangular group `Tₙ₊₁(R)`. Freeness or rank one is not required for the constructions. (HW, §7,
p. 25.)
*Needs:* 9.1; 1.1; Tau Ceti `TauCeti.upperTriangularGroup`, `TauCeti.UpperTriangularGroup.diag`,
`TauCeti.UpperTriangularGroup.diagonalHom`.

- `T(W)` is a subgroup of the `R`-linear automorphisms of `W`; a filtration-preserving automorphism
  of a finite flag preserves each step bijectively.
- The diagonal map is a split surjection onto `Π Aut_R(N_i)`.
- `U(W)` and `U¹(W)` are normal subgroups of `T(W)`.
- Elements are determined by their blocks `N_j → N_i`, which multiply by composition.
- For free rank-one `N_i`, `U(W)` is `TauCeti.upperUnitriangularGroup` and `T(W)` is
  `TauCeti.upperTriangularGroup`.

**Checks.**

- The diagonal of the block-diagonal section of a tuple of automorphisms is that tuple.
- For all `N_i = 𝔽_p` with chosen bases, `U¹(W)` consists of the unitriangular matrices with zero
  adjacent entries.
- A zero summand `N_i` contributes no block coordinates and a trivial automorphism group.
- For four summands `N_i = 𝔽₂` with chosen bases, `T(W) = U₄(𝔽₂)` (every `Aut(N_i)` is trivial) has
  order `64`, `U¹(W)` is generated by `e₀₂, e₁₃, e₀₃` and has order `8`, and `T(W)/U¹(W)` has
  order `8`; the commutator `[e₀₁(1), e₁₂(1)] = e₀₂(1)` is nontrivial in `T(W)` and trivial in
  `T(W)/U¹(W)`, which is abelian.
- For `R = ℤ/4`, `N₀ = ℤ/2` and `N₁ = ℤ/4`, the block `Hom_R(N₁, N₀) ≅ ℤ/2` is not `R`; no block may be
  silently identified with `R`.

### 9.3 The twisted adjacent character

Prove that `A(W) = T(W)/U¹(W) ≅ (⊕ M_{i,i+1}) ⋊ Π Aut_R(N_i)`, with law `(a, d)(b, e) = (a + d·b, de)`,
and define, for fixed actions `χ` and fixed adjacent cocycles `a_i ∈ Z¹(Γ, M_{i,i+1})`, the twisted
adjacent character `α(g) = ((a_i(g))_i, (χ_i(g))_i)`. It is a continuous homomorphism because each
`a_i` is a crossed homomorphism. Replacing `a` by `a + d⁰u` conjugates `α` by `(−u, 1)`:
`(−u, 1)(a(g), χ(g))(u, 1) = (a(g) + g·u − u, χ(g))`. So the classes alone determine `α` up to
conjugacy, not a distinguished homomorphism. (HW, §7, pp. 25–26.)
*Needs:* 9.1, 9.2; 0.4.

- `A(W)` is the split semidirect product above.
- `α` is the homomorphism attached to `χ` and the fixed cocycles.
- Its coordinates are `a(g)` and `χ(g)`.
- The change of cocycles `a ↦ a + d⁰u` is conjugation by `(−u, 1)`.

**Checks.**

- For trivial `χ` and every `N_i` free of rank one over `R` with a chosen basis, this is the
  adjacent homomorphism of 1.3. For `R = ℤ/4` and every `N_i = ℤ/2` the scalar model is over
  `𝔽₂`, even with trivial actions: the adjacent Hom coordinates have order `2`, not `4`.
- From `a = 0`, conjugation by `(−u, 1)` gives the cocycle `d⁰u`, not `−d⁰u`.
- If every adjacent Hom is zero, `α` is the diagonal character.

### 9.4 The twisted corner extension

Prove that for `n ≥ 1`, `Z(W) = Hom_R(Nₙ, N₀) = M₀ₙ`, embedded as the corner transvections, is
abelian, normal in `T(W)` and central in `U(W)` but in general not central in `T(W)`, with
`T(W)`-action `f ↦ d₀ f dₙ⁻¹`; for `n = 0` there is no corner transvection and `Z(W)` is trivial.
Define the extension `1 → Z(W) → T(W) → T(W)/Z(W) → 1` and its class
`u ∈ H²(T(W)/Z(W), Z(W))` for the induced action; pulled back along any lift of the twisted adjacent
character, the coefficient action is the given action on `M₀ₙ`. For one-dimensional `𝔽_p`-modules the
corner subgroup is `triangularCorner`. (HW, §7, (7.2), p. 26.)
*Needs:* 9.2, 9.3; ProfiniteProPGroups Layer 5.

- The extension with kernel the actual Hom module `M₀ₙ`, and its corner-zero section.
- The corner inclusion is injective and normal in `T(W)`.
- Diagonal conjugation acts on the corner by `d₀ f dₙ⁻¹`.
- The class `u` is the canonical extension class with its induced action.

**Checks.**

- With trivial diagonal action and every `N_i` free of rank one over `R` with a chosen basis,
  restricting to `U(W)` gives the corner extension of 1.4. For `R = ℤ/4`, `n = 3` and every
  `N_i = ℤ/2`, `U(W) = U₄(𝔽₂)` has order `64`, not `|U₄(ℤ/4)| = 4096`.
- Over `𝔽₃` with `d₀ = −1`, `dₙ = 1`, diagonal conjugation negates a nonzero corner: `Z(W)` is not
  central in `T(W)`.
- If `Hom_R(Nₙ, N₀) = 0` the quotient by `Z(W)` changes nothing.

### 9.5 The twisted Dwyer correspondence

Fix `χ` and adjacent cocycles `a_i`, with twisted adjacent character `α : Γ → A(W)`. Prove that
defining systems with exactly these adjacent entries correspond bijectively to continuous lifts
`α_Λ : Γ → T(W)/Z(W)` of `α`, by `a_ij(g) = (α_Λ)_ij(g)·χ_j(g)⁻¹` and `(α_Λ)_ij(g) = a_ij(g)·χ_j(g)`,
and that the value is `−α_Λ* u ∈ H²(Γ, M₀ₙ)`. Route: the block equation of `α_Λ(gh) = α_Λ(g)α_Λ(h)`,
right-multiplied by `χ_j(gh)⁻¹`, is the twisted defining equation; the corner of the corner-zero
section's factor set is `+Σ a_0m ∪ a_mn`. The bijection fixes the cocycles, not their classes: for
`Γ = C₂`, `R = 𝔽₃`, `N₀` the sign character and `N₁, N₂, N₃` trivial, the adjacent coboundary
`a₀₁(σ) = 1` (`= d⁰1`) with all other entries zero represents zero classes but does not lie over the
character built from the zero cocycles. (HW, Proposition 7.3 and (7.3), pp. 26–27, which state the
bijection for all representatives of the classes.)
*Needs:* 9.1, 9.3, 9.4; 0.2.

**Checks.**

- For trivial `χ` and all `N_i = R`, the correspondence is 1.5 with the same sign.
- In rank one the corner transforms by `χ₀χₙ⁻¹`, and may be a nontrivial Galois module.
- The representative counterexample above: `d⁰1(σ) = σ·1 − 1 = −2 = 1` in `𝔽₃` with the sign action.

### 9.6 Twisted class-level criteria

Prove that for classes `α_i ∈ H¹(Γ, M_{i,i+1})` the twisted Massey product is defined exactly when
one, equivalently every, twisted adjacent character representing them lifts to `T(W)/Z(W)`, and
contains zero exactly when it lifts to `T(W)`. Route: 9.5 for fixed representatives and the
splitting criterion; for two representatives, lift the conjugating element `(−u, 1)` to `T(W)`, which
carries lifts of one character bijectively to lifts of the other. No bijection is asserted between all
defining systems of the classes and the lifts of one character. (HW, Proposition 7.3, pp. 26–27, and
its use in Theorem 7.4.)
*Needs:* 9.3, 9.5; ProfiniteProPGroups Layer 5; InverseGaloisAndArithmeticFundamentalGroups §IG.4.1.

**Checks.**

- For trivial `χ` and every `N_i` free of rank one over `R` with a chosen basis, this is 1.6.
- In the counterexample of 9.5 both representatives give defined products containing zero.
- Over `Γ = ℤ/2`, `R = 𝔽₂`, rank one and trivial `χ`, `⟨χ′, χ′⟩` for the nonzero `χ′` is defined and
  does not contain zero, as in Layer 1.

### 9.7 The rank-one twisted boundary subgroup

For `R = 𝔽_p`, every `N_i` one-dimensional, `n ≥ 3` and `r + s + 1 = n`, define `P_(r,s)(W) ⊆ U(W)` as
the internal sum of the last-column summands `Hom(Nₙ, N_i)`, `i ≤ r`, and the first-row summands
`Hom(N_j, N₀)`, `j ≥ n − s`. Prove that the two parts meet exactly in `Z(W)`, counted once, that
`P_(r,s)(W)` is `T(W)`-normal and abelian of dimension `r + s + 1` with quotient by `Z(W)` of dimension
`r + s`, and that bases identify it with the subgroup of 7.1, with the diagonal action retained; in the
matrix form its elements are those satisfying `IsTwoBoundary n r s`. (HW, §7, p. 28, where the two
sums are displayed as an external direct sum; at `n = 3`, `r = s = 1` that would have four
coordinates instead of three.)
*Needs:* 7.1, 9.2, 9.4.

- `P_(r,s)(W)` is a `T(W)`-normal subgroup, the internal sum of the two boundary parts.
- The two parts intersect in `Z(W)`.
- Its dimension is `r + s + 1`, its quotient by `Z(W)` has dimension `r + s`.
- After choosing bases its support is that of 7.1, with the diagonal characters acting.

**Checks.**

- At `n = 3`, `r = s = 1`, the summands are `M₀₂, M₀₃, M₁₃`.
- The corner transforms by `χ₀χₙ⁻¹`, in general nontrivially.
- The external direct sum of the two full boundary parts has dimension `r + s + 2` and is not this
  subgroup.

### Examples

- For `p = 2` every character `Γ → 𝔽₂ˣ` is trivial, and 9.5 reduces to 1.5.

### Dependencies

Layers 0, 1 and 7; DGAInfinity Layers 1 and 8; ProfiniteProPGroups Layer 5;
InverseGaloisAndArithmeticFundamentalGroups §IG.4.1; Tau Ceti internal Hom and upper triangular groups.

## Layer 10: rank-one twisted local lifting

### 10.1 Prime-to-`p` descent along the diagonal characters

Let `K` be a local field, `p` a prime and `χ₀, …, χₙ : Γ_K → 𝔽_pˣ` continuous characters, and let `K′`
be the fixed field of their common kernel. Prove that `K′/K` is finite Galois of degree dividing
`(p − 1)^{n+1}`, hence prime to `p`, that `K′` is a local field, and that for every finite
`p`-primary discrete `Γ_K`-module `M` and every `q ≥ 0` restriction `H^q(K, M) → H^q(K′, M)` is
injective, since `cor ∘ res` is multiplication by `[K′ : K]`, an automorphism of `M`. HW argue with
the global field cut out by global characters and the completions above `v`; the descent is local,
and over `ℝ` the extension `K′` is `ℝ` or `ℂ`. (HW, proof of Theorem 7.4, pp. 27–28.)
*Needs:* 8.2; ProfiniteCohomology Layer 10; Tau Ceti `TauCeti.ContinuousCohomology.corestriction_res`,
`TauCeti.absoluteGaloisGroupEquivFixingSubgroup`, `TauCeti.finiteExtension_isNonarchimedeanLocalField`.

**Checks.**

- For `p = 2` every character is trivial and `K′ = K`.
- For `p = 3` and `K = ℝ`, the sign character gives `K′ = ℂ`, of degree `2`, prime to `3`.
- The injectivity fails for `M` not `p`-primary: for `p = 3`, `K = ℝ`, `K′ = ℂ` and `M = ℤ/2`,
  `H²(ℝ, ℤ/2) = ℤ/2` restricts to `H²(ℂ, ℤ/2) = 0`.

### 10.2 The corner of the upper triangular group

Define `triangularCorner R n`, the corner subgroup `Z(W)` of `Tₙ₊₁(R)` in matrix form: the normal
closure of the invertible upper triangular matrices that differ from the identity only at entries
strictly above the diagonal in position `(0, n)`. Prove that for `n ≥ 1` these matrices already
form a normal subgroup isomorphic to `(R, +)`, central in `Uₙ₊₁(R)` and not in `Tₙ₊₁(R)` in general,
and that for `n = 0`, where `(0, 0)` is a diagonal entry and so excluded, the generating set is `{1}`
and the subgroup is trivial; `triangularCorner.normal` records normality, which makes
`Tₙ₊₁(R)/Z(W)` a group. (HW, §7, p. 26, for `Z(W)`: abelian, normal in `T(W)`, central in `U(W)`
and not in `T(W)` in general.)
*Needs:* 9.4; Mathlib `Subgroup.normalClosure`; Tau Ceti `TauCeti.upperTriangularGroup`.

- `triangularCorner R n` is a normal subgroup of `Tₙ₊₁(R)` (`triangularCorner.normal`).
- For `n ≥ 1` it is `{1 + tE₀ₙ : t ∈ R} ≅ (R, +)`.
- Its intersection with `Uₙ₊₁(R)` is the centre of `Uₙ₊₁(R)`.
- Conjugation by a diagonal matrix `d` acts by `t ↦ d₀ t dₙ⁻¹`.

**Checks.**

- For `n = 0` the subgroup is trivial, since no entry lies strictly above the diagonal: over `𝔽₃`
  the generating set is `{1}` and the normal closure has order `1`, whereas the matrices that
  differ from the identity only at `(0, 0)` would be all of `𝔽₃ˣ`, of order `2`.
- Over `𝔽₃`, conjugation by `diag(−1, 1, 1)` sends `1 + E₀₂` to `1 − E₀₂`: the corner is not central
  in `T₃(𝔽₃)`.
- It is contained in every `P_(r,s)` of 7.1, as `IsTwoBoundary n r s` allows the corner, and is
  smaller: over `𝔽₂` with `n = 3`, `e₀₂(1)` lies in `P_(1,1)` but not in the corner, `e₀₃(1)` lies
  in both, the corner has order `2` and `P_(1,1)` order `8`.

### 10.3 Rank-one twisted refined lifting

Prove `twistedRefinedLocalLifting`: for a local field `K`, a prime `p`, `r, s ≥ 1`, `n = r + s + 1` and
`T = Tₙ₊₁(𝔽_p)`, every continuous `ρ : Γ_K → T/Z(W)` agrees modulo `P_(r,s)` with a continuous
homomorphism `Γ_K → T`. The diagonal of `ρ`, which is the tuple of twisting characters, is arbitrary.
Route: `P_(r,s)` is abelian and normal in `T`, so the obstruction to lifting the image of `ρ` in
`T/P_(r,s)` is a class in `H²(K, P_(r,s))` (InverseGaloisAndArithmeticFundamentalGroups §IG.4.1);
over the field `K′` of 10.1 the diagonal is trivial, `ρ` restricts into `U/Z`, and
`refinedLocalLifting` over `K′` kills the restricted obstruction; 10.1 kills the obstruction itself.
This is the local step of HW Theorem 7.4 for coefficients `N_i` of rank one over `𝔽_p`. (HW, proof
of Theorem 7.4, p. 28.)
*Needs:* 7.1, 8.3, 9.7, 10.1, 10.2; InverseGaloisAndArithmeticFundamentalGroups §IG.4.1;
ProfiniteProPGroups Layer 5.

**Checks.**

- For `ρ` with trivial diagonal this is `refinedLocalLifting`.
- For `p = 2`, `T = U` and `triangularCorner` is the centre; the statement is again
  `refinedLocalLifting`.
- For `p` odd and `K = ℝ`, a diagonal with the sign character in one coordinate is allowed; `K′ = ℂ`.

### Examples

- `K = ℚ₇`, `p = 3`, `n = 3`, diagonal `(ω, 1, 1, 1)` with `ω` the unramified character of order two:
  `K′` is the unramified quadratic extension, of degree `2`.

### Dependencies

Layers 7–9; ProfiniteCohomology Layer 10; InverseGaloisAndArithmeticFundamentalGroups §IG.4.1; Tau Ceti
corestriction and finite extensions of local fields.

## Layer 11: the defined non-vanishing `ℤ/8` triple

Throughout, `p ≠ q` are primes with `p ≡ q ≡ 1 (mod 8)`, `χ₀₁, χ₂₃ : Γ_ℚ → ℤ/8` are the independent
lifts of the quadratic characters of `ℚ(√p)` and `ℚ(√2q)` supplied by
InverseGaloisAndArithmeticFundamentalGroups §IG.4.2, and `L` is their joint fixed field, of degree
`64` with quadratic subfields `ℚ(√p)`, `ℚ(√2q)`, `ℚ(√2pq)`. Independence is supplied; it is not
inferred from choosing two arbitrary cyclic-eight lifts. `U₈ = U₄(ℤ/8)`.

### 11.1 The cyclic-eight unitriangular modules

Let `P₈ ⊆ U₈` be the subgroup on the coordinates `02, 03, 12, 13` and `D₈ = U₈¹` the subgroup on
`02, 03, 13`. Prove that `P₈ ≅ (ℤ/8)⁴` is abelian, that `C = U₈/P₈ ≅ (ℤ/8)²` on the coordinates `01, 23`
has the section by the commuting elements `e₀₁, e₂₃`, so `U₈ = P₈ ⋊ C`, and that conjugation makes
`0 → D₈ → P₈ → ℤ/8·e₁₂ → 0` an exact sequence of `C`-modules with trivial action on the quotient.
Pull these modules back to `Γ_ℚ` along `(χ₀₁, χ₂₃)`. The auxiliary coefficients are twisted although
the final Massey inputs have constant coefficients. (HW, §7, pp. 28–29, and (7.6), p. 31.)
*Needs:* 1.1, 1.2; InverseGaloisAndArithmeticFundamentalGroups §IG.4.2.

- The pulled-back exact sequence `D₈ → P₈ → ℤ/8` of finite `Γ_ℚ`-modules.
- The coordinate bases `(02, 03, 13)` of `D₈` and `(02, 03, 12, 13)` of `P₈`.
- The section `C → U₈` by `e₀₁(a)e₂₃(b)`, with `U₈ = P₈ ⋊ C`.
- The action of `e₀₁` and `e₂₃` on each basis vector, and the induced action of `Γ_ℚ`.

**Checks.**

- `P₈` has `8⁴` elements and `D₈` has `8³`, so the quotient has eight.
- `e₀₁(a)e₂₃(b) = e₂₃(b)e₀₁(a)` with `C`-coordinates `(a, b)`.
- `e₀₁ e₁₂ e₀₁⁻¹ = e₁₂e₀₂`: the middle coordinate has no `C`-equivariant section.
- `P₈` contains the middle coordinate `12`; it is not the two-boundary subgroup `P_(1,1)` of `U₄`.

### 11.2 The dual boundary

Prove that Cartier-dualizing the projection of `D₈` onto its coordinates `02, 13` (with kernel the
corner `03`) gives `0 → μ₈² → D₈^D → μ₈ → 0`, and that for every field `K ⊇ ℚ` the connecting map
`H⁰(K, μ₈) → H¹(K, μ₈²) = (Kˣ/Kˣ⁸)²` sends `−1` to `([16q⁴], [p⁴])`, with the contragredient
endpoint action and the cyclotomic action on `μ₈`; the order of the coordinates matters. (HW, proof
of Lemma 7.7, p. 29.)
*Needs:* 11.1; ProfiniteCohomology Layers 5 and 9; Tau Ceti `TauCeti.homAction`.

**Checks.**

- The quotient `D₈/⟨e₀₃⟩` has trivial `C`-action (`e₀₁e₁₃e₀₁⁻¹ = e₀₃e₁₃` and `e₂₃e₀₂e₂₃⁻¹ = e₀₂e₀₃⁻¹`
  are trivial modulo `e₀₃`), so its dual is `μ₈²` with the cyclotomic action.
- `16q⁴ = (2q)⁴` and `p⁴` are the fourth powers of the radicands of `ℚ(√2q)` and `ℚ(√p)`.
- Over `K ⊇ ℚ(√p, √q, √2)` both coordinates are eighth powers and the boundary of `−1` is zero.

### 11.3 The Wang class

Define `w ∈ Ш¹(ℚ, D₈^D)` as the image of `([16], [1]) ∈ H¹(ℚ, μ₈²)`, and prove that it lies in the
all-place kernel and is nonzero. At `v ≠ 2` the pair is zero, since `16` is an eighth power in `ℚ_v`
(one of `2, −2, −1` is a square there, by `x⁸ − 16 = (x² − 2)(x² + 2)(x² − 2x + 2)(x² + 2x + 2)`; the
real place included). At `2` the pair equals the boundary `([16q⁴], [p⁴])` of 11.2 because `p` and `q`
are squares in `ℚ₂`. Globally the kernel of `H¹(ℚ, μ₈²) → H¹(ℚ, D₈^D)` is the image of
`μ₈(ℚ) = {±1}`, namely `{0, ([16q⁴], [p⁴])}`, and `([16], [1])` is neither: `16` is not an eighth power
and `p⁴` is not one, by valuations. (HW, proof of Lemma 7.7, p. 29.)
*Needs:* 11.2; ArithmeticGaloisDuality §R02.3.0d; ProfiniteCohomology Layer 9.

- `w` is a class of `Ш¹(ℚ, D₈^D)`.
- Its `H¹` representative is the image of `([16], [1])`.
- It is locally zero at every `v ≠ 2`, and at `2` it is killed by the boundary of 11.2.
- It is nonzero, by the two-element computation of the boundary image.

**Checks.**

- At every odd place and at the real place `16` is an eighth power, so the pair vanishes before
  mapping to `D₈^D`.
- At `ℚ₂` the pair `([16], [1])` is nonzero in `H¹(ℚ₂, μ₈²)` (`v₂(16) = 4`), and zero after the
  boundary quotient.
- A boundary witness over `ℚ₂` is not one over `ℚ`: `[p⁴] ≠ [1]` in `ℚˣ/ℚˣ⁸`.

### 11.4 The eighth-power kernel over `L`

Prove that `[16]` is a nonzero element of `Ш¹(L, μ₈)`, hence (ArithmeticGaloisDuality §R02.4.5b)
`Ш¹(L, μ₈) = {0, [16]} ≅ ℤ/2` with trivial `Gal(L/ℚ)`-action. At a place `w` above `2`, `L_w` contains
`√2q` and `√q` (`q ≡ 1 (mod 8)` is a square in `ℚ₂`), hence `√2`, and `(√2)⁸ = 16`; at other places
`16` is already an eighth power. If `16` were an eighth power in `L`, `L` would contain `√2`, `√−2` or `i`,
none of which generates one of its three quadratic subfields. (HW, proof of Lemma 7.7, p. 30.)
*Needs:* 11.1; ArithmeticGaloisDuality §§R02.3.0d and R02.4.5b; InverseGaloisAndArithmeticFundamentalGroups
§IG.4.2.

**Checks.**

- `Ш¹(ℚ, μ₈) = 0` (ArithmeticGaloisDuality §R02.4.5b) while `Ш¹(L, μ₈) ≅ ℤ/2`: the two kernels must
  not be confused.
- For `p = 17`, `q = 41`, the quadratic subfields are `ℚ(√17)`, `ℚ(√82)`, `ℚ(√1394)`, none of
  `ℚ(√2)`, `ℚ(√−2)`, `ℚ(i)`.
- The unique nonzero element of a group of order two is fixed by every automorphism.

### 11.5 Invariant dual coordinates over `L`

Prove that over `L` the endpoint twists disappear, so `Ш¹(L, D₈^D) = Ш¹(L, μ₈)³` in the order
`(02, 03, 13)` and `Ш¹(L, P₈^D) = Ш¹(L, μ₈)⁴` in the order `(02, 03, 12, 13)`; that with `s = e₀₁` and
`t = e₂₃` acting through `C = Gal(L/ℚ)` and the dual endpoint action, a triple is invariant exactly
when `s·a₁₃ = a₀₃a₁₃`, `s·a₀ⱼ = a₀ⱼ` (`j = 2, 3`), `t·a₀₂ = a₀₂a₀₃⁻¹` and `t·a_i3 = a_i3` (`i = 0, 1`),
and a quadruple exactly when `s·a₁ⱼ = a₀ⱼa₁ⱼ`, `s·a₀ⱼ = a₀ⱼ` (`j = 2, 3`), `t·a_i2 = a_i2 a_i3⁻¹` and
`t·a_i3 = a_i3` (`i = 0, 1`); and that the coefficient map deletes the coordinate `12`. (HW, proof of
Lemma 7.7, p. 30, and (7.4).)
*Needs:* 11.1, 11.4; ProfiniteCohomology Layer 9; ArithmeticGaloisDuality §R02.3.0d.

**Checks.**

- The equations for the triple are those for the quadruple with the coordinate `12` deleted.
- The restriction of `w` to `L` is the triple `([16], [1], [1])`, and it is invariant:
  `s·[1] = [1] = [1]·[1]`, `s·[16] = [16]`, and `t·[16] = [16] = [16]·[1]⁻¹`, `C` acting trivially on
  `Ш¹(L, μ₈)`.
- The action combines the field automorphism with the dual endpoint action: if the endpoint action
  were dropped, invariance of a quadruple would not involve the factor `a₀ⱼ` in `s·a₁ⱼ = a₀ⱼa₁ⱼ`, and
  `([16], [1], a₁₂, [1])` with any `a₁₂` would be invariant.

### 11.6 The Wang class has no dual lift

Prove that `w` is not in the image of `Ш¹(ℚ, P₈^D) → Ш¹(ℚ, D₈^D)`. A preimage would restrict to an
invariant quadruple over `L` lifting `([16], [1], [1])`, whose coordinate `a₁₂ ∈ Ш¹(L, μ₈)` would
satisfy `s·a₁₂ = [16]·a₁₂`; but `s` acts trivially on `Ш¹(L, μ₈)` and `[16] ≠ 1`. (HW, proof of
Lemma 7.7, pp. 29–30.)
*Needs:* 11.3, 11.4, 11.5.

**Checks.**

- The obstruction uses the invariant subgroup over `L`, not merely nonsurjectivity over `L`.
- Replacing `[16]` by `[1]` in the first coordinate gives the trivial triple, which lifts.
- With `Ш¹(L, μ₈) = 0` the argument would give nothing; the Grunwald–Wang element is what is used.

### 11.7 A nonzero kernel in `Ш²`

Prove that `Ш²(ℚ, D₈) → Ш²(ℚ, P₈)` is not injective: by the perfect pairings
`Ш²(ℚ, M) × Ш¹(ℚ, M^D) → ℚ/ℤ` (ArithmeticGaloisDuality §R02.4.5a, statement (3)), which are natural
in `M`, `⟨f_* a, b⟩ = ⟨a, f^D_* b⟩` for `f : M → N` (ArithmeticGaloisDuality §R02.4.3, *Poitou–Tate
duality*, part (a)), the map `f_*` induced by `f : D₈ → P₈` is dual to `f^D_*`, the non-surjective
map `Ш¹(ℚ, P₈^D) → Ш¹(ℚ, D₈^D)` of 11.6. Choose `0 ≠ η ∈ Ш²(ℚ, D₈)` with zero image in `Ш²(ℚ, P₈)`,
hence in `H²(ℚ, P₈)`. This needs arithmetic duality, not only character duality of finite groups.
(HW, Lemma 7.7, p. 29.)
*Needs:* 11.6; ArithmeticGaloisDuality §§R02.3.0d, R02.4.3 and R02.4.5a.

**Checks.**

- A map of finite groups whose dual is not surjective is not injective.
- `Ш²` is a subgroup of `H²`, so a zero image in `Ш²` is a zero image in `H²`.
- For the constant module `ℤ/8`, `Ш²(ℚ, ℤ/8) = 0`; the kernel lives in the twisted `D₈`.

### 11.8 The middle character

Construct `χ₁₂ ∈ H¹(ℚ, ℤ/8)` with `δχ₁₂ = η` for the connecting map of
`0 → D₈ → P₈ → ℤ/8 → 0`, by exactness at `H²(ℚ, D₈)`; as the quotient action is trivial, `χ₁₂` is a
continuous homomorphism `Γ_ℚ → ℤ/8`. At every completion `δ(χ₁₂|_v) = η_v = 0`, while `δχ₁₂ ≠ 0`.
(HW, proof of Theorem 7.5, p. 30.)
*Needs:* 11.7; ProfiniteCohomology Layers 2 and 5.

- `χ₁₂` is a choice with the displayed boundary.
- `δχ₁₂ = η ≠ 0` in the twisted coefficients `D₈`.
- Every local boundary vanishes.
- `χ₁₂` is a continuous homomorphism `Γ_ℚ → ℤ/8`.

**Checks.**

- `χ₁₂ ≠ 0`, since its boundary is nonzero.
- `χ₁₂` is not in the image of `H¹(ℚ, P₈)`, by exactness.
- For every place `v`, `χ₁₂|_v` is in the image of `H¹(ℚ_v, P₈)`.

### 11.9 A locally solvable global embedding gap

Prove that `χ = (χ₀₁, χ₁₂, χ₂₃) : Γ_ℚ → (ℤ/8)³` has a continuous lift `Γ_{ℚ_v} → U₈` at every place `v`
and no continuous lift `Γ_ℚ → U₈`. Over `ℚ` or any completion, a lift of `χ` exists exactly when `χ₁₂`
is in the image of `H¹(P₈) → H¹(ℤ/8)`: since `U₈ = P₈ ⋊ C`, lifts of the endpoint pair are crossed
homomorphisms to `P₈` times the section, their middle coordinate is the image class, and equality
of classes in `H¹(ℤ/8)` is equality of characters. For the description of the lifts use
InverseGaloisAndArithmeticFundamentalGroups §IG.4.1, *Finite abelian-kernel obstruction and
pullback*, which allows any profinite source and a map that need not be surjective (at a real place
the endpoint pair has image of order at most `2`): for the split extension `1 → P₈ → U₈ → C → 1`,
if `β` is a lift of the endpoint pair `π` and `s` the section, `z(g) = β(g)s(π(g))⁻¹` satisfies
`z(gh) = z(g)·(g·z(h))`, and conversely `z(g)s(π(g))` is a lift for every continuous crossed
homomorphism `z`. (HW, (7.6) and proof of Theorem 7.5, p. 31.)
*Needs:* 11.1, 11.8; InverseGaloisAndArithmeticFundamentalGroups §IG.4.1; ProfiniteCohomology Layer 5.

**Checks.**

- No surjectivity is asked of the lifts.
- Conjugation by `P₈` changes a lift by a coboundary, which does not change the middle class.
- The endpoint characters alone always lift, by the section `C → U₈`.

### 11.10 The defined non-vanishing triple

Prove `exists_masseyDefined_not_masseyContainsZero_zmod_eight`: there are continuous characters
`χ₀₁, χ₁₂, χ₂₃ : Γ_ℚ → ℤ/8` whose triple Massey product is defined and does not contain zero. Route:
the local lifts of 11.9 make both cups `χ₀₁ ∪ χ₁₂` and `χ₁₂ ∪ χ₂₃` vanish in every `H²(ℚ_v, ℤ/8)`;
`Ш²(ℚ, ℤ/8) = 0` (ArithmeticGaloisDuality §R02.4.5b) makes them vanish globally, so a defining system
exists (0.3); if the product contained zero, `masseyContainsZero_iff_exists_lift` would give the
global lift excluded by 11.9. (HW, Theorem 7.5, p. 28, proof p. 31.)
*Needs:* 0.3, 1.6, 11.9; ArithmeticGaloisDuality §R02.4.5b.

**Checks.**

- Definedness and exclusion of zero are proved separately, by different arguments.
- The coefficients of the final product are the constant `ℤ/8`, although the proof uses the twisted
  `D₈` and `P₈`.
- The same construction with `ℤ/2` coefficients cannot work: `localMasseyVanishing` and HW
  Theorem 5.1 say defined products with `𝔽₂` coefficients contain zero.

### Examples

- `p = 17`, `q = 41`: `L` has degree `64` and quadratic subfields `ℚ(√17)`, `ℚ(√82)`, `ℚ(√1394)`.

### Dependencies

Layers 0–1; ArithmeticGaloisDuality §§R02.3.0d, R02.4.3, R02.4.5a and R02.4.5b;
InverseGaloisAndArithmeticFundamentalGroups §§IG.4.1 and IG.4.2; ProfiniteCohomology Layers 2, 5
and 9.

## Downstream consumers

- The homogeneous-space proof of Massey vanishing over number fields (HW, Theorems 1.3, 5.1 and 7.4)
  consumes Dwyer's criteria (Layer 1), the Bogomolov vanishing (Layer 4), the fixed-class and
  cyclic-kernel results (Layer 5), refined local lifting at every place (Layers 7–8) and its twisted
  form (Layer 10), together with the unramified Brauer groups and the Brauer–Manin obstruction of
  HeightsRationalPointsAndObstructions.
- Massey products in Galois cohomology of other fields (function fields, fields of virtual
  cohomological dimension one) consume Layers 0 and 1.

## Worked examples

- **The sign.** For `n = 2` over `Γ = (ℤ/3)²` with coordinate characters `x, y` and `R = 𝔽₃`,
  `⟨x, y⟩ = {−x ∪ y}`, and the class of the pulled-back corner extension of `U₃(𝔽₃)` is `+x ∪ y`.
- **The real place.** Over `ℝ`, `p = 2`: `⟨χ, χ⟩ = {χ ∪ χ} ≠ {0}`, so `n ≥ 3` is needed for local
  Massey vanishing, and `H²(ℝ, 𝔽₂) = 𝔽₂` makes the archimedean case of refined lifting nontrivial.
- **Length six.** At `p = 2`, `n = 6`, `a = (1, 1, 0, 0, 0, 1)`, `B^a` has dimension six and the
  fixed-class images span five dimensions (6.1).
- **`ℤ/8`.** With `p = 17`, `q = 41`, Layer 11 produces three characters `Γ_ℚ → ℤ/8` with a defined
  triple Massey product not containing zero.

## References

- [HW] Y. Harpaz and O. Wittenberg, *The Massey vanishing conjecture for number fields*,
  arXiv:1904.06512v2; Duke Math. J. 172 (2023), 1–41, doi:10.1215/00127094-2022-0004. Page numbers
  are those of the arXiv version 2 (33 pages); the published pagination differs.
- [Michailov] I. M. Michailov, *Bogomolov multipliers for unitriangular groups*, arXiv:1308.3408v2;
  C. R. Acad. Bulgare Sci. 68 (2015), 689–696. Page numbers are those of the arXiv version 2.
- [Moravec] P. Moravec, *Unramified Brauer groups of finite and infinite groups*, arXiv:1203.3190v1.
  Page numbers are those of the arXiv version 1.
- [Dwyer] W. G. Dwyer, *Homology, Massey products and maps between groups*, J. Pure Appl. Algebra 6
  (1975), 177–190, doi:10.1016/0022-4049(75)90006-7; cited by its locator, Theorem 2.4.
- [Milne] J. S. Milne, *Class Field Theory*, course notes, version 4.03 (2020), from the author's
  page. Page numbers are the printed ones of that version.

### Corrections to the printed sources

The following are read at the locators above, in the arXiv versions cited.

| Locator | Printed | Used here |
|---|---|---|
| HW, Lemma 5.5, p. 19 | discrete `Hom(C, A)` for any discrete `C` | finite `C` (7.2); the pointwise Hom of ArithmeticGaloisDuality §R02.1.4 in general |
| HW, Proposition 7.3, p. 26 | bijection with all defining systems of the classes | fixed adjacent cocycles (9.5); class-level statements by conjugation (9.6) |
| HW, Definition 3.2 and Lemma 4.7, pp. 9, 14 | outer exponent of `U¹` is `p` for every `p` | factorization through `(ℤ/p)ˣ`; least divisor `1` at `p = 2` (3.4) |
| HW, proof of Lemma 4.7, p. 14 | exponent of `U¹` divisible by `9` | divides `9` (3.2) |
| HW, proof of Lemma 4.13, p. 17 | factor `e₀₃` with parameter `1` | parameter `a₂` (5.5) |
| HW, proof of Proposition 6.1, p. 23 | the endpoint-zero copy has size four | size five (5.7) |
| HW, §7, p. 28 | external direct sum of the two boundaries | internal sum meeting in the corner (9.7) |
| HW, Proposition 5.3 and proof of Theorem 5.1, pp. 19, 22 | proposition for nonarchimedean fields, used at every place | archimedean case proved (8.1, 8.3) |
| HW, proof of Proposition 5.3, p. 19 | easy case lifts to `Z` | lifts to `U` (7.4) |
| HW, proof of Proposition 5.3, p. 21 | two occurrences of `ρ_(v,u)` | `ρ_(u,v)`, row first (7.6) |
| Michailov, §3, p. 5 | `γ_{m−1}(Uₘ(𝔽_p))` trivial | `γ_{m−1}` is the corner, `γₘ` trivial (1.2) |
| Michailov, Theorem 3.1 Case II, p. 8 | minimal-distance wedge with a distance-one element | two distance-`ℓ` elements of the group (4.4) |
