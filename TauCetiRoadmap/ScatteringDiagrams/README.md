# Roadmap: scattering diagrams, wall crossing and theta functions

This roadmap develops theorems on graded completions, Baker–Campbell–Hausdorff
(BCH) groups, coefficient correspondences, polyhedral geometry and gluing of sections.
They yield scattering-diagram reconstruction, consistent outgoing completions and
theta functions on vector spaces and singular integral-affine bases. Applications
include the focus-focus example and positivity for skew-symmetric polynomial inputs.

| Layer | Title | What it delivers | Depends on |
|---|---|---|---|
| [0](#layer-0-positive-gradings-completions-and-actions) | Positive gradings, completions and actions | the group of wall labels (the completed BCH group of a positively graded Lie algebra), its PBW description by group-like elements, and the algebras on which labels act | Mathlib, Tau Ceti |
| [1](#layer-1-polyhedral-geometry-and-paths) | Polyhedral geometry and paths | rational polyhedral complexes, generic paths and their homotopies, and integral-affine manifolds with singularities | Mathlib, Tau Ceti; 0 for §1.5 |
| [2](#layer-2-general-scattering-diagrams) | General scattering diagrams | path products and consistency; the Kontsevich–Soibelman reconstruction of consistent diagrams from group elements | 0, 1 |
| [3](#layer-3-directed-scattering-and-completion) | Directed scattering and completion | existence and uniqueness of the consistent completion of initial walls, including degrees whose geometric direction is zero | 0–2 |
| [4](#layer-4-realizations-and-specializations) | Realizations and specializations | wall crossing on commutative, quantum and slab algebras, and the comparison of the conical and directed descriptions | 0–3 |
| [5](#layer-5-broken-lines-general-position-and-theta-transport) | Broken lines, general position and theta transport | broken lines, theta functions, their transport across walls, and global theta sections | 0–4 |
| [6](#layer-6-integral-affine-covariance-descent-and-a-worked-example) | Integral-affine covariance, descent and a worked example | compatibility with integral-affine coordinate changes, gluing over charts, and the focus-focus example | 0–5 |
| [7](#layer-7-wall-positivity-and-positive-theta-coefficients) | Wall positivity and positive theta coefficients | positivity of wall functions and theta coefficients for skew-symmetric polynomial inputs | 0–5 |

## Scope and ownership

**Out of scope.** No target of this roadmap constructs or uses: motivic Hall
algebras, stability conditions and stacks, Hall integration
maps and Donaldson–Thomas invariants;
quantum positivity and canonical-basis comparisons; enumerative constructions;
general scheme reconstruction or mirror gluing from arbitrary singular affine input;
seeds, mutation, cluster monomials, `c`- and `g`-vectors and the comparison of theta
functions with cluster variables. The skew-form inputs of Layer 7 are defined
without reference to cluster objects.

**Adjacent roadmaps.** The
[AnalyticToricGeometry roadmap](../../Completed/AnalyticToricGeometry/README.md)
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
for example its Lie algebra, filtration, group theory and convex geometry modules;
scattering-specific carriers belong in
`TauCeti/Geometry/ScatteringDiagram/`.

## Conventions and supplier contracts

1. A lattice is a finite free `ℤ`-module. Every real vector space is a
   finite-dimensional real normed space `V` with an integral lattice map
   `i : L → V` satisfying `IsIntegralLattice`. In the Kontsevich–Soibelman (KS)
   diagrams of Layer 2 the grading lattice is `N`, and walls lie in a model `V` of
   `Hom_ℤ(N,ℝ)` with a bijective evaluation map. The directed diagrams of Layer 3
   have a degree lattice `Γ`, a tangent lattice `Λ`, and an additive
   `ρ : Γ → Λ`, with `V ≅ Λ ⊗_ℤ ℝ` and normals in `Λ* = Module.Dual ℤ Λ`; their
   positive monoid and cutoff degree live in `Γ`. In the identity-projection case
   `Γ=Λ` and `ρ=id`, both lattices are written `L`.
2. Scalar hypotheses are stated in each construction. Gradings, Lie maps and actions
   retain their `R`-linear structures; homogeneous pieces are arbitrary modules.
   Ring filtrations and completions allow associative rings, and coefficient algebras
   allow noncommutative multiplication. A derivation action is an `R`-linear Lie module
   action satisfying the Leibniz rule. BCH groups and exponential actions use a
   commutative `ℚ`-algebra `R`; universal BCH polynomials are evaluated over `ℚ` after
   scalar restriction. Coefficient diagrams and finite path sums admit semiring
   modules; function walls and the focus-focus algebra use commutative rings.
   Rational lattice data are independent of the coefficient ring.
3. A truncation of order `k` retains degrees at most `k`; `F^a` denotes terms of
   degree at least `a`, and the truncation is the quotient by `F^{k+1}`. Products
   act on the left: the first crossing is the rightmost factor, and §0.5's ordered
   product places the smallest index leftmost. A wall with coorientation `ν` and
   label `θ` contributes `θ^{-sgn⟨ν,γ'⟩}`, where `γ'` is the derivative of the path `γ`
   at the crossing.
4. Italicized names are suggested Lean declaration names. The
   [Lean prototype](Suggested.lean) illustrates selected interfaces; this README
   is the definitive specification.

Use Mathlib and Tau Ceti suppliers with their existing meanings and public interfaces;
each section lists its dependencies under *Needs*.

## Layer 0: positive gradings, completions and actions

### 0.1 Positive degree data

Let `N` be an abelian group (a lattice in every instance). *PositiveDegrees* on `N` is
an additive submonoid `P ⊆ N` with an additive `δ : N → ℤ` such that `δ(n)>0` for
nonzero `n∈P` and `{n∈P | δ(n)≤k}` is finite for every `k∈ℕ`; `N⁺=P\{0}`. A
*PositiveDegreeMap* `(N,P,δ) → (N',P',δ')` is an additive `T` with `T(P)⊆P'`,
`T(N⁺)⊆(N')⁺` and a monotone cutoff modulus `λ : ℕ → ℕ` with `δ(n)>λ(k) ⇒ δ'(Tn)>k`
for `n∈P`. Same-order means `λ(k)=k`. For a lattice-rational cone `σ`, `σ∩N` is
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
  cone `σ`, `σ∩N` is finitely generated, by double duality from `σ^∨∩Hom_ℤ(N,ℤ)`; an integral
  functional strictly positive on the nonzero lattice points of `σ` makes `σ∩N`
  *PositiveDegrees*, and a lattice-rational cone carrying such a functional is salient.
- Every `n∈P\{0}` lies on a unique *SupportedRay*, with a unique integer
  `a≥1` such that `n=aw`. At each order only finitely many supported rays meet
  `{n∈P\{0} | δ(n)≤k}`. For `P=C∩N`, with `C` a lattice-rational cone carrying
  the positive degree, the supported primitive generators belong to `P`.
- A *PositiveDegreeMap* `T` maps a supported primitive generator `w` to
  `T(w)=b w'`, where `b≥1` and `w'` is a unique supported primitive generator
  in the target lattice. This ray map respects identity and composition and sends
  `aw∈P` to `ab w'∈P'`, with the original cutoff modulus.

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

An *AlgFiltration* on an associative ring `A` is a decreasing multiplicative family
of two-sided ideals `I^kA`, with `I^0A=A`. It carries Mathlib's
[`IsRingFiltration`](https://leanprover-community.github.io/mathlib4_docs/Mathlib/RingTheory/FilteredAlgebra/Basic.html#IsRingFiltration)
on `ℕᵒᵈ`, with `F(k)=I^kA` and `F_lt(k)=I^{k+1}A`; two-sidedness is additional data.
Its *AlgFiltration.completion* is the compatible-family subring
`Â=lim_k A/I^{k+1}A`. For an `R`-algebra, *AlgFiltration.completionSubalgebra* retains
the `R`-algebra structure on this carrier.

A filtered map `f:A→B` has a monotone cutoff modulus `λ:ℕ→ℕ` satisfying
`f(I^{λ(k)+1}A)⊆J^{k+1}B`. Filtration preservation means `λ(k)=k`;
`f(I^{ck}A)⊆J^kB`, `c≥1`, gives `λ(k)=c(k+1)−1`.
A *ModuleFiltration* uses decreasing submodules and `IsFiltration` on `ℕᵒᵈ`,
with `IsModuleFiltration` for compatibility with a ring filtration; its completion
and filtered maps are defined by the same quotient construction.
For `R`-algebras over a commutative ring, *tensorFiltration* is
`F^j(A⊗_R B)=Σ_{a+b≥j} im(I^aA⊗_R J^bB)`, with completion `A⊗̂B`.

*Targets.*
- Completions, with their induced filtrations and projections, are limits of the
  quotient towers in rings, `R`-algebras or modules, respectively. The canonical maps
  are filtered; scalar restriction preserves their carriers and maps. Supply the
  standard filtration instances on these same families.
- Filtered `RingHom`, `AlgHom` and `LinearMap` maps induce completion maps, with
  order-`k` component induced by `A/I^{λ(k)+1}A→B/J^{k+1}B`. Prove independence of
  enlarging `λ`, identity and composition laws (successive moduli compose as `λ∘λ'`).
- The tensor filtration consists of decreasing multiplicative two-sided ideals,
  with `F^0=A⊗_R B`. The completed tensor map `Â×B̂→A⊗̂B`, levelwise
  `(x_k,y_k)↦x_k⊗y_k mod F^{k+1}`, is bilinear, multiplicative and compatible with
  projections.
- *principalCompletionEquiv*: for a lattice `M` and finite `I`, the completion of
  `MvPolynomial I (AddMonoidAlgebra R M)` along `MvPolynomial.idealOfVars` is
  `MvPowerSeries I (AddMonoidAlgebra R M)`, preserving coefficient maps. Its inverse
  at order `k` is `truncTotal (k+1)` followed by the quotient map.

*Needs:* `IsFiltration`, `IsRingFiltration`, `IsModuleFiltration`, `Ideal.Quotient`,
`AdicCompletion`, `TensorProduct`, `MvPowerSeries`,
`MvPolynomial.idealOfVars`, `truncTotal`.

### 0.4 Algebraic exponential groups

Let `𝔣=FreeLieAlgebra ℚ (Fin 2)` with generators `X, Y`, write `lowerCentralSeries c` for
Mathlib's 0-based `lowerCentralSeries ℚ 𝔣 𝔣 c` (class at most `c` means
`lowerCentralSeries c = ⊥`), and `U⁺=TauCeti.HopfIdeal.augmentation` in `U(𝔣)`. In
`U_c=U(𝔣)/(U⁺)^{c+1}` the images of `X` and `Y` are nilpotent, and
`ι_c : 𝔣/lowerCentralSeries c → U_c` is the map induced by `ι:𝔣 → U(𝔣)`. For `u` nilpotent
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

For an arbitrary Lie algebra `g` over a commutative `ℚ`-algebra `R`, *pbwSymmetrizationEquiv* `Sym_R(g) → U_R(g)` sends a product of `d`
elements to `1/d!` times the sum of their products in all orders.

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

*Route:* Use the total-degree tensor filtration to check primitives componentwise.
PBW symmetrization identifies primitives with the Lie algebra: the `(1,d−1)`
coproduct detects every symmetric degree `d≥2`. In the free Lie algebra, identify
the degree filtration with augmentation powers and truncate the completed
`log(exp X exp Y)` to construct *bchElement*.

**Checks.**
- In §0.2's Heisenberg algebra, `log(exp X exp Y)=X+Y+Z/2` and
  `log(exp Y exp X)=X+Y−Z/2`.
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

A group tower consists of transition homomorphisms `G_{k+1} → G_k`, `k∈ℕ`,
defining a functor `F : ℕᵒᵖ ⥤ GrpCat`. *CompletedGroup* is the preimage of
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
  by §0.2 it is the completion of `S⊗_R g`.
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
- For `A=U_R(g)` with §0.4's degree filtration and canonical map `ι:g→A`,
  the inner action `x·a=ι(x)a−aι(x)` exponentiates on `Â` to conjugation by
  `exp(ι(x))` (`TauCeti.expAd_apply_eq_exp_mul_exp_neg`).

*Needs:* §§0.3–0.5; Lie modules,
`Module.End.exp_mul_of_derivation`, `TauCeti.expAd_apply_eq_exp_mul_exp_neg`.

### 0.7 Limits of diagrams and label actions

A *diagram* is a functor `F:J⥤𝒱` from a small *index category* to a *value category*;
assume the stated limits exist. For types, `SemimoduleCat R` over a semiring, and `AlgCat R` over a
commutative ring, `lim F` consists of *matching families* `(s_x)` satisfying
`F(a)(s_x)=s_y` for every arrow `a:x→y`.

For a small `D`, `C:D⥤Cat` and `F:∫C⥤𝒱`, put `F_d=Grothendieck.ι C d⋙F` and, for `f:d→e`,
let `α_f:F_d⇒C(f)⋙F_e` have components `F(f,id)`. Later truncation towers use
`D=ℕᵒᵖ`. The *labels* are arrows of groupoids `L(d)` in a functor `L:D⥤Cat`, with
`j:L⇒C`; their *represented action* is `A=Grothendieck.map j⋙F`.
A *section* of `p:∫L⥤D` is a functor `s` with `s⋙p=id_D`; write
`s(d)=(d,s_d)` and `s_f:L(f)(s_d)→s_e`. Its *completed coefficient object* is
`Â_s=lim_D(s⋙A)`. A *completed label* `s⇒t` is a natural transformation over `id_D`.

*Targets.*

- **Comparison of limits.** For diagrams `F:J⥤𝒱`, `F':J'⥤𝒱`, a span
  `J←K−J''−H→J'` with `H` initial and `β:K⋙F⇒H⋙F'`, construct
  `lim F→lim F'` by restriction along `K`, `limMap β` and inverse restriction along
  `H`. Prove identity and composition laws using `Comma(H₁,K₂)` and
  `Comma.initial_snd`. The map is an isomorphism when `β` and restriction along `K`
  are isomorphisms (in particular when `β` is an isomorphism and `K` is initial),
  and commutes with limit-preserving functors. Identity spans recover `limMap`;
  `J←u−J'−id→J'` with `F'=u⋙F`, `β=id`, recovers `limit.pre F u`.
- **Fiberwise limits.** If every restriction
  `r_f:lim F_e→lim(C(f)⋙F_e)` is an isomorphism, construct the functor with objects
  `lim F_d` and arrows `(lim α_f)≫r_f⁻¹`, and a natural isomorphism
  `lim_{∫C}F≅lim_d lim F_d`. Initial `C(f)` suffice; constant `C` recovers
  commutation of limits.
- **Reindexing.** Under the same hypothesis, an initial `G:D'⥤D` induces an
  isomorphism by restriction along `Grothendieck.pre C G`; this functor is itself
  initial if every `C(f)` is initial. A monotone `λ:ℕ→ℕ` is initial on `ℕᵒᵖ`
  exactly when `∀k,∃n,k≤λ(n)`. For towers `T,T'`, any monotone `λ` and
  `β:λ⋙T⇒T'` induce `lim T→lim T'`. Enlarging `λ` to `μ≥λ` and replacing
  `β_k` by `T(μ(k)→λ(k))≫β_k` preserves this map. Successive moduli compose as
  `λ∘λ'`; maps mutually inverse after such enlargements induce inverse isomorphisms.
- **Actions along sections.** Completed labels induce isomorphisms `Â_s≅Â_t`,
  respecting identity and composition. The group of completed labels `s⇒s` is
  `lim_d Aut(s_d)` with transition `g↦s_f L(f)(g)s_f⁻¹`. For
  `L_k=SingleObj G_k` and identity `s_f`, recover §§0.5–0.6, including ordered
  products and changes of degree.
- **Intertwiners.** For a second such system over `D'` with represented action `A'`,
  an *intertwiner* consists of `G:D'⥤D`, `h:G⋙L⇒L'` and
  `η:Grothendieck.pre L G⋙A⇒Grothendieck.map h⋙A'`. Pulling a section back along
  `G` and forward along `h` gives `t`; restricting `η` gives `Â_s→Â'_t` through
  the span `D←G−D'−id→D'`. Prove identity, composition and label-equivariance laws.

**Checks.**

- If `H` is not initial, there need be no comparison map. Let `J=J''` be
  terminal and `J'` discrete on two objects, with `F=Unit`, `F'=(Unit,Empty)`, `H` the
  first object and `β=id`. Then `lim F` is a point and `lim F'` is empty, so there is
  no map `lim F→lim F'`.
- For an action of a group `H` on a type `X`, viewed as a functor on `SingleObj H`,
  the limit is the fixed-point set `Xᴴ`. In `ℚ[ε]/(ε²)`, the label `exp ε=1+ε` is not
  `1`, but conjugation by it is the identity, so an action by conjugation does not
  detect this label.

*Needs:* §§0.3–0.6; `CategoryTheory.Grothendieck`, `Functor.Initial.limitIso`,
`Comma.initial_snd`, `limit.pre`, `limMap`, `SingleObj`, `SemimoduleCat`, `AlgCat`.

### 0.8 Homogeneous coefficient correspondences

Let `R` be a semiring and `N_b→M_u`, `N_b→M_v`, written `λ_u,λ_v`, a span of
linear maps, for example the image of `b→u,b→v` under `F:J⥤SemimoduleCat R`.
A *GradedCorrespondence* gives decompositions `M_i=⊕_{γ∈Γ_i}M_{i,γ}` for abelian
groups `Γ_i`, projections `pr_{i,γ}`, sets `I_i⊆Γ_i` of *admissible degrees*, and linear *lift*s
`L_{i,γ}:M_{i,γ}→N_b` for `γ∈I_i`, with `λ_i L_{i,γ}=inclusion`.
Its *transfer* is `B^{γ,η}_{u,b,v}=pr_{v,η} λ_v L_{u,γ}`.
A *common lift* of linear maps `α_i:E→M_i` is `ℓ:E→N_b` with `λ_iℓ=α_i`.
Joint injectivity of `(λ_u,λ_v)` is a separate hypothesis for uniqueness and matching.

A *morphism* consists of linear maps `r_b,r_u,r_v` and group homomorphisms
`T_i:Γ_i→Γ'_i` satisfying
`r_iλ_i=λ'_i r_b`, `r_i(M_{i,γ})⊆M'_{i,T_iγ}`, `T_i(I_i)⊆I'_i`, and
`r_b L_{i,γ}=L'_{i,T_iγ} r_i|_{M_{i,γ}}` on admissible pieces.
Zero target pieces are admissible with zero lift. For §0.7 comparisons, require
these equations of `β` on the chosen spans and their images under `K,H`;
scalar changes use restriction of scalars.

*Targets.*

- **Morphisms and transfers.** Construct identities and composites, and prove
  `B'^{T_uγ,η'}(r_ua)=∑_{η:T_vη=η'}r_v(B^{γ,η}(a))` for admissible `a∈M_{u,γ}`,
  summing over the finite homogeneous support of `λ_v L_{u,γ}(a)`. Identity degree
  maps give truncation compatibility and compatibility along admissible sequences.
- **Finite component expansion.** Successive homogeneous expansions along a finite
  sequence of linear maps between direct sums give a finite sum of degree histories
  equal to the composite, including after final projection. Prove regrouping,
  identity insertion and concatenation laws. Uniform finite support on an input
  submodule gives a linear-map identity. Apply this to transfers extended by zero
  on inadmissible pieces; intertwining maps preserve expansion and injective output
  maps reflect identities.
- **Finite recursion.** For a linear endomorphism `U` of a semimodule with `U^r=0`,
  prove that `x=a+U(x)` has unique solution `∑_{j<r}U^j(a)`. A filtration of length
  `r` raised by `U` implies this nilpotence; component expansion identifies the
  solution with its finite sum of histories.
- **Graphs.** A linear equivalence `θ:M_u≃M_v` gives the *graph correspondence*
  with `N_b=M_u`, `λ_u=id`, `λ_v=θ`, all degrees admissible, and lifts
  `inclusion`, `θ⁻¹∘inclusion`. Prove joint injectivity; the transfers are the
  components of `θ` and `θ⁻¹`.
- **Matching and common lifts.** Under joint injectivity, identify `N_b` with
  `S_b=range(λ_u,λ_v)⊆M_u×M_v`. A common lift exists iff `(α_u,α_v)` takes values
  in `S_b`, and is unique. Any morphism sends a common lift to `r_bℓ`.
  For the free incidence category on `U⊔B` generated by `b→u(b),b→v(b)`, with
  `u,v:B→U` and jointly injective spans, construct a linear equivalence between
  matching families and families `(s_x)_{x∈U}` satisfying
  `(s_{u(b)},s_{v(b)})∈S_b` for every `b`.
- **Products.** For a diagram of algebras over a commutative ring, the matching
  equivalence is an algebra equivalence. Independently of joint injectivity, if
  the gradings are multiplicative and admissible lifts satisfy
  `L_{u,γ+δ}(aa')=L_{u,γ}(a)L_{u,δ}(a')`, then
  `B^{γ+δ,η}(aa')=∑_{η₁+η₂=η}B^{γ,η₁}(a)B^{δ,η₂}(a')` for
  `γ,δ,γ+δ∈I_u`, summing over the two finite output supports.

**Checks.**

- For `M_u=M_v=ℚ` concentrated in degree `0∈ℤ` and `θ(a)=2a`, the graph
  correspondence has `B^{0,0}(1)=2` and `B^{0,η}(1)=0` for `η≠0`.

*Needs:* §0.7; `DirectSum.Decomposition`, `DirectSum.component`,
`DirectSum.sum_support_decompose`, linear and semilinear maps.
Sources: MAN §2.2; GHS Definitions 3.1–3.3.

## Layer 1: polyhedral geometry and paths

### 1.1 Rational polyhedra and finite complexes

Work in a finite-dimensional real normed space `V` with an integral lattice `i : N → V`
(`IsIntegralLattice`). A functional is *rational* when it is a rational multiple of a
lattice character; a linear map is *rational* when it pulls rational functionals back to
rational functionals. An *IntegralAffineEquiv* is an affine equivalence `f : V ≃ᵃ[ℝ] V'`
with a lattice isomorphism `T : N ≃ N'` and `f.linear ∘ i = i' ∘ T`. A
*RationalAffinePolyhedron* is a presentation `{x | g_i(x) ≤ c_i}` by finitely many
affine inequalities with rational `g_i` and real `c_i`; such a polyhedron is
*rational-normal*; *IsRationalPolyhedron* also asks
rational `c_i`; a *RelOpenCell* is cut out by finitely many equations and strict
inequalities with rational functionals and real offsets. Write
`dir(Q)=span_ℝ{x−y | x,y∈Q}` and `rec(Q)={v | ∀x∈Q, ∀t≥0, x+tv∈Q}`. A nonempty `F`
is an *IsPolyhedralFace* of `Q` if `F=Q∩{ℓ=c}` for a real linear functional `ℓ` with
`ℓ≤c` on `Q`. A *FinitePolyhedralComplex* is a finite set of nonempty closed
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
  `t = 0`. The nonempty faces of `Q` are exactly the nonempty height-one slices of
  `PointedCone.IsFaceOf` faces of its homogenization; every face of a finitely
  generated pointed cone is exposed. `Q` has finitely many faces
  (`PointedCone.FG.finite_face`); faces of faces are faces, faces are rational-normal,
  and the relative boundary is the union of the proper faces.
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
- In `ℝ²`, put `H={y=1}`, `L={y=0}`, `v=(√2,0)` and `r=v+ℝ_{≥0}(1,0)`.
  The families `{H}`, `{L}` and `{r,{v}}` are complexes; `H` has nonzero lineality.
- In `ℝ`, the presentations `0 ≤ −1` and `x ≤ 0 ∧ −x ≤ −1` of `∅` have inequality cones
  `ℝ × {0}` and `{(0,0)}`, and homogenization `{0}`.

*Needs:* `TauCeti.Toric.IsIntegralLattice`, `Module.Dual`, `PointedCone.FG`,
`PointedCone.DualFG`, `PointedCone.IsFaceOf`, `PointedCone.IsFaceOf.trans`,
`PointedCone.FG.finite_face`, `PointedCone.closure`, `IsLatticeRational`, `IsExposed`,
`TauCeti.IsConvexPolyhedron`, `TauCeti.Toric.Fan`, `Fan.IsSubdivision`, `AffineEquiv`,
`intrinsicInterior`, `intrinsicFrontier`. Sources: GHKK Appendix C.1; BRI §§2.2–2.5.

### 1.2 Generic paths and two-parameter families

A wall is a nonempty closed polyhedron of codimension one. For a family of walls, *SingularSupport* is the union of the relative
boundaries of the walls and of the intersections of walls whose affine spans have
different directions. A point off all walls is an *allowed* endpoint. An
*AdmissiblePLPath* between allowed endpoints is a finite chain of affine segments
whose vertices miss the walls, whose segments meeting a wall have direction outside
the wall's affine direction, and which avoids the singular support; the constant path
at an allowed endpoint is one. For the cooriented walls of
a finite polyhedral complex, *crossingWord* lies in `FreeGroup` on the walls, ordered
and signed by Convention 3; an admissible path meets at most one such wall at each
crossing time. For an arbitrary finite wall family, simultaneous coplanar crossings
are a single event recording the finite signed set of incident wall indices. A small
loop around a joint `j` is the boundary of a small positively
oriented transverse triangle that meets `j` once and meets only walls containing `j`.
Its filled triangle avoids every other codimension-two cell of the adapted complex
and the relative boundary of `j`.

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
- For finitely many closed codimension-one walls in a ball, the chambers (connected
  components of the complement of the walls in the ball) are connected under
  adjacency (closures meeting off the singular support); near a point, a locally finite
  polyhedral stratification reduces to this case.

*Route:* Apply Baire to vertex parameters. A generic PL homotopy crosses joints
one at a time; its triangles give conjugates of joint meridians and hence
*jointLoopGeneration*.

**Checks.**
- With walls `x = 0` and `x = y` in `ℝ²`, endpoints `(−1,1)`, `(1,−1)` and no free
  vertex, the only vertex list passes through the joint `0` and is not admissible.
- In `U=ℝ²∖{0}`, restrict the wall `w={(x,0) | x≥0}` cooriented by `dy`.
  The counterclockwise boundary of `[−1,1]²` based at `(1,1)` and the constant
  loop have words `w⁻¹` and `1` and are not homotopic in `U`.

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
`k`-simplex to `V`. At every cell it meets, its linear part surjects onto the
normal quotient; its proper parameter faces avoid the support, and its image avoids
cell frontiers. Disjoint tests need no rank condition and may be degenerate. The transverse
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
  normal-quotient map, with no determinant magnitude. Cochain relations preserve the
  pairing when the test is transverse to both representatives; parameter subdivisions
  preserve it when all pieces are transverse tests. In particular, new parameter faces
  must avoid the intersections being counted. A cochain on which every
  sufficiently small transverse test vanishes is zero, coincident coplanar contributions
  being combined first. `⟨dC,τ⟩=⟨C,∂τ⟩`, `∂τ=Σ_l(−1)^lτ∘δ_l`, for a codimension-`k`
  cochain `C` and an affine `(k+1)`-simplex `τ` in general position for `dC` whose faces
  are in general position for `C`; this includes triangulated prisms `H(t,s)=S(s)+tn`
  on `[0,T]×Δ^k`, not necessarily embedded, with `∂([0,T]×S)=S_T−S_0−[0,T]×∂S`.
- On transverse cochains, `S_n` respects the subdivision relations, its swept supports
  are closed rational-normal polyhedra of codimension `k−1`, `dS_nC+S_ndC=−C`, and every
  nonempty cell `Q` of `S_nC` has `n∉rec(Q)` (*sweep_strictlyOutgoing*).
- Coefficient maps commute with `d`, the intersection pairing and `S_n`, which are
  `R`-linear on their domains for `R`-module coefficients.

*Route:* The transverse sweep is an affine prism `P×ℝ_{≥0}`. Its base and swept
facets, with their conormal orientations, give `dS_n(P)=-P-S_nd(P)`; descend through
subdivision. The pairing and Stokes targets are independent geometric API.

**Checks.**
- The half-plane `{y≥0}` with coefficient `c` has coboundary `({y=0},+dy,c)`;
  this coboundary pairs with `γ(t)=(0,1−2t)`, `0≤t≤1`, to give `−c`.
- With integer coefficients, the segment from `p₀=(0,0)` to `p₁=(1,0)` with
  conormal `dy` has coboundary `(p₀,+dx∧dy,1)+(p₁,−dx∧dy,1)`.
  The coboundary pairs with small positively oriented triangles around `p₀,p₁` to
  give `1,−1`.

*Needs:* §§1.1–1.2.

### 1.5 Integral-affine bases and exponent data

The *integralAffinePregroupoid* consists of maps between opens locally equal to
*IntegralAffineEquiv*s (§1.1). An *IntegralAffinePolyhedralBase* is a pure
`d`-dimensional space `B` with a polyhedral decomposition locally finite on compact
sets, a closed cell union `Δ` of dimension at most `d−2` after refinement, and an
integral-affine atlas on `B₀=B∖Δ` whose chart cells are rational-normal polyhedra.
The tangent lattice local system is `Λ`; an *ExponentSystem* is a lattice local
system `Γ` with `ρ:Γ→Λ` and `T_Λρ=ρ'T_Γ` on overlaps. On each connected component,
choose a universal cover `π:B̃₀→B₀`, a locally integral-affine developing map
`dev:B̃₀→V` and trivializations of the lifted lattice systems, equivariant under
deck transformations: `dev(gx)=h_g(dev(x))` for integral-affine holonomy `h_g`.

A *BasedCoefficientDiagram* is §0.7's tower `C:ℕᵒᵖ⥤Cat`, `F:∫C⥤𝒱`, `j:L⇒C`,
with truncation-compatible cell objects, facet spans and overlap diagrams. Overlaps
are generated by restrictions from cell/facet objects and commuting chart
comparisons; these intertwine actions and preserve §0.8 lifts. Every other object
is reached by restrictions. Quotients and localizations may occur outside facet
spans. Cooriented *slab faces* carry §0.8 correspondences; other
base facets carry chart identifications. Supply coefficient monoids, ideals and
orders where needed, their comparison maps, and `ρ_u:Γ_u→Λ_u` for each cell.

An *ordinary wall* in a cell is a §1.2 support with nonzero integral normal and
a *label* in the automorphism group of an object of `L` sent by `j` to that cell's
coefficient object. It is *active* at order `k` if its label is nonidentity there.
Choose compatible locally finite refinements adapted to facets and active walls,
with a closed codimension-at-least-two cell union `Σ_k` containing `Δ`, wall
boundaries and all joints. The *regular locus* `B∖Σ_k` has open top-dimensional
*chambers* and codimension-one crossing *faces*.

Let `J_k` be generated by chamber and face objects, incidences `b→u,b→v`, and
the overlap diagrams with their objects identified and relations imposed.
The functor `r_k:J_k→C_k` uses the supplied incidences and overlap maps. At an
ordinary wall labelled `g`, its face object maps to the cell object, the positive
incidence to `id`, and the negative incidence to `j(g)`; artificial faces use
identities. Subdivision keeps restriction objects or copies them for each piece,
joining copies by isomorphisms sent to identities and commuting with copied arrows.
Atlas refinement restricts the overlap diagrams. The *regular coefficient tower*
is `r_k⋙F_k`; its sections are matching families.

The *velocity* of a degree `γ` is `−ρ(γ)`. Each oriented face, with normal `ν` and
source chamber `u`, admits every degree whose velocity is transverse to the face and
points into it from `u`: these degrees lie in `I_{u,b}`. Each nonzero outgoing
component `η` of a crossing from degree `γ` obeys the normal-velocity condition
`ν(ρ_v(η))=ν(T_Λρ_u(γ))`. Graph correspondences of filtration-raising tangent wall
actions satisfy it. A degree `γ` of `u` is *tangential* to a face with normal `ν`
when `ν(ρ_u(γ))=0`.

An *incoming source specification* `s` gives an `R`-module `E_s` and records
`(C_e,γ_e,α_e)`: `C_e` is embedded by `dev` as an unbounded rational-normal
polyhedron in a lifted chart `u(e)`, `ρ(γ_e)∈rec(dev(C_e))`, and
`α_e:E_s→M_{u(e),γ_e}` is linear and truncation-compatible. Chart, deck and common
unbounded-facet identifications transport geometry and coefficients together;
facet identifications require equal transported velocities and a common lift of
the maps `α_e`. Subdivision retains the sets `C_e` and their data.

An *IncomingDatum* is `(s,a)`, `a∈E_s`. An *IncomingTail* is a germ at `t→−∞` of
an affine half-line eventually in some `C_e`, with nonzero coefficient `α_e(a)`
and velocity `−ρ(γ_e)≠0`, modulo eventual agreement under those identifications.
For one chart and `a∈A_p`, all affine tails of velocity `−ρ(p)` and coefficient `a`
are allowed. Truncation deletes zero coefficients. The *IncomingTypeDatum* records
`e`, degree, coefficient and chart/face/deck labels modulo the identifications;
positions belong to the tail. A *ConstantIncomingSection* is a homogeneous matching
family of the regular coefficient tower with zero spatial velocity.

*Targets.*
- *integralAffineGroupoid*: the `Pregroupoid` axioms and its `StructureGroupoid`.
  Each member extends uniquely to a global *IntegralAffineEquiv* on each nonempty
  connected domain component, with linear part `IsIntegralLattice.extend` of the
  lattice map. Global self-equivalences form a group surjecting onto lattice
  automorphisms with translation kernel; they preserve rational-normal polyhedra,
  complexes and admissible paths.
- Restriction, pullback along integral-affine open embeddings, and common atlas and
  polyhedral refinements act functorially on exponent systems and
  *BasedCoefficientDiagram*s. For a finer choice of refinements at order `k`, with
  index category `J'_k`, let `p:J'_k→J_k` send each chamber and face to the chamber
  or face of `J_k` containing it and each copied object to its original. Prove that
  when the facet spans are jointly injective, the map of matching families induced
  by the §0.7 span `J_k←p−J'_k−id→J'_k` is an isomorphism: faces with identity
  correspondences determine the values on chambers,
  joint injectivity determines the values on faces, and restrictions determine the
  remaining values. A wall that is active at order `k+1` but not at order `k` has, at
  order `k`, the graph correspondence of the identity. These
  isomorphisms give the hypothesis of §0.7's fiberwise limit theorem for the regular
  coefficient tower. Compact-path
  data admit a finite common refinement with cutoff bounded by the maximum local
  modulus; cofinal reindexing compares the local towers.
- *incomingTailTransport*: the map `IncomingTail→IncomingTypeDatum` respects
  restriction of representatives and chart, face and deck identifications.
  Transport commutes with restriction, refinement, coefficient maps, truncation
  and regrading. Deck transformations act simultaneously on the path, the endpoint
  lift and the incoming datum; a fixed endpoint lift determines the path lift.
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

A *GroupoidWallDiagram* in a fiber `L_d` of §0.7's label functor assigns to each
chamber an object of `L_d`, and to the two opposite crossings of each wall mutually
inverse arrows. The transport of successive crossings `ℓ_1,…,ℓ_s` is `ℓ_s∘…∘ℓ_1`.

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
- *representedPathProduct*: the represented action sends the transport of a path to
  the composite coefficient map, commutes with cutoff and truncation, and recovers
  *pathProduct* in the one-object case. Completed labels between sections whose
  values are chamber objects act between their completed coefficient objects (§0.7).
  Faithful represented actions reflect equality of label products.

**Checks.**
- Subdivide the axes of `ℝ²` into four closed half-axes and the origin; label the
  horizontal half-axes `a`, cooriented by `dy`, and the vertical ones `b`, cooriented by
  `dx`, with `ab≠ba`. The counterclockwise square loop
  `(1,1)→(−1,1)→(−1,−1)→(1,−1)→(1,1)` crosses `b,a,b⁻¹,a⁻¹`, with product
  `a⁻¹b⁻¹ab≠1`.

*Needs:* §§0.7, 1.1–1.2, 1.5; `Group`, `FreeGroup`, groupoids and functors.
Source: BRI Definitions 2.1–2.2 for the group case.

### 2.2 Graded KS complexes and completed diagrams

For §0.1's `N`, the space `V` is a *KSSpace*: the model of `Hom_ℤ(N,ℝ)` of
Convention 1, with lattice map `Hom(N,ℤ)→V` satisfying `IsIntegralLattice`. For a
rational cone `σ⊆V`, `g(σ)=⊕_{n∈N⁺, σ⊆n⊥} g_n`. A *KSComplex k* is a finite rational
conical complex (§1.1) whose wall `𝔡` has label in `exp(g(𝔡)≤k)` and is cooriented by
`n∈N⁺` with `𝔡⊆n⊥`. A *CompletedDiagram* is a sequence
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
- For `N=ℤ²`, `P=ℕ²` and `x∈Ĝ` with every order-`k` projection in `exp(g(e_2⊥)≤k)`, let the
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

A *DegreeHom* `f:g→g'` is §0.2's graded Lie homomorphism over the identity map of
the positive degree data. The ray Lie algebra of a §0.1 *SupportedRay* `w` is
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

Let `(Γ,P,δ)` be *PositiveDegrees* (§0.1), `g` a positively `Γ`-graded Lie
algebra over a commutative ring `R`, and independently `i:Λ→V` an integral lattice
with additive `ρ:Γ→Λ`. Degree `n` has geometric direction `ρ(n)`.

*DirectedWallSpaces* consists of `R`-submodules `h_{n,m}⊆g_n` for
`n∈P\{0}`, `m∈Λ*`, satisfying `h_{n,0}=0`, `h_{n,m}=0` if `m(ρ(n))≠0`,
`h_{n,cm}=h_{n,m}` for nonzero integers `c`, and
`[h_{n,m},h_{n',m'}]⊆h_{n+n',μ}` for `μ=m(ρ(n'))m'−m'(ρ(n))m`.
Wall groups and §§3.2–3.4 require `R` to be a `ℚ`-algebra. For a *SupportedRay* `w`,
*raySubmodule* is `⊕_{a≥1, aw∈P}h_{aw,m}`; *wallGroup w m* consists of
`θ∈Ĝ` whose logarithm at each order lies in its image, using the actual degrees
`aw∈P` with orders `δ(aw)`.

Fixed-degree morphisms are graded Lie homomorphisms preserving wall spaces.
Coordinate changes are lattice isomorphisms `T_Γ`, `T_Λ` with
`T_Λ∘ρ=ρ'∘T_Γ`, `T_Γ(P)=P'`, and a graded Lie isomorphism taking
`h_{n,m}` onto `h'_{T_Γn,m∘T_Λ⁻¹}`. Their cutoff moduli are those of §0.1;
`δ'∘T_Γ=δ` gives maps at the same order.

*Targets.*

- Homogeneous wall spaces embed in the submodules indexed by §0.1's supported
  rays, compatibly with truncation and decomposition by actual degrees in `P`.
  Primitive generators lie in `Γ`; their images under `ρ` may be zero or nonprimitive.

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
- Scalar extension along a commutative-ring map `R→S` gives the grading on
  `S⊗_R g` and wall spaces `im(S⊗_R h_{n,m}→S⊗_R g)` satisfying the axioms.
  Homogeneous pieces are direct summands; wall submodules need not be. For flat
  `S`, the wall spaces are `S⊗_R h_{n,m}`. Extend scalars at finite order, then complete.

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

The walls nontrivial at order `k` are *active*. Their *levelPathProduct* follows
Convention 3, multiplying simultaneous crossing factors. These products define
order-`k` equivalence, equivalence and consistency. A refinement assigns each
nonidentity wall of `𝔇'` to a wall of `𝔇` with the same degree, normal and label,
whose support contains it. Each nonidentity original support is covered by its assigned
supports with pairwise disjoint relative interiors; repeated and overlapping
indexed walls are refined separately.

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

The input `𝔇_in` is a family of incoming full affine hyperplanes labelled in §3.1's
wall groups, with finitely many active walls at each order.
An outgoing completion is a consistent diagram containing `𝔇_in` whose other
walls are outgoing. *HasPureBirthLogs* means each noninitial wall has a
homogeneous logarithm in `g_n` and birth order `δ(n)`. For `k≥1`,
*IsCorrectionStage k* means the diagram contains `𝔇_in`, is consistent through
order `k−1`, and has only outgoing noninitial walls with pure birth logarithms of
orders below `k`.

For a diagram consistent through order `k−1`, a *ChamberTrivialization* at order
`k` is a finite ambient complex covering the active walls by codimension-one cells,
with a base point off its codimension-one skeleton and lifts `t_C∈G≤k`, one for each
chamber `C`, of the order-`(k−1)` transport from that point to `C`. For an oriented
wall cell `w`, let `X_w` be the signed crossing product from its negative chamber to
its positive chamber, with lifts `t_−` and `t_+`. The central defect `A_k` is the
codimension-one *PolyhedralCochain* (§1.4) in `E_k=F^kg/F^{k+1}g` with
`A_k(w)=log(t_+⁻¹X_wt_−)`. Lower-order transport places `t_+⁻¹X_wt_−` in
`ker(G≤k→G≤k−1)`, on which the central logarithm is defined. Likewise, `ζ_k` assigns to each codimension-two cell the
central logarithm of the product around its positively oriented closed meridian (§1.2), with kernel
membership supplied by lower-order consistency.

At order `k`, *centralStep* uses `b_{k,n}=S_{i(ρ(n))}ζ_{k,n}`, the sweep of §1.4, on the nonzero
transverse components with `δ(n)=k`. For `n=aw`, `a≥1`, index each swept wall
`𝔡−ℝ_{≥0}i(ρ(n))` by its supported primitive ray `w`, with birth order `k` and
label `exp(−c)` for degree-`n` coefficient `c` on the positive transverse side.
The sweeps along `ρ(n)` and `ρ(w)` have the same support and outgoingness.

*Targets.*

- *exists_outgoingCompletion*: construct an outgoing completion at each finite
  order, compatibly with truncation, and assemble them for the stated input.
  Finite families are a special case; full-hyperplane supports remain required.
- *relativeAbelianCompletion*: let `h=g⋉I` be a split positively graded Lie
  extension with abelian ideal `I`, whose splitting and projection preserve the
  directed wall spaces. Fix a consistent `g`-diagram and incoming full hyperplanes
  labelled in `I`, finite at each order. Keeping the lifted `g`-diagram fixed,
  construct a consistent extension by outgoing `I`-walls with pure birth logs,
  compatibly with truncation. The fixed diagram may have arbitrary §3.2 supports.
- *exists_chamberTrivialization*: construct an adapted finite complex, chamber
  lifts, oriented crossings and isolating joint meridians for every diagram consistent
  through order `k−1`. The lifts come from lower-order path independence and the
  surjective truncation map; the meridians satisfy §1.2's local isolation conditions.
- For every *ChamberTrivialization*, `ζ_k=dA_k`, hence `dζ_k=0`. For an
  *IsCorrectionStage k* diagram, the degree-`n` component at a joint of direction
  `W` is zero when `i(ρ(n))∈W`; otherwise it lies in the wall space whose
  normal spans `Ann(W+ℝi(ρ(n)))`.
- *zeroDirectionObstruction*: degree-`n` obstructions vanish when `ρ(n)=0`.
- At an *IsCorrectionStage k* diagram, *centralStep* adds only outgoing walls with
  pure birth logarithms of order `k` and produces an
  *IsCorrectionStage (k+1)* diagram;
  `ζ_k+dΣ_n b_{k,n}=0` on a common refinement including the sweep side faces and
  the new intersections.

*Route:* Linear terms cancel on the initial full hyperplanes and have birth order
below `k` on other walls. *zeroDirectionLieWord* kills tangent-degree components.
Apply §1.4's sweep identity to the closed cochain `ζ_k`; strict outgoingness gives
the new walls. For *relativeAbelianCompletion*, quotient consistency puts every
defect in `I`; apply the same induction to its components. The initial `I`-walls
are full hyperplanes, and all new logarithms remain in the ideal.

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

- *outgoingCompletion_unique*: two outgoing completions of one input are equivalent.
- *relativeAbelianCompletion_unique*: relative completions with the same quotient
  diagram and ideal inputs are equivalent. The resulting class depends only on the
  quotient diagram's equivalence class and is natural under maps of split extensions
  preserving wall spaces, inputs and cutoff moduli.
- The order-`k` class of *Scat* depends only on that of the input. Mapping a
  completion along `g→g≤k` gives a completion of the truncated input.
- *Scat* commutes with §0.5's *completedMap* along the fixed-degree morphisms of
  §3.1 and with its coordinate changes, using their cutoff moduli for finite-order
  comparisons.

*Route:* At the first differing order, split the central difference by degree;
initial walls cancel. Each remaining abelian part is consistent and outgoing.
For direction `n=i(ρ(γ))`, every support lies in `l≤c` with `l(n)>0`.
A transverse segment and its far translate along `n` bound a rectangle with zero
sum, forcing this part to vanish. Induct on order.

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
`T:Γ→Γ'` and a `ℚ`-linear map `S:U→ₗ[ℚ](Λ')*_ℚ` on a subspace `U≤Λ*_ℚ`, with
`S(m)(ρ'(Tp))=m(ρ(p))` for `p∈P`, `m∈U`. The identity-projection case
`Γ=Λ=L`, `ρ=id` is the usual tropical vertex algebra and pairing.

*Targets.*
- The bracket satisfies the Jacobi identity, and the `h_{n,m}` satisfy §3.1.
- *tropicalVertexGroup*: §0.5's completed group `Ĝ` of the formal Lie algebra `g`.
  For each coefficient monoid `Q`, the `R`-linear Lie map `g→Der_R R[Q]`
  integrates through §0.6 to an `R`-algebra action on `R[[Q]]`, faithful on
  `R[[P]]` when `ρ(P)` spans `Λ_ℚ`. For ray series `f` of constant term one,
  `exp(log(f)∂_m)(z^p)=z^p f^{m(ρ(p))}` for `p∈Q`, with powers taken in units.
  These actions are §0.7 represented actions, compatible with truncation.
- *tropicalVertexGroup.map*: for a *TropicalPairing*, the span of the `z^n∂_m`, `m∈U`,
  is a Lie subalgebra, and `z^n∂_m↦z^{Tn}∂_{S(m)}` is a functorial Lie and group
  homomorphism on it, intertwining `z^p↦z^{Tp}` on `R[P]` and on completions along the
  cutoff modulus of `T`. For commuting degree and tangent isomorphisms,
  `S` is the inverse dual of the tangent map. In the identity-projection case,
  lattice isomorphisms carrying `P` onto `P'` and finite-index embeddings with
  rational inverse dual are pairings; integral walls keep their primitive normals
  and take the denominators into their labels.
  On a supported ray, `T(w)=b w'` (§0.1) gives a map into the target ray subgroup
  indexed by `w'`, with degrees `aw↦ab w'` and the same cutoff modulus. Transport of
  supports and outgoingness requires a compatible spatial map, as in the coordinate
  and cylinder comparisons.

- *tropicalVertexGroup.coeffMap*: for a ring map `φ:R→R'`, a *TropicalPairing*,
  coefficient monoids with `T(Q)⊆Q'` and
  `S(m)(ρ'(Tq))=m(ρ(q))` for `q∈Q`, `m∈U`, and a monoid homomorphism
  `χ:Q→(R',·)`, the map `r z^n∂_m↦φ(r)χ(n)z^{Tn}∂_{S(m)}` is a Lie homomorphism
  on the span with `m∈U`. It intertwines `r z^q↦φ(r)χ(q)z^{Tq}` on coefficient
  algebras and their completions along the cutoff modulus of `T`, with the preceding
  ray reindexing. For `Q=Γ`, `χ` takes values in units. These maps are §0.7
  intertwiners, so they induce maps `Â_s→Â'_t` of completed coefficient objects.
  The case `T=S=id`, `χ=1` is coefficient change on a fixed lattice.

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
`{N,N_uf∩N°}⊆ℤ`. Morphisms are lattice maps preserving the form and carrying these
sublattices into their counterparts. For `0≠n∈N`, define `κ(n)∈ℚ_{>0}` by
`ℝ_{>0}n∩N°=ℕ_{>0}κ(n)n`; it is an integer on primitive `n`, and `κ(tn)=κ(n)/t` for
rational `t>0` with `tn∈N`. An *AdaptedBasis* consists of a basis `(e_i)` of `N`, a
subset `I_uf` whose vectors form a basis of `N_uf`, and integers `d_i>0` such that
`(d_i e_i)` is a basis of `N°`. Put `M°=Module.Dual ℤ N°`,
`P_N=Σ_{i∈I_uf}ℕe_i`, `N⁺=P_N\{0}` and `p₁*(n)={n,-}|_{N°}` for `n∈N_uf`, pairing `N`
with `M°` over `N_ℚ`. The directed normal of `n` is `{-,n}=−p₁*(n)`; for `n=(a,b)` in rank two it is
`{e_1,e_2}(b,−a)`. Over a
commutative `ℚ`-algebra `R`, the skew Lie algebra has `[X_n,X_n']={n',n}X_{n+n'}`; on `R[M°][[t_i]]`, `q^n=z^{p₁*(n)}t^n` and
`D_n(z^m t^a)=⟨n,m⟩z^{m+p₁*(n)}t^{a+n}`. The principal lift has `L_pr=M°⊕N_uf`,
`P_pr=r(P_N)` for `r(n)=(p₁*(n),n)`, `δ_pr(r(n))=Σn_i`, normal `ν_n(m,a)=⟨n,m⟩` with
primitive normal `κ(n)ν_n`, and `h_{r(n),m}` the line of `X_n` when `m`
is a nonzero multiple of `κ(n)ν_n`, zero otherwise. A KS wall of degree `n` is
KS-incoming if its support contains `p₁*(n)`. For an integral form, the skew comparison is
the linear map `p₁*_ℝ:N_ℝ→M°_ℝ` extending `x↦{x,-}`.

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
  forms.

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

Let `(L,P,δ)` be *PositiveDegrees*, `R` a commutative ring, `q∈Rˣ` a specified unit,
and `β` an integral alternating form on `L`. *QuantumMonoidAlgebra* `R q β` is the module of
`AddMonoidAlgebra R L` with basis `z^p`, `p∈L`, and multiplication
`z^p z^{p'}=q^{β(p,p')}z^{p+p'}`. The full twisted group algebra carries the Laurent
homogeneous pieces; its positive subalgebra spanned by `z^p`, `p∈P`, carries the degree
completion, and its strictly positive part is a graded `R`-Lie algebra acting by inner
derivations. BCH groups, exponential actions and quantum scattering assume in addition
that `R` is a `ℚ`-algebra. For `n` outside the radical of `β`, `h_{n,m}` is the
`R`-span of `z^n` when `m` is nonzero and rationally proportional to `β(n,-)`, of
either sign, and zero otherwise; degrees in the radical have zero wall spaces. Wall
eligibility is determined by `β`, also when specialization of `q` enlarges the center.
For a skew datum, take `β(n,n')={n',n}`, assumed integral.
Coefficient models include `k[q,q⁻¹]`, `RatFunc k` for characteristic-zero fields `k`,
and specified localizations of the Laurent ring. Inputs using denominators
`q^a−q^(-a)`, `a>0`, require these elements to be units.

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
with geometric orientation selecting strictly transverse degrees. These give a §0.8
*GradedCorrespondence*, also for compatible quotient towers `S_k,q_k`.
For a monoid algebra quotient `S=R[Q]/I`, monomial face data consist of a kink
exponent `κ_b∈Q` and a tangential function `f_b∈S[Λ_b]`, with `q_b=z^{κ_b}f_b`;
`z^{κ_b}` denotes its image in `S`.

*Targets.*
- *functionWallAction*: multiplicativity, inverse `Θ_{f⁻¹}`, composition
  `Θ_f Θ_g=Θ_{fg}` for weight-zero units, compatibility with truncation and
  naturality under graded maps sending `f` to `f'`. On algebras over a fixed scalar
  ring these are algebra automorphisms when the scalars have weight zero.
- *functionWallAction_eq_exp*: over a commutative `ℚ`-algebra, in a complete
  filtered coefficient algebra with `I=F¹A`, for `f∈1+I` and a
  filtration-preserving normal degree derivation `D_ℓ`, prove
  `Θ_f=exp(log(f)D_ℓ)` at finite order and after completion. This identifies
  the function-wall action with the §0.6 BCH action.
- *slabNormalForm*: for arbitrary `q`, `N_b` is free over `S[Λ_b]` with basis
  `{X^a | a≥0} ∪ {Y^a | a≥1}`. The chamber maps are jointly injective; the
  lifts have the stated source images and define transfers compatible with
  scalar extension and truncation. Write `Z_n=X^{−n}` for `n<0`, `Z_n=Y^n`
  for `n≥0`. Prove `Z_n Z_m=q^r Z_{n+m}`, `r=(|n|+|m|−|n+m|)/2∈ℕ`, and obtain
  the homogeneous transfer coefficients by expanding `q^a` in the tangential basis.
- The graph correspondences of §§4.1–4.3's tropical vertex, principal and quantum
  actions, and the slab correspondences, instantiate §0.8. For each pair of compared
  cutoffs, coefficient and degree maps give natural transformations on the common span
  `b→u`, `b→v`, and these are §0.8 morphisms. Restrictions and maps of completed
  coefficient objects are §0.7 comparisons of limits and reindexings.

**Checks.**
- In `S[w,w⁻¹][X,Y]/(XY-t(1+w))`, the incoming lift `X^a w^b` has right chamber
  image `t^a y⁻ᵃ Σ_{j=0}^a binom(a,j)w^{b+j}`.

*Needs:* §§0.3, 0.6–0.8, 1.5, 4.1–4.3; `GradedAlgebra`, `Units`, localization,
polynomial and Laurent polynomial algebras. Sources: GS §2.3; GHS Definitions
3.1–3.3; MAN Example 2.1(i) for the exponential comparison.

## Layer 5: broken lines, general position and theta transport

### 5.1 Graded actions and shifted coefficient modules

Let `R` be a commutative `ℚ`-algebra and `A=⊕_{p∈Γ}A_p` an associative,
possibly noncommutative, `Γ`-graded `R`-algebra. Let §3.1's Lie algebra act
`R`-linearly by derivations, with `g_n A_p⊆A_{n+p}` (*graded action condition*)
and `h_{n,m}A_p=0` whenever `m(ρ(p))=0` (*annihilation condition*).
An *ordinary wall* here is a §3.2 wall with this action. For graded Lie modules
retain the same conditions and omit products.

For `p∈Γ`, the *shifted module* `M_p=⊕_{n∈P}A_{p+n}` has relative degree
`δ(n)` on `A_{p+n}`; its order-`k` quotient retains `δ(n)≤k`.
The instances are §4.1's tropical vertex action, §4.2's principal action with its
degree lattice and projection, and §4.3's inner action on twisted group algebras.

*Targets.*

- *IsWallAnnihilating*: the annihilation condition, as a class on the action. It and
  the graded action condition hold for the three instances.
- *ShiftedCoefficients p*: §0.3's completion `M̂_p`, with the induced `Ĝ`-action (§0.6),
  *homogeneousComponent* maps and products `M̂_p×M̂_{p'}→M̂_{p+p'}`.
  Each coefficient is a finite sum by §0.1. For `γ∈Ĝ` and `a∈A_p`, the
  relative-degree-zero component of `γ·a` is `a`.
- Action, components and products are natural under §3.1's morphisms and coordinate
  changes `(T_Γ,T_Λ,φ)`, through *completedMap* `φ`, together with graded
  algebra maps `ψ` satisfying `ψ(A_q)⊆A'_{T_Γq}` and
  `ψ(x·a)=φ(x)·ψ(a)`. For modules retain the action and component statements.
- *zeroDirectionComponent*: an ordinary wall action fixes `A_p` when `ρ(p)=0`
  and has zero component map `A_p→A_q` when `p≠q` and `ρ(q)=0`.
- Realize each order-`k` shifted module as one of §0.8's graded modules `M_u`, with
  ordinary-wall correspondences given by the identity and the signed group action.

*Needs:* §§0.1–0.6, 0.8, §3.1 and Layer 4; `GradedAlgebra`, `GradedLieModule`.
Sources: MAN §2.1 and Definition 2.10.

### 5.2 Decorated broken lines

Use §1.5's base and incoming datum `(s,a)`, with the chamber modules `M_u` and the
face correspondences of its regular coefficient tower over a semiring. Fix an order
`k` and an endpoint `Q` in a chamber.

A *BrokenLine* is a proper continuous path `β:(−∞,0]→B₀` ending at `Q`, with
finitely many strictly increasing crossing times below `0` and nonzero homogeneous decorations
`a_i∈M_{u_i,k,p_i}` giving velocity `−ρ(p_i)` in affine coordinates. Its first segment
is an *IncomingTail* admitted by `(s,a)`. Record every encounter with an active
ordinary wall or a slab face (§1.5); open segments miss these supports, crossings are
transverse to every active normal encountered, and paths avoid `Σ_k`.
The next decoration is an entire nonzero component
`pr_{v,η}(λ_{v,b}L_{u,b,p_i}(a_i))` of the §0.8 transfer. Ordinary walls use the
graph correspondence of the signed action. Use §1.5's admissibility and normal-velocity
conditions. Affine and slab instances specialize this definition and its evaluation maps.
*Artificial subdivisions* insert or delete breakpoints away from encounters, preserving
degree and decoration under chart identifications; they define the same line.

A *DecoratedType* records *IncomingTypeDatum*, chamber/face itinerary, degrees and
chart/deck labels modulo coordinate identifications and artificial subdivisions.
Component maps determine its decorations. Its *realizations* additionally specify
endpoints, crossing times and tail positions.

*Targets.*

- Path evaluation, the map to *DecoratedType*, initial and final decorations, and the
  component propagation maps, with their subdivision and truncation laws.
- In §5.1's affine instance, every nonidentity component shift lies in `P\{0}`
  and raises relative degree, so at order `k` there are at most `k` such changes.
  Identity components fix decorations; shifts in `ker ρ` are recorded.
- *weightedEvaluation* sums final decorations over finite evaluation fibers.
- *brokenLine_coefficientEmbedding*: over the same face presentation and incoming
  records, a §0.8 morphism with injective chamber maps and degree isomorphisms
  preserving `ρ` and admissibility gives a bijection of broken lines for an input
  and its image. Construct the inverse by lifting successive components; retain
  the whole path and incoming tail. The bijection respects endpoint, type and weight.
- For general coefficient morphisms preserving velocities and incoming records,
  §0.8's component expansion gives equality of finite weighted sums after grouping
  degree histories and deleting zero components. Prove identity, composition,
  subdivision and truncation laws for both comparisons.
- For a *ConstantIncomingSection*, weighted evaluation is the corresponding constant
  section; in §5.1 this includes every `a∈A_p` with `ρ(p)=0`.

**Checks.**

- Artificial subdivisions and zero output components add no broken lines. Zero
  input has weighted evaluation `0`.
- In the empty one-chart diagram on `V`, for fixed nonzero `a∈A_p` with `ρ(p)≠0`
  and incoming cell `V`, the unique line at `Q` is `β_Q(t)=Q−t i(ρ(p))`. These
  lines form one *DecoratedType*, with endpoint chart `V` and varying transverse
  tail positions.
- In `A=ℚ[x,x⁻¹,t]/(t²)`, graded by `Γ=ℤ²` with `deg x=(1,0)`,
  `deg t=(0,1)` and `ρ(r,s)=r`, give `{0}⊂ℝ` coorientation `u↦u` and
  label `θ(x)=x(1+t)`, `θ(t)=t`. At a right-to-left crossing with incoming
  decoration `x`, the possible next decorations are exactly `x` and `tx`,
  both with velocity `−1`.

*Needs:* §§0.8, 1.1–1.3, 1.5, 3.2 and 5.1.
Sources: MAN Definition 2.10 and Proposition 2.13; GHKK Definitions 3.1–3.3 and
Proposition 3.4; GHS Definitions 3.1–3.3.

### 5.3 Endpoint evaluation, closed families and general position

Fix `(s,a,k)` on §1.5's base. The bounded-itinerary construction uses, near each
regular endpoint, finitely many lifted polyhedral cells, face presentations and
incoming records, with affine transitions extending to their closures in `B`.
Every contributing path, including its incoming tail, must have a representative
there with at most `L` encounters, counting changes of cell or chart.

For a fixed itinerary, reconstruct backwards from `X(Q)=Q`: intersection with
`m=c` has parameter `τ=(c−m(X(Q)))/m(i(ρ(q)))` when the denominator is nonzero.
Crossing order, cell membership and incoming-tail conditions give its *valid endpoint
domain*. A *FiniteClosedTypeFamily* consists locally of finitely many complete
*DecoratedType*s exhausting the paths, with these domains stratified into relative
interiors of closed polyhedra. The endpoint maps extend to closed affine embeddings,
proper over compact endpoint sets. Weights and discrete labels are constant on each
branch; at its boundary encounters converge in `B`, with finite crossing times and
the prescribed tail identifications. Zero-length segments and encounters with `Σ_k`
are retained as degenerations.

*Targets.*

- *boundedItineraries_finiteClosedTypeFamily*: enumerate the finite tree of face
  choices and nonzero transfer components to depth `L`. Backward reconstruction and
  §1.3 construct *BrokenLineFamily*, satisfying *IsFiniteBranch*, and its closed
  family. Prove exhaustivity, uniqueness for fixed endpoint and type, and independence under
  subdivision. Codimension-one boundary events are terminal crossings, collapsed
  segments, joint/singular encounters and incoming-record identifications, including
  tangential source faces; all remaining degenerations have codimension at least two.
- *filtrationEncounterBound*: let component transfers preserve
  `F^0M=M ⊇ ⋯ ⊇ F^rM=0` in each chamber.
  Mark steps that raise filtration, and suppose each intervening block has at most
  `h` unmarked encounters. A nonzero history has at most `r−1` marked steps and
  at most `r h+r−1` encounters. This supplies `L` for the preceding construction.
- *affine_finiteClosedTypeFamily*: apply this with relative degree, `r=k+1` and
  marked nonidentity components. Between them the path is straight and meets each
  convex active wall at most once. This gives finitely many complete types across
  all endpoints and their closed realization family.
- *positiveKink_finiteClosedTypeFamily*: for §4.4 monomial data over a commutative
  ring `S` with homogeneous ideal `J`, `J^r=0`, require `z^{κ_b}∈J` at base facets
  and ordinary wall functions `1` modulo `J`. On finitely many convex cells, walls
  and incoming records, prove that facet crossings and degree changes
  raise `J`-order; intervening straight segments supply `h`. Apply the same
  construction. For Noetherian toric graded quotients `S=A[Q]/I`, take `J=√I/I`.
- *singleFaceBrokenLines*: glue two affine half-spaces along `H={ν=c}`, with
  singular set `Σ⊆H` closed polyhedral of ambient codimension at least two. Allow
  finitely many affine transition maps fixing `H` pointwise and preserving `ν`.
  In chamber coordinates the face pieces have the same §0.8 span and admissible
  lifts; there are no other walls. For nonzero `a∈M_{u,γ}`, write `μ_i=i_i∘ρ_i`
  and admit exactly all affine tails of velocity `−μ_u(γ)` in its half-space.
  Require `ν(μ_u(γ))≠0` and `ν(μ_v(η))=ν(μ_u(γ))` for each nonzero
  `a_η=B^{γ,η}(a)`.
  Prove at most one crossing and apply the bounded-itinerary construction. Opposite
  fibers are indexed by such `η` with `X∉Σ`, where
  `T=(ν(Q)−c)/ν(μ_v(η))<0`, `X=Q−Tμ_v(η)`; incoming fibers are uniquely unbent.
  Generic weighted values are `λ_v L_{u,γ}(a)` and `a`, respectively.
- *endpointDiscriminant*: branch frontiers lie in a finite *ExceptionalArrangement*
  `Δ(a,k)` in each endpoint chart. Its complement, the *GenericEndpoint*s, has
  finite, locally stable fibers; countably many inputs have a dense common generic
  locus. In the affine case include affine spans of the shadows
  `σ−ℝ_{≥0}i(ρ(p+n))`, `δ(n)≤k`, of singular-support cells. Tangent ordinary walls
  contribute trivially by §5.1's annihilation condition.
- *incomingBranchGerm*: choose `r` so each `i(ρ(q))+r` avoids the arrangement
  directions and preserves every nonzero `m(i(ρ(q)))` sign. Then
  `x^-=x+ε(i(ρ(q))+r)` is generic for small positive `ε`, also after finite refinement.
- Families glue on endpoint covers by identifying representatives of the same
  complete global histories on overlaps. Construct common polyhedral refinements
  and prove independence of cover and coordinates. §5.2's coefficient embeddings
  transport closed families in both directions; general coefficient comparisons
  preserve finite weighted evaluation by grouping histories.

**Checks.**

- For active walls `{x=0}`, `{y=0}`, `ρ=id` and incoming degree `p=(−1,−1)`, the diagonal
  `{x=y>0}` lies in an open chamber and in `Δ(a,k)` by joint incidence.
- The arrangements `{x=1/(j+1)}` in `ℝ` have common generic point `0`, but no
  neighborhood of `0` is generic for all of them.

*Needs:* §§0.3, 0.8, 1.2–1.3, 1.5, 4.4 and 5.2.
Sources: CPS Proposition 4.4 and Definition 4.6; N23 Definition 7.2 and the proof of
Proposition 7.6; GHS Proposition 3.5, Remark 3.6 and Lemma 3.7.

### 5.4 Local resolutions and gluing of sections

Let finitely many cooriented walls in `V` have labels in a group `G` acting on `M`.
Labels of coincident regular germs commute. Segment transport `P_{yz}` has factors
`θ^{side(y)−side(z)}` in crossing order, first rightmost, with `side=1` on `m>c`
and `0` otherwise. Simultaneous crossings combine these factors; reversal inverts
their product. *coefficientPathTransport* composes segment transports along admissible
PL paths in `V∖SingularSupport`.

A sheaf of types is *IsLocallyConstantSheaf* if each point has a neighborhood whose
restrictions to nonempty preconnected opens are bijective.
*CoefficientLocalSystem* sheafifies the `M`-valued functions with
`s(z)=P_{yz}·s(y)` for every segment in their domain; shifted modules give instances.

At a codimension-one boundary event of a *FiniteClosedTypeFamily*, fix the exterior
pieces. The nearby local histories on either side, with their composite component
maps from an input module `H`, are its *local resolutions*. Require uniform finite
contributing support on `H`; for arbitrary source modules test every finite list of
inputs by a map `H=R^n→E_s`, followed by `α_e` at source identifications.
A *LocalResolutionCertificate* gives equality of the two sums in each outgoing
degree at nonterminal events, and a common lift `H→N_b` of the two chamber sums
at terminal faces, including tangential inputs. Joint injectivity makes this lift unique.

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
- *localResolution_expansion*: restrict §5.3's closed polyhedral charts to a
  transverse interval and group by exterior pieces. Construct both exhaustive local
  resolutions and their concatenations with the exterior. Compute their sums by
  §0.8's finite component expansion, retaining the incidence inequalities selecting
  each itinerary. Thus equal local operator expressions give the nonterminal
  identities; common lifts give the terminal ones.
- Certificates respect subdivision, concatenation and coefficient morphisms.
  Under *brokenLine_coefficientEmbedding*, reflect their identities through the
  injective chamber maps; a terminal lift descends when it has a specified preimage
  in the source face module. Compatible certificates glue on endpoint covers.
- *singleFaceResolution*: for the families of *singleFaceBrokenLines*, the sum
  of outgoing components is `λ_v L_{u,γ}(a)`, with source image `a`.
  Component expansion supplies the terminal common lift and the identities across
  singular-degeneration strata: the component maps in chamber coordinates agree
  across face presentations. Tangential inputs use §1.5's common source lifts.
  This constructs the certificate for graph and slab correspondences alike.
- *finiteSum_matchingFamily*: on a locally finite polyhedral stratification of
  §1.5's chambers, finite sums of linear maps `H→M_u` agreeing across interior
  facets and admitting common face lifts extend uniquely to a matching family when
  the spans are jointly injective. Prove compatibility with overlaps, coefficient
  maps, refinement and regrouping.
- *globalThetaSection*: apply *finiteSum_matchingFamily* to *weightedEvaluation*
  using a closed family and its certificate, with `H=R` and `1` sent to each
  branch weight. This gives the unique matching family `ϑ_{s,a,≤k}` extending
  generic values. *globalTheta_transport* gives *coefficientPathTransport* along
  ordinary paths and `ϑ_u=λ_u(ϑ_b)`, `ϑ_v=λ_v(ϑ_b)` at faces.
- Prove linearity by common refinements for finite sets of inputs, and naturality
  under coefficient maps, coordinate changes, weighted refinements and restrictions
  retaining global histories. Truncation through §1.5's refinement isomorphisms
  gives the completed section `ϑ_{s,a}=lim_k ϑ_{s,a,≤k}`.
- *slabTheta_normalForm*: in the single-face setting with §4.4's span and full
  half-space incoming data, transverse monomials and tangential records with common lifts `z^λ∈N_b`
  give sections represented by `X^d z^λ`, `Y^d z^λ` and `z^λ`; zero velocities use
  *ConstantIncomingSection*s.
  Identify the matching-section algebra with `N_b` by §0.8; *slabNormalForm*
  gives its theta basis and multiplication, compatibly with scalar extension and
  truncation. In a tower, the inverse limit consists of coefficient families
  with finite support at each order. Coefficient embeddings with a face isomorphism
  transport this identification to the subdiagram whenever the chamber values lie
  in the embedded modules.

*Route:* A generic endpoint path meets finitely many boundary events. Apply
*localResolution_expansion* at each, then *facetDescent* inside chambers and joint
injectivity at coefficient faces.

**Checks.**

- With one wall `{x=0}`, normal `e_1*`, label `θ` and `θ·a≠a`,
  a family constant equal to `a` on both sides is not a section: the facet equation
  is `s(Q⁺)=θ^{-1}·s(Q⁻)` for `Q⁺` on the side `x>0`.

*Needs:* §§0.7–0.8, 1.1–1.2, 1.5, 2.1, 3.2, 4.4 and 5.1–5.3;
`TopCat.Sheaf`, `TopCat.PrelocalPredicate.sheafify`,
`TopCat.subsheafToTypes`. Sources: Curry for *facetDescent*; GHS §3.2 for
local identities at walls and slab lifts; GHS Proposition 3.16 and Theorem 3.19,
and CPS Lemmas 4.7 and 4.9 for gluing.

### 5.5 Module probes and affine theta transport

Fix a consistent §3.2 diagram `𝔇` acting as in §5.1, an order `k` and `a∈A_p`.
The *module probe* is `g⋉M_p`, with `M_p` abelian. Set
`Γ_ext=Γ⊕ℤ`, `Λ_ext=Λ⊕ℤe_z`, `ρ_ext(x,c)=(ρ(x),0)`,
`P_ext={(n+cp,c):n∈P,c∈ℕ}` and `δ_ext(x,c)=δ(x)+(1−δ(p))c`.
The pieces `g_n` and `A_{p+n}` have degrees `(n,0)` and `(p+n,1)`.
Normals `(m,0)` carry the old wall spaces, nonzero multiples of `e_z*` carry the
module pieces, and all other spaces vanish. *Module charge* is the second degree
coordinate. Cylinder walls are `𝔡×ℝe_z`; the *probe wall* is `z=0`, with
degree `(p,1)`, normal `e_z*` and label `exp(a)`. Write `Θ` for *weightedEvaluation*.

*Targets.*

- *moduleProbe*: the datum satisfies §3.1, the mixed bracket of `h_{n,m}` with
  `A_{p+n'}` having normal `m(ρ(p+n'))e_z*`; when this normal is zero the bracket
  vanishes by annihilation. Positivity follows from `δ_ext(n+cp,c)=δ(n)+c`.
  For `P=C∩Γ`, set `C_ext=cone(C×0,(p,1))` and prove `P_ext=C_ext∩Γ_ext`.
  Old rays lift by `w↦(w,0)`; the module ray group at
  `(p+n,1)`, `n∈P`, is `exp(A_{p+n})`, with no higher-charge pieces.
  Charge one through order `k+1` is `M_{p,≤k}`.
  Cylinder lifting preserves consistency, incomingness and outgoingness.
- *probeCompletion*: apply *relativeAbelianCompletion* with quotient the cylinder
  diagram. Module walls lie in `z=0≃V`, and added walls are outgoing. At regular `Q`,
  define `F(Q)∈M_{p,≤k}` by the upward crossing label `exp(−F(Q))`, independently
  of the short segment. Regularity excludes old supports and module-wall boundaries.
- *probeTransport*: rectangles and `G exp(v)G⁻¹=exp(G·v)` give
  `F(Q')=𝔭_{γ,𝔇}·F(Q)` along admissible paths. Outgoingness gives
  `F_{p+n}(Q+Ti(ρ(p+n)))=1_{n=0}a` for large `T` at regular points.
  If `ρ(p+n)=0`, there is no outgoing wall of that degree and the component
  is already `1_{n=0}a`.
- *backwardRayOperator*: choose a finite exceptional arrangement containing the
  old supports' affine hyperplanes, module-wall boundary spans and §5.3's
  discriminant. On its complement `Ω`, for each `q=p+n` with `ρ(q)≠0`, list
  the regular encounters `x` of `Q+ℝ_{>0}i(ρ(q))` and fix sufficiently close
  incoming points `x^-∈Ω` by §5.3. Define a linear operator on `E=(Ω→M_{p,≤k})` by
  `(Uf)_q(Q)=Σ_x Σ_{δ(n')<δ(n)}pr_q(U_x^q f_{p+n'}(x^-))`, where
  `U_x^q` is the combined action crossing toward `Q`. Put `(Uf)_q=0` for
  `ρ(q)=0`. Prove finiteness and filtration increase, hence `U^{k+1}=0`.
- *brokenLine_recursion*: deleting the last positive-degree change gives a
  weighted decomposition into the preceding evaluation fibers at `x^-` and their
  nonzero output components. Normal-velocity equality identifies the incoming side.
  For the inverse, deform the prefix to endpoint `x` in §5.3's closed chart and
  attach the segment to `Q`, recording intervening identity crossings. Prove that
  genericity excludes contributing singular degenerations. Retain shifts in `ker ρ`
  and discard zero outputs. Thus `Θ=b+UΘ`,
  where `b(Q)=a` in degree `p`, including §5.2's constant-section case.
- *probe_recursion*: independently, sum the component jumps of *probeTransport*
  along each backward ray and use its far-ray value to obtain `F=b+UF`.
  §0.8's finite recursion now proves *probeWall_eq_brokenLineSum*, `F=Θ` on `Ω`.
  §5.3's local stability extends the equality over the broken-line generic locus;
  prove independence of the auxiliary arrangement and incoming-point choices.
- *operatorProbe*: for any `R`-module `H`, replace the pieces by
  `Hom_R(H,A_{p+n})`, with post-composition action and initial map `H→A_p`.
  At finite order their direct sum is `Hom_R(H,M_{p,≤k})`. Evaluation preserves
  probe labels and both recursions. Taking `H=A_p` and initial map `id`
  gives identities of linear maps for all incoming coefficients simultaneously.
- *affineLocalResolution*: at a codimension-two joint and fixed order, form the
  incident tangent diagram and prove consistency by rescaling admissible loops. Apply
  *operatorProbe* to this diagram, whose supports need not be full hyperplanes.
  Identify its fibers with the local resolutions by rescaling §5.3's boundary charts;
  *probeWall_eq_brokenLineSum* and *probeTransport* give their component-map
  identities. Concatenate exterior pieces by *localResolution_expansion* to
  construct the certificate; terminal events use graph lifts.
- *thetaSection* is §5.4's *globalThetaSection* applied to
  *affine_finiteClosedTypeFamily* and *affineLocalResolution*, valued in
  *CoefficientLocalSystem*; *theta_transport* specializes *globalTheta_transport*.
- *theta_coeffMap*: for a fixed-degree wall-space map `f` and intertwining filtered
  coefficient map `φ` as in §5.1, after restriction of scalars, §5.4 gives
  `φ(ϑ_{𝔇,a,Q})=ϑ_{f_*𝔇,φ(a),Q}` at finite order and after completion;
  `f_*𝔇` maps labels by *completedMap* `f`.

**Checks.**

- For `{x=0}` with normal `m=e_1*`, function `1−z^n` with `n∈P\{0}` and
  `m(ρ(n))=0`, and initial `z^p` with `m(ρ(p))=1`, the chamber values
  are `ϑ_Q=z^p` for `Q_x>0` and `ϑ_Q=z^p−z^{p+n}` for `Q_x<0`.

- Restricting this one-wall example to `U={x<−1}` gives `z^p−z^{p+n}`,
  although the wall misses `U`: the family retains incoming tails and bends outside
  `U`. For the empty full-space diagram with initial `z^p`, the theta is `z^p`.

*Needs:* §§0.8, 1.4, 3.1, 3.3–3.4 and 5.1–5.4;
`LieAlgebra.SemiDirectSum`, `LieDerivation`.
Sources: MAN Theorem 2.14 and §3.3.3; LMY §3.

### 5.6 Monomial presentations and comparison of theta constructions

A *MonomialPresentation* chooses a basis `z^p` for each nonzero chamber
homogeneous piece, free of rank one over the common commutative scalar ring.
Truncation sends each basis element to its corresponding element or to zero.
A monomial broken line is §5.2's line in these bases, using whole homogeneous
components of the propagation maps. In §4.2's skew setting, initial polynomials
are arbitrary over a commutative `ℚ`-algebra `R`.

For §4.2's principal coefficients, the principal comparison projects `L_pr→M°`,
`(m,n)↦m`, on degrees and spatial coordinates. Write `z^{(m,n)}=t^n z^m`, grouping
terms with the same `m` into one projected homogeneous component. The walls in
`L_pr,ℝ` are the inverse-image cylinders of the projected walls.

*Targets.*

- The standard principal and quantum bases give *MonomialPresentation*s. Their
  ordinary-wall components are §4.2's wall-function powers and §4.3's conjugation
  formula, respectively.
- *monomial_exponent_dictionary*: for a §4.2 principal wall with primitive normal
  `m₀=κ(n)ν_n` and `q=(m,a)`, the exponent of the monomial action is
  `|m₀(q)|=|⟨κ(n)n,m⟩|` (GHKK).
- *cylinderBrokenLineLift*: for each contributing principal exponent history, a
  projected path has a unique lift with endpoint `(Q,0)` and initial exponent `(m,0)`,
  obtained by integrating the forgotten coordinate velocities backwards. It crosses
  exactly the corresponding walls with the corresponding incoming tail, and every
  contributing principal path arises from this lifting. Prove that at each cutoff a
  projected type has finitely many contributing principal refinements. Retain zero projected shifts as coefficient
  changes, using §5.2's evaluation of *ConstantIncomingSection*s for zero initial direction.
- *theta_eq_monomialBrokenLineSum*: express §5.4's weighted evaluation in a
  *MonomialPresentation*. Its finite sums and completed sections are §5.5's
  *thetaSection* in these bases.
- *principalTheta_eq_projectedMonomialSum*: `z^{(m,n)}↦t^n z^m` sends §4.2's
  principal theta to the projected monomial sum. This is a weighted pushforward:
  several principal degree histories can combine into one projected homogeneous
  decoration. Prove equality at each finite order, then in the inverse limit.
- *theta_presentationInvariant*: equivalent consistent §3.2 diagrams
  have equal theta sections for §5.1's coefficient action, hence equal
  *homogeneousComponent* coefficients and, in a monomial presentation, equal monomial
  sums at common generic endpoints and orders, by relative uniqueness and
  *probeWall_eq_brokenLineSum*.
- Apply §§0.8 and 5.4 to coefficient regradings with finite contributing refinements;
  base changes additionally use the geometric lift and incoming-tail correspondence above.

*Needs:* §§4.2–4.3 and §§5.1–5.5.
Sources: CPS Proposition 3.2, Proposition 4.4 and Lemmas 4.7, 4.9 in
2205.07753v2, PDF 11–18; N23 Proposition 7.6, Lemmas 7.7–7.8 and §7, PDF 96–98.

## Layer 6: integral-affine covariance, descent and a worked example

### 6.1 Integral-affine covariance

A *DirectedAffineIso* consists of an *IntegralAffineEquiv* `f` with tangent-lattice
map `T:Λ≃Λ'`, a lattice isomorphism `S:Γ≃Γ'` with `T∘ρ=ρ'∘S` and `S(P)=P'`,
and a graded Lie isomorphism `φ` taking `h_{n,m}` onto `h'_{Sn,m∘T⁻¹}`,
with cofinal filtration moduli in both directions. Supports move by `f`, degrees by
`S`, tangent vectors by `T`, normals by the dual inverse and labels by *completedMap*.
A *CoefficientIso* over an integral-affine isomorphism of §1.5 bases consists of
exponent-system isomorphisms commuting with `ρ` and mutually inverse §0.7 diagram
comparisons after cofinal reindexing. They carry chambers and faces onto corresponding
supports and preserve §0.8 spans, gradings, admissible lifts and incoming records.
For algebra actions, `ψ(A_q)=A'_{Sq}` and `ψ(x·a)=φ(x)·ψ(a)` give the coefficient
instance associated to a *DirectedAffineIso*.

*Targets.*
- *mapAffineDiagram*: transport preserves incoming/outgoing walls, equivalence,
  consistency and path products, with identity, composition and inverse laws for
  both geometry and coefficients; on §2.1 complexes it is *image*. Restrictions
  transport wall germs and paths in their domains with the same product identity,
  using §1.5's unique affine extension on each connected overlap component.
- *theta_affineCovariance*: pull back geometry by `f` and apply §§5.2–5.4's
  coefficient comparison and family transport. Obtain
  `ψ(ϑ_{a,Q})=ϑ_{ψ(a),f(Q)}`, with identity, composition, inverse and truncation
  laws; cofinal reindexing gives the completed equality.

**Checks.**
- The swap `(x,y)↦(y,x)` of `ℤ²`, of determinant `−1`, sends `{x=0}` with normal
  `e_1*` to `{y=0}` with normal `e_2*`. The identity
  `⟨m∘T⁻¹,Tv⟩=⟨m,v⟩` preserves the crossing factor without a determinant sign.

*Needs:* §§0.5, 0.7–0.8, 1.1–1.2, 1.5, 2.1, 3.1–3.2 and 5.1–5.6;
`AffineEquiv`, `IsIntegralLattice.extend`, `realCharacter_comp`.

### 6.2 Descent of coefficient diagrams and transport

At each cutoff, a *DescentDatum* on §1.5's `(B,Δ)` consists of, on each chart, §0.7
labels, a coefficient diagram with chosen §0.8 correspondences, and a wall
presentation. The restriction maps to overlaps may be quotients or localizations. On
each nonempty overlap component, the restricted data carry §6.1 coordinate
identifications, label equivalences, and coefficient isomorphisms intertwining the
actions. These preserve the correspondences and regular loci and satisfy identity,
cocycle and truncation equations. For comparisons across geometric refinements,
require jointly injective facet spans. These refinements are compared by §1.5's
restriction isomorphisms, and changes of cutoff by §0.7's reindexing.
Local consistency means identity label transport on every contractible admissible
chart loop.

Use §1.5's regular locus `B∖Σ_k`. The *invertible locus* consists of chambers and
regular faces whose two maps `λ` are isomorphisms. In the fixed-model case a group `H` acts
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
- *globalTheta_descent*: for a global incoming datum, glue compatible local closed
  families and certificates retaining whole global histories by §§5.3–5.4.
  Their bounded-itinerary and component-expansion constructions commute with this
  gluing. With jointly injective face spans, apply *globalThetaSection* to the
  descended diagram. Prove atlas-refinement, coefficient-map and truncation laws,
  and *globalTheta_transport* on the invertible locus.

*Needs:* §§0.7–0.8, 1.5, 2.1, 5.3–5.4 and 6.1;
`ChartedSpace`, `StructureGroupoid`, `SemidirectProduct`, `TopCat.Sheaf` and §5.4's
*facetDescent*.

### 6.3 Worked example: the focus-focus slab and its theta basis

This example applies the slab, descent and theta constructions to the focus-focus
affine singularity (GS §2.2).

Take `B=ℝ²`, `Δ={(0,0)}`, with left and right chambers `u<0` and `u>0` and the
slab `u=0`. Chart extensions across the slab have transition the identity on the lower
overlap and `T(u,v)=(u,v−u)` on the upper overlap, defining the affine structure on
`B₀`.
The exponent lattice is `Γ=ℤ³`, with
`ρ(a,b,h)=(a,b)`, and monoid
`Q={(a,b,h):h≥0, h−a≥0}`. Write
`x=(-1,0,0)`, `y=(1,0,1)`, `w=(0,1,0)` and `t=(0,0,1)` for its monomial degrees;
`x+y=t` and `w` is invertible. The upper exponent transition is
`S(a,b,h)=(a,b−a,h)`, so `ρS=Tρ`; it preserves `Q` and the respective chamber
orders `ord₋(a,b,h)=h` and `ord₊(a,b,h)=h−a`.

For a commutative ring `K`, set `S_k=K[t]/(t^{k+1})`, `f=1+w` and `f'=1+w⁻¹`.
Use the algebras

`R₋,k=S_k[x₁,y₁,w^{±1}]/(x₁y₁−t, y₁^{k+1})`,

`R₊,k=S_k[x₂,y₂,w^{±1}]/(x₂y₂−t, x₂^{k+1})`,

`B_i,k=S_k[x_i,y_i,w^{±1}]/(x_i y_i−t, x_i^{k+1}, y_i^{k+1})`,

and `D_k=B_2,k[f⁻¹]`, with the quotient maps `q₋:R₋,k→B_1,k` and
`q₊:R₊,k→B_2,k`. The overlap maps are
`h_II(x₁,y₁,w)=(x₂,y₂,w)` and
`h_III(x₁,y₁,w)=(w x₂,w⁻¹y₂,w)`.
On `D_k`, let `g_f(x₂,y₂,w)=(f x₂,f⁻¹y₂,w)` and define `g_f'` by the same formula
with `f'`. They are §4.4's weight-zero function automorphisms for the weight `(a,b,h)↦a`
and the unit `f⁻¹`, respectively `(f')⁻¹`. Since `f=w f'`,

`g_f ∘ h_II = g_f' ∘ h_III : B_1,k → D_k`.

Put `α₋=(g_f∘h_II)∘q₋` and let `α₊` be `q₊` followed by localization. The coefficient
diagram contains the gluing cospan `R₋,k —α₋→ D_k ←α₊— R₊,k` and its limit
`A_k=R₋,k ×_{D_k} R₊,k`, the slab coefficient algebra, whose two projections form the
§0.8 span. In `A_k` define `X=(x₁,f x₂)`, `Y=(f y₁,y₂)` and `W=(w,w)`. The horizontal
weight `a` descends to `A_k`. The projections are jointly injective, the left one is
injective on weights `a≤0` and the right one on weights `a≥0`, and these weights are
the admissible degrees on the two sides. The lifts are
`t^r x₁^d w^b ↦ t^r X^d W^b` from the left and `t^r y₂^d w^b ↦ t^r Y^d W^b` from the
right (`d,r≥0`, `b∈ℤ`), extended `K`-linearly to whole homogeneous pieces, with zero
lifts on zero pieces. At weight `a=0`, the maps `α_±:K→M_±`, `α_±(c)=c t^r w^b`, have
the common lift `ℓ(c)=c t^r W^b`. Propagation is the projection to the opposite side
followed by its chamber homogeneous decomposition.
The chamber embeddings
`ι₋:R₋,k→S_k[x₁^{±1},w^{±1}]`, `y₁↦t x₁⁻¹`, and
`ι₊:R₊,k→S_k[y₂^{±1},w^{±1}]`, `x₂↦t y₂⁻¹`, are injective localizations.
Composing with the projections of `A_k` gives §4.4's slab maps for `q=t(1+w)`.

*Targets.*
- *focusFocusAlgebra*: prove the `S_k`-algebra isomorphism
  `e:S_k[W^{±1},X,Y]/(XY−t(1+W)) ≃ A_k`, with the displayed generator images,
  compatible with `K→K'` and `k+1→k`; *slabNormalForm* gives its basis and flatness.
- *focusFocusDatum*: construct the displayed atlas, exponent system, monoid algebras
  and chamber-order quotients, and the §0.7–0.8 coefficient diagram with its stated
  admissible lifts and full half-space incoming data. Prove the overlap and reduction
  squares, injectivity assertions and compatibility of lifts with both crossing descriptions. On the common span
  `b→u`, `b→v`, the maps `ι₋`, `e⁻¹` and `ι₊` form a natural transformation to
  §4.4's slab diagram, preserving lifts, exponent projections and incoming records.
- *focusFocusBrokenLines*: apply *brokenLine_coefficientEmbedding* to the displayed
  span comparison. In chamber coordinates, `T` fixes the slab pointwise and
  `g_f h_II=g_f' h_III` identifies its two transfer presentations. Thus
  *singleFaceBrokenLines* and *singleFaceResolution* give the global closed family
  and certificate, including singular and terminal degenerations. For incoming
  `X^d W^b` from the left and `Y^d W^b` from the right (`d≥1`), expand the §4.4 transfers.
  At `Q=(u,v)` in the opposite chamber, branches `0≤j≤d` have decorations and heights
  `binom(d,j)x₂^d w^{b+j}`, `s_j=v+(b+j)u/d` for `X`, and
  `binom(d,j)y₁^d w^{b+j}`, `s_j=v−(b+j)u/d` for `Y`. Discard zero decorations.
  For `X`, the lower crossing uses term `j` of `f^d`; the upper uses term `d−j`
  of `(f')^d` after `h_III`. In the incoming chamber each nonzero decoration has
  one unbent line. For `W^b`, use the vertical line when `b≠0` and its decoration is nonzero;
  for `b=0` use the *ConstantIncomingSection* `ϑ_1=1`. The generic locus excludes
  `u=0` and `s_j=0`; their boundary charts are those of the general construction.
- *focusFocusTheta* is *globalThetaSection* for these data. Apply
  *slabTheta_normalForm* through `e` to identify its values, basis and completion
  with `X^d W^b`, `Y^d W^b` and `W^b` in `A_k` and its inverse limit.
- *focusFocusTheta_mul*: index these sections by `ϑ_{n,b}`, with values
  `X^{−n}W^b` for `n<0`, `W^b` for `n=0`, and `Y^nW^b` for `n>0`. Specialize
  *slabNormalForm*'s product to `q=t(1+W)` and expand binomially to obtain
  for `r=(|n|+|m|−|n+m|)/2∈ℕ`
  `ϑ_{n,b}ϑ_{m,c}=t^r Σ_{j=0}^r binom(r,j)ϑ_{n+m,b+c+j}`.
  Over `ℤ` its coefficients lie in the image of `ℕ[t]`; scalar extension gives
  the formula over `K`.

*Route:* Eliminate `t=x_i y_i`; regularity of `1+w` identifies the fiber product.

**Checks.**
- Over `K=ℤ` at `k=2`, `ϑ_{−1,0}ϑ_{1,0}=tϑ_{0,0}+tϑ_{0,1}`.
  At `Q=(1,1)`, incoming `X` and `X²` from the left have respectively two and
  three broken lines, with weights `1,1` and `1,2,1`.

*Needs:* §§0.7–0.8, 1.5, 4.4, 5.2–5.4 and 6.1–6.2;
`AddMonoidAlgebra`, `Ideal.Quotient`, `Localization.Away`, `MvPolynomial`,
and `CategoryTheory.Limits`.
Sources: GS §2.3; GHS Definition 3.3, Proposition 3.5 and Lemma 3.7.

## Layer 7: wall positivity and positive theta coefficients

For commutative skew scattering inputs, this layer constructs representatives whose
grouped wall functions have polynomial or formal-series coefficients in `ℕ[A]`, for a
specified variable set `A`.

### 7.1 Polynomial inputs and positive representatives

Fix an adapted §4.2 datum, allowing degenerate and zero forms, positive integers
`ℓ_i` at unfrozen indices, and independent variables `a_{i,s}`, `1≤s≤ℓ_i`.
For coefficient variables `A`, use `ℕ[A]⊆ℤ[A]⊆ℚ[A]`. A function wall groups
commuting §3.2 ray walls with the same support, primitive coorientation and projected
monomial direction; its function is the product determined by their common logarithmic-derivation
action. Coefficient maps use coefficient monoids, where the variables need not be units.

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
  `M=Hom(N,ℤ)`, the form `ω_B=−{,}`, positive integers `ℓ_j` with `ℓ_j=1` at
  frozen `j`, `gcd(d_i)=1`, `w_i=ω_B(-,d_ie_i)/ℓ_i` primitive in `M`, BLM's injectivity
  of `N_uf∩N°→M`, `n↦ω_B(-,n)`, independent monoid variables `p_{i,s}`, and initial
  functions `f_i=1+∑_{s=1}^{ℓ_i}p_{i,s}z^{sw_i}` on `e_i⊥`.
- *finiteAlphabetLift*: over a commutative `ℚ`-algebra `R`, for a lattice `M`,
  finitely many cooriented affine walls in `M_ℝ` and a finite family `E` of terms
  `c_αz^{m_α}`, `m_α∈M` tangent to their walls, form
  `L_E=M⊕ℤ^E`, `v_α=(m_α,e_α)`, the saturated monoid `P_E=⊕_αℕv_α` with
  `δ_E(v_α)=1`, and cylinder walls with functions `1+Σ_αc_αz^{v_α}` and normals
  pulled back from `M`. Given *PositiveDegrees* `(L,P,δ)`, a surjection `π:L→M` and
  an additive map `τ:L_E→L` with `π∘τ=pr_M` and `τ(v_α)=n_α∈P∖{0}`,
  `τ`, `ν∘pr_M↦ν∘π` is a §4.1 *TropicalPairing* of modulus `λ(k)=k`.
  It induces maps `R[P_E]→R[P]` and of §5.1 shifted modules. Using cylinder supports
  over the same walls in `M_ℝ`, these maps preserve normal pairings, path products
  and outgoing completions for the input `c_αz^{n_α}`. Decompose its logarithms into
  supported rays in `P`, reindex image rays by ambient primitive generators (§4.1),
  and group them.
  If `δ(Σb_αn_α)≤k+1` and some `b_α>0` has `δ(n_α)≥2`, then
  `δ_E(Σb_αv_α)≤k`. For *BLMPolynomialInput*, use `E={(i,s)}`, `m_{i,s}=sw_i`
  on `e_i⊥`, `c_{i,s}=1`, and identify `z^{v_{i,s}}` with `p_{i,s}z^{sw_i}`.

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
  `δ_E≤δ_pr≤ℓ_max δ_E` on `P_E`; image rays are reindexed by their
  ambient primitive generators using §0.1 and grouped.

*Route:* Rescale the adapted basis and form to obtain `p₁*(ε_i)=w_i`. The extension's
frozen diagonal block makes `N_uf∩N°→M` injective and each `w_i` primitive, including
for the zero form; a common rescaling supplies BLM's integrality conditions.

**Checks.**
- For the zero form with `N_uf≠0`, `N_uf∩N°→M` is not injective, and its
  *principalBLMExtension* is a *BLMPolynomialInput*.
- The terms `p_1x`, `p_2x²` of `1+p_1x+p_2x²` lie on different rays of `P_E`.
  The factor `f_u` on the ray of `u=p_1p_2x³` satisfies `[u]f_u=−1`.

*Needs:* §0.3, §§0.5–0.6, §3.2, §§4.1–4.2 and §5.1; `MvPolynomial`, `AddMonoidAlgebra`.
Sources: BLM §8.1, PDF 50–53, §9.2 (Step 3) and Corollary 9.8; N23 §1.

### 7.2 Ordinary binomial wall positivity

For `n∈N⁺` in §4.2's completed skew group, put
`Ψ[n]=exp(Σ_{j≥1}(-1)^{j+1}X_{jn}/j²)`, with products as in Convention 3.
A sequence `n_1,…,n_k` is ordered if `{n_i,n_{i+1}}≥0` and antiordered if
`{n_i,n_{i+1}}≤0` for every `i`. Collinear factors commute and may be grouped or
kept in a fixed tie order. A normalized positive factor is `Ψ[tn]^{sκ(tn)}` for
primitive `n∈N⁺` and integers `s,t>0`, using §4.2's rational normalization.

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

*Route:* The zero-form case commutes. Otherwise exchange adjacent out-of-order
factors by N23's rank-two formula, proving termination at each finite order.

**Checks.**
- With `{e_1,e_2}=1` and `d_1=d_2=1`, `Ψ[e_2]Ψ[e_1]=Ψ[e_1]Ψ[e_1+e_2]Ψ[e_2]`, with
  antiordered left side and ordered right side.

*Needs:* §§1.1–1.2, §§2.1–2.4, §4.2 and §7.1. Sources: N23 Theorem 5.2, Proposition 5.4
and §§5.2–5.5, PDF 53–65 (N23's ordering is the reverse of ours); GHKK Theorem 1.13 and
Appendix C.3, PDF 22, 129–134.

### 7.3 Dyck gradings and the rank-two polynomial formula

The maximal Dyck path of `(d_1,d_2)∈ℕ²` runs from `(0,0)` to `(d_1,d_2)` by
horizontal and vertical unit edges, weakly below and closest to the diagonal. It is
`DyckWord (01)^a` for `(a,a)`, `V^b` for `(0,b)` and `H^a` for `(a,0)`; the empty
path has one grading of weight `1`. Subpaths include endpoint edges and wrap
cyclically at the final vertex. Write the initial polynomials as `P_1(x)=Σ_{r=0}^{ℓ_1}p_{1,r}x^r` and
`P_2(y)=Σ_{r=0}^{ℓ_2}p_{2,r}y^r` with `p_{1,0}=p_{2,0}=1`. A grading assigns grades
`0≤γ_V(v)≤ℓ_1` to the vertical edges and `0≤γ_H(h)≤ℓ_2` to the horizontal edges;
`p=Σγ_V`, `q=Σγ_H`, and its weight is
`wt(γ)=∏_v p_{1,γ_V(v)} ∏_h p_{2,γ_H(h)}`. Put `π_{r,s}(P)=[z^s]P(z)^r`
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
- For coprime `a,b>0` and `k≥1`, *OneBending* `(d_1,d_2;a,b,k)` means that every
  broken line bending only on the coordinate axes and rays `ℝ_{≤0}(a',b')`, `a',b'>0`,
  from exponent `(−d_1,−d_2)` to `(ka−d_1,kb−d_2)`, at any allowed endpoint and
  without a bend on a positive coordinate axis, has exactly one bend, on
  `ℝ_{≤0}(a,b)`. For `ad_2≠bd_1` this implies BLM Definition 5.9.

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
and 4.5; BLM Definitions 3.14, 3.17, 5.1, 5.3, 5.4 and 5.9, Lemma 5.13, Corollary 5.14,
Theorem 5.17, Remark 5.20, Lemmas 5.23 (V), 5.27 (R) and 5.31–5.33, Propositions 5.28
(base case) and 5.34, and §5.5, PDF 23–25, 33–40.

### 7.4 Lattice change and affine rank-two perturbation

A *RankTwoPolynomialInput* (BLM Theorem 9.9) consists of *PositiveDegrees* `(L,P,δ)`,
a surjection `π:L→M` onto a rank-two lattice, and countably many incoming affine
lines in `M_ℝ`, with cylinder supports in `L_ℝ`. Line `j` has a nonzero primitive
tangent `m_j∈M`, primitive coorientation `ν∈M*` annihilating it, and polynomial
`f=1+Σ_nc_{j,n}z^n`, with `n∈P∖{0}` and `π(n)∈ℕ_{>0}m_j`. It acts by
`z^q↦z^qf^{⟨ν,π(q)⟩}`. The `c_{j,n}` are independent variables over `ℚ`, and only
finitely many lines are nontrivial at each order. Reversing `ν` presents the same
wall (Convention 3). Rank-two skew data with nonzero form use `π:L_pr→M°`; the zero
form gives commuting input. *finiteAlphabetLift* preserves this class at each
finite order and leaves projected directions unchanged.

The ray presentation has commuting labels `exp((log f)_w∂_{ν∘π})`, where
`(log f)_w` is the component on the supported primitive ray `w` of `L`. All
logarithmic degrees lie in `P`, with finitely many active at each order, giving
compatible finite-order inputs for §§3.3–3.4.

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

*Route:* Far from the centres, collapse preserves crossings and combines only
commuting walls, so uniqueness identifies the completion. Perturb to at most two
order-one lines per joint; contributions involving a third line reduce to smaller
lifted order via *finiteAlphabetLift*. For two lines, the positive filtered
substitution `p_{i,k}x^{km_i}↦Σ_{π(n)=km_i}c_{i,n}z^n` and lattice change reduce
to the basis rank-two polynomial formula.

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

*Route:* Prove the tangent/transverse joint dichotomy for the skew input at each
order. For joint direction `W`, use §3.3's vanishing when `i(ρ(n))∈W`; in the
transverse case pass to the rank-two quotient, apply §7.4 and lift its positive
corrections. Refine supports and group coincident factors compatibly with truncation.

*Needs:* §§1.1–1.2, §§3.3–3.4, §4.2 and §§7.1, 7.3–7.4. Sources: BLM Theorem 8.11,
Definition 9.10, Lemma 9.14 and §9.3.

### 7.6 Positive specialization and intrinsic positivity

A positive specialization consists of a ring map `f:B→C` filtered along a monotone
modulus `λ`, `f(F^{λ(k)+1})⊆G^{k+1}` as in §0.3, its restriction to a semiring map
between the chosen positive subsemirings, and its §0.3 completion map, which commutes
with the canonical maps into the completions.
The rings may be associative; scattering and theta instances use the commutative
`ℚ`-algebras above and maps intertwining their actions.

*Targets.*
- *PositiveSpecialization*: the structure above, with identity and composition laws; it
  preserves *IsPositive* (*map_isPositive*).
- Positive specializations along §4.1's *tropicalVertexGroup.map* or
  *tropicalVertexGroup.coeffMap* preserve represented path products. For coefficient
  changes with fixed supports and geometric directions preserved up to positive
  scaling, and for the cylinder comparisons of §§4.2 and 7.1, they preserve outgoing
  completions and positive wall representatives when the normal map and the chosen
  primitive coorientations satisfy `S(ν)=rν'` and `f_target=φ(f_source)^r` for some
  `r∈ℕ`. The §7.1 comparisons establish these identities.
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

*Route:* Apply §7.5 to *principalBLMExtension*, transport by the comparison maps,
and group supported-ray factors. Uniqueness identifies the resulting class.

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
  in the homogeneous pieces of §5.2's modules `M_u` and in its modules `N_b`. If admissible component
  maps preserve them, finite weighted sums with positive incoming coefficient lie
  in them. When terminal certificate lifts also preserve them, so do the face values
  of *globalThetaSection*. Compatible coefficient maps and finite weighted-history
  comparisons preserving these submonoids preserve both conclusions.
- *theta_coefficients_nonnegative*: §5.5's formal theta series is a
  *PositiveThetaSeries*: in §5.6's standard principal monomial presentation, every
  *homogeneousComponent* of *ShiftedCoefficients p* is `c·z^{p+n}` with `c∈ℕ[A]`,
  independent of the diagram representative. Under *principalProjectionComparison* and §5.6's finite
  weighted cylinder comparison it is §5.4's positive section for the projected
  principal coefficients, including coefficient degrees of zero spatial direction.

*Route:* Finite evaluation fibers and *monomial_exponent_dictionary* express
coefficients as sums of products of coefficients of `f^{|⟨κ(n)n,m⟩|}`; tangencies have
exponent zero. Positivity survives these finite operations and the inverse limit.

*Needs:* §§0.8, 4.4, 5.2–5.6, §7.1 and one of
*ordinaryWall_positiveRepresentative* (§7.2),
*polynomialWall_positiveRepresentative* (§7.5) or
*adaptedPolynomialWall_positiveRepresentative* (§7.6).

## Completion criteria

A layer is complete when its constructions, theorems, worked examples and Checks
are proved in Lean with the stated hypotheses. General components must be usable
independently of scattering; the finite-order constructions must yield the completed ones.

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
