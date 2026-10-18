# Roadmap: scattering diagrams, wall crossing and theta functions

**Summary.** This roadmap develops scattering diagrams and their theta functions:
consistent diagrams and their reconstruction from a single group element, the consistent
completion of a finite set of initial walls, broken lines and the theta functions they
define, and positivity of wall functions and theta coefficients for skew-symmetric
polynomial inputs. Walls live in vector spaces and on integral-affine manifolds with
codimension-two singularities, and the focus-focus singularity is worked out as an
example. The general components it needs (BCH groups, completions, polyhedral complexes)
are built for reuse outside scattering.

| Layer | Title | What it delivers | Depends on |
|---|---|---|---|
| [0](#layer-0-positive-gradings-completions-and-actions) | Positive gradings, completions and actions | the group of wall labels (the completed BCH group of a positively graded Lie algebra), its PBW description by group-like elements, and the algebras on which labels act | Mathlib, Tau Ceti |
| [1](#layer-1-polyhedral-geometry-and-paths) | Polyhedral geometry and paths | rational polyhedral complexes, generic paths and their homotopies, and integral-affine manifolds with singularities | Mathlib, Tau Ceti; 0 for §1.5 |
| [2](#layer-2-general-scattering-diagrams) | General scattering diagrams | path products and consistency; the Kontsevich–Soibelman reconstruction of consistent diagrams from group elements | 0, 1 |
| [3](#layer-3-directed-scattering-and-completion) | Directed scattering and completion | existence and uniqueness of the consistent completion of initial walls, including exponents with no spatial direction | 0–2 |
| [4](#layer-4-realizations-and-specializations) | Realizations and specializations | wall crossing on commutative, quantum and slab algebras, and the comparison of the conical and directed descriptions | 0–3 |
| [5](#layer-5-broken-lines-general-position-and-theta-transport) | Broken lines, general position and theta transport | broken lines, theta functions, their transport across walls, and global theta sections | 0–4 |
| [6](#layer-6-integral-affine-covariance-descent-and-a-worked-example) | Integral-affine covariance, descent and a worked example | compatibility with integral-affine coordinate changes, gluing over charts, and the focus-focus example | 0–5 |
| [7](#layer-7-wall-positivity-and-positive-theta-coefficients) | Wall positivity and positive theta coefficients | positivity of wall functions and theta coefficients for skew-symmetric polynomial inputs | 0–5 |

## Scope and ownership

**Out of scope.** No target of this roadmap constructs or uses: motivic Hall
algebras and their multiplications, stability conditions and stacks, Hall integration
maps and Donaldson–Thomas invariants;
quantum positivity and canonical-basis comparisons; enumerative constructions;
general scheme reconstruction or mirror gluing from arbitrary singular affine input;
seeds, mutation, cluster monomials, `c`- and `g`-vectors and the comparison of theta
functions with cluster variables. The static skew inputs of Layer 7 are defined
without reference to cluster objects.

**Adjacent roadmaps.** The
[AnalyticToricGeometry roadmap](../AnalyticToricGeometry/README.md)
owns the toric lattice, salient cone, finite fan and dual-semigroup interfaces
consumed here; §1.1 adds affine cells and complexes allowing lineality and proves
comparisons on the existing cone carriers. The
[RepresentationTheory/LieGroups roadmap](../RepresentationTheory/LieGroups/README.md)
owns analytic local BCH and Lie-group exponential theory; §0.4 owns universal rational
BCH polynomials and algebraic nilpotent BCH groups over commutative `ℚ`-algebras. The
[RepresentationTheory/LieHighestWeight roadmap](../RepresentationTheory/LieHighestWeight/README.md)
owns the Poincaré–Birkhoff–Witt theorem for free modules; §0.4 owns its symmetrization
form over commutative `ℚ`-algebras for arbitrary Lie algebras.

**Library homes.** General components belong in the matching general areas of Tau Ceti,
for example its Lie algebra, filtration, group theory and convex geometry modules, not
under a scattering-specific directory; the scattering-specific carriers belong in
`TauCeti/Geometry/ScatteringDiagram/`.

## Conventions and supplier contracts

1. A lattice is a finite free `ℤ`-module. Every real vector space is a
   finite-dimensional real normed space `V` with an integral lattice map
   `i : L → V` satisfying `IsIntegralLattice`. The KS grading lattice is `N`; its
   spatial space is a model `V` of `Hom_ℤ(N,ℝ)` with a bijective evaluation map.
   The directed theory has a degree lattice `Γ`, a tangent lattice `Λ`, and an
   additive `ρ : Γ → Λ`, with `V ≅ Λ ⊗_ℤ ℝ` and normals in
   `Λ* = Module.Dual ℤ Λ`. Its positive monoid and cutoff degree live in `Γ`.
   The notation `L` in an identity-projection realization means `Γ=Λ=L`, `ρ=id`.
2. Scalar hypotheses are local to each construction. Graded Lie algebras,
   degree ideals and truncations (§0.2), and homogeneous wall-space data (§3.1),
   are over a commutative ring `R`. Ring filtrations and their completions (§0.3)
   are defined for associative rings; a specified commutative scalar ring gives
   the corresponding algebra structure on the same completion. Polyhedral
   cochains (§1.4) have coefficients in an abelian group. BCH groups, exponential
   actions and the all-order Lie-theoretic scattering and theta theorems use a
   commutative `ℚ`-algebra `R`. Their gradings, Lie maps, coefficient algebras and
   actions retain their `R`-linear structures in the public API. Universal BCH
   polynomials are constructed over `ℚ` and evaluated after scalar restriction.
   Homogeneous pieces need not be finite, free or flat. A coefficient algebra may
   be noncommutative; a derivation action means an `R`-linear Lie module action
   satisfying the Leibniz rule. The rational numbers specifying lattice geometry
   in Conventions 1, 3 and 6 are independent of the coefficient ring. Coefficient
   diagrams and finite decorated-path sums have semiring/module instances; function
   walls and the focus-focus algebra use commutative rings (§§0.7–0.8, 4.4, 6.3).
3. A truncation of order `k` retains degrees at most `k`; `F^a` denotes terms of
   degree at least `a`, and the truncation is the quotient by `F^{k+1}`. Products
   act on the left: the first crossing is the rightmost factor, and §0.5's ordered
   product places the smallest index leftmost. A wall with coorientation `ν` and
   label `θ` contributes `θ^{-sgn⟨ν,γ'⟩}`. KS walls are cooriented by the positive
   normal `n` and directed walls by the normal `m`. In the skew case the directed
   normal of the degree `n` is `{-,n}`; BLM's form is `ω_B=-{,}`. The quantum form is
   `β`, with `β(n,n')={n',n}`. In rank two with coordinates `(a,b)` and `{e_1,e_2}>0`,
   the directed normal of the ray through `(a,b)` is a positive multiple of `(b,-a)`.
4. At each order, affine positive-degree diagrams are finite; general bases have
   finite data on compact subsets. Completed diagrams need not be spatially locally
   finite. Global theta theorems require finite families of complete incoming histories
   closed under degeneration; all-order paths require admissibility at every order.
5. Italicized names are suggested Lean declaration names. The
   [Lean prototype](Suggested.lean) illustrates selected interfaces; this README
   is the definitive specification.
6. For the skew data of §4.2, `κ(n)∈ℚ_{>0}` is defined for every nonzero `n∈N` by
   `ℝ_{>0}n∩N°=ℕ_{>0}κ(n)n`; it is an integer on primitive `n`, and
   `κ(tn)=κ(n)/t` for rational `t>0` with `tn∈N`.

Suppliers are Mathlib and Tau Ceti declarations with their existing meanings; Tau Ceti
suppliers are consumed through the public interfaces of their modules.

- Algebra: `AddSubmonoid`, `AddMonoidAlgebra`, `MvPolynomial`, `MvPowerSeries` with
  `truncTotal` and `MvPolynomial.idealOfVars`; `AdicCompletion`;
  `IsFiltration`, `IsRingFiltration`, `IsModuleFiltration`;
  `GrpCat.sectionsSubgroup` for limits of group towers; `GradedLieAlgebra`,
  `GradedLieModule`, `GradedAlgebra`, `LieSubalgebra`, Lie ideals with `LieIdeal.mkQ`,
  `LieIdeal.liftQ` and `LieIdeal.lieHom_qext`, `LieAlgebra.center`,
  `LieRing.IsNilpotent`; `LieAlgebra.SemiDirectSum`, `LieDerivation`, `Derivation`;
  `TauCeti.heisenberg`.
- Enveloping algebras: `UniversalEnvelopingAlgebra`, `SymmetricAlgebra`,
  `instHopfAlgebra`, `IsGroupLikeElem`, `Bialgebra.IsPrimitiveElem`,
  `TauCeti.HopfIdeal.augmentation`, `FreeLieAlgebra`, `lowerCentralSeries`.
  `TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv` is PBW for free modules;
  symmetrization PBW over commutative `ℚ`-algebras for arbitrary Lie algebras is built
  here (§0.4).
- Exponentials and base change: `IsNilpotent.exp`, `Module.End.exp_mul_of_derivation`,
  `TauCeti.expAd` with `TauCeti.expAd_apply_eq_exp_mul_exp_neg`,
  `LieAlgebra.ExtendScalars`, `DirectSum.Decomposition.baseChange`, `TensorProduct`.
- Lattices, cones and polyhedra: `TauCeti.Toric.IsIntegralLattice` with
  `IsIntegralLattice.extend` and `realCharacter_comp`, `TauCeti.IsPrimitive`,
  `Module.Dual`, `Module.Free`, `Module.Finite`, `AddSubgroup.index`; `PointedCone` with
  `FG`, `DualFG`, `IsFaceOf`, `FG.finite_face`, `closure` and `IsLatticeRational`, and
  `TauCeti.Toric.IsLatticeRational.fg_dualSemigroup`; `IsExposed`, `intrinsicInterior`,
  `intrinsicFrontier`, `TauCeti.IsConvexPolyhedron`. `PointedCone` allows lineality and
  `TauCeti.Toric.Fan` with `Fan.IsSubdivision` requires salient cones; complexes with
  lineality are built here (§1.1) and compared with fans.
- Groups, paths and sheaves: `FreeGroup`, `Subgroup.normalClosure`,
  `Finset.noncommProd`, `SemidirectProduct`; `CategoryTheory.Functor`,
  natural transformations, groupoids and limits; `ModuleCat`, `AlgCat`;
  `Path`, `ContinuousMap.Homotopy`,
  `BaireSpace`, `AffineEquiv`, `ChartedSpace`, `Pregroupoid`, `StructureGroupoid`,
  `TopCat.Sheaf` with `TopCat.PrelocalPredicate.sheafify` and `TopCat.subsheafToTypes`.
- Coefficients and combinatorics: `Units`, `RatFunc`, `LaurentPolynomial`, `DyckWord`.

## Layer 0: positive gradings, completions and actions

### 0.1 Positive degree data

Let `N` be an abelian group (a lattice in every instance). *PositiveDegrees* on `N` is
an additive submonoid `P ⊆ N` with an additive `δ : N → ℤ` such that `δ(n)>0` for
nonzero `n∈P` and `{n∈P | δ(n)≤k}` is finite for every `k∈ℕ`; `N⁺=P\{0}`. A
*PositiveDegreeMap* `(N,P,δ) → (N',P',δ')` is an additive `T` with `T(P)⊆P'`,
`T(N⁺)⊆(N')⁺` and a monotone cutoff modulus `λ : ℕ → ℕ` with `δ(n)>λ(k) ⇒ δ'(Tn)>k`
for `n∈P`. Degree-preserving means `λ(k)=k`. For a lattice-rational cone `σ`, `σ∩N` is
its set `latticePoints`. The first instance is `ℕ^r ⊆ ℤ^r` with `δ(n)=Σ n_i`.

For a lattice `N`, a *SupportedRay* is a primitive ambient vector `w∈N`
(`TauCeti.IsPrimitive`) for which `aw∈P\{0}` for some integer `a≥1`. Its
*rayDegrees* are precisely `{aw∈P\{0} | a≥1}`; `w` itself need not belong to `P`.

*Targets.*
- For fixed `n∈N`, `{(a,b)∈P² | a+b=n}` is finite, and `P` is sharp: `n,−n∈P` forces
  `n=0`.
- Positive degree maps form a category: the identity has modulus `λ(k)=k`, and `(T,λ)`
  followed by `(T',λ')` has modulus `λ∘λ'`. Any modulus becomes monotone by finite
  maxima. A bound `δ(n)≤c·δ'(Tn)` on `P` gives the modulus `λ(k)=c·k`; for finitely
  generated `P` with `T(N⁺)⊆(N')⁺`, the maximum `c` of `δ` on the generators gives such
  a bound. An additive `T` injective on `P` with `T(P)⊆P'` is a positive degree map with
  modulus `λ(k)=max{δ(n) | n∈P, δ'(Tn)≤k}`; in particular a lattice isomorphism carrying
  `P` onto `P'` has a modulus in each direction.
- A finitely generated submonoid with an integral functional
  strictly positive on its nonzero elements has finite cutoffs. For a lattice-rational
  cone `σ`, `σ∩N` is finitely generated, by double duality from `σ^∨∩M`; an integral
  functional strictly positive on the nonzero lattice points of `σ` makes `σ∩N`
  *PositiveDegrees*, and a lattice-rational cone carrying such a functional is salient.
- Every `n∈P\{0}` lies on a unique *SupportedRay*, with a unique integer
  `a≥1` such that `n=aw`. At each order only finitely many supported rays meet
  `{n∈P\{0} | δ(n)≤k}`. For `P=C∩N`, with `C` a lattice-rational cone carrying
  the positive degree, the supported primitive generators belong to `P`.
- A *PositiveDegreeMap* `T` maps a supported primitive generator `w` to
  `T(w)=b w'`, where `b≥1` and `w'` is a unique supported primitive generator
  in the target lattice. This ray map respects identity and composition and sends
  an actual degree `aw∈P` to `ab w'∈P'`, with the original cutoff modulus.

**Checks.**
- An upper bound `δ'(Tn)≤c·δ(n)` gives no cutoff modulus: on `P={0}∪{(a,b)∈ℕ² | a≥b≥1}`
  with `δ(a,b)=a`, `T(a,b)=b` to `(ℤ,ℕ,id)` sends every `(j,1)` to degree one.
- For `P=2ℕe_1+ℕe_2⊆ℤ²`, the supported ray `e_1` has degrees
  `2ℕ_{>0}e_1`, although `e_1∉P`. For
  `P={0}∪{(a,b)∈ℤ² | a≥1, |b|≤a²}`, `δ(a,b)=a` has finite cutoffs,
  while every `(1,b)` is a supported primitive generator. Finiteness is measured
  on actual degrees in `P`, not on all primitive generators of bounded `δ`.

*Needs:* `AddSubmonoid`, additive homomorphisms, `TauCeti.IsPrimitive`,
`TauCeti.exists_eq_zsmul_isPrimitive`; for the cone targets `PointedCone`,
`IsIntegralLattice`, `IsLatticeRational`, `IsLatticeRational.fg_dualSemigroup`.
Sources: BRI §2.1; MAN §2.1.

### 0.2 Graded Lie algebras and truncations

Let `R` be a commutative ring. A positively graded Lie algebra is an `R`-Lie algebra `g`
with a `GradedLieAlgebra` decomposition into `R`-submodules `g_n`, `n∈N`,
`[g_n,g_m] ⊆ g_{n+m}`, and *IsPositiveGrading*: `g_n=0` for `n∉N⁺`. *degreeIdeal*
`F^{k+1}g` is the sum of the pieces with `δ(n)>k`; *truncatedLie* `g≤k` is `g/F^{k+1}g`.
A *GradedLieHom* over a *PositiveDegreeMap* `(T,λ)` is an `R`-linear Lie homomorphism
with `f(g_n)⊆g'_{Tn}`. For a scalar homomorphism `R→S`, a map to an `S`-Lie algebra is
represented as an `R`-linear map to its scalar restriction. A Lie subalgebra or ideal
`K` is graded when the homogeneous components of its elements lie in `K`. The graded
Heisenberg algebra is `TauCeti.heisenberg R` over `N=ℤ` with `X, Y` in degree `1` and
`Z` in degree `2`.

*Targets.*
- `F^{k+1}g` is a graded Lie ideal (*degreeIdeal_isGraded*) and `g≤k` is a nilpotent,
  positively graded Lie algebra. The kernel of `g≤k+1 → g≤k` is central and is the image
  of the pieces `g_n` with `δ(n)=k+1`.
- Quotient maps `g/I → g/J` for Lie ideals `I ⊆ J`, in particular the transitions
  `g≤k' → g≤k` for `k≤k'`, and the maps `g≤λ(k) → g'≤k` induced by a *GradedLieHom* over
  `(T,λ)`, with evaluation on classes, commutation with the transitions, and identity
  and composition laws. A same-order map `g≤k → g'≤k` is induced by `f` iff
  `f(F^{k+1}g) ⊆ F^{k+1}g'`.
- Graded Lie subalgebras, and quotients by graded Lie ideals, inherit positive gradings
  with their direct-sum decompositions.
- Scalar change, without freeness, flatness or dimension assumptions: restriction along
  a homomorphism of commutative rings `S→R` preserves the grading and identifies the
  degree ideals and quotients; base change along `R→S` gives the grading on `S⊗_R g` and
  `(S⊗_R g)≤k ≃ S⊗_R(g≤k)`, the homogeneous pieces and finite cutoffs being direct
  summands.

**Checks.**
- The graded Heisenberg algebra is a `GradedLieAlgebra` with *IsPositiveGrading*.

*Needs:* §0.1; `GradedLieAlgebra`, `LieIdeal`, `LieIdeal.mkQ`, `LieIdeal.liftQ`,
`LieIdeal.lieHom_qext`, `LieSubalgebra`, `LieAlgebra.center`, `LieRing.IsNilpotent`,
`LieAlgebra.ExtendScalars`, direct sums and quotient modules, `TauCeti.heisenberg`.

### 0.3 Filtered algebras and their completions

Let `A` be an associative ring with a multiplicative decreasing filtration by two-sided
ideals `I^kA`, `I^0A=A` (*AlgFiltration*). On `ℕᵒᵈ`, the same ideal family
`F(k)=I^kA`, with `F_lt(k)=I^{k+1}A`, carries Mathlib's
[`IsRingFiltration`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/FilteredAlgebra/Basic.html#IsRingFiltration);
two-sidedness is additional data. Its completion *AlgFiltration.completion*
`Â=lim A/I^{k+1}A` is the compatible-family subring of `∏_k A/I^{k+1}A`; for an
`R`-algebra `A`, *AlgFiltration.completionSubalgebra* is the same carrier as an
`R`-algebra. A ring homomorphism `f : A → B` is filtered along a monotone cutoff modulus
`λ : ℕ → ℕ` as in §0.1 when `f(I^{λ(k)+1}A) ⊆ J^{k+1}B` for every `k`; `λ(k)=k` is the
filtration-preserving case, and a constant `c≥1` with `f(I^{ck}A) ⊆ J^kB` for every `k` gives
`λ(k)=c(k+1)−1`. A filtered `R`-module (*ModuleFiltration*) has no multiplication; its
decreasing submodule family uses `IsFiltration` on `ℕᵒᵈ`, and `IsModuleFiltration` when
compatible with a ring filtration. Its completion and filtered module maps are defined
in the same way. For `R`-algebras `A`,
`B` with filtrations `I`, `J` over a commutative ring `R`, *tensorFiltration* is
`F^j(A⊗_R B)=Σ_{a+b≥j} im(I^aA⊗_R J^bB)`, and its completion is the completed tensor
product `A⊗̂B`. For a commutative ring `R`, a lattice `M` and a finite set `I`,
`R[M][t_i : i∈I]` is `MvPolynomial I (AddMonoidAlgebra R M)`, and `(t_i)` with its
powers is `MvPolynomial.idealOfVars` with its coefficients.

*Targets.*
- `Â` is a ring with the induced filtration and `A → Â` is a filtered ring homomorphism.
  Every specified `R`-algebra structure is retained, with `R`-algebra projection maps;
  restriction of scalars preserves the carrier and all these maps. Supply the standard
  filtration instances on these same families. Filtered ring, algebra and module maps
  are `RingHom`, `AlgHom` and `LinearMap`, respectively, equipped with the cutoff-modulus
  condition above.
- Filtered ring maps and filtered module maps along `λ` induce maps on completions whose
  order-`k` projection is induced by `A/I^{λ(k)+1}A → B/J^{k+1}B`, unchanged when `λ` is
  enlarged, with identity and composition laws (`f` along `λ` and then `f'` along `λ'`
  compose along `λ∘λ'`), retaining any specified algebra or linear structure.
- The `F^j(A⊗_R B)` are two-sided ideals, decreasing and multiplicative, with
  `F^0=A⊗_R B`. The completed product `Â × B̂ → A⊗̂B`, `(x,y)↦x⊗̂y`, is levelwise
  `x_k⊗y_k` modulo `F^{k+1}`; it is `R`-bilinear, multiplicative and compatible with the
  projections.
- *principalCompletionEquiv*: the `(t_i)`-adic completion of `R[M][t_i : i∈I]` is
  `MvPowerSeries I (AddMonoidAlgebra R M)`, preserving all coefficient maps; the
  order-`k` component of its inverse is `truncTotal (k+1)` followed by the quotient map.

*Needs:* `IsFiltration`, `IsRingFiltration`, `IsModuleFiltration`, `Ideal.Quotient`,
`AdicCompletion`, `TensorProduct`, `MvPowerSeries`,
`MvPolynomial.idealOfVars`, `truncTotal`.

### 0.4 Algebraic exponential groups

Let `𝔣=FreeLieAlgebra ℚ (Fin 2)` with generators `X, Y`, write `lowerCentralSeries c` for
Mathlib's 0-based `lowerCentralSeries ℚ 𝔣 𝔣 c` (class at most `c` means
`lowerCentralSeries c = ⊥`), and `U⁺=TauCeti.HopfIdeal.augmentation` in `U(𝔣)`. In
`U_c=U(𝔣)/(U⁺)^{c+1}` the images of `X` and `Y` are nilpotent, and
`ι_c : 𝔣/lowerCentralSeries c → U_c` is the map induced by `𝔣 → U(𝔣)`. For `u` nilpotent
in a `ℚ`-algebra, *nilLog*`(1+u)` is the finite series `Σ_{j≥1}(−1)^{j+1}u^j/j`.
*bchElement c* is the element of `𝔣/lowerCentralSeries c` whose image under `ι_c` is
*nilLog*`(exp(X)exp(Y))`.
Let `R` be a commutative `ℚ`-algebra. For any `R`-Lie algebra `a` of nilpotency class
at most `c`, *BCHGroup a* has underlying set `a`, identity exponential and logarithm,
and product obtained by evaluating `bchElement c` at `(x,y)` through
`FreeLieAlgebra.lift` on the scalar restriction to `ℚ`. For positively graded `g`,
*truncatedGroup* `G≤k` is *BCHGroup* of `g≤k`.

Over any commutative ring `R`, `U_R(g)_n` is the `R`-span of products of homogeneous
elements whose degrees sum to `n`; *degreeIdealU* is `I^kU=⊕_{δ(n)≥k}U_R(g)_n`; `J` is
the augmentation ideal; *completedEnveloping* `Û_R(g)` is the §0.3 completion along
`I^kU`; *completedLie* is `ĝ=lim g≤k`; and *completedLieToU* `ĝ → Û_R(g)` is induced by
the maps `g≤k → U/I^{k+1}U`. Let `U⊗̂U` be the completion for the §0.3
*tensorFiltration* `F^k(U⊗_R U)` of `I^kU` with itself. The *completedCoproduct*
`Δ̂ : Û_R(g) → U⊗̂U` is the filtration-preserving §0.3 completion map of the coproduct `Δ` of
`instHopfAlgebra`, and the counit induces `ε̂ : Û_R(g) → R`. An element `x` of `Û_R(g)`
is *IsCompletedGroupLike* when `ε̂(x)=1` and `Δ̂(x)=x⊗̂x`, and *IsCompletedPrimitive*
when `Δ̂(x)=x⊗̂1+1⊗̂x`, the completed forms of `IsGroupLikeElem` and
`Bialgebra.IsPrimitiveElem`. The quotients `U/I^{k+1}U` are not quotient coalgebras, so
these predicates are stated in `Û_R(g)`. Over a commutative `ℚ`-algebra, *completedExp*
on the first term `Î^1` of the induced filtration and *completedLog* on `1+Î^1` are
levelwise `IsNilpotent.exp` and *nilLog*, with no norm or convergence hypothesis.

For every Lie algebra `g` over a commutative `ℚ`-algebra `R`, with no hypothesis on its
underlying module, *pbwSymmetrizationEquiv* `Sym_R(g) → U_R(g)` sends a product of `d`
elements to `1/d!` times the sum of their products in all orders. The supplied
`TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv` assumes
`Module.Free R g` and does not cover this case.

*Targets.*
- *bchElement c* is defined and unique: `ι_c` is injective, that is
  `ι⁻¹((U⁺)^{c+1})=lowerCentralSeries c`; *nilLog*`(exp(X)exp(Y))` lies in the image of
  `ι_c`; and
  `exp(X)exp(Y)=exp(ι_c(bchElement c))` in `U_c`. The elements are compatible in `c`, so
  the *BCHGroup* product is independent of the nilpotency bound. Word length is a
  positive grading of `𝔣` over `ℕ⊆ℤ` with `δ=id`, generated in degree one, whose degree
  ideal `F^{c+1}𝔣` is `lowerCentralSeries c`. *nilLog* is inverse to `IsNilpotent.exp`.
- *BCHGroup* is a group with `(exp x)⁻¹=exp(−x)` and `exp(x)^n=exp(n•x)`;
  `exp(x)exp(y)=exp(x+y)` when `[x,y]=0`, and `exp(x)exp(y)=exp(y)exp(z)exp(x)` for
  `[x,y]=z` central. It is a functor to groups along `R`-linear Lie homomorphisms
  between nilpotent algebras (*BCHGroup.map*). Lie subalgebras and ideals are subgroups
  and normal subgroups, and the Lie quotient is the quotient group. Conjugation by
  `exp x` is `exp` of `TauCeti.expAd x`. Restriction along a homomorphism of commutative
  `ℚ`-algebras preserves the group law on the underlying set, and the identity
  comparison commutes with *BCHGroup.map*, `exp` and `log`. The `G≤k` form a tower under
  the maps induced by the truncation maps.
- *pbwSymmetrizationEquiv* is a filtered `R`-linear coalgebra equivalence preserving the
  lattice grading.
- Over any commutative ring: the `U_R(g)_n` give a direct-sum decomposition, by
  descending the tensor-algebra grading through the homogeneous enveloping relations;
  the `I^kU` are two-sided, decreasing and multiplicative with `I^0U=U`; `J^k⊆I^kU`; and
  if `g` is generated in degrees at most `B≥1`, then `I^{B(k−1)+1}U⊆J^k` for `k≥1`, so
  the two filtrations are cofinal. The Lie algebra on `∏_n g_n` is `ĝ`.
- `Δ(I^kU)⊆F^k(U⊗_R U)`, and `Δ̂` is an `R`-algebra map whose order-`k` projection is
  the induced `U/I^{k+1}U → (U⊗_R U)/F^{k+1}`. Over a commutative `ℚ`-algebra,
  *completedExp* and *completedLog* exchange the *IsCompletedPrimitive* elements of
  `Î^1` and the *IsCompletedGroupLike* elements, and the *IsCompletedPrimitive* elements
  of `Û_R(g)` are the image of `ĝ`.

*Route:* `F^j(U⊗_R U)` is the sum of the `U_R(g)_a⊗U_R(g)_b` with `δ(a)+δ(b)≥j`, so the
homogeneous components of a completed primitive element are primitive in `U_R(g)`; under
*pbwSymmetrizationEquiv* primitives of symmetric degree `d≥2` vanish, since the
`(1,d−1)` part of the coproduct multiplies back to `d` times the element. For
`bchElement`, the grading of `𝔣` gives `I^kU=(U⁺)^k`, so `ι_c` is the order-`c`
component of *completedLieToU*, and the *completedLog* of the group-like product of the
completed exponentials of `X` and `Y` lies in the image of `𝔣̂`.

**Checks.**
- In the Heisenberg algebra `log(exp x exp y)=x+y+z/2`; the reverse product has `−z/2`.
- Through degree 3, *bchElement* is `X+Y+[X,Y]/2+([X,[X,Y]]+[Y,[Y,X]])/12`.
- In `U(ℚx)=ℚ[x]` with `deg(x)=1`, `I²U` contains `x²` although `g_2=0`.
- For an abelian Lie algebra with independent generators `x_d` in every degree `d≥1`,
  `x_d∈I^dU` and `x_d∉J²`, so the two filtrations are not cofinal.

*Needs:* §§0.2–0.3; `UniversalEnvelopingAlgebra`, `SymmetricAlgebra`,
`TauCeti.UniversalEnvelopingAlgebra.pbwAssociatedGradedEquiv`, `instHopfAlgebra`,
`IsGroupLikeElem`, `Bialgebra.IsPrimitiveElem`, `TauCeti.HopfIdeal.augmentation`,
`FreeLieAlgebra`, `lowerCentralSeries`, `IsNilpotent.exp`, `TauCeti.expAd`. Source: PET
§8, Hypothesis 8.1 and Theorems 8.1–8.2.

### 0.5 Completed groups and changes of filtration

A tower is a family of groups `G_k`, `k∈ℕ`, with transition homomorphisms
`G_{k+1} → G_k` and functor `F : ℕᵒᵖ ⥤ GrpCat`. *CompletedGroup* is the preimage of
`GrpCat.sectionsSubgroup F` under the reindexing `(∀k, G_k) ≃ (∀ j:ℕᵒᵖ, F.obj j)`, with
*projection* to each `G_k` and *degreeFiltration* `F^0G=G`, `F^aG=ker(G→G_{a-1})` for
`a≥1`. A linearly ordered family has finite support at each order when each `G_k`
receives finitely many nonidentity projections. A *TowerHom* is a compatible family of
same-level homomorphisms; a *CofinalTowerHom* is a monotone `λ` with compatible maps
`G_{λ(k)}→G'_k`. For positively graded `g`, `Ĝ` is the completed group of the tower
`G≤k`.

*Targets.*
- *CompletedGroup* is isomorphic to the cone point of `GrpCat.limitCone`, with the
  universal property for compatible families of homomorphisms and extensionality by
  projections. `F^aG` is decreasing and separated, `G/F^{k+1}G ≅ G_k` for surjective
  transition maps, and `[F^aĜ,F^bĜ]⊆F^{a+b}Ĝ`. *TowerHom*s and *CofinalTowerHom*s induce
  homomorphisms commuting with the projections, unchanged when the modulus is enlarged.
- The ordered product of a family with finite support at each order, smallest index
  leftmost (Convention 3): its order-`k` projection is the ordered product of the
  finitely many factors nontrivial at order `k`, the empty product being the identity.
  It is invariant under deleting identity factors and under order-preserving
  reindexing, and adjacent factors whose projections commute at every order may be
  swapped.
- *completedMap*: `Ĝ → Ĝ'` for a *GradedLieHom* over `(T,λ)`, levelwise by
  *BCHGroup.map*, with identity and composition laws, mapping `F^{λ(k)+1}Ĝ` into
  `F^{k+1}Ĝ'` and preserving convergent ordered products. Scalar restriction induces the
  levelwise identity comparison of completed groups, commuting with projections and
  *completedMap*. Completed scalar extension to `S` is defined as `lim_k (S⊗_R g≤k)`;
  by §0.2 it is the completion of `S⊗_R g`. Ordinary tensor product with `ĝ` is not
  completed scalar extension.
- The *IsCompletedGroupLike* elements of `Û_R(g)` form a subgroup of its units, and `Ĝ`
  is isomorphic to that subgroup, compatibly with the exponential.
- *changeDegreeEquiv*: for two positive degree functions `δ`, `δ'` on one positive
  monoid `P`, the identity has the modulus `λ(k)=max{δ(n) | n∈P, δ'(n)≤k}` and its
  reverse (§0.1); the filtrations are cofinal, and the induced isomorphism of completed
  groups commutes with the maps from `g`, with *completedMap* and with ordered products.

**Checks.**
- From `δ` to `2δ` the identity has modulus `λ(k)=⌊k/2⌋`: the truncations and induced
  maps change the order, and *changeDegreeEquiv* identifies the completed groups.
- On `P={(a,b)∈ℕ² | b≤a≤b²}`, *changeDegreeEquiv* from `δ(a,b)=a` to `δ'(a,b)=b` has
  moduli `λ(k)=k²` and `λ(k)=k`.

*Needs:* §§0.1–0.4; `GrpCat.sectionsSubgroup`, `GrpCat.limitCone`, `Subgroup`
commutators.

### 0.6 Complete coefficient actions

Let `A` be an `R`-algebra with an *AlgFiltration*, and let `g` be a positively graded
`R`-Lie algebra acting `R`-linearly on `A`, with the Leibniz rule
(*IsDerivationAction*). The action is *IsFiltrationRaising* when
`F^a g · I^bA ⊆ I^{a+b}A`, and is detected by the filtration when every `x ∉ F^{k+1}g`
has `b` and `m ∈ I^bA` with `x·m ∉ I^{b+k+2}A`.

*Targets.*
- For a filtration-raising action over any commutative `R`, each `x∈g` induces an
  `R`-linear endomorphism of `A/I^{k+1}A` whose `(k+1)`-st power vanishes. Group
  homomorphisms `G_k → Aut_R(A/I^{k+1}A)` along a tower of groups `G_k`, compatible with
  the truncation maps, induce a group homomorphism from the completed group of the tower
  to `Aut_R(Â)` acting levelwise.
- *expDerivationAction_exists*: over a commutative `ℚ`-algebra `R`, the levelwise
  exponentials of the §0.4 BCH groups give a group homomorphism `Ĝ → Aut_R(Â)` by
  `R`-algebra automorphisms, whose order-`k` projection of `γ·u` depends only on those
  of `γ` and `u`. The action after scalar restriction agrees with the scalar restriction
  of this action. The action is faithful when the Lie action is detected by the
  filtration.
- The same construction gives `R`-linear actions of `Ĝ` on the completion of a filtered
  module with a filtration-raising Lie module action.

**Checks.**
- For the inner action `x·a = xa − ax` of a filtration-raising `x`, the action of
  `exp x` is conjugation by `exp x` (`TauCeti.expAd_apply_eq_exp_mul_exp_neg`).

*Needs:* §§0.3–0.5; Lie modules,
`Module.End.exp_mul_of_derivation`, `TauCeti.expAd_apply_eq_exp_mul_exp_neg`.

### 0.7 Coefficient diagrams and representations of labels

A *FiniteOrderCoefficientDiagram* is a tower of small categories `C_k` on one
object type, with identity-on-objects functors `τ_k:C_{k+1}→C_k`, functors
`F_k:C_k→𝒱`, and natural transformations `q_k:F_{k+1}⇒F_k∘τ_k`. Here `𝒱` is
types, semiring modules, associative algebras over a commutative ring, or
algebra-module pairs. A pair morphism `(φ,ψ)` satisfies `ψ(am)=φ(a)ψ(m)`,
with `φ` an algebra map and `ψ` additive and linear over the specified common
scalars. Quotients, localizations and incidence maps are permitted arrows.

A *LabelRepresentation* adds groupoids `L_k` on the same objects, truncations
`τ_k^L` and functors `j_k:L_k→C_k` satisfying
`τ_k∘j_{k+1}=j_k∘τ_k^L`. Its coefficient action is `F_k∘j_k`; both `j_k`
and the action may be nonfaithful. Group towers use the one-object groupoids
`L_k=B G_k`.

A *CoefficientDiagramMap* of monotone cofinal cutoff modulus `λ` consists of
functors `H_k:C_{λ(k)}→C'_k` commuting with iterated truncations and natural
transformations `α_k:F_{λ(k)}⇒F'_k∘H_k` commuting with truncation.
Represented maps also have label functors commuting with `j_k` and `H_k`.
Same-order maps use `λ=id`; replacing a monotone modulus by `max(λ(k),k)`
makes it cofinal.

*Targets.*
- Categories of coefficient diagrams and represented labels: identities, composition
  with modulus `λ∘λ'` for successive moduli `λ,λ'`, componentwise extensionality,
  and change of target by a functor. Enlarging a modulus through truncation preserves
  the induced map on compatible families.
- *coefficientDiagramLimit*: objectwise compatible-family limits of `F_k(x)`,
  levelwise action of compatible arrow families, and natural, functorial limit maps
  for *CoefficientDiagramMap*s. These agree with §§0.3–0.5, including cofinal
  reindexing and degree-function independence. Completed matching families have the
  universal property of the limit of the combined incidence and truncation diagram.
  Matching sections commute with inverse limits for a fixed indexing category;
  for varying `C_k`, full `τ_k` induce a tower of matching-section objects.
- *groupTower_coefficientDiagram*: §§0.5–0.6's arbitrary group towers,
  nonabelian ordered products and coefficient actions give the `B G_k` constructors,
  with identical carriers and action maps.
- *envelopingLabelRepresentation*: through §0.4's identification of `Ĝ` with
  the group-like units of `Û`, a unit `u` acts on `(Û,Û)` by `(Ad_u,L_u)`,
  where `Ad_u(a)=uau⁻¹`, `L_u(v)=uv` and `L_u(av)=Ad_u(a)L_u(v)`.
  This agrees with §§0.4–0.6 at finite order and under scalar change;
  `L_u(1)=u` detects every unit.
- Quotient, localization and scalar-extension constructors, with universal properties
  and naturality squares. Completed scalar extension is the limit of the finite-order
  algebra or module constructions.

**Checks.**
- On `B H`, composition evaluates to multiplication in `H`, with the first applied
  arrow rightmost. A trivial action of a nontrivial `H` leaves its distinct labels
  distinct in `L_k`.
- For a nonzero central Lie element `z` detected at order `k`, `Ad_{exp z}=id` on the
  enveloping algebra, while `L_{exp z}(1)=exp z ≠ 1` at that order.

*Needs:* §§0.3–0.6; categories, groupoids, functors, natural transformations and limits;
`ModuleCat`, `AlgCat`, algebra-module pairs, quotient and localization APIs.

### 0.8 Homogeneous coefficient correspondences

At fixed order, chamber `u` has an abelian degree group `Γ_u`, an `R`-module
`M_u=⊕_γ M_{u,γ}` over a semiring `R`, projections `pr_{u,γ}`, and an additive
`ρ_u:Γ_u→Λ_u` to a lattice. Truncation is linear and graded under specified
degree identifications. Algebra instances have graded multiplication.

A *GradedFaceSpan* between `u` and `v` is a module `N_b` with jointly injective
linear maps `λ_{u,b}:N_b→M_u` and `λ_{v,b}:N_b→M_v`. Each orientation has
admissible homogeneous submodules `D_{u,b,γ}⊆M_{u,γ}` and linear lifts
`L_{u,b,γ}:D_{u,b,γ}→N_b` satisfying `λ_{u,b}∘L_{u,b,γ}=inclusion`.
Put `I_{u,b}={γ | D_{u,b,γ}=M_{u,γ}}`; geometric crossings use these whole-piece
domains. No grading is required on `N_b`.

The *DecoratedCrossingRule* consists of the linear maps
`B_{u,b,v}^{γ,η}=pr_{v,η}∘λ_{v,b}∘L_{u,b,γ}`, each returning the entire
`η`-component of the propagated coefficient.

Chamber truncations `r_{u,k}` preserve admissible submodules and, with face
truncations `r_{b,k}`, satisfy `r_{u,k}λ_{u,b,k+1}=λ_{u,b,k}r_{b,k}` and
`r_{b,k}L_{u,b,k+1,γ}=L_{u,b,k,γ}r_{u,γ,k}`, also for `v`, where
`r_{u,γ,k}` is the restricted chamber map. Whole-piece domains remain whole-piece
whenever their coefficients survive.
An identified tangential germ also has a common tangent lift: a linear map from its
identified coefficient module to `N_b`, with the prescribed chamber images,
compatible with truncation. Terminal-face certificates require these common lifts
in addition to transverse lifts.
Maps are chamber and face maps commuting with `λ`, `L` and truncation, graded
through specified regradings. They are linear over common scalars and semilinear
under scalar change, giving §0.7 coefficient-diagram maps.

*Targets.*
- Each element has finite homogeneous support and is reconstructed from its
  projections. *DecoratedCrossingRule*s and their composites along fixed finite
  degree sequences are linear, natural for coefficient maps and truncation.
  Regrading sums components with the same image degree.
- *graphFaceSpan*: for any linear equivalence `θ:M_u≃M_v`, take `N_b=M_u`,
  `λ_{u,b}=id`, `λ_{v,b}=θ` and `L_{u,b,γ}=inclusion`; reversal uses `θ⁻¹`.
  This realizes the signed label actions of §§0.6–0.7.
- *faceMatching*: the image of `(λ_{u,b},λ_{v,b})` is the submodule of allowed
  chamber pairs, canonically isomorphic to `N_b`. Finite incidence sections are
  matching families, with restriction, refinement, fiber-product and coefficient-map
  operations commuting with the defining maps and compatible-family limits.
- For graded algebra coefficients and algebra maps `λ`, matching families inherit
  algebra operations. Multiplicativity of the relevant homogeneous lifts
  is an additional hypothesis for product formulas.

**Checks.**
- For `Γ=ℤ`, `M=ℚ` concentrated in degree `0`, and `θ(a)=2a`, the graph span
  has `B^{0,0}(1)=2` and `B^{0,η}(1)=0` for every `η≠0`.

*Needs:* §0.7; `DirectSum.Decomposition`, direct sums, linear maps, semilinear maps and
graded modules. Sources: MAN §2.2; GHS Definitions 3.1–3.3 for the monomial face
correspondence instance.

## Layer 1: polyhedral geometry and paths

### 1.1 Rational polyhedra and finite complexes

Work in a finite-dimensional real normed space `V` with an integral lattice `i : N → V`
(`IsIntegralLattice`). A functional is *rational* when it is a rational multiple of a
lattice character; a linear map is *rational* when it pulls rational functionals back to
rational functionals. An *IntegralAffineEquiv* is an affine equivalence `f : V ≃ᵃ[ℝ] V'`
with a lattice isomorphism `T : N ≃ N'` and `f.linear ∘ i = i' ∘ T`. A
*RationalAffinePolyhedron* is a presentation `{x | g_i(x) ≤ c_i}` by finitely many
affine inequalities with rational `g_i` and real `c_i`; *IsRationalPolyhedron* also asks
rational `c_i`; a *RelOpenCell* is cut out by rational equations and strict
inequalities. A *FinitePolyhedralComplex* is a finite set of nonempty closed
rational-normal polyhedra, closed under faces, whose pairwise intersections are common
faces; unbounded cells and lineality are allowed. *IsSubdivision*: equal supports, each
new cell in an old cell; *IsWeakRefinement*: support in the old support, each new cell
in an old cell.

*Targets.*
- The carrier of a *RationalAffinePolyhedron* is a `TauCeti.IsConvexPolyhedron`;
  intersection, preimage under a rational affine map, image under an
  *IntegralAffineEquiv*, and the empty and full polyhedra are constructed with their
  carriers.
- The *homogenization* of `Q` is the closed pointed cone in `V × ℝ` generated by
  `Q × {1}`; it depends only on the carrier, is finitely generated, is `{0}` for
  `Q = ∅`, and for nonempty `Q` is the inequality cone `{(x,t) | t ≥ 0, g_i(x) ≤ t·c_i}`
  of every presentation, with slice `Q` at `t = 1` and the recession cone of `Q` at
  `t = 0`. A nonempty face of a nonempty `Q` (*IsPolyhedralFace*) is the slice at
  `t = 1` of a `PointedCone.IsFaceOf` face of its homogenization meeting height one.
  Every face of a finitely generated pointed cone is exposed, so these are the nonempty
  exposed subsets of `Q`. `Q` has finitely many faces (`PointedCone.FG.finite_face`);
  faces of faces are faces, faces are rational, and the relative boundary is the union
  of the proper faces.
- Rational Minkowski–Weyl: a pointed cone in `V`, lineality allowed, is `PointedCone.FG`
  iff it is `PointedCone.DualFG` for the pairing with `Module.Dual ℝ V`, and for a
  lattice-rational cone the generators and defining functionals can be taken rational.
  Hence rational polyhedra with zero offsets are the finitely generated lattice-rational
  `PointedCone`s, and their faces are the `PointedCone.IsFaceOf` faces.
- *FinitePolyhedralComplex*: support, walls (cells of codimension one), *joints* (cells
  of codimension two), subcomplexes and images under an *IntegralAffineEquiv*; meeting
  cells have the same lineality space; *IsSubdivision* and *IsWeakRefinement* are
  partial orders preserved by images. The *commonRefinement* of two complexes consists
  of the nonempty intersections of their cells; its support is the intersection of the
  supports, it is a common weak refinement in which each cell has a minimal containing
  cell in each original, every common weak refinement weakly refines it, and for equal
  supports it is the common subdivision. The *ambientSubdivision* of a finite family of
  presented polyhedra is the subdivision by the sign cells of all defining hyperplanes;
  each member is a union of its cells.
- *toFan*, *ofFan*: maps between *IsConical* complexes (every cell a cone with apex `0`)
  with salient cells and `TauCeti.Toric.Fan`; `toFan ∘ ofFan = id`, `ofFan` lands in
  conical complexes with salient cells, and `Fan.IsSubdivision Φ Ψ` holds exactly when
  `ofFan Φ` is a subdivision of `ofFan Ψ`.

**Checks.**
- A full hyperplane, a translated ray with irrational offset, and a line through the
  origin are each a complex; the full hyperplane is a cell that is not salient.
- In `ℝ`, the presentations `0 ≤ −1` and `x ≤ 0 ∧ −x ≤ −1` of `∅` have inequality cones
  `ℝ × {0}` and `{(0,0)}`, and homogenization `{0}`.

*Needs:* `TauCeti.Toric.IsIntegralLattice`, `Module.Dual`, `PointedCone.FG`,
`PointedCone.DualFG`, `PointedCone.IsFaceOf`, `PointedCone.IsFaceOf.trans`,
`PointedCone.FG.finite_face`, `PointedCone.closure`, `IsLatticeRational`, `IsExposed`,
`TauCeti.IsConvexPolyhedron`, `TauCeti.Toric.Fan`, `Fan.IsSubdivision`, `AffineEquiv`,
`intrinsicInterior`, `intrinsicFrontier`. Sources: GHKK Appendix C.1; BRI §§2.2–2.5.

### 1.2 Generic paths and two-parameter families

A wall is a nonempty closed polyhedron of codimension one; codimension presupposes
nonemptiness. For a family of walls, *SingularSupport* is the union of the relative
boundaries of the walls and of the intersections of walls whose affine spans have
different directions. An *AdmissiblePLPath* between endpoints off the walls is a finite
chain of affine segments whose vertices miss the walls, whose segments meeting a wall
have direction outside the wall's affine direction, and which avoids the singular
support; the constant path at an allowed endpoint is one. For the cooriented walls of
a finite polyhedral complex, *crossingWord* lies in `FreeGroup` on the walls, ordered
and signed by Convention 3; an admissible path meets at most one such wall at each
crossing time. For an arbitrary finite wall family, simultaneous coplanar crossings
are a single event recording the finite signed set of incident wall indices. A small
loop around a joint `j` is the boundary of a small positively
oriented transverse triangle that meets `j` once and meets only walls containing `j`.

*Targets.*
- Admissible paths cross finitely: each segment meets each wall in at most one
  relative-interior point. For finitely many closed walls they exist between allowed
  endpoints, and they are closed under reversal and concatenation, the latter homotopic
  through reparametrization to `Path.trans`. The *crossingWord* is multiplicative under
  concatenation, inverted by reversal and unchanged by subdivision of the path. Deleting
  walls maps it by the `FreeGroup.map` killing them; subdividing the complex maps it by
  sending each new wall to the old wall containing it, inverted if the coorientations
  disagree, or to `1` if no old wall contains it. The image of an admissible path under
  an *IntegralAffineEquiv* `e` is admissible for the image family and, with
  coorientations `ν∘e.linear⁻¹`, has as crossing word the image under the induced wall
  bijection.
- A countable family of finite families of proper affine subspaces has dense common
  complement, open when the family is finite. For finitely many finite wall families, a
  PL path with endpoints off all their walls is perturbed, fixing the endpoints, to one
  admissible for every family, with the same ordered signed crossings (simultaneous
  coplanar crossings one event) for each family for which the original path is
  admissible. For countably many finite families, endpoints off all their walls and at
  least one free vertex, the vertex lists admissible for every family form a dense
  intersection of open dense subsets.
- *jointLoopGeneration*: for the walls of a finite polyhedral complex, the crossing
  word of any admissible loop lies in the normal
  closure in `FreeGroup` of the crossing words of small loops around joints. For open
  `U ⊆ V`, admissible paths in `U` with equal endpoints, homotopic in `U` relative to
  the endpoints, have crossing words equal modulo the normal closure of the words of
  small loops around the joints in `U`.
- For finitely many closed codimension-one walls in a ball, chambers are connected under
  adjacency (closures meeting off the singular support); near a point, a locally finite
  polyhedral stratification reduces to this case.

*Route:* Prove countable genericity by the Baire theorem on the vertex parameters. Make
a homotopy piecewise linear and generic, so that each small triangle of the parameter
square meets joints only transversely; across each triangle the crossing word changes by
a conjugate of a small-loop word. The homotopy to the constant path gives
*jointLoopGeneration*.

**Checks.**
- With walls `x = 0` and `x = y` in `ℝ²`, endpoints `(−1,1)`, `(1,−1)` and no free
  vertex, the only vertex list passes through the joint `0` and is not admissible.
- On `U = ℝ²∖{0}` with the single wall `{(x,0) | x > 0}`, a loop around `0` whose
  crossing word is the wall's generator (inverse per coorientation) and the constant
  loop, with crossing word `1`, are not homotopic in `U`.

*Needs:* §1.1; `FreeGroup`, `FreeGroup.map`, `Subgroup.normalClosure`, `Path`,
`ContinuousMap.Homotopy`, `BaireSpace`.

### 1.3 Semilinear families and exceptional arrangements

A *FiniteSemilinearFamily* is a finite set of piecewise-affine charts, with rational
linear parts (§1.1) and real offsets, on finite Boolean combinations of rational-normal
affine inequalities, with an evaluation map to a real vector space carrying its own
integral lattice. Charts need not be proper and fibers need not be finite. A
*LocallyClosedPolyhedron* is a closed rational-normal polyhedron cut by finitely many
strict inequalities with rational linear parts; it is convex, and relatively open cells
are instances. *IsFiniteBranch* means a finite union of affine embeddings of
*LocallyClosedPolyhedron* domains. An *ExceptionalArrangement* is a finite family of
proper affine subspaces; a point *IsGeneric* when it avoids their union.

*Targets.*
- Under `IsIntegralLattice` on both lattices, a family has compatible source and target
  stratifications into *LocallyClosedPolyhedron* strata. Over each target stratum each
  branch of an *IsFiniteBranch* family is either absent or an affine copy of the
  stratum, so the fiber cardinality is constant on each stratum.
- Families have disjoint union, restriction of the charts to a rational polyhedron,
  post-composition of the evaluation with a rational affine map of the target, and
  pullback along a rational affine map of the target.
- Exceptional arrangements are closed under union and under images and preimages of
  affine equivalences, which preserve genericity. A countable family of arrangements has
  a dense common generic locus (§1.2).

**Checks.**
- The inclusion `(0,1)→ℝ`, whose domain is not closed in `ℝ`, is a valid finite branch.
- The disjoint union of two copies of `id : ℝ → ℝ` has fiber cardinality two;
  overlapping images are not identified.

*Needs:* §§1.1–1.2.

### 1.4 Polyhedral cochains and sweeps

Let `V` be a finite-dimensional real normed space with an integral lattice `i:L→V` and `E` an
abelian group. Coefficient operations are finite addition, negation and multiplication
by integers; the signs and conormal orientations are defined in the real geometry
independently of `E`. A *PolyhedralCochain* of codimension `k` is a finite sum of
generators `(P,o,c)`, with `P` a nonempty closed rational-normal affine polyhedron of
codimension `k`, `o` an orientation of `V/dir(P)` (equivalently of its conormal
determinant line) and `c∈E`, modulo additivity in `c`, zero coefficients, negation of
`c` under reversal of `o`, and subdivision of the support with the induced conormal
orientations. A *TransverseAffineTest* is an affine map from an oriented standard
`k`-simplex to `V`, not necessarily an embedding, transverse to the affine span of every
supporting cell, and in stratified general position on its faces: surjective to each
relevant normal quotient and avoiding the lower-dimensional strata. The transverse
cochains for `n=i(n₀)`, `n₀∈L`, are those whose cells all have `n∉dir(P)`; on them the *sweep* is
`S_n(P,α,c)=(P−ℝ_{≥0}n,ι_nα,c)`, with `α` an alternating form representing the conormal
orientation.

*Targets.*
- The quotient by the stated relations agrees with the colimit over finite ambient
  subdivisions (§1.1). Additive maps `E→E'` act functorially on cochains and transverse
  cochains. For an `R`-module `E` over a commutative ring `R`, both carriers are
  `R`-modules, and `R`-linear coefficient maps induce `R`-linear maps.
- The *coboundary* `d(P,o,c)` is the signed sum over the codimension-one faces `F` of
  `P`, with `F` oriented by appending an outward conormal of `F` within `dir(P)` to an
  oriented conormal frame of `P` and multiplying by `(−1)^{k+1}`. It is independent of
  positive rescaling of the conormals, respects the subdivision relations, and satisfies
  `d∘d = 0`, lineality allowed.
- The *intersectionPairing* with a *TransverseAffineTest* is the sum over the finitely
  many zero-dimensional preimages of the coefficient times the orientation sign of the
  normal-quotient map, with no determinant magnitude; it is invariant under the cochain
  relations and under subdivision of the parameter simplex. A cochain on which every
  sufficiently small transverse test vanishes is zero, coincident coplanar contributions
  being combined first. `⟨dC,τ⟩=⟨C,∂τ⟩`, `∂τ=Σ_l(−1)^lτ∘δ_l`, for a codimension-`k`
  cochain `C` and an affine `(k+1)`-simplex `τ` in general position for `dC` whose faces
  are in general position for `C`; this includes triangulated curtains `H(t,s)=S(s)+tn`
  on `[0,T]×Δ^k`, not necessarily embedded, with `∂([0,T]×S)=S_T−S_0−[0,T]×∂S`.
- On transverse cochains, `S_n` respects the subdivision relations, its swept supports
  are closed rational-normal polyhedra of codimension `k−1`, `dS_nC+S_ndC=−C`, and every
  nonempty cell `Q` of `S_nC` has `n∉rec(Q)` (*sweep_strictlyOutgoing*).
- Coefficient maps commute with `d`, the intersection pairing and `S_n`, which are
  `R`-linear on their domains for `R`-module coefficients.

*Route:* Prove the sweep homotopy by the Stokes identity for curtains with `T` beyond
every hitting time, retaining every side face, and the vanishing criterion for tests.

**Checks.**
- A half-plane `{y≥0}` with coefficient `c` has coboundary `(line,+dy,c)`, and a path
  leaving it pairs to `−c`.
- The segment `[0,1]×0` with conormal `dy` has coboundary `(p₀,+dx∧dy)+(p₁,−dx∧dy)`,
  matching the counterclockwise disk pairing.

*Needs:* §§1.1–1.2.

### 1.5 Integral-affine bases and exponent data

The *integralAffinePregroupoid* consists of maps between open subsets locally equal
to an *IntegralAffineEquiv* (§1.1). An *IntegralAffinePolyhedralBase* is a pure
`d`-dimensional space `B` with a polyhedral decomposition locally finite on compact
subsets, a closed cell union `Δ` of dimension at most `d−2` after a specified
refinement, and an integral-affine atlas on `B₀=B∖Δ`. Chart cells are §1.1's
rational-normal polyhedra, with real offsets and lineality allowed. The atlas gives
a tangent lattice local system `Λ`; an *ExponentSystem* is a lattice local system
`Γ` with `ρ:Γ→Λ`, so overlap maps satisfy `T_Λ∘ρ=ρ'∘T_Γ`. Coefficient
monoids, quotient ideals and order functions are specified independently on chamber
and face objects, with comparisons through their coefficient-diagram maps.

A *BasedCoefficientDiagram* assigns §§0.7–0.8 to chamber, face and chart objects
with incidence and overlap arrows. Each oriented face with normal `ν` admits every
degree whose velocity `−ρ(γ)` is transverse and points into the face from the source
chamber: these degrees lie in `I_{u,b}`. Each nonzero outgoing component obeys the
normal-velocity condition `ν(ρ_v(η))=ν(T_Λρ_u(γ))`. Graph spans of
filtration-raising tangent wall actions satisfy it. The regular locus omits `Δ` and
active codimension-two singular strata, and includes regular codimension-one faces
through their incidence diagram.

An *IncomingTail* is a germ at `t→−∞` of an affine half-line in an unbounded cell of
the developed base, with nonzero parallel homogeneous coefficient of degree `γ` and
velocity `−ρ(γ)≠0`, modulo restriction to earlier tails and specified chart or deck
identifications.
An *IncomingDatum* selects unbounded cells and parallel degrees and coefficients,
with chart, face-end and deck identifications. Admitted tails record a selected cell,
eventually lie in it with its prescribed decoration, and have arbitrary transverse
positions; require `ρ(γ)∈rec(cell)`. A common tangential end includes a common face
lift with both prescribed chamber images. In one chart, `a∈A_p` admits all affine
tails of velocity `−ρ(p)` and coefficient `a`. Truncation deletes zero decorations.
The tail's *IncomingTypeDatum* records only its selected source cell or end,
prescribed parallel degree and coefficient, and discrete chart, face-end and deck
labels modulo the specified identifications. Its affine anchor and transverse
offset belong to the actual *IncomingTail*.
A *ConstantIncomingSection* is a compatible homogeneous coefficient section of zero
spatial velocity, supplying constant paths.

*Targets.*
- *integralAffineGroupoid*: the `Pregroupoid` axioms and its `StructureGroupoid`.
  Each member extends uniquely to a global *IntegralAffineEquiv* on each nonempty
  connected domain component, with linear part `IsIntegralLattice.extend` of the
  lattice map. Global self-equivalences form a group surjecting onto lattice
  automorphisms with translation kernel; they preserve rational-normal polyhedra,
  complexes and admissible paths.
- Restriction, pullback along integral-affine open embeddings, common atlas and
  polyhedral refinements, with identity and composition laws for exponent systems
  and *BasedCoefficientDiagram*s. Compact-path data admit a common finite refinement
  and cutoff bounded by the maximum of the local moduli; cofinal maps compare
  the local towers.
- *incomingTailTransport*: representative independence, restriction and refinement,
  chart and deck covariance, coefficient transport, truncation and regrading.
  The forgetful map to *IncomingTypeDatum* respects these identifications.
  Chosen endpoint lifts fix deck ambiguity, and changing a lift transports the
  incoming datum. An empty one-chart diagram has exactly one line per endpoint for
  fixed nonzero `a∈A_p` with `ρ(p)≠0`; zero input has zero weighted evaluation.
- The one-chart case `Γ=Λ`, `ρ=id` recovers §§1.1–1.4.

*Needs:* §§0.7–0.8, 1.1–1.3; `ChartedSpace`, `Pregroupoid`, `StructureGroupoid`,
`AffineEquiv`, `IsIntegralLattice.extend`, `realCharacter_comp`, covering spaces and
local systems. Sources: GS §2; GHS §§1 and 3.

## Layer 2: general scattering diagrams

### 2.1 Finite labelled complexes and path products

A *FiniteWallDiagram* over a group `H` is a finite polyhedral complex in `V` (§1.1)
whose walls carry a coorientation (a nonzero linear functional vanishing on the wall's
direction, up to positive scalar) and exactly one label in `H`, crossed with the sign
and order of Convention 3. *pathProduct* is `FreeGroup.lift` of the labels on §1.2's
crossing word. A common admissible path of two diagrams is one vertex list admissible
for each wall family separately. *Equivalent* diagrams agree on common admissible
paths; *Consistent* means path products depend only on endpoints. A compatible
refinement of `𝔇` subdivides its complex, gives walls inside a wall `𝔡` of `𝔇` its label
and a positively proportional coorientation, and others `1`.

A *GroupoidWallDiagram* assigns chamber objects in §0.7's label groupoid and
mutually inverse arrows to opposite crossings. The transport of successive
crossings `ℓ_1,…,ℓ_s` is `ℓ_s∘…∘ℓ_1`.

*Targets.*
- Path products are unchanged by positive rescaling of coorientations and by reversing
  one with its label inverted; `P` then `Q` gives `pathProduct Q * pathProduct P`,
  reversal inverts, and path subdivision preserves path products.
- *Equivalent* is an equivalence relation, by §1.2's path perturbation. Restriction to
  a subcomplex containing every wall with nonidentity label, and compatible refinement,
  give equivalent diagrams.
- *image* along an *IntegralAffineEquiv* (§1.1), carrying path products to path
  products and functorial up to *Equivalent*; relabelling along a group homomorphism,
  functorial as equalities.
- A diagram is consistent iff its admissible loops have product `1`, and, on the vector
  space, iff `FreeGroup.lift` of the labels kills §1.2's joint-loop words.

*Targets for groupoid coefficients.*
- Path subdivision, reversal, compatible refinement, overlap identifications and
  relabelling are functorial, with the same joint-word relations. Killing local
  joint words gives homotopy-invariant transport on the regular base. Endpoint
  independence additionally requires trivial holonomy on each component.
- *representedPathProduct*: representation sends transport to the composite
  coefficient map, commutes with cutoff and truncation maps, and recovers
  *pathProduct* in the one-object case. Faithful representations reflect equality
  of label products.

**Checks.**
- Subdivide the axes of `ℝ²` into four closed half-axes and the origin; label the
  horizontal half-axes `a`, cooriented by `x₁`, and the vertical ones `b`, cooriented by
  `x₀`, with `ab≠ba`. The counterclockwise square loop
  `(1,1)→(−1,1)→(−1,−1)→(1,−1)→(1,1)` crosses `b,a,b⁻¹,a⁻¹`, with product
  `a⁻¹b⁻¹ab≠1`.

*Needs:* §§0.7, 1.1–1.2, 1.5; `Group`, `FreeGroup`, groupoids and functors.
Source: BRI Definitions 2.1–2.2 for the group case.

### 2.2 Graded KS complexes and completed diagrams

For §0.1's `N`, the space `V` is a *KSSpace*: the model of `Hom_ℤ(N,ℝ)` of
Convention 1, with lattice map `Hom(N,ℤ)→V` satisfying `IsIntegralLattice`. For a
rational cone `σ⊆V`, `g(σ)=⊕_{n∈N⁺, σ⊆n⊥} g_n`. A *KSComplex k* is a finite rational
conical complex (§1.1) whose wall `𝔡` has label in `exp(g(𝔡)≤k)` and is cooriented by
a positive normal `n` with `𝔡⊆n⊥`. A *CompletedDiagram* (Convention 4) is a sequence
of KS complexes `𝔇_k` with the projection of `𝔇_{k+1}` equivalent to `𝔇_k`; equivalence
and consistency hold order by order. An all-order path is one vertex list admissible
for every `𝔇_k`; a point is allowed when it lies on no wall of any `𝔇_k`.

*Targets.*
- `δ` as a vector of `V`, by bijectivity of evaluation `N⁎⊗ℝ→V`; `g(σ)` as a Lie
  subalgebra, and `exp(A≤k)` for a Lie subalgebra `A` as a subgroup of `G≤k` (§0.4).
- The complete path product on all-order paths. Two completed diagrams are equivalent
  iff their complete path products agree on all common all-order paths: by §1.2's
  countable perturbation, every order-`k` test product is computed by a common
  all-order path with the same order-`k` crossing word, after moving the endpoints
  within their order-`k` chambers.
- Transport of a consistent completed diagram between allowed points, built order by
  order, independent of the finite-order paths and equal to the complete path product
  on all-order paths.

**Checks.**
- For `N=ℤ²`, `P=ℕ²` and `x∈Ĝ` with order-`k` projection in `exp(g(e_2⊥)≤k)`, let the
  order-`k` complex be cut out by `e_2⊥` for even `k` and by `e_1⊥`, `e_2⊥` for odd
  `k`, with the projection of `x` on `e_2⊥` or on each of its half-lines and `1` on the
  half-lines of `e_1⊥`: a *CompletedDiagram* whose complexes do not stabilize.

*Needs:* §§0.2, 0.4–0.5, §2.1, conical §1.1 and §1.2's countable perturbation lemma;
`TauCeti.Toric.IsIntegralLattice`. Source: BRI Definition 2.3 and §§2.9–2.11.

### 2.3 Sign factorization and reconstruction

For `θ∈V`, `g_+(θ)`, `g_0(θ)`, `g_-(θ)` are the sums of the `g_n`, `n∈N⁺`, with
`θ(n)` positive, zero and negative, and `G_+(θ)`, `G_0(θ)`, `G_-(θ)` their groups at
each order and completed. The `±` chambers are `{θ | ∀n∈N⁺, ±θ(n)>0}`.
*arrangementComplex k* is the conical complex cut out by the `n⊥` with `n∈N⁺`,
`δ(n)≤k`. `P` is any positive monoid of §0.1; finite generation is assumed only for the
openness of the chambers.

*Targets.*
- Sign factorization: multiplication `G_+(θ)×G_0(θ)×G_-(θ)→G≤k` is a bijection, and
  so is its completed form onto `Ĝ`; the plus part, middle factor and minus part are
  functions of the product.
- `±δ` lie in the `±` chambers, which are open for finitely generated `P`; every
  completed diagram has allowed points in both.
- *reconstruct g*, for `g∈Ĝ`: the completed diagram on *arrangementComplex k* whose
  walls carry the middle factors of `g` at relative-interior points. It is consistent,
  and its transport from the positive to the negative chamber is `g`.
- *reconstructionEquiv*: in a consistent completed diagram, the order-`k` label of a
  wall is the middle factor of the chamber transport at a relative-interior point of the
  wall on no other `n⊥` with `δ(n)≤k`. Hence consistent completed diagrams modulo
  equivalence are `Ĝ`, compatibly with order-`k` projection.

**Checks.**
- In rank one, *reconstruct g* for `g` in the completed group of §0.2's graded
  Heisenberg algebra is the single wall `{0}` labelled `g`.

*Needs:* §2.2; §0.2's central kernels; §0.1's bounded-degree and positive-functional
properties. Source: BRI Lemmas 3.1–3.2 and Propositions 3.3–3.4.

### 2.4 Change of coefficients and abelian-ray presentations

A *DegreeHom* `f:g→g'` is a degree-preserving Lie homomorphism on the same positive
lattice (§0.2's graded Lie homomorphism over the identity degree map), injective or
not. The ray Lie algebra of a §0.1 *SupportedRay* `w` is
`⊕_{a≥1, aw∈P}g_{aw}`; *IsAbelianRays* says it is abelian for every supported
ray. An *IndexedWall* is a rational codimension-one cone in `w⊥`, labelled in
the completed group of this supported ray; an
*IndexedWallPresentation* is a family of indexed walls with finitely many nontrivial at
each order.

*Targets.*
- *mapDiagram f*, with identity and composition laws, preserving equivalence and
  consistency; `mapDiagram f (reconstruct g)` is equivalent to
  `reconstruct (completedMap f g)` for §0.5's *completedMap*.
- Change of degree acts on consistent classes only: for two positive degree functions
  on one positive monoid `P`, it is §0.5's change-of-degree isomorphism conjugated by
  *reconstructionEquiv*, and it commutes with *mapDiagram*.
- Under *IsAbelianRays*, the completed diagram of a presentation labels each cell by
  the `Finset.noncommProd` of the indexed labels containing it; presentations modulo
  equivalence are the KS-complex classes, through merging of coincident supports,
  subdivision and deletion of identity walls.
- An index `n=aw∈N⁺` with a label in `exp(⊕_{j≥1}g_{jn})` is reindexed by
  `w` using the inclusion in its supported ray group. Under *IsAbelianRays*,
  splitting a supported-ray logarithm into its actual homogeneous degrees recovers a
  presentation indexed in `N⁺`, finite at each order. These operations preserve
  path products and commute with coefficient maps.

**Checks.**
- For nontrivial `R`, the quotient of §0.2's Heisenberg algebra by its center sends the
  one-wall diagrams labelled `exp X·exp Y` and `exp Y·exp X`, inequivalent by §0.4's
  Heisenberg computation, to equivalent diagrams: *mapDiagram* does not reflect
  equivalence. The Heisenberg grading fails *IsAbelianRays*.
- When `2m,3m∈P` and `m∉P`, labels in the ray groups of `2m` and `3m` on one support
  commute by *IsAbelianRays* on their common supported primitive ray.

*Needs:* §§0.4–0.5 and §§2.1–2.3; `Finset.noncommProd`, `LieAlgebra.center`. Source:
BRI §§2–3; GHKK §1.1.

## Layer 3: directed scattering and completion

### 3.1 Homogeneous wall spaces and geometric directions

Let a lattice `Γ` have *PositiveDegrees* `(P,δ)` (§0.1); `P=C∩Γ` for a
lattice-rational cone is a specialization. Independently fix an integral lattice
`i:Λ→V` (`IsIntegralLattice`) and additive `ρ:Γ→Λ`. Let `g` be positively
`Γ`-graded over a commutative ring `R` (§0.2). The geometric direction of degree
`n` is `ρ(n)`.

*DirectedWallSpaces* assigns to `n∈P\{0}`, `m∈Λ*` an `R`-submodule
`h_{n,m}⊆g_n` with `h_{n,0}=0`, `h_{n,m}=0` if `m(ρ(n))≠0`,
`h_{n,cm}=h_{n,m}` for `c∈ℤ\{0}`, and
`[h_{n,m},h_{n',m'}]⊆h_{n+n',μ}`, where
`μ=m(ρ(n'))m'−m'(ρ(n))m`. Wall groups and §§3.2–3.4 additionally assume that
`R` is a `ℚ`-algebra. For a *SupportedRay* `w`, its *raySubmodule* is
`⊕_{a≥1, aw∈P}h_{aw,m}`; *wallGroup w m* consists of the `θ∈Ĝ` whose
logarithm at every order lies in this submodule's image in the truncation.
All truncations use the actual degrees `aw∈P` and their orders `δ(aw)`.

A fixed-degree morphism is a graded Lie homomorphism preserving the wall spaces.
A coordinate change consists of lattice isomorphisms `T_Γ`, `T_Λ` with
`T_Λ∘ρ=ρ'∘T_Γ` and `T_Γ(P)=P'`, together with a graded Lie isomorphism taking
`h_{n,m}` onto `h'_{T_Γn,m∘T_Λ⁻¹}`. Its filtration comparisons use the cutoff
moduli of §0.1; when `δ'∘T_Γ=δ` they preserve each order.

*Targets.*

- §0.1's supported-ray decomposition indexes the wall groups. Its primitive
  generator belongs to `Γ`; its image in `Λ` need not be primitive or nonzero.
  Homogeneous wall spaces embed in their supported ray submodules, which are
  compatible with truncation and decompose by their actual degrees in `P`.
- `[h_{n,m},h_{n',m'}]=0` for `m,m'` proportional over `ℚ`. For supported
  primitive rays `w,w'`,
  `[⊕_{a≥1, aw∈P}h_{aw,m},⊕_{b≥1, bw'∈P}h_{bw',m'}]`
  `⊆⊕_{a,b≥1, aw,bw'∈P}h_{aw+bw',μ_{a,b}}`,
  where `μ_{a,b}=b·m(ρ(w'))m'−a·m'(ρ(w))m`. The resulting wall groups for
  proportional nonzero normals commute elementwise. In particular,
  *wallGroup w m* is an abelian subgroup of `Ĝ`.
- *zeroDirectionLieWord*: a Lie word with at least two homogeneous wall-space
  leaves vanishes if its leaf normals annihilate a linear subspace `W⊆V` and its
  total degree `n` satisfies `i(ρ(n))∈W`. In particular it vanishes when `ρ(n)=0`.
- Fixed-degree morphisms and coordinate changes, with identity and composition laws,
  induce the wall-group maps and the finite-order maps prescribed by their moduli.
- Base change along a homomorphism `R→S` of commutative rings: the scalar extension
  of the grading on `S⊗_R g`, with wall spaces
  `im(S⊗_R h_{n,m}→S⊗_R g)`, satisfies the conditions. The homogeneous pieces
  are direct summands, while wall submodules need not be; for flat `S` the wall
  spaces are `S⊗_R h_{n,m}`. Scalar extension is performed at finite order before
  completion.

*Needs:* §§0.1–0.2, 0.4–0.5; `TauCeti.Toric.IsIntegralLattice`,
`TauCeti.IsPrimitive`, `LieAlgebra.ExtendScalars`,
`DirectSum.Decomposition.baseChange`. Sources: MAN (5); LMY Definition 1.2,
whose `(m,n)` is our `(n,m)` and whose third condition is §5.1's annihilation
condition.

### 3.2 Directed affine walls and admissibility

A *DirectedWall* has a nonzero normal `m∈Λ*`, a *SupportedRay* `w` with
`m(ρ(w))=0`, a support `𝔡` that is a nonempty rational-normal affine polyhedron,
bounded or not, with affine direction `ker(m_ℝ)`, and a label in *wallGroup w m*.
Its direction is `−i(ρ(w))`. *Incoming* means `i(ρ(w))∈rec(𝔡)`, or
`𝔡+ℝ_{≥0}i(ρ(w))⊆𝔡`; *Outgoing* is its negation. In particular every wall
with `ρ(w)=0` is incoming. A *DirectedDiagram* is a wall family with finitely many
walls nontrivial at each order `k`.

Its order-`k` path product *levelPathProduct* runs over the active walls, with
crossing factor `θ^{-sgn⟨m,γ'⟩}` (Convention 3), the first crossing rightmost and
simultaneous crossings contributing the product of their factors. Order-`k`
equivalence, equivalence and consistency are defined by these products. A refinement
is an assignment `η` sending each nonidentity wall of `𝔇'` to a wall of `𝔇` of
the same degree, normal and label whose support contains its support, such that each
nonidentity wall of `𝔇` is covered by its assigned supports with pairwise disjoint
relative interiors. Overlapping and repeated walls are distinct indexed walls,
refined separately.

*Targets.*

- `rec(𝔡+v)=rec(𝔡)`, so *Incoming* and *Outgoing* are translation invariant;
  walls whose supports have the same affine tangent hyperplane have commuting labels.
- *levelPathProduct* is §2.1's path product on any complex whose walls subdivide the
  active supports, each cell labelled by the product of the signed labels of the
  active walls containing it, signs taken on the positive side of its coorientation.
  A transverse segment meeting only one regular wall germ computes this same combined
  label, independently of the enumeration of coincident walls.
- Order-`k` equivalence is an equivalence relation (§1.2's path perturbation for wall
  families, §2.1's endpoint shift). A refinement preserves combined wall-germ labels
  and is equivalent to the diagram it refines, so equivalence does not depend on the
  wall presentation.
- Coordinate changes act on supports through `T_Λ` and on primitive degrees through
  `T_Γ`, preserve incomingness and outgoingness, and commute with path products.

**Checks.**

- For `Γ=Λ=ℤ²`, `P=ℕ²`, `ρ=id`, `w=e_1` and `m=e_2*`, both supports
  `𝔡=ℝ_{≥0}e_1` and `𝔡+2e_1` are incoming, although `e_1∈𝔡` and
  `e_1∉𝔡+2e_1`.
- For `Γ=ℤ²`, `P=ℕ²` and `ρ(a,b)=a∈ℤ`, a wall of degree `(0,1)`
  is incoming, including when its support is a single point of `ℝ`.

*Needs:* §3.1, §§1.1–1.2, §2.1. Sources: MAN Definition 2.2, Remark 2.3 and (8).

### 3.3 Local scattering and existence of completion

The input `𝔇_in` is a finite family of incoming full affine hyperplanes labelled
in §3.1's wall groups, with no transversality or rational-offset hypothesis.
An outgoing completion is a consistent diagram containing `𝔇_in` whose other
walls are outgoing. *HasPureBirthLogs* means that each noninitial wall has a single
homogeneous logarithm in `g_n`, with birth order `δ(n)`. For `k≥1`,
*IsCorrectionStage k* says that the diagram contains `𝔇_in`, is consistent through
order `k−1`, and has only outgoing noninitial walls with pure birth logarithms of
orders strictly less than `k`.

For a diagram consistent through order `k−1`, a *ChamberTrivialization* at order
`k` is a finite ambient complex covering the active walls by codimension-one cells,
with a base point off its codimension-one skeleton and lifts to `G≤k` of the
order-`(k−1)` transport from that point, constant on each chamber. The central
defect `A_k` is the codimension-one *PolyhedralCochain* (§1.4) in
`E_k=F^kg/F^{k+1}g` of the conjugated discrepancies of these lifted actions.
Prove each discrepancy lies in `ker(G≤k→G≤k−1)` before applying the inverse
central exponential. Likewise, `ζ_k` assigns to each codimension-two cell the
central logarithm of the product around its closed meridian (§1.2), with kernel
membership supplied by lower-order consistency.

For each degree `n` with `δ(n)=k`, *centralStep* uses
`b_{k,n}=S_{i(ρ(n))}ζ_{k,n}`, the sweep of §1.4, on the nonzero transverse
components. It is realized by walls on `𝔡−ℝ_{≥0}i(ρ(n))`, indexed by the
primitive generator of `n` in `Γ`, with logarithm the degree-`n` coefficient
and label `exp(−c)` for coefficient `c` on the positive transverse side.
For `n=aw`, `a≥1`, this generator is a *SupportedRay* and the sweeps along
`ρ(n)` and `ρ(w)` have the same support and outgoingness. The birth order is
`δ(n)` throughout.

*Targets.*

- *exists_outgoingCompletion*: every input `𝔇_in` has an outgoing completion,
  assembled from finite order-`k` completions compatible in `k`.
- For every *ChamberTrivialization*, `ζ_k=dA_k`, hence `dζ_k=0`. For an
  *IsCorrectionStage k* diagram, the degree-`n` component at a joint of direction
  `W` is zero when `i(ρ(n))∈W`; otherwise it lies in the wall space whose
  normal spans `Ann(W+ℝi(ρ(n)))`.
- *zeroDirectionObstruction*: the degree-`n` obstruction is zero when `ρ(n)=0`;
  *centralStep* therefore uses only nonzero directions.
- At an *IsCorrectionStage k* diagram, *centralStep* adds only outgoing walls with
  pure birth logarithms of order `k` and produces an
  *IsCorrectionStage (k+1)* diagram;
  `ζ_k+dΣ_n b_{k,n}=0` on a common refinement including the sweep side faces and
  the new intersections.

*Route:* Initial linear contributions to the joint obstruction cancel, since their
supports are full hyperplanes. Other linear terms have birth orders below `k`.
For degree `n` with `i(ρ(n))∈W`, every remaining Lie word vanishes by
*zeroDirectionLieWord*: its leaf normals annihilate `W`. For the transverse
components, apply `dS_{i(ρ(n))}+S_{i(ρ(n))}d=−id` to `dζ_k=0`. Strict
outgoingness of the swept cells gives the required outgoing walls.

**Checks.**

- Over `A=ℚ[t_1,t_2]/(t_1²,t_2²)`, with wall spaces `A⊗h_{n,m}`,
  transverse hyperplanes labelled `exp(t_1x)` and `exp(t_2y)` gain one wall
  `exp(t_1t_2[x,y])` with normal
  `μ=m(ρ(n'))m'−m'(ρ(n))m` on the joint swept by `−i(ρ(n+n'))`,
  and none if `μ=0`. For `ρ=id`,
  `n=e_1,m=e_2*,n'=e_2,m'=e_1*`, the support is
  `−ℝ_{≥0}(1,1)` with normal `e_1*−e_2*`.
- If `ρ(n+n')=0` in this calculation, the bracket and correction vanish.

*Needs:* §§0.2, 0.4–0.5, 1.2, 1.4, 3.1–3.2;
`LieAlgebra.ExtendScalars`, `DirectSum.Decomposition.baseChange`.
Sources: MAN Theorem 2.6 and Lemma 2.9; GHKK Appendices C.1 and C.3.

### 3.4 Uniqueness and compatibility

*Scat* `𝔇_in` is the equivalence class of an outgoing completion of a §3.3
input, bundled with an index type in the universe of *exists_outgoingCompletion*;
its order-`k` class is taken modulo order-`k` equivalence.

*Targets.*

- *outgoingCompletion_unique*: two outgoing completions of one input are equivalent,
  so every outgoing completion represents *Scat* `𝔇_in`.
- The order-`k` class of *Scat* depends only on that of the input. Mapping a
  completion along `g→g≤k` gives a completion of the truncated input.
- *Scat* commutes with §0.5's *completedMap* along the fixed-degree morphisms of
  §3.1 and with its coordinate changes, using their cutoff moduli for finite-order
  comparisons.

*Route:* Split the central difference at the first differing order into homogeneous
parts on an ambient subdivision. Initial walls cancel. A degree-`n` part is a
consistent abelian family supported on outgoing walls. Its supports satisfy
`i(ρ(n))∉rec(𝔡)`, so `ρ(n)≠0` and each support lies in a half-space
`l≤c` with `l(i(ρ(n)))>0`. A transverse segment and its far translate along
`i(ρ(n))` bound a rectangle with sum zero; the part is therefore trivial.
Induct on the order.

**Checks.**

- A nontrivial full hyperplane, with
  `𝔡−ℝ_{≥0}i(ρ(n))⊆𝔡`, is consistent and inequivalent to `∅`.

*Needs:* §3.3, §0.2's graded degree ideals, §1.1's ambient subdivision.
Sources: MAN Theorem 2.6; GHKK Appendix C.1; LMY Definition 1.3 calls a wall
with `𝔡−ℝ_{≥0}i(ρ(n))⊆𝔡` outgoing.

## Layer 4: realizations and specializations

### 4.1 The tropical vertex algebra

Let `R` be a commutative `ℚ`-algebra and use `Γ,Λ,ρ,P` of §3.1. The formal
logarithmic derivations of degree `n∈P\{0}` are
`g_n=R⊗_ℤ{m∈Λ* | m(ρ(n))=0}`, with generators `z^n∂_m` and bracket
`[z^n∂_m,z^{n'}∂_{m'}]=z^{n+n'}∂_{m(ρ(n'))m'−m'(ρ(n))m}`.
The wall space `h_{n,m}` is the `R`-line of `z^n∂_m` when `m(ρ(n))=0`, and zero
otherwise. A *coefficient monoid* is a submonoid `Q` with `P⊆Q⊆Γ`. The action on
`R[Q]` is `z^n∂_m(z^q)=m(ρ(q))z^{n+q}`. It raises the filtration by the ideals
spanned by `z^{q+n}`, `q∈Q`, `n∈P`, `δ(n)≥k`; `R[[Q]]` is its §0.3 completion.
`Q=P` gives the degree completion; the full Laurent algebra for `Q=Γ` enters the
relative completions of §5.1. A *TropicalPairing* is a *PositiveDegreeMap*
`T:Γ→Γ'` and a `ℚ`-linear map `S:U→ₗ[ℚ](Λ')*_ℚ` on `U⊆Λ*_ℚ`, with
`S(m)(ρ'(Tp))=m(ρ(p))` for `p∈P`, `m∈U`. The identity-projection case
`Γ=Λ=L`, `ρ=id` is the usual tropical vertex algebra and pairing.

*Targets.*
- The bracket satisfies the Jacobi identity, and the `h_{n,m}` satisfy §3.1.
- *tropicalVertexGroup*: §0.5's completed group `Ĝ` of the formal Lie algebra `g`.
  For each coefficient monoid `Q`, the `R`-linear Lie map `g→Der_R R[Q]`
  integrates through §0.6 to an `R`-algebra action on `R[[Q]]`, faithful on
  `R[[P]]` when `ρ(P)` spans `Λ_ℚ`. For ray series `f` of constant term one,
  `exp(log(f)∂_m)(z^p)=z^p f^{m(ρ(p))}` for `p∈Q`, with powers taken in units.
  These are §0.7 label representations, compatibly with truncation.
- *tropicalVertexGroup.map*: for a *TropicalPairing*, the span of the `z^n∂_m`, `m∈U`,
  is a Lie subalgebra, and `z^n∂_m↦z^{Tn}∂_{S(m)}` is a functorial Lie and group
  homomorphism on it, intertwining `z^p↦z^{Tp}` on `R[P]` and on completions along the
  cutoff modulus of `T`. For commuting degree and tangent isomorphisms,
  `S` is the inverse dual of the tangent map. In the identity-projection case,
  lattice isomorphisms carrying `P` onto `P'` and finite-index embeddings with
  rational inverse dual are pairings; integral walls keep their primitive normals
  and take the denominators into their labels.
  On a supported ray, write `T(w)=b w'` by §0.1. Its ray subgroup maps into
  the target subgroup indexed by `w'`, sending each supported degree `aw` to
  `ab w'`. Reindexing changes neither these exponents nor the cutoff modulus;
  the image need not be the whole target ray subgroup. Transport of supports and
  outgoingness additionally uses a compatible spatial map, as in the coordinate
  and cylinder comparisons.
- *tropicalVertexGroup.coeffMap*: change of coefficient ring `φ:R→R'` on a fixed
  lattice. For a *TropicalPairing*, coefficient monoids `Q`, `Q'` with `T(Q)⊆Q'` and
  `S(m)(ρ'(Tq))=m(ρ(q))` for `q∈Q`, `m∈U`, and a monoid homomorphism
  `χ:Q→(R',·)`, the twisted
  map `r z^n∂_m↦φ(r)χ(n)z^{Tn}∂_{S(m)}` is a Lie homomorphism on the span of the
  `z^n∂_m`, `m∈U`, intertwining `r z^q↦φ(r)χ(q)z^{Tq}` from `R[Q]` to `R'[Q']` and on
  completions along the cutoff modulus of `T`. For `Q=Γ` the values of `χ` are
  units. This uses the same supported-ray reindexing as *tropicalVertexGroup.map*;
  `χ` is evaluated only on actual degrees in `Q`. The action square is the
  naturality square of *LabelRepresentation*.

**Checks.**
- For `R=ℚ`, `Γ=Λ=ℤ³`, `P=ℕ³` and `ρ=id`, `g_{e_1}` contains the independent
  `z^{e_1}∂_{e_2*}` and `z^{e_1}∂_{e_3*}`, and
  `[z^{e_1}∂_{e_3*},z^{e_2}∂_{e_1*}]=−z^{e_1+e_2}∂_{e_3*}`
  although `e_3*(e_2)=0`.
- For `R=ℚ`, `Γ=Λ=ℤ²`, `P=ℕe_1` and `ρ=id`, the nonzero
  `z^{e_1}∂_{e_2*}` acts by zero on `R[P]`.
- With identity projections, `P=ℕ²`, `P'=ℕ` and `U=ℚe_1*`, the map
  `T:ℤ²→ℤ`, `(a,b)↦a+b`, preserves positive degrees but admits no pairing `S`.
  No derivation of `ℚ[z]` intertwines `yx∂_x` with `x,y↦z`, since `x−y↦0`
  but `yx∂_x(x−y)=xy↦z²`.
- For `T(a,b)=(2a,b)` with `S` the rational inverse dual, *tropicalVertexGroup.map*
  sends `z^{e_2}∂_{e_1*}` to `½·z^{e_2}∂_{e_1*}`.

*Needs:* §§0.1, 0.3–0.6, 3.1; `TensorProduct`, `AddMonoidAlgebra`, `Derivation`.
Source: MAN Example 2.1(i).

### 4.2 Skew forms, Poisson actions and the principal realization

A *SkewLatticeDatum* is a finite free lattice `N` with a saturated sublattice `N_uf`, a
finite-index sublattice `N°` and a rational skew form `{,}` with `{N_uf,N°}⊆ℤ` and
`{N,N_uf∩N°}⊆ℤ`; morphisms carry `N_uf`, `N°` and the forms to each other. An
*AdaptedBasis* is additional data: an unfrozen subset spanning `N_uf` and integers
`d_i>0` with `(d_i e_i)` a basis of `N°`. Put `M°=Module.Dual ℤ N°`,
`P_N=Σ_{i∈I_uf}ℕe_i`, `N⁺=P_N\{0}` and `p₁*(n)={n,-}|_{N°}` for `n∈N_uf`, pairing `N`
with `M°` over `N_ℚ`. The directed normal of `n` (Convention 3) is `-p₁*(n)`. The skew
Lie algebra has `[X_n,X_n']={n',n}X_{n+n'}`; on `R[M°][[t_i]]`, `q^n=z^{p₁*(n)}t^n` and
`D_n(z^m t^a)=⟨n,m⟩z^{m+p₁*(n)}t^{a+n}`. The principal lift has `L_pr=M°⊕N_uf`,
`P_pr=r(P_N)` for `r(n)=(p₁*(n),n)`, `δ_pr(r(n))=Σn_i`, normal `ν_n(m,a)=⟨n,m⟩` with
primitive normal `κ(n)ν_n` (Convention 6), and `h_{r(n),m}` the line of `X_n` when `m`
is a nonzero multiple of `κ(n)ν_n`, zero otherwise. A KS wall of degree `n` is
KS-incoming if its support contains `p₁*(n)`. For an integral form, a skew comparison is
a linear map `p₁*_ℝ:N_ℝ→M°_ℝ` extending `x↦{x,-}`.

*Targets.*
- Morphisms of skew lattice data form a category; `{-,κ(n)n}` is integral for
  primitive `n∈N_uf`; the adapted-basis degree on `N⁺` and any §3.1 degree on its cone
  give the same completions.
- Ray subalgebras are abelian; `X_n(z^{n'})={n',n}z^{n+n'}` acts on `R[N]`; the `D_n`
  give a faithful Lie action on `R[M°][[t_i]]` for every datum, with wall action
  `θ_{n,f}(z^m t^a)=z^m t^a f(q^n)^{⟨κ(n)n,m⟩}`, compatible with scalar extension.
- *principalGradingDictionary*: `P_pr=C_pr∩L_pr` for `C_pr=cone{r(e_i)}`, with finite
  cutoffs; `ν_n(r(n))=0`, the `h_{r(n),m}` satisfy §3.1, and `D_n` shifts
  `M°×ℕ^{I_uf}`-degree by `r(n)`. `X_n↦z^{r(n)}∂_{ν_n}` is an injective graded Lie
  homomorphism over `r` into §4.1's formal algebra of `P_pr`, through which `D_n` is
  §4.1's action on `R[Q_pr]`, `Q_pr=M°⊕P_N`, with `R[[Q_pr]]=R[M°][[t_i]]` by §0.3.
- After *completedMap* along the regrading from `P_N` to `P_pr` over `r` (identity
  modulus), the `M°_ℝ`-projection intertwines path products of KS walls `𝔡` and of
  cylinders `𝔡×(N_uf)_ℝ` with normal `κ(n)ν_n`. Incoming ray-group elements, finite at
  every order and of distinct degrees, have a consistent conical completion, unique up
  to equivalence, whose KS-incoming cells `𝔡⊆n⊥` (`n` primitive in `N⁺`) carry the
  label of `n`; via the principal lift it is §3.4's completion on finite
  full-hyperplane input.
- *principalProjectionComparison*: `Γ=L_pr`, `P=P_pr`, `Λ=M°` and
  `ρ=pr_{M°}`, with the same abstract Lie algebra and coefficient modules,
  define §3.1's projected wall spaces and §4.1's action. The normal
  `κ(n)⟨n,-⟩` pulls back to `κ(n)ν_n`. Pullback of supports gives principal
  cylinders with `ρ=id`, preserving signed products, sweeps and compatible
  refinements. It preserves incomingness and outgoingness by
  `r(n)∈rec(𝔡×(N_uf)_ℝ) ↔ p₁*(n)∈rec(𝔡)`,
  hence identifies outgoing completions (§3.4). The action on `R[M°][[t_i]]` is faithful.
  For the zero form, initial walls are consistent and `ρ(r(n))=0`.
- For a skew comparison `A=p₁*_ℝ` and a KS cone `σ⊆n⊥`,
  `n∈rec(A⁻¹(σ)) ↔ A(n)∈σ`, and `ker A` is the real radical of the form. If the
  pulled-back normal `{-,κ(n)n}` is nonzero and `A⁻¹(σ)` has codimension one, this
  inverse image is a §3.2 directed-wall support, KS-incoming agrees with *Incoming*,
  and that normal gives its crossing signs. These hypotheses hold for nondegenerate
  forms; the principal cylinder comparison above applies to every datum.

**Checks.**
- The zero form has trivial Poisson action and faithful principal action.
- For `N=ℤ²`, `{e_1,e_2}=1`, `d=(1,2)`, `N°=ℤe_1⊕2ℤe_2`, both integrality conditions
  hold, `κ(e_1)=1`, `κ(e_2)=2`, and `{-,κ(e_2)e_2}` is integral on `N`.
- For `n∈N⁺` in the radical of `{,}`, prescribe the full KS wall `n⊥`
  with a nonidentity label in its supported-ray group. Brackets of total degree
  `n` vanish, and a skew comparison pulls its normal back to zero. The KS and
  projected principal walls are incoming, with `r(n)≠0` and `ν_n≠0`. The projected
  and principal-cylinder direction maps send `r(n)` to `0` and `r(n)`, respectively.

*Needs:* §§0.1–0.6, 2.3–2.4, 3.1–3.2, 3.4, 4.1; `Module.Free`, `Module.Finite`,
`AddSubgroup.index`, `Module.Dual`, `MvPowerSeries`, `AddMonoidAlgebra`. Sources: GHKK
§1 and Appendix B; N23 §§1–3; MAN Examples 2.1(ii), Remark 2.3.

### 4.3 Quantum coefficients

Let `R` be a commutative ring, `q∈Rˣ` a specified unit, and `β` an integral
alternating form on the lattice `L`. *QuantumMonoidAlgebra* `R q β` is the module of
`AddMonoidAlgebra R L` with basis `z^p`, `p∈L`, and multiplication
`z^p z^{p'}=q^{β(p,p')}z^{p+p'}`. The full twisted group algebra carries the Laurent
homogeneous pieces; its positive subalgebra spanned by `z^p`, `p∈P`, carries the degree
completion, and its strictly positive part is a graded `R`-Lie algebra acting by inner
derivations. BCH groups, exponential actions and quantum scattering assume in addition
that `R` is a `ℚ`-algebra. For `n` outside the radical of `β`, `h_{n,m}` is the
`R`-span of `z^n` when `m` is nonzero and rationally proportional to `β(n,-)`, of
either sign, and zero otherwise; degrees in the radical have zero wall spaces. Wall
eligibility is determined by `β`, also when specialization of `q` enlarges the center.
For a skew datum, `β` is that of Convention 3, with the integrality required here.
Coefficient models are specified explicitly: `k[q,q⁻¹]` and `RatFunc k` for a
characteristic-zero field `k` are instances, and so is a localization of the Laurent
ring with specified inverted elements; an input using denominators `q^a−q^(-a)`,
`a∈ℕ_{>0}`, specifies a model in which they are units.

*Targets.*
- *QuantumMonoidAlgebra* over any commutative `R`: associativity, unit and basis
  theorems, `[z^n,z^{n'}]=(q^{β(n,n')}-q^{-β(n,n')})z^{n+n'}`, the `GradedAlgebra`
  over `L` with pieces `R z^p`, and `β=0` giving `AddMonoidAlgebra` as graded
  algebras.
- A lattice map preserving the forms induces a graded algebra homomorphism, extending
  to completions through §0.3 with the cutoff modulus when its restriction to the
  positive monoids is a *PositiveDegreeMap*. A ring homomorphism `φ:R→S` with
  `φ(q)=q'` induces `a z^p↦φ(a)z^p`, functorially, commuting with lattice maps and
  extending to completions.
- Over a commutative `ℚ`-algebra, the completed action by conjugation on the completed
  positive subalgebra through `R`-algebra automorphisms, intertwined by coefficient
  maps. The `h_{n,m}` satisfy §3.1, so §3.4 gives the quantum *Scat*, natural for
  coefficient maps; for a skew datum, `β(n,-)` is `{-,n}` and the eligible normals are
  those of §4.2.
- *quantumRayAction*: for `n∈P\{0}`, `p∈L`, `G(T)∈1+T R[[T]]` and
  `r=β(n,p)`, conjugation gives
  `Ad_{G(z^n)}(z^p)=z^p G(q^{2r}z^n)G(z^n)⁻¹`, as a coefficientwise identity
  of series supported in `p+ℕn`. If `G(q^{2r}T)G(T)⁻¹=Σ_j h_j T^j`, its
  degree-`p+jn` component is `q^(-jr)h_j z^{p+jn}`. These identities commute with
  truncation and coefficient maps; signed crossings use `G` or `G⁻¹` by Convention 3.
- When all `q^j−q^(-j)`, `j>0`, are units, construct the unique
  `Ψ_q(T)∈1+T R[[T]]` satisfying `Ψ_q(q²T)=(1+qT)Ψ_q(T)`.
  For `G=Ψ_q`, the right multiplier in *quantumRayAction* is
  `∏_{j=1}^r (1+q^{2j−1}z^n)` for `r≥0`, with empty product `1`, and
  `∏_{j=1}^{−r} (1+q^{−(2j−1)}z^n)⁻¹` for `r<0`.

**Checks.**
- For `β(e_1,e_2)=1`, `z^{e_1}z^{e_2}=q z^{e_1+e_2}` and
  `z^{e_2}z^{e_1}=q⁻¹ z^{e_1+e_2}`.
- For `R=ℚ(q)`, `n∈P\{0}` and `β(n,p)=1`, put `θ=Ad_{Ψ_q(z^n)}`.
  Then `θ(z^p)=z^p+z^{p+n}` and
  `θ(z^{2p})=z^{2p}+(q+q⁻¹)z^{2p+n}+z^{2p+2n}`.
- Evaluation `q↦1` is defined on `k[q,q⁻¹]` and gives the untwisted algebra, where the
  unnormalized commutator and its inner action vanish; no ring homomorphism `k(q)→k`
  sends `q` to `1`.

*Needs:* §§0.1, 0.3–0.6, 3.1–3.4, 4.2; units, `AddMonoidAlgebra`, `GradedAlgebra`;
`PowerSeries`, `PowerSeries.rescale`; `RatFunc` and `LaurentPolynomial` for the coefficient instances. Sources: MAN
Example 2.1(iii); NQ §2.3, equations (2.14) and (2.21).

### 4.4 Weight-zero function walls and face algebras

Let `A=⊕_{d∈ℤ}A_d` be a commutative ring graded by the normal weight `ℓ`, and let
`f∈A₀ˣ`. A *FunctionWallAction* is the ring automorphism `Θ_f(a_d)=a_d f^d` on a
homogeneous element. At finite order use compatible graded rings `A_k` and
weight-zero units `f_k`; truncation is graded. For a monomial model with exponent
map `ρ` and normal `ν`, take `ℓ=ν∘ρ`, so
`Θ_f(z^p)=z^p f^{ν(ρ(p))}`. Localization at a weight-zero element preserves the
normal-weight grading, even when it does not preserve the full exponent grading.

For a commutative ring `S`, tangential lattice `Λ_b` and arbitrary
`q∈S[Λ_b]`, the *SlabAlgebra* is `N_b=S[Λ_b][X,Y]/(XY-q)`. Its chamber
algebras are `M_u=S[Λ_b][x,x⁻¹]` and `M_v=S[Λ_b][y,y⁻¹]`, with maps
`λ_u(X)=x`, `λ_u(Y)=qx⁻¹`, `λ_v(X)=qy⁻¹`, `λ_v(Y)=y`, fixing
`S[Λ_b]`. Incoming lifts are `cx^a↦cX^a` and `cy^a↦cY^a` for `a≥0`,
with geometric orientation selecting strictly transverse degrees. These give
§0.8's face span, also for compatible quotient towers `S_k,q_k`.
In monomial models, `q=z^κf` for a kink monomial `z^κ` and tangential function `f`.

*Targets.*
- *functionWallAction*: multiplicativity, inverse `Θ_{f⁻¹}`, composition
  `Θ_f Θ_g=Θ_{fg}` for weight-zero units, compatibility with truncation and
  naturality under graded maps sending `f` to `f'`. On algebras over a fixed scalar
  ring these are algebra automorphisms when the scalars have weight zero.
- *functionWallAction_eq_exp*: over a commutative `ℚ`-algebra, in a complete
  filtered coefficient algebra with `I=F¹A`, for `f∈1+I` and a
  filtration-preserving normal degree derivation `D_ℓ`, prove
  `Θ_f=exp(log(f)D_ℓ)` at finite order and after completion. This identifies
  the function-wall and §0.6 BCH label representations.
- *slabNormalForm*: for arbitrary `q`, `N_b` is free over `S[Λ_b]` with basis
  `{X^a | a≥0} ∪ {Y^a | a≥1}`. The chamber maps are jointly injective; the
  lifts have the stated source images and define *DecoratedCrossingRule*s
  compatible with truncation.
- The graph spans of §§4.1–4.3's tropical vertex, principal and quantum actions,
  and the slab spans, instantiate §0.8. Their restrictions and coefficient and
  degree maps give *CoefficientDiagramMap*s.

**Checks.**
- In `S[w,w⁻¹][X,Y]/(XY-t(1+w))`, the incoming lift `X^a w^b` has right chamber
  image `t^a y⁻ᵃ Σ_{j=0}^a binom(a,j)w^{b+j}`.

*Needs:* §§0.3, 0.6–0.8, 1.5, 4.1–4.3; `GradedAlgebra`, `Units`, localization,
polynomial and Laurent polynomial algebras. Sources: GS §2.3; GHS Definitions
3.1–3.3; MAN Example 2.1(i) for the exponential comparison.

## Layer 5: broken lines, general position and theta transport

### 5.1 Graded actions and shifted coefficient modules

Let `R` be a commutative `ℚ`-algebra and `A=⊕_{p∈Γ}A_p` an associative,
possibly noncommutative, `Γ`-graded `R`-algebra (`GradedAlgebra`).
§3.1's Lie algebra acts as in §0.6 by an `R`-linear Lie module action with the
Leibniz rule; multiplication and action are given data. The *graded action condition*
is `g_n A_p⊆A_{n+p}` (`GradedLieModule`), and the *annihilation condition* is
`h_{n,m}A_p=0` whenever `m(ρ(p))=0`. The module constructions also apply to any
`Γ`-graded Lie module satisfying these conditions; the algebra structure supplies
the products.

For `p∈Γ` the *shifted module* is `M_p=⊕_{n∈P}A_{p+n}`, with relative degree
`δ(n)` on `A_{p+n}`. Complete it by relative degree using §0.3; its order-`k`
quotient retains `δ(n)≤k` (Convention 3). The instances are §4.1's tropical vertex
derivations, §4.3's inner derivations on twisted group algebras, and §4.2's principal
action with its degree lattice and geometric projection. Their Laurent algebras enter
the relative completion through the `M_p`.

*Targets.*

- *IsWallAnnihilating*: the annihilation condition, as a class on the action. It and
  the graded action condition hold for the three instances.
- *ShiftedCoefficients p*: the completion of `M_p`, with the induced action of
  `Ĝ` (§0.6), components *homogeneousComponent*, and products
  `M̂_p×M̂_{p'}→M̂_{p+p'}`, each coefficient a finite sum by §0.1's finite
  decomposition theorem. For `γ∈Ĝ` and `a∈A_p`, the relative-degree-zero
  component of `γ·a` is `a`.
- Action, components and products are natural under §3.1's morphisms and coordinate
  changes `(T_Γ,T_Λ,φ)`, through *completedMap* `φ`, together with graded
  algebra maps `ψ` satisfying `ψ(A_q)⊆A'_{T_Γq}` and
  `ψ(x·a)=φ(x)·ψ(a)`. For modules retain the action and component statements.
- *zeroDirectionComponent*: an ordinary wall action fixes `A_p` when `ρ(p)=0`
  and has zero component map `A_p→A_q` when `p≠q` and `ρ(q)=0`.
- Realize each order-`k` shifted module as §0.8's graded chamber coefficients, with
  ordinary-wall face spans given by the identity and the signed group action.

*Needs:* §§0.1–0.6, 0.8, §3.1 and Layer 4; `GradedAlgebra`, `GradedLieModule`.
Sources: MAN §2.1 and Definition 2.10.

### 5.2 Decorated broken lines

Use §1.5's base, incoming datum `(s,a)` and degree projections, and §0.8's
chamber modules and face spans over a semiring. Fix order `k` and an endpoint `Q`
in a regular chamber. In a vector space, `a∈A_p` admits every affine tail with
velocity `−i(ρ(p))` and coefficient `a`.

A *BrokenLine* is a proper continuous path `β:(−∞,0]→B_0` ending at `Q`, with
finitely many strictly increasing crossing times and nonzero homogeneous decorations
`a_i∈M_{u_i,k,p_i}` giving velocity `−ρ(p_i)` in affine coordinates. Its first segment
is an *IncomingTail* admitted by `(s,a)`. Record every active wall/slab encounter;
open segments miss the supports, crossings are transverse to every active normal
encountered, and paths avoid joints and the excluded singular locus. The next
decoration is the entire nonzero component `pr_{p_{i+1}}(Φ_{u'u,k}(a_i))`, where `Φ`
is the opposite generization after the admissible homogeneous lift, or the signed
ordinary-wall action. Crossing rules admit every transverse incoming degree and
preserve the transported normal component of each nonzero output. Equality ignores
subdivisions introducing no encounter.

A *DecoratedType* records the selected *IncomingTypeDatum*, chamber and wall/slab
itinerary, degrees and discrete chart/deck history, modulo the specified coordinate
identifications and artificial subdivisions. Its incoming record fixes the initial
coefficient, and component maps determine subsequent decorations. Endpoints, crossing
times and affine tail positions belong only to realizations.

*Targets.*

- Path evaluation, the map to *DecoratedType*, initial and final decorations, and the
  component propagation maps, with their subdivision and truncation laws.
- In §5.1's affine instance, every nonidentity component shift lies in `P\{0}`
  and raises relative degree. At order `k` there are at most `k` such changes and
  finitely many realized *DecoratedType*s across all endpoints for a fixed initial
  decoration. Identity components fix the decoration; shifts in `ker ρ` are recorded.
- The constant-source constructor sends compatible invariant incoming coefficients
  of zero spatial direction to constant theta sections; in §5.1 this applies to
  every `a∈A_p` with `ρ(p)=0`.
- At finite order, *weightedEvaluation* sums final decorations over an evaluation
  fiber when it is finite. The completed theta series is the inverse limit of these
  finite-order sums.

**Checks.**

- Subdividing a straight segment or adding zero components adds no broken lines.
- In the empty one-chart diagram on `V`, with incoming cell `V`, fixed nonzero
  `a∈A_p` and `ρ(p)≠0`, the lines `β_Q(t)=Q−t i(ρ(p))` form one
  *DecoratedType* with endpoint chart `V`. Their individual incoming tails retain
  their transverse affine positions.
- In `A=ℚ[x,x⁻¹,t]/(t²)`, graded by `Γ=ℤ²` with `deg x=(1,0)`,
  `deg t=(0,1)` and `ρ(r,s)=r`, give `{0}⊂ℝ` coorientation `u↦u` and
  label `θ(x)=x(1+t)`, `θ(t)=t`. At a right-to-left crossing with incoming
  decoration `x`, the possible next decorations are exactly `x` and `tx`,
  both with velocity `−1`.

*Needs:* §§0.8, 1.1–1.3, 1.5, 3.2 and 5.1.
Sources: MAN Definition 2.10 and Proposition 2.13; GHKK Definitions 3.1–3.3 and
Proposition 3.4; GHS Definitions 3.1–3.3.

### 5.3 Endpoint evaluation, closed families and general position

First take §5.1's affine positive-degree instance and fix `(a,k)` and a
rational-normal presentation of the wall supports. A *DecoratedType*'s *valid endpoint
domain* is the set of endpoints of its realizations. Define its *endpoint discriminant*
`Δ(a,k)` by the zero sets of the nonconstant affine functions in the backward
intersection calculation below, over all types, and by the affine spans of
`σ−ℝ_{≥0}i(ρ(p+n))` for `δ(n)≤k` and singular-support cells `σ` of
codimension at least two. A *generic endpoint* lies outside `Δ(a,k)`.

For a point `x` on a backward ray `Q+τi(ρ(q))`, `τ>0`, its *incoming
germ* `x^-` is `x+ε(i(ρ(q))+r)` for small `ε>0`. Choose one `r` for
the finitely many relevant `q` so that
`m(i(ρ(q))+r)m(i(ρ(q)))>0` whenever `m(i(ρ(q)))≠0`, and
`i(ρ(q))+r` lies outside the direction of every affine subspace in `Δ(a,k)`.
Sign preservation and eventual avoidance are separate requirements.

For a general base, a *FiniteClosedTypeFamily* for `(s,a,k)` gives, near every
regular chamber or facet point, finitely many complete global *DecoratedType*s
exhausting all contributing paths and their asymptotic/deck histories, with constant
weights in the specified coefficient identifications. Incoming records and discrete
continuations are fixed; affine tail positions vary with endpoint coordinates.
Each chart is the relative interior of a closed polyhedron, with closed endpoint map
an affine embedding into the closure of its final chamber, proper over compact
subsets of the chosen relatively compact neighborhood. Valid endpoints lie in the
chamber interior. Boundary points represent actual finite degenerate paths in `B`,
retaining every encounter and the incoming tail modulo its specified identifications;
no encounter escapes to infinity.

Generic codimension-one boundary events are artificial subdivisions, terminal face
crossings, finite joint or singular-locus degenerations, and specified incoming-record
identifications, including tangential source faces. Other degenerations have
codimension at least two.

*Targets.*

- *BrokenLineFamily a k*: in the affine instance, a §1.3 semilinear family with one
  chart per *DecoratedType* and convex piece of its valid endpoint domain. Each domain
  is a finite disjoint union of *LocallyClosedPolyhedron* sets. The family *IsFiniteBranch*:
  endpoint and type determine a transverse line and its individual incoming tail by
  backward propagation, with no genericity hypothesis.
- *endpointDiscriminant*: `Δ(a,k)` is an *ExceptionalArrangement* containing
  all domain frontiers and degenerations: zero-length segments and encounters with
  wall boundaries, joints or singular points. Under the annihilation condition,
  tangent ordinary-wall encounters act trivially, so the transverse formulation loses
  no weighted contribution at generic endpoints.
- *GenericEndpoint*: every nonempty open set contains generic endpoints; their fibers
  are finite; and each has a neighborhood with the same realized types. Countably
  many pairs `(a,k)` have a dense common generic locus. The chartwise statements
  hold on a general base equipped with a *FiniteClosedTypeFamily*.
- *incomingBranchGerm*: the incoming germs eventually avoid `Δ(a,k)`; the
  construction works after any finite exceptional-arrangement refinement by choosing
  `r` for that refinement.
- *affine_finiteClosedTypeFamily*: construct the closed family for §5.1 using the
  component-change bound and the fact that each straight segment meets each convex
  active wall at most once.
- *positiveKink_finiteClosedTypeFamily*: construct the closed family for §1.5/§4.4
  monomial data on finitely many convex integral polyhedral cells, with singular locus
  in their codimension-two skeleton and finitely many walls per cell at each order.
  Let coefficients be `A[Q]/I`, with `A` Noetherian commutative, `Q` toric,
  `I_0=√I` and `I_0^r⊆I`. Require `z^{κ_ρ}∈I_0` for every interior base-facet kink,
  ordinary wall functions `1` modulo `I_0`, and admissible propagation with finite homogeneous expansion.
  Prove that base-facet crossings and ordinary-wall direction changes raise
  coefficient order, hence fewer than `r` of each occur, and construct the complete
  types and their closed degeneration charts for each global incoming monomial.
- Refining endpoint charts, changing affine coordinates and applying a compatible
  finite-order coefficient map preserve the finite-family and weighted-evaluation
  constructions, after grouping coincident types and discarding zero weights.

*Route:* Backward intersection with `m=c` gives
`τ=(c−m(X(Q)))/m(i(ρ(q)))`, with a fixed nonzero integer denominator; tangency
is `m(X)=c`. Successive substitutions, including the affine chart transitions,
recover all encounter points and the incoming tail position as affine functions of
`Q`. Their validity conditions are locally constant off the discriminant. The
finite-type bounds, closed charts and §1.3's Baire theorem give the stated finiteness,
properness, stability and density.

**Checks.**

- For `{x=0}∪{y=0}`, `ρ=id` and `p=(−1,−1)`, the diagonal
  `{x=y>0}` lies in an open chamber and in `Δ(a,k)` by joint incidence.
- The hyperplanes `{x=1/(j+1)}` of `ℝ` have common generic point `0` and
  no neighborhood of `0` generic for all.

*Needs:* §§1.2–1.3, 1.5, 4.4 and 5.2.
Sources: CPS Proposition 4.4 and Definition 4.6; N23 Definition 7.2 and the proof of
Proposition 7.6; GHS Proposition 3.5, Remark 3.6 and Lemma 3.7.

### 5.4 Coefficient local systems and local resolution identities

Fix finitely many cooriented walls in `V` labelled in a group `G` acting on an
arbitrary type `M`, with pairwise commuting labels for walls containing the same
point outside *SingularSupport*. A simultaneous crossing uses the combined signed
product; reversing it inverts the whole product. For walls of a polyhedral complex the
commutation condition holds because regular wall germs are disjoint. On
`V∖SingularSupport` the segment transport `P_{yz}` along `[y,z]` has factor
`θ^{side(y)−side(z)}` for each wall `m=c` encountered, where `side=1` on
`m>c` and `0` otherwise, with the first crossing rightmost.
*coefficientPathTransport* composes these along an admissible PL path.

A sheaf of types is locally constant (*IsLocallyConstantSheaf*) when its restrictions
to nonempty preconnected opens of small neighborhoods are bijective.
*CoefficientLocalSystem* is the sheafification
(`TopCat.PrelocalPredicate.sheafify`, `TopCat.subsheafToTypes`) of the
`M`-valued functions `s` satisfying `s(z)=P_{yz}·s(y)` for every segment
`[y,z]` in their domain. The order-`k` action on a shifted module is one instance.

For §5.2, a *LocalResolutionCertificate* assigns finite local resolutions to every
generic codimension-one boundary event of §5.3. In a wall star, fix incoming and
outgoing homogeneous germs and exhaust all admissible local histories between them.
Each history gives the linear map obtained by composing component propagation maps.
The finite sums for the two resolutions must agree under the specified coefficient
identifications, including at joint or excluded-singular degenerations, artificial
subdivisions and incoming-record identifications.

At a terminal face the certificate supplies a linear lift whose two generizations
are the two resolution sums, including incoming germs from either side and compatible
tangential germs. Joint injectivity gives uniqueness.

*Targets.*

- Local segment cocycle: `P_{zw}P_{yz}=P_{yw}` when the convex hull of
  `y,z,w` misses *SingularSupport*. For an order-`k` directed diagram,
  `P_{yz}` is *levelPathProduct* along `[y,z]` with endpoints off the walls.
  *coefficientPathTransport* is unchanged by subdivision.
- *CoefficientLocalSystem* is locally constant, is compatible with restriction, and
  relates sections along admissible paths by *coefficientPathTransport*.
- *facetDescent*: on an open subset of a finite-dimensional real affine space with a
  locally finite polyhedral stratification, locally constant sections of an
  *IsLocallyConstantSheaf* on the top strata extend uniquely if their continuations
  agree across every common facet.
- Local resolutions respect concatenation, subdivision and linear coefficient maps.
  Grafting onto fixed exterior path pieces gives exactly the nearby global types
  with those pieces, with component map equal to the composite of the exterior and
  local maps. Certificates are preserved by identity crossings, wall refinements
  preserving propagation, and finite weighted refinements of local histories.
- Under §5.2's geometric admissibility and normal-component conditions, construct
  single-face certificates from ordinary wall actions and terminal slab certificates
  from §0.8's admissible lifts and agreement on tangential germs. State the additional
  joint and singular identities separately.

**Checks.**

- With one wall `{x=0}`, normal `e_1*`, label `θ` and `θ·a≠a`,
  a family constant equal to `a` on both sides is not a section: the facet equation
  is `s(Q⁺)=θ^{-1}·s(Q⁻)` for `Q⁺` on the side `x>0`.

*Needs:* §§0.8, 1.1–1.2, 1.5, 2.1, 3.2 and 5.1–5.3;
`TopCat.Sheaf`, `TopCat.PrelocalPredicate.sheafify`,
`TopCat.subsheafToTypes`. Sources: Curry for *facetDescent*; GHS §3.2 for
local wall-star identities and the use of slab lifts.

### 5.5 Module probes and affine theta transport

Fix a §3.3 input `𝔇_in`, a representative `𝔇` of *Scat* `𝔇_in`, an
order `k` and `a∈A_p`. The *module probe* is `g⋉M_p`
(`LieAlgebra.SemiDirectSum` along the action as
`LieDerivation R M_p M_p`), with `M_p` an abelian ideal. Its degree lattice and
spatial lattice are
`Γ_ext=Γ⊕ℤe_y⊕ℤe_z` and `Λ_ext=Λ⊕ℤe_y⊕ℤe_z`, with
`ρ_ext(x,c,l)=(ρ(x),c,l)`. The degrees of `g` sit at `(n,0,0)` and those of `M_p`
at `(p+n,1,0)`. Set
`P_ext={(n+cp,c,0):n∈P,c∈ℕ}` and
`δ_ext(x,c,l)=δ(x)+(1−δ(p))c`. When `P=C∩Γ`, its cone is spanned by
`C×0×0` and `(p,1,0)` in `Γ_ext,ℝ`. Normals `(m,0,0)` carry the wall spaces of `g`,
nonzero multiples of `e_z*` carry `A_{p+n}`, and the other wall spaces are zero.
*Module charge* is the `e_y` degree coordinate; charge one through extended order
`k+1` is relative order `k`.

The cylinder over a wall has degree `(n,0,0)`, normal `(m,0,0)` and support
`𝔡×ℝe_y×ℝe_z`. The *probe wall* is `z=0` with degree `(p,1,0)`,
normal `e_z*` and label `exp(a)`. A point `(Q,y,0)` is *vertically regular*
when a short upward vertical segment is admissible at extended order `k+1` and
meets only module walls. Write `Θ_Q` for *weightedEvaluation* at `Q`.

*Targets.*

- *moduleProbe*: the datum satisfies §3.1, the mixed bracket of `h_{n,m}` with
  `A_{p+n'}` having normal `m(ρ(p+n'))e_z*`. Positivity and finite cutoffs of
  `P_ext` follow from `δ_ext(n+cp,c,0)=δ(n)+c`; in the cone case
  `P_ext=C_ext∩Γ_ext`. Supported rays of `P` lift by `w↦(w,0,0)`.
  The ray group at `(q,1,0)` and normal `e_z*` is `exp(A_q)` when
  `q−p∈P`, and trivial otherwise; its higher multiples have no module piece.
  Charge one at extended order `k+1` is
  `M_{p,≤k}`, with charge-zero action given by §5.1. Its geometric module
  directions `(ρ(p+n),1,0)` are nonzero even when `ρ(p+n)=0`.
  Cylinder lifts preserve consistency, incomingness and outgoingness.
- *probeCompletion*: construct a consistent probe diagram whose charge-zero part is
  the cylinder over `𝔇` and whose other walls are the probe and outgoing
  charge-one walls. At a vertically regular `(Q,y,0)` its combined module label,
  cooriented by `e_z*`, is `exp(F(Q))`. A wall with normal `c e_z*`
  contributes `θ^{sgn(c)}`, so the upward crossing is `exp(−F(Q))`.
  Here `F(Q)∈M_{p,≤k}` is independent of the regular `y` and short crossing.
- A finite exceptional arrangement `Δ_pr(a,k)` refining `Δ(a,k)` makes
  every endpoint outside it vertically regular for some `y`. For admissible
  `γ` between such endpoints,
  `F(Q')=𝔭_{γ,𝔇}·F(Q)`, where `𝔭` is the order-`k`
  *levelPathProduct*. For `q=p+n` with `ρ(q)≠0`, at all sufficiently large
  `T` the component `F_q(Q+Ti(ρ(q)))` is `a` if `n=0` and `0`
  otherwise. Components with `ρ(q)=0` have these same constant values by
  *zeroDirectionComponent*.
- *probeWall_eq_brokenLineSum*: `F(Q)=Θ_Q` off `Δ_pr(a,k)`. These values
  extend uniquely over `V∖Δ(a,k)` and equal *weightedEvaluation* there.
- *affineLocalResolution*: construct §5.4's certificate for every incoming homogeneous
  coefficient in the affine completion, extracting finite component-map identities
  from the charge-one probe products and the recursion below.
- *thetaSection*: `Θ` is locally constant off `Δ(a,k)` and obeys each
  facet equation: the signed wall action at a wall crossing, the identity at other
  facets. It extends uniquely by *facetDescent* to a section `ϑ_a` of
  *CoefficientLocalSystem*, compatible with truncation. *theta_transport*:
  `ϑ_{a,Q'}=𝔭_{γ,𝔇}(ϑ_{a,Q})` for an everywhere admissible path between
  generic endpoints, at every finite order and in the inverse limit.
- *theta_coeffMap*: for a fixed degree and spatial lattice, a §3.1 wall-space
  morphism `f` and a degree-preserving filtered coefficient map `φ`, linear
  after restriction along the specified scalar homomorphism and intertwining actions,
  satisfy `φ(ϑ_{𝔇,a,Q})=ϑ_{f_*𝔇,φ(a),Q}` at common generic endpoints.
  Here `f_*𝔇` maps labels by *completedMap* `f`. Prove this at every
  finite order and in the inverse limit as an equality of weighted sums; remove zero
  decorations and identity labels after specialization.

*Route:* Complete the cylindrical input and probe by §3.3. Projection to charge zero
and §3.4 permit replacing that part by the cylinder over `𝔇`. Rectangles and
`G exp(v)G⁻¹=exp(G·v)` prove transport and independence of the regular height `y`.
Refine `Δ(a,k)` by old-wall supporting hyperplanes active through order `k+1` and
`π(affineSpan σ)` for module-wall boundary strata in `z=0` active at extended
order `k+1` whose directions contain `e_y`, where `π:V×ℝe_y→V`. These projections are proper affine subspaces; each
remaining boundary span meets a `y`-line at most once, giving a regular height and
a sufficiently short vertical crossing avoiding walls in `z=c≠0`. Use incoming
germs for this refinement.

A noninitial charge-one wall of degree `(q,1,0)` misses
`(Q+Ti(ρ(q)),y+T,0)` for large `T` by outgoingness, giving the boundary values of `F`.
For `ρ(q)≠0`, thin rectangles along the backward ray give
`F_q(Q)=1_{n=0}a+Σ_xΣ_{δ(n')<δ(n)}pr_q(U_x^q F_{p+n'}(x^-))`,
where `q=p+n`, `x` ranges over its wall encounters and `U_x^q` is their signed
combined action. Deleting the last positive-degree component change, including a
shift in `ker ρ`, gives the same recursion for *weightedEvaluation*. Degree induction,
with *zeroDirectionComponent*, proves `F=Θ`; local constancy removes the extra strata
of `Δ_pr`. Probe identities give the local resolution and facet equations, and
*facetDescent* gives the theta section.

**Checks.**

- For `{x=0}` with normal `m=e_1*`, function `1−z^n`,
  `m(ρ(n))=0` and initial `z^p` with `m(ρ(p))=1`, the chamber values
  are `ϑ_Q=z^p` for `Q_x>0` and `ϑ_Q=z^p−z^{p+n}` for `Q_x<0`.

*Needs:* §§1.4, 3.1, 3.3–3.4 and 5.1–5.4;
`LieAlgebra.SemiDirectSum`, `LieDerivation`.
Sources: MAN Theorem 2.14 and §3.3.3; LMY §3.

### 5.6 Monomial presentations and comparison of theta constructions

A *MonomialPresentation* chooses a basis element `z^p` of each nonzero chamber
homogeneous piece over the specified common commutative scalar ring; each such piece
is free of rank one. Truncation sends a chosen basis element to its corresponding
basis element or to zero. A monomial broken line is §5.2's *BrokenLine* written in
these bases, using the whole homogeneous components of the given propagation maps.
In the static skew setting of §4.2 the initial polynomials are arbitrary over a
commutative `ℚ`-algebra `R`.

For §4.2's principal coefficients use the regrading `z^{(m,n)}↦t^n z^m`
and direction projection `(m,n)↦m`; the fine walls are inverse-image cylinders.

*Targets.*

- The standard bases of §4.2's principal coefficients and §4.3's quantum coefficients
  give *MonomialPresentation*s. Their ordinary-wall components are computed by
  §4.2's wall-function power formula and §4.3's conjugation formula, respectively.
- *monomial_exponent_dictionary*: for §4.2, GHKK's exponent `|m₀(q)|` is
  `|⟨κ(n)n,m⟩|` for `q=(m,a)`.
- *cylinderBrokenLineLift*: for the principal regrading above and a contributing fine
  exponent history, a coarse path has a unique lift with endpoint `(Q,0)` and initial exponent `(m,0)`,
  obtained by integrating the forgotten coordinate velocities backwards. It crosses
  exactly the same walls with the corresponding incoming tail, and every contributing
  fine path arises from this lifting. Prove finiteness of the contributing fine refinements of
  each coarse type at every cutoff. Retain zero projected shifts as coefficient
  changes, using §5.2's constant-source convention for zero initial direction.
- *theta_eq_monomialBrokenLineSum*: in a *MonomialPresentation* of §5.1's coefficients,
  §5.5's theta equals the sum of final monomial decorations obtained from the actual
  signed action components. The equality holds at every finite order, commutes with
  truncation and hence holds in the inverse limit.
- *principalTheta_eq_projectedMonomialSum*: §4.2's principal theta maps to the coarse sum by
  `z^{(m,n)}↦t^n z^m`. This is a weighted pushforward: several fine degree
  histories can combine into one coarse homogeneous decoration. Prove equality at
  each finite order, then in the inverse limit.
- *theta_presentationInvariant*: any two representatives of *Scat* `𝔇_in`
  have equal theta sections for §5.1's general coefficient action, hence equal
  *homogeneousComponent* coefficients and, in a monomial presentation, equal monomial
  sums at every common generic endpoint and order.
- Compatible coefficient regradings on a fixed base preserve weighted evaluation
  when component propagation intertwines and contributing refinements are finite.
  Across different bases also require the geometric lift and incoming-tail
  correspondence above.

*Route:* Equivalent charge-zero diagrams give the same probe labels; apply
*probeWall_eq_brokenLineSum*. Regrading groups finite fine histories using linearity
of the component maps; cylinder lifting supplies the geometric correspondence.

*Needs:* §§4.2–4.3 and §§5.1–5.5.
Sources: CPS Proposition 3.2, Proposition 4.4 and Lemmas 4.7, 4.9 in
2205.07753v2, PDF 11–18; N23 Proposition 7.6, Lemmas 7.7–7.8 and §7, PDF 96–98.

### 5.7 Global theta sections from finite local resolutions

Fix §5.2's base, incoming datum and coefficient system, with truncation-compatible
*FiniteClosedTypeFamily*s (§5.3) and *LocalResolutionCertificate*s (§5.4) at every
order. Sections are matching families on the regular chamber/facet coefficient
diagram of §0.8.

*Targets.*

- *globalThetaSection*: finite-order *weightedEvaluation* is independent of the general
  endpoint within each chamber and extends to a unique matching section
  `ϑ_{s,a,≤k}`. Across an ordinary wall it obeys signed wall transport; at a face
  `b` its values satisfy `ϑ_u=λ_u(ϑ_b)` and `ϑ_{u'}=λ_{u'}(ϑ_b)`.
  *globalTheta_transport* is this compatibility, together with §0.7/§5.4 transport
  along ordinary-wall paths; partial propagation is used on its admissible domain.
- The sections commute with truncation, defining `ϑ_{s,a}=lim_k ϑ_{s,a,≤k}`.
  They are linear in the incoming coefficient and natural under compatible coefficient
  maps, affine coordinate changes, restrictions retaining global incoming histories,
  and finite weighted refinements of path families.
- *affine_finiteClosedTypeFamily* and *affineLocalResolution* instantiate the theorem
  for §5.1 and identify its section with §5.5's *thetaSection*. A *MonomialPresentation*
  gives §5.6's monomial sum; for the principal regrading, apply
  *principalTheta_eq_projectedMonomialSum*.

*Route:* Along a generic endpoint path, proper closed families reduce changes to the
finitely many declared codimension-one events. Group types by local germs and use
§5.4's grafting and resolution identities; at terminal faces sum the certified lifts,
whose uniqueness follows from joint injectivity. Avoid the remaining strata by
endpoint perturbation. Compatibility of component maps and lifts gives truncation.

**Checks.**

- For the one-wall example of §5.5, restriction to `U={x<−1}` gives the
  section `z^p−z^{p+n}` although the wall misses `U`. The restricted path
  family retains the incoming tails and bends outside `U`. The empty full-space
  diagram with initial coefficient `z^p` has a different incoming problem and
  theta `z^p`.

*Needs:* §§0.7–0.8, 1.2–1.3, 1.5 and 5.2–5.6.
Sources for the finite-family and local-to-global arguments: GHS §3,
especially Proposition 3.16 and Theorem 3.19; CPS Lemmas 4.7 and 4.9.

## Layer 6: integral-affine covariance, descent and a worked example

### 6.1 Integral-affine covariance

Use §1.5's *integralAffineGroupoid*. A *DirectedAffineIso* consists of a global
*IntegralAffineEquiv* `f`, with tangent-lattice part `T:Λ≃Λ'`, a grading-lattice
isomorphism `S:Γ≃Γ'` with `T∘ρ=ρ'∘S`, and a graded Lie isomorphism `φ` carrying
`h_{n,m}` onto `h'_{Sn,m∘T⁻¹}`. It carries positive degrees to positive degrees and
has specified cofinal filtration moduli in both directions (§§0.3, 0.5, 0.7).
The sign of `det T` is unrestricted. Supports move by `f`, degree indices by `S`,
projected directions by `T`, normals by the dual inverse and labels by *completedMap*.
A *CoefficientIso* is an isomorphism of the chosen §0.7 representation diagrams and
§0.8 chamber/facet data over this map, preserving chamber gradings through the
specified exponent isomorphisms. For a graded algebra action this says
`ψ(A_q)=A'_{Sq}` and `ψ(x·a)=φ(x)·ψ(a)`. The case `Γ=Λ`, `ρ=id` and `δ'∘S=δ`
recovers the degree-preserving coordinate changes of §§3.1 and 5.1.

*Targets.*
- *mapAffineDiagram*: transport preserves incoming/outgoing walls, equivalence,
  consistency and path products, with identity, composition and inverse laws for
  both geometry and coefficients; on §2.1 complexes it is *image*. Restrictions
  transport wall germs and paths in their domains with the same product identity,
  using §1.5's unique affine extension on each connected overlap component.
- *theta_affineCovariance*: isomorphisms preserving cutoffs give bijections of
  evaluation fibers preserving weights and incoming data. Cofinal filtration
  comparisons commute with truncation and give `ψ(ϑ_{a,Q})=ϑ_{ψ(a),f(Q)}` in the
  completion. They transport *FiniteClosedTypeFamily*s and *LocalResolutionCertificate*s,
  hence the affine and global theta sections of §§5.5 and 5.7.

**Checks.**
- The swap `(x,y)↦(y,x)` of `ℤ²`, of determinant `−1`, sends `{x=0}` with normal
  `e_1*` to `{y=0}` with normal `e_2*`. The identity
  `⟨m∘T⁻¹,Tv⟩=⟨m,v⟩` preserves the crossing factor without a determinant sign.

*Needs:* §§0.5, 0.7–0.8, 1.1–1.2, 1.5, 2.1, 3.1–3.2 and 5.1–5.7;
`AffineEquiv`, `IsIntegralLattice.extend`, `realCharacter_comp`.

### 6.2 Descent of coefficient diagrams and transport

At each cutoff, a *DescentDatum* on §1.5's `(B,Δ)` consists of chartwise
§0.7 label/representation diagrams, §0.8 chamber/facet data and wall presentations,
with §6.1 coordinate identifications, label-diagram equivalences and intertwining
representation isomorphisms on each nonempty overlap component. They preserve face
maps and regular loci and satisfy identity, cocycle and truncation equations on
their overlaps, using §0.7's cofinal moduli and finite refinements when needed.
Local consistency means identity label transport on every contractible admissible
chart loop.

Let `Σ_k⊆B` be closed and contain `Δ` and the order-`k` wall boundaries and joints.
Descend the chamber/facet coefficients on `B∖Σ_k`; invertible transport is restricted
to faces with isomorphism generizations. In the fixed-model case a group `H` acts
compatibly on the tower `G≤k`, with chart-change lifts in `H` and transport group
`G≤k⋊H`, where `(g,α)(g',α')=(g·α(g'),αα')`.

*Targets.*
- *descendCoefficientDiagram*: construct the descended diagram and sheaf of matching
  sections, with restriction, chart pullback, gluing uniqueness, and identity and
  composition for maps of descent data. Prove independence, up to canonical
  isomorphism, of path subdivision, overlap refinement and atlas refinement.
- *descendTransport*: locally consistent transport descends to a functor on the
  fundamental path groupoid of the invertible locus in `B∖Σ_k`, recovering chart
  products. Prove concatenation, reversal, basepoint change and holonomy conjugation;
  trivial holonomy gives endpoint independence on each connected component. In the
  fixed-model case the target is `G≤k⋊H`, and a faithful action detects the lift and
  cocycle equations.
- Truncation-compatible data give compatible descended diagrams and transport on
  common regular loci, invariant under cofinal reindexing. When fixed-model tower
  transitions fix `H`, prove `lim_k(G≤k⋊H)≃(lim_k G≤k)⋊H`, respecting transport.
- Equivariant fixed-model coefficient actions and overlap isomorphisms satisfying
  the descent cocycle give coefficient local systems on the invertible locus,
  including §5.4's type, algebra and module instances. A prescribed degree `p` must be invariant; alternatively
  use the direct sum of modules, or disjoint union of types, over its monodromy orbit.
- *globalTheta_descent*: apply §5.7 to the descended diagram with a global incoming
  datum, *FiniteClosedTypeFamily* and *LocalResolutionCertificate*. Chart restrictions
  are weighted sums of the same global paths, with §6.1 overlap covariance. The
  section commutes with atlas refinement, compatible coefficient maps and truncation,
  and satisfies *globalTheta_transport* on the invertible locus.

*Needs:* §§0.7–0.8, 1.5, 2.1, 5.3–5.4, 5.7 and 6.1;
`ChartedSpace`, `StructureGroupoid`, `SemidirectProduct`, `TopCat.Sheaf` and §5.4's
*facetDescent*.

### 6.3 Worked example: the focus-focus slab and its theta basis

This required worked example applies the general slab, descent and theta constructions
to the standard focus-focus affine singularity (GS §2.2).

Use the nodal affine plane `B=ℝ²`, `Δ={(0,0)}`, with left and right chambers
`u<0` and `u>0`. The chart extensions near the slab `u=0` have transition the
identity on its lower overlap component and `T(u,v)=(u,v−u)` on its upper component.
These maps fix the slab and define the focus-focus affine structure on `B₀`.
The exponent lattice is `Γ=ℤ³`, with
`ρ(a,b,h)=(a,b)`, and monoid
`Q={(a,b,h):h≥0, h−a≥0}`. Write
`x=(-1,0,0)`, `y=(1,0,1)`, `w=(0,1,0)` and `t=(0,0,1)` for its monomial degrees;
`x+y=t` and `w` is invertible. The upper exponent transition is
`S(a,b,h)=(a,b−a,h)`, so `ρS=Tρ`; it preserves `Q` and the respective chamber
orders `ord₋(a,b,h)=h` and `ord₊(a,b,h)=h−a`.

For a commutative ring `K`, set `S_k=K[t]/(t^{k+1})`, `f=1+w` and `f'=1+w⁻¹`.
The finite coefficient diagram consists of

`R₋,k=S_k[x₁,y₁,w^{±1}]/(x₁y₁−t, y₁^{k+1})`,

`R₊,k=S_k[x₂,y₂,w^{±1}]/(x₂y₂−t, x₂^{k+1})`,

`B_i,k=S_k[x_i,y_i,w^{±1}]/(x_i y_i−t, x_i^{k+1}, y_i^{k+1})`,

and `D_k=B_2,k[f⁻¹]`, with the quotient maps `q₋:R₋,k→B_1,k` and
`q₊:R₊,k→B_2,k`. The overlap maps are
`h_II(x₁,y₁,w)=(x₂,y₂,w)` and
`h_III(x₁,y₁,w)=(w x₂,w⁻¹y₂,w)`.
On `D_k`, let `g_f(x₂,y₂,w)=(f x₂,f⁻¹y₂,w)` and define `g_f'` by the same formula
with `f'`. They are §4.4's weight-zero function automorphisms for the integer weight
`a` and the unit `f⁻¹`, respectively `(f')⁻¹`. Since `f=w f'`,

`g_f ∘ h_II = g_f' ∘ h_III : B_1,k → D_k`.

Put `α₋=(g_f∘h_II)∘q₋` and let `α₊` be `q₊` followed by localization. The slab
coefficient algebra is their limit `A_k=R₋,k ×_{D_k} R₊,k`, with its two projections.
In this limit define
`X=(x₁,f x₂)`, `Y=(f y₁,y₂)` and `W=(w,w)`.
The horizontal weight `a` descends to `A_k`; the projections are jointly injective.
On weights `a≤0` the left projection is injective, and on weights `a≥0` the right
projection is injective. The admissible lifts of incoming monomials are
`t^r x₁^d w^b ↦ t^r X^d W^b` from the left and
`t^r y₂^d w^b ↦ t^r Y^d W^b` from the right (`d≥1`, `r≥0`, `b∈ℤ`).
Tangential coefficients have the common lift `t^r w^b↦t^r W^b` for face matching.
These are §0.8's admissible lifts; propagation is the opposite projection followed
by its chamber homogeneous decomposition.
The chamber embeddings
`ι₋:R₋,k→S_k[x₁^{±1},w^{±1}]`, `y₁↦t x₁⁻¹`, and
`ι₊:R₊,k→S_k[y₂^{±1},w^{±1}]`, `x₂↦t y₂⁻¹`, are injective localizations.
Composing with the projections of `A_k` gives §4.4's slab maps for `q=t(1+w)`.

*Targets.*
- *focusFocusDatum*: construct the displayed atlas, exponent system, monoid algebras
  and chamber-order quotients, and the §0.7–0.8 coefficient diagram with its stated
  admissible lifts. Prove the overlap and reduction squares, injectivity assertions,
  and compatibility of lifts with both crossing descriptions. The maps
  `(ι₋,id_{A_k},ι₊)` form a *CoefficientDiagramMap* to §4.4's slab constructor,
  preserving lifts and homogeneous components and identifying the incoming
  broken-line families and decorations in the two presentations.
- *focusFocusAlgebra*: prove the `S_k`-algebra isomorphism
  `S_k[W^{±1},X,Y]/(XY−t(1+W)) ≃ A_k`, with the displayed generator images,
  compatible with `K→K'` and `k+1→k`. Construct the affine `S_k`-scheme `Spec(A_k)`
  and its reduction maps. The ring is free over `S_k` on
  `{W^b : b∈ℤ} ∪ {X^d W^b,Y^d W^b : d≥1,b∈ℤ}`, hence flat over `S_k`.
- *focusFocusBrokenLines*: for incoming `X^d W^b` from the left, `Y^d W^b` from
  the right (`d≥1`), and invariant `W^b` (`b∈ℤ`), construct a
  *FiniteClosedTypeFamily* and a *LocalResolutionCertificate*. Every
  nonconstant line has at most one slab crossing. For endpoint `Q=(u,v)` in the
  opposite chamber, the `j`-th branches, `0≤j≤d`, have decorations and crossing heights
  `binom(d,j)x₂^d w^{b+j}`, `s_j=v+(b+j)u/d` for `X`, and
  `binom(d,j)y₁^d w^{b+j}`, `s_j=v−(b+j)u/d` for `Y`. Discard zero decorations.
  For `X`, the lower crossing uses term `j` of `f^d`; the upper uses term `d−j`
  of `(f')^d` after `h_III`. In the incoming chamber each nonzero decoration has
  one unbent line. For `W^b`, use the vertical line when `b≠0` and its decoration is nonzero;
  for `b=0` use §5.2's constant-source section `ϑ_1=1`. The generic enumeration excludes
  `u=0` and `s_j=0`; construct their face and singular-degeneration data.
- *focusFocusTheta*: identify §5.7's sections for these incoming data with
  `X^d W^b`, `Y^d W^b` and `W^b` in `A_k` using the stated lifts. They form the
  displayed `S_k`-basis compatibly in `k`. In the inverse limit, coefficient families
  in `K[[t]]` are admitted exactly when only finitely many coefficients survive
  modulo `t^{k+1}` at each `k`.
- *focusFocusTheta_mul*: write `ϑ_{n,b}=X^{−n}W^b` for `n<0`, `ϑ_{0,b}=W^b`, and
  `ϑ_{n,b}=Y^nW^b` for `n>0`. For `r=(|n|+|m|−|n+m|)/2∈ℕ`, prove
  `ϑ_{n,b}ϑ_{m,c}=t^r Σ_{j=0}^r binom(r,j)ϑ_{n+m,b+c+j}`.
  Over `ℤ` its coefficients lie in the image of `ℕ[t]`; scalar extension gives
  the formula over `K`.

*Route:* Eliminate `t=x_i y_i`; regularity of `1+w` in `K[w^{±1}]` gives the
fiber-product normal forms and uniqueness of incoming lifts. For the `X` and `Y`
inputs, constant nonzero horizontal velocity makes the one-crossing families
exhaustive, with closed polyhedral charts cut out by the signs of `u` and `s_j`. At `s_j=0`, binomial
symmetry and the overlap identity equate the upper and lower local resolutions.
At `u=0`, use the admissible and common tangential lifts. Multiplication by `t^r`
and `K`-linearity extend these identities to every admissible homogeneous local germ,
proving the required component-map certificates. Apply §5.7; multiplication uses
`XY=t(1+W)`.

**Checks.**
- Over `K=ℤ` at `k=2`, `ϑ_{−1,0}ϑ_{1,0}=tϑ_{0,0}+tϑ_{0,1}`.
  At `Q=(1,1)`, incoming `X` and `X²` from the left have respectively two and
  three broken lines, with weights `1,1` and `1,2,1`.

*Needs:* §§0.7–0.8, 1.5, 4.4, 5.2–5.4, 5.7 and 6.1–6.2;
`AddMonoidAlgebra`, `Ideal.Quotient`, `Localization.Away`, `MvPolynomial`,
`CategoryTheory.Limits` and `AlgebraicGeometry.Spec`.
Sources: GS §2.3; GHS Definition 3.3, Proposition 3.5 and Lemma 3.7.

## Layer 7: wall positivity and positive theta coefficients

Positivity means membership in a polynomial or formal-series semiring over ℕ, for
specified commutative skew scattering inputs. It is asserted for one representative of
each consistent equivalence class, not for every representative, and not for KS, Hall or
quantum labels.

### 7.1 Static polynomial inputs and positive representatives

The input of this layer is an adapted §4.2 datum of any form, including degenerate and
zero forms, with positive integers `ℓ_i` at the unfrozen `i` and independent variables
`a_{i,s}`, `1≤s≤ℓ_i`. For a set `A` of coefficient variables, the positive coefficient
semiring is `ℕ[A]⊆ℤ[A]⊆ℚ[A]`. A function wall groups commuting homogeneous §3.2 ray walls with the
same support, the same chosen primitive coorientation and the same projected monomial
direction; its function is the product determined by their common logarithmic-derivation
action. Positivity refers to grouped wall functions in the realizations of §§4.1–4.2,
not to individual ray walls. Coefficient maps below are defined on coefficient monoids,
not on Laurent algebras, since the `a_{i,s}` are not units.

*Targets.*
- *AdaptedPolynomialInput*: the principal input over `ℚ[a_{i,s}][M°]⟦t_i⟧` with, at each
  unfrozen `i`, support `e_i⊥×(N_uf)_ℝ`, primitive normal `κ(e_i)ν_{e_i}` and grouped
  wall function `1+Σ_{s=1}^{ℓ_i}a_{i,s}(q^{e_i})^s`. *OrdinaryBinomialInput* has the
  walls `(e_i⊥,1+q^{e_i})` over `ℚ`.
- *IsPositive*: for a chosen subsemiring `Pos⊆B` of a §0.3 filtered ring, an element
  of `B̂` represented by an element of `Pos` at every order. For the coefficient
  algebra `B=ℚ[A][Q]`, take `Pos` to be the image of `ℕ[A][Q]`; with the monomial
  filtrations of §§4.1–4.2 this means monomial coefficients in `ℕ[A]`. Such elements
  form a subsemiring of `B̂` and are closed under natural powers.
- *FunctionWallGrouping*, *PositiveWallRepresentative*: the function-wall presentation
  of a directed diagram, finitely active at each order, with the path products of its
  ray presentation; a positive wall representative is a diagram with a grouping whose
  grouped wall functions are *IsPositive*.
- *BLMPolynomialInput*: the skew lattice and adapted basis of BLM §8.1 with
  `M=Hom(N,ℤ)`, the form `ω_B` of Convention 3, positive integers `ℓ_j` with `ℓ_j=1` at
  frozen `j`, `gcd(d_i)=1`, `w_i=ω_B(-,d_ie_i)/ℓ_i` primitive in `M`, BLM's injectivity
  of `N_uf∩N°→M`, `n↦ω_B(-,n)`, independent monoid variables `p_{i,s}`, and initial
  functions `f_i=1+∑_{s=1}^{ℓ_i}p_{i,s}z^{sw_i}` on `e_i⊥`.
- *finiteAlphabetLift*: for a lattice `M`, finitely many cooriented affine walls in
  `M_ℝ` and a finite family `E` of wall terms `c_αz^{m_α}`, `m_α∈M` tangent to the wall
  of `α`, the directed input over `L_E=M⊕ℤ^E` with degrees `v_α=(m_α,e_α)`, saturated
  positive monoid `P_E=⊕_αℕv_α`, total degree `δ_E(v_α)=1`, cylinder walls whose normals
  act on the first coordinate, and wall functions `1+Σ_αc_αz^{v_α}`. For
  *PositiveDegrees* `(L,P,δ)`, cylinder walls over the same walls through a surjection
  `π:L→M`, and an additive `τ:L_E→L` with `π∘τ=pr_M` and `τ(v_α)=n_α∈P∖{0}`, the pair
  `τ`, `ν∘pr_M↦ν∘π` is a §4.1 *TropicalPairing* of modulus `λ(k)=k`; it maps positive
  graph algebras and §5.1 shifted modules, and carries supports, normal pairings, path
  products and outgoing completions to those of the input with terms `c_αz^{n_α}`, image
  rays reindexed by their ambient primitive generators as in §4.1 and grouped.
  The target ray presentation is obtained by decomposing each logarithm into
  supported rays; every term retains its degree in `P`.
  A degree `Σb_αv_α` with `δ(Σb_αn_α)≤k+1` and `b_α>0` for some `α` with
  `δ(n_α)≥2` has `δ_E≤k`. For *BLMPolynomialInput*, `E={(i,s)}`, `m_{i,s}=sw_i` on
  `e_i⊥` and `c_{i,s}=1`, `z^{v_{i,s}}` standing for `p_{i,s}z^{sw_i}` in BLM's `M⊕ℕ^E`.
- *polynomialInput_principalComparison*: a *BLMPolynomialInput* with nonempty unfrozen
  part has a normalized principal datum, an adapted §4.2 datum with `N` as `N°`, dual
  coefficient lattice `M`, form a positive multiple of `−ω_B` and adapted basis
  `ε_j∈ℚ_{>0}e_j` with `p₁*(ε_i)=w_i` at unfrozen `i`. The lift
  `T(m,b)=(m,Σ_{i,s}sb_{i,s}ε_i)` with twist `χ(m,b)=a^b`, so `p_{i,s}↦a_{i,s}t_i^s`, is
  §4.1's *tropicalVertexGroup.coeffMap* on the coefficient monoids `Q=M⊕ℕ^E⊇P_E` and
  `Q'=M⊕ℕ^{I_uf}`. It preserves normal pairings, satisfies
  `δ_E(b)≤δ_pr(Tb)≤ℓ_max δ_E(b)` on `P_E`, `ℓ_max=max({1}∪{ℓ_i : i∈I_uf})`, and induces
  the filtered algebra map `ℚ[[Q]]→ℚ[a_{i,s}][[Q']]` into the principal realization,
  sending cylinder supports to principal cylinders and grouped wall functions to the
  §4.2 wall functions of the `ε_i`.
- *principalBLMExtension*: every *AdaptedPolynomialInput* has a *BLMPolynomialInput*
  with the same unfrozen indices and `ℓ_i`, on the space lattice `M°⊕ℤ^u` (`ℤ^u≅N_uf` by
  the unfrozen basis), whose lattice `N^B` has the basis `a_j=d_je_j` and frozen `c_i`,
  one per unfrozen `i`. Its form is a positive multiple of `−{,}` on the `a_j`, pairs
  the `c_i` with the unfrozen `a_j` by a positive diagonal block and vanishes on all
  other pairs involving a `c_i`. `N°→N^B`, `d_je_j↦a_j`, sends the original normals to
  the initial primitive normals, and `w_i=r(e_i)`.
- *principalBLMExtension_principalComparison*: the identification `M°⊕ℤ^u≅L_pr`,
  `(m,(b_i))↦(m,Σ_ib_ie_i)`, with twist `a^b` on `ℕ^E`, is §4.1's
  *tropicalVertexGroup.coeffMap* on the coefficient monoids `Q=M°⊕ℕ^u⊕ℕ^E` and
  `Q'=M°⊕P_N`, inducing the filtered algebra map `ℚ[[Q]]→ℚ[a_{i,s}][[Q']]` into the
  principal realization of the original datum. It preserves grouped wall functions,
  wall actions, path products and incoming and outgoing supports, and satisfies
  `δ_E≤δ_pr≤ℓ_max δ_E` on active graph degrees; image rays are reindexed by their
  ambient primitive generators using §0.1 and grouped.

*Route:* Normalization rescales the adapted basis and the form until `p₁*(ε_i)=w_i`. In
the extension, the diagonal block of the frozen dual directions `c_i` makes
`N_uf∩N°→M` injective and each `w_i` primitive, also for the zero form; a common
rescaling gives BLM's integrality conditions.

**Checks.**
- For the zero form with `N_uf≠0`, `N_uf∩N°→M` is not injective, and its
  *principalBLMExtension* is a *BLMPolynomialInput*.
- The terms `p_1x`, `p_2x²` of `1+p_1x+p_2x²` lie on different rays of `P_E`.
  The factor `f_u` on the ray of `u=p_1p_2x³` satisfies `[u]f_u=−1`.

*Needs:* §0.3, §§0.5–0.6, §3.2, §§4.1–4.2 and §5.1; `MvPolynomial`, `AddMonoidAlgebra`.
Sources: BLM §8.1, PDF 50–53, §9.2 (Step 3) and Corollary 9.8; N23 §1.

### 7.2 Ordinary binomial wall positivity

In the completed skew group of §4.2, with bracket `[X_n,X_{n'}]={n',n}X_{n+n'}`, put
`Ψ[n]=exp(Σ_{j≥1}(-1)^{j+1}X_{jn}/j²)`; products follow Convention 3. A sequence
`n_1,…,n_k` is ordered if `{n_i,n_{i+1}}≥0` for all `i` and antiordered if
`{n_i,n_{i+1}}≤0`; collinear factors commute and are grouped or kept in a fixed tie
order. A normalized positive factor is `Ψ[tn]^{sκ(tn)}` with `n` primitive and integers
`s,t>0`; its exponent `sκ(tn)=sκ(n)/t` (Convention 6) is rational.

*Targets.*
- *dilogElement*: `Ψ[n]` as a compatible family of levelwise exponentials; the wall
  function of a normalized positive factor is `(1+q^{tn})^s`.
- *positiveOrdering_rankTwo*: for degrees in a rank-two sublattice and any restriction
  of the form, including zero, a finite antiordered product of normalized positive
  factors has at every finite order an ordered factorization by normalized positive
  factors, compatible under truncation and assembling to all orders.
- *ordinaryWall_positiveRepresentative*: every finite-rank *OrdinaryBinomialInput*, for
  every form including degenerate and zero forms, has an outgoing consistent positive
  wall representative of §4.2's completion with grouped wall functions products of
  `(1+q^{tn})^s`, from the rank-two factorization at its joints.

*Route:* If the form vanishes on the rank-two sublattice, all factors commute.
Otherwise, in coordinates `(a,b)` with `{e_1,e_2}>0`, `{n,n'}=(ab'−a'b){e_1,e_2}`, so
ordered means weakly increasing slope, and N23's exchange of adjacent antiordered pairs
terminates at each finite order.

**Checks.**
- With `{e_1,e_2}=1` and `d_1=d_2=1`, `Ψ[e_2]Ψ[e_1]=Ψ[e_1]Ψ[e_1+e_2]Ψ[e_2]`, with
  antiordered left side and ordered right side.

*Needs:* §§1.1–1.2, §§2.1–2.4, §4.2 and §7.1. Sources: N23 Theorem 5.2, Proposition 5.4
and §§5.2–5.5, PDF 53–65 (N23's ordering is the reverse of ours); GHKK Theorem 1.13 and
Appendix C.3, PDF 22, 129–134.

### 7.3 Dyck gradings and the rank-two polynomial formula

The maximal Dyck path of a lattice rectangle `(a,b)` runs from `(0,0)` to `(a,b)` with
`a` horizontal and `b` vertical unit edges, weakly below the diagonal and closest to it;
it is the `DyckWord` `(01)^a` for `a=b`, `V^b` for `a=0` and `H^a` for `b=0`, and only
`(0,0)` gives the empty path, with grading set `{0}` and weight `1`. Subpaths include
both endpoint edges and wrap cyclically at the final vertex. Gradings `γ_H,γ_V` of the
horizontal and vertical edges are bounded and nonnegative; `p=Σγ_V`, `q=Σγ_H`. On a
rectangle `(d_1,d_2)`, `P_1` is the initial polynomial of the vertical edges and `P_2`
that of the horizontal edges, by the rank-two monomial dictionary, and weights are
products of their coefficients selected by the edge grades. Put `π_{r,s}(P)=[z^s]P(z)^r`
for `r≥0`, `π_{r,0}(P)=1` for `r<0` and `π_{r,s}(P)=0` for `r<0<s`.

For `t≥0`, `B_+^t(p,q)` is the weighted sum of the §5.2 broken lines for §5.1's `R[L]`
action of §4.1 with Laurent initial exponent `(−d_1,−d_2)`, final exponent
`(p−d_1,q−d_2)` and endpoint `Q_+` in the open first quadrant, in the chamber at order
`p+q` bounded by the positive first coordinate axis (the wall of `P_1`), whose bend on
that axis takes the term `x^t` (`t=0`: no bend there); `B_+=B_+^0`. Dually, `B_-^t` and
`B_-` use `Q_-` in the chamber bounded by the positive second coordinate axis and the
term `y^t` there (BLM §5.5, before Lemma 5.31).

*Targets.*
- *Compatible*, *Shadowed*, *Tight*: a grading is compatible if for every horizontal `h`
  and vertical `v` there is a proper initial subpath `he` of `hv` with
  `#V(he)=Σ_{h'∈H(he)}γ_H(h')` or a proper final subpath `ev` of `hv` with
  `#H(ev)=Σ_{v'∈V(ev)}γ_V(v')`, one-edge subpaths included. The local shadow of a
  horizontal edge `e` is the set of vertical edges of the shortest subpath `ee'` whose
  vertical edge count equals the horizontal grade sum on it (RUP Definition 4.5), all
  vertical edges if there is none and empty if `γ_H(e)=0`, and dually; the total
  shadows, the unions of local shadows, have `min(d_2,q)` and `min(d_1,p)` edges. A
  compatible grading is shadowed if its nonzero horizontal support lies in the total
  vertical shadow or its nonzero vertical support lies in the total horizontal shadow
  (BLM Definition 5.3), and tight if it is shadowed with `p≤d_1`, `q≤d_2` and
  `pd_2−qd_1=±gcd(p,q)` (BLM Definition 5.4).
- *Cplus*, *Cminus*: `C_+(p,q)` is the weight sum of the compatible gradings with totals
  `(p,q)` whose nonzero vertical support lies in the total horizontal shadow, and
  `C_-(p,q)` the dual sum. They satisfy
  \[
  \sum_{s=0}^{p}\pi_{d_2-q,s}(P_1)\,C_+(p-s,q)
  =\sum_{s=0}^{q}\pi_{d_1-p,s}(P_2)\,C_-(p,q-s) \tag{R}
  \]
  and (V): off `(0,0)`, `C_+(p,q)=0` for `d_1q≤d_2p` and `C_-(p,q)=0` for `d_1q≥d_2p`.
  With `C_±(0,0)=1`, (R) and (V) determine `C_±` by induction on `p+q`.
- `B_±` satisfy (R), (V) and the initial values, by deleting the last bend on the
  positive coordinate axis with §5.5's endpoint transport for §7.1's lift; hence
  `B_±=C_±`.
- *OneBending*: every broken line bending only on the coordinate axes and the rays
  `ℝ_{≤0}(a',b')`, `a',b'>0`, from initial exponent `(−d_1,−d_2)` to final exponent
  `(ka−d_1,kb−d_2)`, at any endpoint and with no bend on a positive coordinate axis, has
  exactly one bend, on `ℝ_{≤0}(a,b)`. It implies BLM Definition 5.9.
- *rankTwoWall_coefficientFormula*: for coprime positive `(a,b)`, `k≥1` and any
  `(d_1,d_2)` with `ad_2−bd_1=±1`, `d_1≥ka` and `d_2≥kb`, the degree-`k(a,b)`
  coefficient of the wall function on `ℝ_{≤0}(a,b)` is the weight sum of the tight
  gradings of the rectangle `(d_1,d_2)` with `p=ka`, `q=kb` (BLM Theorem 5.17 and
  Remark 5.20).
- *rankTwoWall_powerFormula*: on a one-bending rectangle `(d_1,d_2)` with `d_1≥ka`,
  `d_2≥kb` and `m=|ad_2−bd_1|`, the degree-`k(a,b)` coefficient of the `m`-th power of
  the wall function in primitive direction `(a,b)` is the shadowed-grading sum of BLM
  Theorem 5.17.
- For coprime `a,b>0`, `k>0`, `Δ=bd_1−ad_2` and `m=|Δ|`, `Δ>0 ∧ d_2≥mkb` or
  `Δ<0 ∧ d_1≥mka` implies one-bending (BLM Corollary 5.14(2)).
- For `Δ≠0`, if no `(a_1,b_1)` with `a_1≤ka`, `b_1≤kb` has `a_1/b_1` strictly between
  `a/b` and `d_1/d_2`, then one-bending holds.

*Route:* For `Δ>0`, conservation of the position–velocity determinant orders the bends
by decreasing slope, so a second bend gives a cumulative increment `(a_1,b_1)` in that
lattice gap, and under `d_2≥mkb` the determinant `a_1b−ab_1` would be an integer
strictly between `0` and `1`; for `Δ<0` interchange the coordinates. In the power
formula the shadowed-grading sum is `C_+(ka,kb)` for `bd_1>ad_2` (dually `C_-`) by (V);
for `d_1>ka`, `d_2>kb` the only line counted by `B_+(ka,kb)` is the one-bend line. For
`d_2=kb` the one-bend line ends in the open fourth quadrant, and §5.5's transport to
`Q_+` identifies its weight with `B_+(ka,kb)`; `d_1=ka` is dual.

**Checks.**
- For `P_1=1+ax+bx²` and `P_2=1+cy+dy²` the diagonal wall function in `u=xy` is
  `f(u)=1+ac·u+(2bd+bc²+a²d)u²+5abcd·u³+…`, and `[u³]f²=14abcd+2abc³+2a³cd`.
- On the rectangle `(5,3)`, with `Δ=2` and `d_2=3<6`, the shadowed gradings with total
  grading `(3,3)` sum to `16abcd+2abc³+2a³cd`; the excess `2abcd` is the two-bend broken
  line with velocities `(5,3)`, `(2,1)`, `(2,0)` bending on the negative `y`-axis, at
  the gap point `(3,2)`, which one-bending excludes.
- The rectangle `(6,4)` fails `d_2≥mkb`, is one-bending by the lattice test, and its
  shadowed-grading sum is `[u³]f²`.

*Needs:* §§3.2–3.4, §4.1, §§5.1–5.5 and §7.1; `DyckWord`. Sources: RUP Definitions 4.1
and 4.5; BLM Definitions 3.14, 5.1, 5.3, 5.4 and 5.9, Lemma 5.13, Corollary 5.14,
Theorem 5.17, Remark 5.20, Lemmas 5.23 (V), 5.27 (R) and 5.31–5.33, Propositions 5.28
(base case) and 5.34, and §5.5, PDF 23–25, 33–40.

### 7.4 Lattice change and affine rank-two perturbation

A *RankTwoPolynomialInput* (BLM Theorem 9.9) is *PositiveDegrees* `(L,P,δ)` with a
surjection `π:L→M` onto a rank-two lattice and countably many incoming affine lines in
`M_ℝ` with cylinder supports in `L_ℝ`. Each line `j` has a chosen nonzero primitive tangent
direction `m_j∈M`, primitive coorientation `ν∈M*` with `ν(m_j)=0`, and a polynomial wall
function `f=1+Σ_nc_{j,n}z^n` with `n∈P∖{0}` and `π(n)=km_j` for some integer `k>0` for every
nonconstant term, acting by `z^q↦z^qf^{⟨ν,π(q)⟩}`. Its coefficients are independent
variables `c_{j,n}` indexed by the line `j` and the term degree `n`, in `R=ℚ[c_{j,n}]`;
finitely many lines are nontrivial at each order of `δ`, and `(ν,f)`, `(−ν,f)` present
the same wall by Convention 3. Rank-two skew data with nonzero form enter through
`π:L_pr→M°`; a zero form gives commuting initial walls. Each finite-order restriction
stays in this class under *finiteAlphabetLift*, with its projected directions unchanged.
Its directed ray presentation splits `log f` into components `(log f)_w` on
the supported primitive rays of `L`, with labels
`exp((log f)_w∂_{ν∘π})`. Every logarithmic degree lies in `P`; the labels
commute and only finitely many are active at each order. This presentation supplies
the input for §§3.3–3.4, applied compatibly to the finite-order restrictions.

*Targets.*
- *rankTwo_latticeChange*: let primitive independent `m_1,m_2∈M` span `M₀` of index
  `ℓ`, `N=M*⊆N₀=M₀*`, and `m°=pm_1+qm_2=r·m` with `(p,q)` coprime positive and `m`
  primitive in `M`. Then `ℓ=r·ind(m°)` for `ind(m°)=[m°⊥∩N₀ : m°⊥∩N]`, by evaluation at
  `m°`, and the primitive normal of `ℝm°` in `N` is `ind(m°)` times that in `N₀`.
  Through §4.1's finite-index pairings, with equal path products, the completion of the
  lines `ℝm_i` with functions `1+Σ_kp_{i,k}x^{km_i}` over `M` has on `ℝ_{≤0}m°` the
  `r`-th power of the wall function on that ray of their completion over `ℓ^{-1}M₀`,
  with basis `ℓ^{-1}m_1,ℓ^{-1}m_2` (BLM Theorem 9.5).
- *affinePerturbation_comparison*: for a finite-order rank-two input with affine
  incoming lines, generic translations of the lines, with finitely many translations and
  intersections at each order, give compatible consistent completions. Their collapse to
  the original centres, replacing translated pieces by their limiting conical supports
  and combining commuting coincident labels, is consistent, has the original incoming
  data and represents the original class for all translations; at each original joint
  the local diagram, recentred, conically completed and translated back, is the
  correction there.
- *rankTwoPolynomial_positiveRepresentative*: every *RankTwoPolynomialInput* has
  compatible finite-order representatives of its completion whose grouped wall
  functions have coefficients in `ℕ[c_{j,n}]`.

*Route:* Far from the centres the collapse and the perturbed completion have the same
crossings up to commuting coincident labels, and §3.4's uniqueness gives the class.
Induct on the order (BLM Theorem 9.9): recentre and perturb so that at most two lines
nontrivial at order one meet at each joint. Terms involving a third line have smaller
lifted order by the degree bound of *finiteAlphabetLift*. For two lines, the
substitution `p_{i,k}x^{km_i}↦Σ_{π(n)=km_i}c_{i,n}z^n` is a filtered positive map
carrying the two-line completion to that of the input (BLM Corollary 9.8); the lattice
change reduces to a basis, where *rankTwoWall_coefficientFormula* gives positivity.

**Checks.**
- For `L=M=ℤ²`, `π=id`, `P=2ℕe_1+ℕe_2` and `δ(a,b)=a+b`, the
  horizontal incoming line with function `1+c z^{2e_1}` is indexed by the
  supported primitive ray `e_1`, with logarithm supported on `2ℕ_{>0}e_1`.
  Its single-wall diagram is its outgoing completion and is a positive representative.
- For `m_1=(1,0)`, `m_2=(1,2)` (`ℓ=2`) and `m°=(2,2)=2·(1,1)`: `r=2`, `ind(m°)=1`, outer
  power `2`.
- BLM Example 5.21 has the wall function `Σ_{k≥0}(k+1)x^{2k}y^{2k}=(1−x²y²)^{-2}`,
  positive and not a polynomial.

*Needs:* §§1.1–1.3, §§3.2–3.4, §4.1, §7.1 and §7.3. Sources: BLM Definition 2.1,
Example 5.21, Definition 9.3, Theorem 9.5 and Corollary 9.8, PDF 64–66;
Theorem 9.9, PDF 66–68.

### 7.5 All-rank positivity at joints

*Targets.*
- *polynomialWall_positiveRepresentative*: every *BLMPolynomialInput* has finite-order
  consistent outgoing representatives, compatible under truncation after suitable common
  refinements, whose grouped wall functions have coefficients in `ℕ[p_{i,s}]`. Their
  inverse limit represents the unique outgoing completion. The principal comparison of
  §7.1 identifies this class with the corresponding principal completion.

*Route:* Choose at each order a finite subdivision whose joints have either all incident
degree directions tangent or all transverse. The former need no correction; apply §7.4
in the transverse rank-two quotient for the latter: each incident projected direction
is nonzero, and the terms of each grouped wall project to its positive ray. Carry
positivity, consistency, swept outgoing supports and at most one outgoing facet per
direction after grouping at transverse joints through the induction. Subdivide base
faces before sweeping.

*Needs:* §§1.1–1.2, §§3.3–3.4, §4.2 and §§7.1, 7.3–7.4. Sources: BLM Theorem 8.11,
Definition 9.10, Lemma 9.14 and §9.3.

### 7.6 Positive specialization and intrinsic positivity

A positive specialization pairs a semiring map of chosen positive subsemirings with a
ring map filtered along a monotone modulus `λ`, `f(F^{λ(k)+1})⊆G^{k+1}` as in §0.3, and
its §0.3 completion map, which commutes with the canonical maps into the completions.
The carrier is defined for arbitrary associative rings; for scattering and theta
comparisons the rings are the commutative `ℚ`-algebra models above and the maps
intertwine their actions.

*Targets.*
- *PositiveSpecialization*: the structure above, with identity and composition laws; it
  preserves *IsPositive* (*map_isPositive*).
- Positive specializations along §4.1's *tropicalVertexGroup.map* or
  *tropicalVertexGroup.coeffMap* preserve represented path products. On a fixed
  lattice they preserve outgoing completions and positive wall representatives
  provided the normal map preserves the chosen primitive coorientation and
  `f_target=φ(f_source)`, or its specified nonnegative integer outer power with
  the normal-scaling equation. The §7.1 comparisons establish these identities.
  With the same degree data, §5.5's *theta_coeffMap* preserves theta positivity.
- *adaptedPolynomialWall_positiveRepresentative*: for every adapted §4.2 datum,
  including degenerate and zero forms, and positive integers `ℓ_i` at unfrozen `i`, the
  consistent outgoing completion of its *AdaptedPolynomialInput* on `L_{pr,ℝ}` has a
  representative whose grouped wall functions have coefficients in `ℕ[a_{i,s}]`.
- For a semiring map `φ` from `ℕ[a_{i,s}]` to the positive subsemiring of a commutative
  `ℚ`-algebra model, applied coefficientwise and filtered `t`-adically, the image of
  that representative is a positive representative of the completion with initial
  functions `1+Σ_sφ(a_{i,s})(q^{e_i})^s`. Instances are the reciprocal identification
  `a_{i,s}=a_{i,ℓ_i−s}`, `a_{i,ℓ_i}=1`, and *OrdinaryBinomialInput* by `a_{i,1}↦1` for
  `ℓ_i=1`.

*Route:* Apply §7.5 to §7.1's *principalBLMExtension* and transport its representative
by *principalBLMExtension_principalComparison*; image rays are regrouped by their
primitive generators, and §3.4's *outgoingCompletion_unique* identifies the class.

**Checks.**
- With the `t`-adic filtration, `Σ_ja^jt^j` specializes at `a=1` to `Σ_jt^j`; when `a`
  is the only filtration variable, `Σ_ja^j` has no filtered specialization at `a=1`.
- For `P=ℕe_1⊆ℤ²` and `ρ=id`, the pairing `T=id`, `S(e_2*)=−e_2*`
  intertwines the zero action on `R[[P]]` but inverts a formal wall label. At the
  fixed coorientation `e_2*`, the function `1+x` becomes `(1+x)⁻¹`.

*Needs:* §0.3, §§0.5–0.6, §3.4, §§4.1–4.2, §5.5, §7.1 and §7.5.

### 7.7 Positive formal theta coefficients

The input is a positive wall representative of §7.2, §7.5 or §7.6 and a positive initial
monomial.

*Targets.*
- *positiveDecoratedEvaluation*: choose truncation-compatible additive submonoids
  in §5.2's chamber homogeneous pieces and face modules. If admissible component
  maps preserve them, finite weighted sums with positive incoming coefficient lie
  in them. When terminal certificate lifts also preserve them, so do the face values
  of *globalThetaSection*. Compatible coefficient maps and finite weighted-history
  comparisons preserving these submonoids preserve both conclusions.
- *theta_coefficients_nonnegative*: §5.5's formal theta series is a
  *PositiveThetaSeries*: in §5.6's standard principal monomial presentation, every
  *homogeneousComponent* of *ShiftedCoefficients p* is `c·z^{p+n}` with `c∈ℕ[A]`,
  independent of the diagram representative. Under *principalProjectionComparison* and §5.6's finite
  weighted cylinder comparison it is §5.7's positive section for the projected
  principal coefficients, including coefficient degrees of zero spatial direction.

*Route:* At each finite order a theta coefficient is a finite sum of branch weights over
§5.3's evaluation fibre. A bend on a wall of degree `n` of a line with exponent `m`
takes a term of `f^{|⟨κ(n)n,m⟩|}`, the exponent of §5.6's
*monomial_exponent_dictionary*, nonnegative for either coorientation and crossing
direction and zero at tangency, where no bend occurs. Each branch weight is thus
positive; pass to the limit coefficientwise.

*Needs:* §§0.8, 4.4, 5.2–5.7, §7.1 and one of
*ordinaryWall_positiveRepresentative* (§7.2),
*polynomialWall_positiveRepresentative* (§7.5) or
*adaptedPolynomialWall_positiveRepresentative* (§7.6).

## Completion criteria

A layer is complete when its stated constructions, basic theory, comparison theorems,
worked examples and Checks are proved in Lean in the stated generality. General
components are usable independently of their scattering applications, and the
finite-order systems establish the all-order statements.

## References

- **PET:** Petracci, *Universal representations of Lie algebras by coderivations*,
  §8, Hypothesis 8.1 and Theorems 8.1–8.2,
  [math/0303020v1](https://arxiv.org/abs/math/0303020v1), for symmetrization PBW
  over commutative `ℚ`-algebras without a freeness hypothesis.
- **KS:** Kontsevich–Soibelman, *Wall-crossing structures in Donaldson–Thomas
  invariants, integrable systems and Mirror Symmetry*, §2.1,
  [1303.3253v4](https://arxiv.org/abs/1303.3253v4).
- **BRI:** Bridgeland, *Scattering diagrams, Hall algebras and stability conditions*,
  §§2–3, [1603.00416v4](https://arxiv.org/abs/1603.00416v4).
- **MAN:** Mandel, *Scattering diagrams, theta functions, and refined tropical
  curve counts*, §2 and §3.3.3,
  [1503.06183v5](https://arxiv.org/abs/1503.06183v5).
- **LMY:** Leung–Ma–Young, *Refined scattering diagrams and theta functions from
  asymptotic analysis of Maurer–Cartan equations*, Definitions 1.2–1.3,
  Theorem 3.12, Proposition 3.14 and Lemma 3.19,
  [1902.05765v2](https://arxiv.org/abs/1902.05765v2).
- **GS:** Gross–Siebert, *An Invitation to Toric Degenerations*, §§2.2–2.4,
  [0808.2749v2](https://arxiv.org/abs/0808.2749v2).
- **GHS:** Gross–Hacking–Siebert, *Theta functions on varieties with effective
  anti-canonical class*, §3 and Appendix A,
  [1601.07081v4](https://arxiv.org/abs/1601.07081v4).
- **GHKK:** Gross–Hacking–Keel–Kontsevich, *Canonical bases for cluster algebras*,
  §§1–3 and Appendices B–C,
  [1411.1394v2](https://arxiv.org/abs/1411.1394v2).
- **CPS:** Carl–Pumperla–Siebert, *A tropical view on Landau–Ginzburg models*,
  §§3–4, [2205.07753v2](https://arxiv.org/abs/2205.07753v2).
- **N23:** Nakanishi, *Cluster Algebras and Scattering Diagrams, Part III*,
  §§1–3, §5 and §7, [2111.00800v6](https://arxiv.org/abs/2111.00800v6).
- **NQ:** Nakanishi, *Pentagon relation in quantum cluster scattering diagrams*,
  §2.3, [2202.01588v7](https://arxiv.org/abs/2202.01588v7).
- **BLM:** Burcroff–Lee–Mou, *Positivity of generalized cluster scattering diagrams*,
  §§3, 5.5, 8–9, [2503.03719v1](https://arxiv.org/abs/2503.03719v1).
- **RUP:** Rupel, *Greedy bases in rank 2 generalized cluster algebras*,
  §§2 and 4, [1309.2567v1](https://arxiv.org/abs/1309.2567v1), for finite grading
  combinatorics.
- **Curry:** *Dualities between Cellular Sheaves and Cosheaves*,
  [1607.06942v1](https://arxiv.org/abs/1607.06942v1), for cellular sheaves.
