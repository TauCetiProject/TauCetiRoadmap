# p-adic comparison for the cohomology of functors on test rings

**Summary.** The argument of the family runs as follows: a one-sided bound for a sum over primes gives a half-plane
free of zeros of Dirichlet L-functions, and the one-sided bound comes from comparing an upper and a lower bound for
the covolume of a lattice of theta lifts (OneSidedPrimeSumBoundsAndAdmissibleData). The lower bound needs congruences
between twisted theta lifts and Galois representations attached to eigenforms on definite unitary groups
(CongruencesOfTwistedThetaLifts, GaloisRepresentationsOfUnitaryEigenforms). The route cuts these Galois
representations out of the `p`-adic cohomology of integral models of Kuga–Sato type that it builds itself
(AbelianSchemesWithThetaStructuresAndTheirCohomology), and this cohomology is not étale cohomology: it is the
cohomology of functors on test rings of CohomologyOfFunctorsOnTestRings, `Vⁿ(Y) = ℚ_p ⊗ Hⁿ(Y_Ω, ℤ_p)`, computed as
`Ext` groups of functors. What the construction needs about `Vⁿ(Y)` at a prime `p` is what the primitive, crystalline
and Hodge–Tate comparison theorems give for étale cohomology: that it is finite-dimensional with a continuous Galois
action, that it is crystalline at a `p`-adic place where `Y` is smooth, with relations between Frobenius twists of
maps on the special fibre carried to relations between the linear Frobenius operators, and that the values of the
Hodge–Tate map on Hodge cohomology are images of vectors of Hodge–Tate weight `h`. This roadmap proves these
statements for the cohomology of functors directly. Nothing here identifies that cohomology with étale, pro-étale, v-
or crystalline cohomology; the period map has no integral (`A_inf`) version, and the Hodge–Tate statement is limited
to the weights of the values of `λ_h`.

The headline theorems are these.

(1) *The primitive comparison* (5.2). Let `Y` be proper over a ring `R` and charted over an algebraically closed
field `Ω` with a map to `ℂ_p`. Then `Hⁿ(Y_Ω, 𝔽_p)` is finite, the cohomology of `Y_Ω` commutes with flat extension of
the coefficients, and, for a map `R → O_C` compatible with `R → Ω → ℂ_p` and a coefficient module `M` over the tilt
`O♭` with an acyclicity property, the cohomology of
`Y_Ω` with coefficients `O♭ ⊗ 𝔽_p-valued locally constant functions ⊗ M` is that of the functor of points of `Y` on
`p`-adic tests with tilted coefficients `S ↦ S♭ ⊗ M`.

(2) *The period map* (5.5). For a period ring pair `(Λ, K)` with `K` flat over `Λ` and a `ℚ_p`-algebra there are
natural, Galois-equivariant `K`-linear maps
from `K ⊗ Vⁿ(Y)` to the cohomology of the points of `Y` on `p`-adic tests with period coefficients
`K ⊗_Λ (Λ ⊗_{A_inf} W(S♭))^`, bijective when `Y` is proper and charted. Finiteness and continuity of `Vⁿ(Y)` (5.3)
come with it.

(3) *Hodge–Tate weights* (6.5). For `Y` proper and smooth of relative dimension `d`, every value of the Hodge–Tate
map `λ_h` on a Hodge class of degree `q`, pulled back along any map `W → Y` from a proper `W`, is the image of the
pull-back of one vector of `ℂ_p ⊗ V^{q+h}(Y)` on which the decomposition group acts by `χ^{−h}`.

(4) *Crystallinity and Frobenius congruences* (7.6). For `Y` proper over a Noetherian ring `R` mapping to the
valuation ring of a `p`-adic place, charted over `R` and over `Ω` (for instance smooth of relative dimension `d` over
`R`), `Vⁿ(Y)` is crystalline (in the sense of `B_max`) for the decomposition group, and a relation
`Σ m_i [Frob^{a_i}(u_i x)] = 0` between maps `u_i : W → Y` from a proper `R`-scheme `W` charted over `Ω`, known at the
points of the special fibre of `W`, gives `Σ m_i u_i^* ∘ β_i = 0` for the linear Frobenius operators `β_i` on
`B_max ⊗ Vⁿ(Y)`.

There are seven layers. Layer 1 sets up `p`-adic tests (products of `p`-complete absolutely integrally closed
valuation rings over `O_C`) and tilting for them. Layer 2 is almost descent for perfect algebras over `O♭`. Layer 3
is derived completeness and the passage from bijectivity modulo `p` to bijectivity. Layer 4 shows that two `ℓ`-torsion
theories with the projective line formula that agree at the point agree on standard étale charts and on charted
functors, by excision and duality on products of `ℙ¹`. Layer 5 proves the primitive comparison, finiteness
and continuity, and the period map. Layer 6 builds the Hodge–Tate map and proves the weight statement. Layer 7 proves crystallinity, through
Wang sequences for root systems of units, divided power envelopes and a comparison on charts, and the Frobenius
congruence relation.

## Conventions and notation

- *Labels.* Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal
  proof:*` how [ShortProof] proves it. [ShortProof] is the shorter formal proof of the family `ShortGRH`; the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under `src/`) and the declarations
  where it proves the statement. The names of [ShortProof] occur only on that line.
- *The prime and the period rings.* The prime `p`, `ℂ_p`, `ℚ̄_p`, `O_C`, `G_p`, the cyclotomic character `χ`, the tilt
  `O♭` of `O_C`, `A_inf = W(O♭)`, Fontaine's map `θ`, `ε`, the Teichmüller lift `[·]`, `μ = [ε] − 1`, `τ`, `ξ` (with
  `ξτ = μ` and `ker θ = ξA_inf`), `A_max`, `B_max` and their Frobenius `φ` and action of `G_p` are as in the
  conventions and §§1.1, 1.2, 1.3 of CrystallineRepresentationsAndKisinModules; `𝔪` is the maximal ideal of `O♭` and
  `p♭ ∈ O♭` the image of `ξ` in `A_inf/p = O♭`.
- *Tilts.* For a ring `S`, `S♭ = lim_{x ↦ x^p} S/p` with `x ↦ x^♯` its untilt map, `W(·)` the `p`-typical Witt
  vectors, `θ_S : W(S♭) → S` Fontaine's map when `S` is `p`-complete. A ring is *`p`-complete torsion-free* if it is
  `p`-adically complete and separated and `p` is a non-zero-divisor on it; `X^` is the `p`-adic completion of `X`.
  For an `A_inf`-algebra `Λ` and an `O♭`-algebra `b`, `P_Λ(b) := (Λ ⊗_{A_inf} W(b))^`.
- *Cohomology of functors.* `Hⁿ(N, F) = Extⁿ(N, F)` for functors `N, F : 𝒞 → Ab`, total `Ext` `H*(N, F)` with the
  Yoneda product, functors with flat values, `ℤ[Y]` and `Hⁿ(Y, F) = Hⁿ(ℤ[Y], F)`, the functor `ℤ[Y]/ℤ[U]` of a pair
  `(Y, U)`, `h_B = Hom(B, −)`, comparisons `(φ, β)` from `F` on `𝒞` to `F'` on `𝒞'` and their bijectivity along
  `α : N' → N∘φ`, covers, Čech descent, Zariski descent, partitions along idempotents and closed classes of functors are
  as in CohomologyOfFunctorsOnTestRings §§1.1, 2.2, 2.3. `F` is *acyclic at `B` along `φ`* if restriction along `φ`,
  `Hⁿ(h_B, F) → Hⁿ(h_B∘φ, F∘φ)`, is bijective for every `n` (so the right side is `F(B)` in degree 0 and `0` above).
- *Flat base change.* A functor `N : 𝒞 → Ab` has *flat base change* if for all rings `S → T`, every `T`-module `M`
  flat over `S`, every functor `Φ` from `𝒞` to `S`-modules and every `n`, the map
  `M ⊗_S Hⁿ(N, Φ) → Hⁿ(N, M ⊗_S Φ)`, `m ⊗ z ↦` (push of `z` along `x ↦ m ⊗ x`), is bijective.
- *Test rings and the cohomology of schemes.* Test rings (reduced, absolutely integrally closed, any two elements
  comparable for divisibility after a partition by an idempotent), the cohomology `Hⁿ(Y_Ω, Λ)` of the functor of
  points of `Y ×_R Ω` on test rings with locally constant coefficients, the coefficients `ℤ_p` (Witt vectors of
  locally constant `𝔽_p`-valued functions), `Vⁿ(Y) = ℚ_p ⊗ Hⁿ(Y_Ω, ℤ_p)` with its action of automorphisms of `Ω`
  over `R`, Hodge cohomology `H^q_Hodge(N)` of a functor `N` on `k`-algebras, theories, the class `η` and the
  projective line formula are those of CohomologyOfFunctorsOnTestRings §§1.2, 1.3, 2.7, 3.4, 5.1, 6.1. Except in 1.1,
  5.1 (b) and 5.2, where it is any field (local domain in 5.1 (b)) with the stated properties, `Ω` is a fixed algebraic
  closure of `ℚ`.
- *Charted schemes.* Étale charts of a functor on `k`-algebras (with any number `d ≥ 0` of coordinates; *étale over a
  torus* when all coordinates are units), atlases of dimension `d`, charting subfunctors and `R`-schemes *charted over*
  an `R`-algebra `k` are as in CohomologyOfFunctorsOnTestRings §1.4 (c), (d), and a proper `R`-scheme whose base change
  to a Noetherian `R`-algebra `k` is smooth of relative dimension `d` has an atlas of dimension `d` on `k`-algebras and
  is charted over `k` (CohomologyOfFunctorsOnTestRings §1.5 (c), (d)). Charted schemes stand in for smooth ones.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `O_C, O♭, 𝔪, A_inf, θ, ε, μ, τ, ξ, p♭` | integers of `ℂ_p`, its tilt and maximal ideal, `W(O♭)`, Fontaine's map, the elements of `A_inf` | Conventions; CrystallineRepresentationsAndKisinModules §1.1 |
| `A_max, B_max, φ` | the period rings of crystalline representations, and Frobenius | CrystallineRepresentationsAndKisinModules §1.3 |
| `S♭, x^♯, θ_S, X^` | tilt, untilt, Fontaine's map of `S`, `p`-adic completion | Conventions |
| `Hⁿ(N, F), H*(N, F), ℤ[Y]` | `Ext` of functors, total `Ext`, free abelian functor | Conventions; CohomologyOfFunctorsOnTestRings §§1.1, 2.2 |
| `Hⁿ(Y_Ω, Λ), Vⁿ(Y)` | cohomology of a scheme on test rings, `p`-adic cohomology | CohomologyOfFunctorsOnTestRings §§1.3, 3.4 |
| `H^q_Hodge(N)` | Hodge cohomology of a functor on `k`-algebras | CohomologyOfFunctorsOnTestRings §6.1 |
| cell, `p`-adic test, `S`, `S♭`, `T = S[1/p]` | the test category of this roadmap | 1.1 |
| `h_b^♭` | `S ↦ Hom_{O♭}(b, S♭)` on `p`-adic tests | 1.1 |
| `P_Λ(b)` | `(Λ ⊗_{A_inf} W(b))^` | Conventions |
| `LC(A)` | locally constant `𝔽_p`-valued functions on `Spec A`, for a test ring `A` | 5.1 |
| `(Λ, K)` | period ring pair | 5.1 |
| `D_A, j` | decomposition group of a `p`-adic place `A` of `Ω`, its open embedding into `G_p` | 6.5 |
| `D, LH_D` | compared theory, its Leray–Hirsch map | 4.1 |
| `B_S, ι_S` | `W(S♭)[1/p]/(ker θ)²`, the map `T → B_S` given by `μ` | 6.1 |
| `(S, M), B_{S,M}, κ_h, λ_h` | Hodge–Tate pairs, `B_S ×_T (T ⊕ M)`, the contraction class, the Hodge–Tate map | 6.2, 6.3 |
| `𝔡(D)` | `{x : n! ∣ xⁿ for all n}` | 7.3 |
| `D_S` | `(A_max ⊗_{A_inf} W(S♭))^` | 7.4 |

## Layer 1: `p`-adic tests and tilting

This layer defines the category on which the comparisons are computed and proves the tilting statements for it, then
produces covers by tests and flat base change for functors covered by one affine.

### 1.1 Cells, `p`-adic tests and their tilts

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

A *cell* is a domain `V` that is a valuation ring, `p`-adically complete and separated, absolutely integrally closed
(every monic polynomial of positive degree over `V` has a root in `V`), with `p ≠ 0` in `V`; then `p` is not a unit of
`V`. A *`p`-adic test* is a non-empty family `(V_i)_{i ∈ I}` of cells with a ring map `O_C → ∏_i V_i`; its ring is
`S = ∏_i V_i`, an `O_C`-algebra, and a map of `p`-adic tests is a map of `O_C`-algebras of their rings. Write `S` both
for the test and for its ring.

- The *tilt* `S♭` is an `O♭`-algebra, and `S ↦ S♭` is a functor from `p`-adic tests to `O♭`-algebras. For a perfect
  `O♭`-algebra `b`, `h_b^♭` is the functor `S ↦ Hom_{O♭}(b, S♭)` on `p`-adic tests.
- The *generic ring* `T = S[1/p]` is a `ℂ_p`-algebra; `S ↦ T` is a functor to test rings, and, for a field `Ω` with a
  map `Ω → ℂ_p`, to test rings over `Ω`.
- For `g ∈ G_p`, the *twist* `gS` is the same ring with structure map `O_C →^{g} O_C → S`; it is an endofunctor of
  `p`-adic tests that leaves `S`, `S♭`, `T` unchanged.
- For a ring `R` with a map `R → O_C` and an `R`-scheme `Y`, the functor `S ↦ Y(S)` of `R`-points of `Y` in the rings
  of `p`-adic tests is the *points of `Y` on tests*.

`p`-adic tests stand in for the covers by perfectoid valuation rings of the pro-étale and v-topologies, and the
cohomology of functors on them for pro-étale or v-cohomology; no comparison with those is used.

*Needs:* CrystallineRepresentationsAndKisinModules §1.1 (`O♭`, `A_inf`, `θ`, `ε`, `ξ`);
CohomologyOfFunctorsOnTestRings §§1.2, 1.3 (test rings, tests over a ring).

[ShortProof], `Lib/PadicComparison/Descent/TestCategory` (`New.Variety.IsCell`, `New.Variety.PadicTest`,
`New.Variety.PadicTest.tilt`, `New.Variety.PadicTest.twist`, `New.Variety.PadicTest.algFunctor`,
`New.Variety.testPoints`, `New.Variety.IsCompleteTorsionFree`, `New.Variety.periodAlg`), `Lib/PadicComparison/HodgeTate/GenericFibre`
(`New.Variety.PadicTest.GenericRing`, `New.Variety.PadicTest.genericTest`), `Lib/PadicComparison/Primitive/PeriodCoefficients`
(`New.Variety.genericTestOver`)

### 1.2 Tilting `p`-adic tests

*Origin:* adapted from the published theory of tilting for perfectoid rings and of Fontaine's map `θ` (Bhatt, Morrow
and Scholze (2018), Lemma 3.10; Scholze (2012), Perfectoid spaces, Theorem 5.2): here, for the rings of `p`-adic tests,
with the fixed generator `ξ`, as a natural isomorphism `O_C ⊗_{A_inf} W(S♭) ≅ S` and a bijection of maps out of
perfect algebras.

*Method of the formal proof:* tilting commutes with the product, and divisibility in `S♭` may be tested on untilts,
which gives (b). `θ_S` is onto because `S` is `p`-complete and absolutely integrally closed, and its kernel is generated
by the image of `ξ` since `p` is a non-zero-divisor on `S` (a) and since the divisibility test of (b) applies to zeroth
Witt coordinates; this gives (c). For (d), a ring map from `W(R)`, `R` perfect, is determined by the induced map
`R → S/p`, and that map lifts uniquely to `R → S♭`; (e) follows from (c) and (d).

Let `S` be a `p`-adic test with cells `V_i`.
(a) `S` is a test ring, `p` is a non-zero-divisor on `S`, and for an idempotent `e ≠ 1` of `S` there is a map of
`p`-adic tests `S → S'` that is the quotient by `(e)` and is universal among maps of tests killing `e`.
(b) The map `S♭ → ∏_i V_i♭` given by the projections is an isomorphism; `S♭` is perfect and `p♭` is a non-zero-divisor
on it; for `x, y ∈ S♭`, `x^♯ ∣ y^♯` in `S` implies `x ∣ y` in `S♭`.
(c) The kernel of `θ_S : W(S♭) → S` is generated by the image of `ξ` under `W(O♭) → W(S♭)`, and
`O_C ⊗_{A_inf} W(S♭) → S`, `a ⊗ x ↦ a·θ_S(x)`, is an isomorphism of `O_C`-algebras, natural in `S`.
(d) For a perfect ring `R` of characteristic `p`, `f ↦ θ_S ∘ W(f)` is a bijection from ring maps `R → S♭` to ring maps
`W(R) → S`. For a perfect `O♭`-algebra `b`, `O♭`-algebra maps `b → S♭` correspond, naturally in `S`, to `O_C`-algebra
maps `O_C ⊗_{A_inf} W(b) → S`.
(e) The functor `S ↦ S♭` from `p`-adic tests to `O♭`-algebras is full and faithful.

At the pinned revisions the library has Fontaine's map of a `p`-adically complete ring, with its surjectivity when
Frobenius is onto modulo `p` (Mathlib `WittVector.fontaineTheta`, `surjective_fontaineTheta`), and integral perfectoid
rings, with the kernel of `θ` principal (`TauCeti.Perfectoid.IsIntegralPerfectoid`,
`TauCeti.Perfectoid.IsIntegralPerfectoid.isPrincipal_ker_fontaineTheta`). On Tau Ceti's main branch, later than the
revision pinned here: the first claim of (b) (`PreTilt.piEquiv`), the theorem that in an integral perfectoid ring a
distinguished element of `ker θ` generates it
(`TauCeti.Perfectoid.IsIntegralPerfectoid.ker_fontaineTheta_eq_span_iff_isDistinguished`), and the universal property
of Witt vectors of a perfect ring (`TauCeti.WittVector.adicLiftEquiv`). What is missing is that cells and their
products are integral perfectoid, the natural isomorphism of (c) and the bijection of (d) into the tilt.

*Needs:* 1.1; CrystallineRepresentationsAndKisinModules §1.2 (`ker θ = (ξ)` for `O_C`);
CohomologyOfFunctorsOnTestRings §1.2 (test rings are stable under products).

[ShortProof], `Lib/PadicComparison/Descent/TestCovers` (`New.Variety.PadicTest.isTest`,
`New.Variety.PadicTest.isLeftRegular_p`, `New.Variety.PadicTest.exists_isQuotientByElem`,
`New.Variety.PadicTest.tiltPiEquiv`, `New.Variety.PadicTest.dvd_of_untilt_dvd`,
`New.Variety.PadicTest.isPerfectTorsionFree_tilt`, `New.Variety.PadicTest.ker_theta`, `New.Variety.PadicTest.thetaIso`,
`New.Variety.theta_comp_bijective`, `New.Variety.homTiltIso`, and the instances `tilt.Full`, `tilt.Faithful`)

### 1.3 Cells over primes, covering points and flat base change

*Origin:* adapted from the published theory of covers by products of absolutely integrally closed valuation rings in
the v- and arc-topologies (Bhatt and Mathew (2021), The arc-topology; Scholze (2017), Étale cohomology of diamonds):
here, (a) and (b) for cells and `p`-adic tests; (c) is particular to this proof, and (d) is the form in which
properness enters it.

*Method of the formal proof:* for (a), an absolutely integrally closed valuation ring with `p ≠ 0` dominating `B_𝔮` is
replaced by a countable ultrapower; there the telescope equations of 3.1 for `π = p` can be solved, so its `p`-adic
completion is a cell and still receives `B` with the required property. For (b), each map from `B` to a cell lands in a
subring of the cell in which every equation of three fixed kinds (a polynomial equation, the limit of a sequence, an
idempotent `x` with `a ∣ xb` and `b ∣ (1 − x)a`) with coefficients in the subring that is solvable in the cell already
has a solution; such a subring is again a cell. Since its elements are polynomials over `B` in named solutions, these
subrings are all images of one polynomial ring over `B`, and `S₀` is the product of all the quotients of that ring
that are cells. (c) is a dévissage over the Čech nerve of the single affine cover (CohomologyOfFunctorsOnTestRings
§§2.1, 2.3), the representable case being the Yoneda lemma. (d) uses the ring of a
finite affine open cover of `W ×_R k`; a point over a ring of the stated kind factors through it after a partition of
that ring by idempotents.

(a) Let `B` be a ring on which `p` is a non-zero-divisor and `𝔮` a prime ideal of `B` containing `p`. There are a cell
`V` and a ring map `B → V` that sends every element of `𝔮` to a non-unit.
(b) (Covering points.) Let `B` be an `O_C`-algebra that has an `O_C`-algebra map to the ring of some `p`-adic test.
Then there are a `p`-adic test `S₀` and an `O_C`-algebra map `y : B → S₀` such that every `O_C`-algebra map from `B` to
the ring of a `p`-adic test `S` is `f ∘ y` for some map of tests `f : S₀ → S`.
(c) (Flat base change.) Let `ι` be a full and faithful functor from a category `𝒞` to `A`-algebras with covering
points in the sense of (b). Let `Y` be a functor on `A`-algebras that is separated (as in
CohomologyOfFunctorsOnTestRings §1.4 (b)) and covered by one affine along `ι` (there is a point `y ∈ Y(B)` of which
every point of every `Y(ι(c))` is an image). Then `ℤ[Y∘ι]` has flat base change. In particular, for an `O_C`-algebra
`B`, the functor `S ↦ Hom_{O_C}(B, S)` on `p`-adic tests has flat base change.
(d) (Points of proper schemes.) Let `W` be a proper scheme over a ring `R` and `k` an `R`-algebra. The functor of
points `C ↦ W(C)` of `W` on `k`-algebras is separated (CohomologyOfFunctorsOnTestRings §1.5 (b)), and there are a
`k`-algebra `B` and `y ∈ W(B)` such that, for every `k`-algebra `C` in which any two elements `a, b` admit an
idempotent `e` with `a ∣ eb` and `b ∣ (1 − e)a` (for instance a test ring), every point of `W(C)` is the image of `y`
under some `k`-algebra map `B → C`. So the functor of
points of `W` is covered by one affine along every functor to such `k`-algebras.

*Needs:* 1.1, 1.2 (a); CohomologyOfFunctorsOnTestRings §§1.1, 2.1, 2.3 (closed classes, dévissage, Čech descent);
CohomologyOfFunctorsOnTestRings §§1.4, 1.5 (separated functors, points of proper schemes); ArcTopologyAndDescent §0.1
(absolutely integrally closed rings).

[ShortProof], `Lib/PadicComparison/Descent/TestCovers` (`New.Variety.exists_cell_over`,
`New.Variety.isCell_of_isSolutionClosed`, `New.Variety.cellPoint`, `New.Variety.hasCoveringPoints_padic`,
`New.Variety.HasFlatBaseChange.isClosedClass`, `New.Variety.isAffinelyCovered_cech`,
`New.Variety.IsAffinelyCovered.devissage_bijective`, `New.Variety.IsAffinelyCovered.hasFlatBaseChange`,
`New.Variety.hasFlatBaseChange_of_iso_reprBy`), `Lib/PadicComparison/Descent/TestCategory`
(`New.Variety.HasFlatBaseChange`, `New.Variety.baseChangeMap`), `Lib/General/Geometry/PointsOfProperSchemes`
(`New.Variety.isSeparatedFunctor_algPointsOf`, `New.Variety.isAffinelyCovered_algPointsOf`)

## Layer 2: Almost descent

The comparisons of Layers 5 and 7 need that the functor of points of a perfect `O♭`-algebra in tilts of tests has no
higher cohomology. With the maximal ideal `𝔪` put into the coefficients, this holds exactly.

### 2.1 Almost descent for perfect algebras

*Origin:* adapted from the published theory of v-descent and of the almost vanishing of the higher v-cohomology of
the integral structure sheaf on affinoid perfectoid spaces (Scholze (2017), Étale cohomology of diamonds, Theorem 8.7
and Proposition 8.8; for perfect rings, Bhatt and Scholze (2017), Theorem 4.1; for the argument by points, Gabber and
Kelly (2015), Theorem 2.3): here, as an exact statement for the cohomology of functors on tilts of `p`-adic tests, for
perfect `O♭`-algebras and coefficients killed by `p♭`, with `𝔪` in the coefficients.

*Method of the formal proof:* (b) is proved by contradiction from a non-zero relative class of least degree. Zorn's
lemma gives a map of perfect algebras that keeps the class non-zero and is maximal for the divisibilities it creates;
by maximality any two elements of its image are comparable for divisibility. Doing this twice, the second time from
the target of the first map, gives a composite that factors through a perfect valuation domain on which the class is
still non-zero. Quotients of the two kinds allowed (by an ideal contained in `(p♭)`, or by any ideal when `p♭`
is radical) do not kill the class, and (a) then gives a faithfully flat map to the tilt of a test
along which the class vanishes, because that point of `b` lifts to `b'`. (c) is Čech descent
(CohomologyOfFunctorsOnTestRings §2.3) along the cover of (b), with `b'` the tilt of the covering test of 1.3 (b), or
the zero ring if `b` has no point in a tilt of a test. Throughout, `𝔪 = 𝔪²` is used in a strengthened form: each
`m ∈ 𝔪` factors as `s·k` with `k ∈ 𝔪`, where some power of `s` is divisible by a prescribed non-zero `t`.

Let `N` be an `O♭`-module with `p♭N = 0`, and let `F_N` be the functor `D ↦ D ⊗_{O♭} N ⊗_{O♭} 𝔪` on `O♭`-algebras.
(a) Let `V` be a perfect `O♭`-algebra that is a valuation domain, in which `p♭` is neither zero nor a unit. There are a
`p`-adic test `S` and an `O♭`-algebra map `φ : V → S♭` such that `V/ker φ → S♭` is faithfully flat and `p♭` divides
every element of `ker φ`.
(b) (v-descent.) Let `y : b → b'` be a map of perfect `O♭`-algebras such that every `O♭`-algebra map from `b` to the
tilt of a `p`-adic test factors through `y`. Then, on the category of perfect `O♭`-algebras, `h_{b'} → h_b` is a cover
for the coefficients `F_N`: the inclusion of its image in `h_b` induces bijections on `Hⁿ(·, F_N)` for every `n`.
(c) (Acyclicity.) For every perfect `O♭`-algebra `b`, `F_N` is acyclic at `b` along `S ↦ S♭`: restriction from
`Hⁿ(h_b, F_N)` on `O♭`-algebras to `Hⁿ(h_b^♭, S ↦ S♭ ⊗ N ⊗ 𝔪)` on `p`-adic tests is bijective for every `n`. So
`H⁰(h_b^♭, S ↦ S♭ ⊗ N ⊗ 𝔪) = b ⊗ N ⊗ 𝔪` and the higher groups vanish. The same holds with all `O♭`-algebras replaced by
the perfect ones.

The library has the almost-mathematics set-up for a valuation domain with non-finitely generated maximal ideal
(`TauCeti.Almost.BasicSetup.ofValuationRing`), the perfectness of tensor products of perfect algebras over a perfect
ring of characteristic `p` (`Algebra.TensorProduct.perfectRing`) and the vanishing of higher `Tor` between perfect
algebras over such a ring (`TauCeti.isZero_Tor_succ_of_perfectRing`), which the proof uses as ingredients; it has
no v-descent statement. The almost vanishing of higher v-cohomology of DiamondsAndVStacks §D2.8 is about sheaf
cohomology on the v-site and gives this statement only through an identification that no roadmap states.

*Needs:* 1.1, 1.2, 1.3 (b); CohomologyOfFunctorsOnTestRings §§1.1, 2.3 (covers, Čech descent, relative functors);
Tau Ceti `Algebra.TensorProduct.perfectRing` (tensor products of perfect algebras perfect).

[ShortProof], `Lib/PadicComparison/Descent/AlmostDescent` (`New.Variety.almostCoeff`,
`New.Variety.MaxIdealFlat.exists_smul_eq`, `New.Variety.exists_faithfullyFlat_padicTest`,
`New.Variety.exists_perfect_valuationRing_factor`, `New.Variety.tensorPush_quotient_ne_zero`,
`New.Variety.faithfullyFlat_descent`, `New.Variety.isCover_of_points`, `New.Variety.isAcyclicAt_perfectTilt`,
`New.Variety.IsAcyclicOnPerfect`, `New.Variety.isAcyclicOnPerfect_almostCoeff`)

## Layer 3: Derived completeness and adic approximation

### 3.1 Derived completeness for one element

*Origin:* adapted from the published theory of derived completeness for a principal ideal (Stacks Project, Tags 091N,
091P, 0G1U, 09BA, 0CQY; Bhatt (2019), Torsion completions are bounded; Positselski, arXiv 1605.03934): here, for
modules, with completeness defined by the telescope map, and base change only for modules of finite rank over a
discrete valuation ring.

*Method of the formal proof:* (a) writes a preimage as the sum of a series whose terms are chosen one after another;
the series converges by derived completeness of `E` and `X`. (b) carries solutions of the telescope equation from `E`
to `X`, the identity `a ∘ b = π^m` controlling the error; for `X^ι` the equation is solved coordinatewise. (c) is (a)
for the zero map. For (d), let `τ : W^s → X` be given by a maximal independent family of `X`, finite by the rank
hypothesis; the derived completeness of `X` and of `W^s`, with (a), gives `k` with `π^k X ⊆ τ(W^s)`, hence (`τ` being
injective) `σ : X → W^s` with `τ ∘ σ = π^k`, and (b) applies to `S ⊗ τ` and `S ⊗ σ` with `E = S^s`, derived complete
because `S` is. (e) approximates modulo powers of `p`.

Let `W` be a commutative ring and `π ∈ W`. A `W`-module `X` is *derived `π`-complete* if `(x_j) ↦ (x_j − π x_{j+1})`
is bijective on sequences `ℕ → X`.
(a) (Successive approximation.) Let `f : E → X` be a linear map of derived `π`-complete modules and `g : F → X` a map
from a set with `g(x) ∈ f(E) + π·g(F)` for every `x`. Then `g(F) ⊆ f(E)`.
(b) (Retracts.) If `E` is derived `π`-complete and `a : E → X`, `b : X → E` are linear with `a ∘ b = π^m` on `X`, then
`X` is derived `π`-complete. A `π`-adically complete module is derived `π`-complete, and if `X` is derived
`π`-complete, so is the module `X^ι` of all maps `ι → X`, for every set `ι`.
(c) (Nakayama.) A submodule `K` of a derived `π`-complete module with `πK = K` is zero.
(d) (Base change.) Let `W` be a discrete valuation ring with uniformiser `π` and `S` a `W`-algebra such that `W`, `S`
(for the image of `π`) and `X` are derived complete and `X` has finite rank over `W`. Then `S ⊗_W X` is derived
complete.
(e) A `p`-complete torsion-free ring is derived `p`-complete. A map `κ : B → B'` of algebras that is onto modulo `p`
and satisfies `p^n ∣ κ(x) ⇒ p^n ∣ x` induces a bijection of `p`-adic completions; along a map with this property every
linear map to a `p`-adically complete module extends uniquely; `B → B^` has it.

At the pinned revisions the library has adic completeness and completion (Mathlib `IsAdicComplete`, `AdicCompletion`)
and no derived completeness. On Tau Ceti's main branch, later than the revision pinned here: the definition
(`TauCeti.IsDerivedComplete`, by the telescope map for every element of an ideal), with
`TauCeti.IsDerivedComplete.of_isAdicComplete`, `TauCeti.IsDerivedComplete.pi`,
`TauCeti.IsDerivedComplete.of_linearEquiv`, `TauCeti.IsDerivedComplete.ker`, `TauCeti.IsDerivedComplete.quotient_range`,
`TauCeti.IsDerivedComplete.of_exact`, and a derived-category form (`TauCeti.derivedComplete`); clauses (a)–(e) build on
it.

*Needs:* Mathlib `IsAdicComplete`, Mathlib `AdicCompletion`; Tau Ceti `TauCeti.IsDerivedComplete`.

[ShortProof], `Lib/PadicComparison/Completion` (`New.Variety.IsDerivedComplete`,
`New.Variety.IsDerivedComplete.exists_apply_eq_of_approx`, `New.Variety.IsDerivedComplete.of_retract`,
`New.Variety.IsDerivedComplete.eq_zero_of_mem_of_isSMulDivisible`, `New.Variety.IsDerivedComplete.baseChange`,
`New.Variety.IsCompleteTorsionFree.isDerivedComplete`, `New.Variety.IsCompletionBijective.of_dvd_sub_of_pow_dvd`,
`New.Variety.IsCompletionBijective.linearMap_comp_bijective`, `New.Variety.isCompletionBijective_completion`)

### 3.2 Comparisons that are bijective modulo `p`

*Origin:* adapted from the published theory of derived completeness (the derived Nakayama lemma and completed base
change; the sources named in 3.1): here, for comparison maps of `Ext` groups of functors, with divisibility of kernels
and finite rank in place of derived tensor products.

*Method of the formal proof:* (a) holds because `Hⁿ(N, −)` commutes with the product of copies of `Φ` indexed by
`ℕ`, on which the telescope map is an isomorphism of coefficients. (b) is checked objectwise. (c) is a five-lemma
argument on the long exact sequences of the two short exact sequences: the kernel of the comparison turns out
`a`-divisible, hence zero by 3.1 (c), and the comparison turns out onto modulo `a`, hence onto by 3.1 (a). (d) is (c)
for `a = p`, where flat base change for `N` rewrites `Hⁿ(N, S ⊗ Θ)` as `S ⊗ Hⁿ(N, Θ)` and 3.1 (d) supplies its
completeness.

Let `φ : 𝒞' → 𝒞`, `N : 𝒞 → Ab`, `N' : 𝒞' → Ab`, `α : N' → N∘φ`, and let `Φ`, `Φ'` be functors on `𝒞`, `𝒞'` to modules over
a ring, with `β : Φ∘φ → Φ'`.
(a) If every `Φ(A)` is derived `a`-complete, then every `Hⁿ(N, Φ)` is.
(b) Let `m` be a natural number. If every `Φ(A)` has no `m`-torsion and `q : Φ → G` is at every object onto with
kernel `mΦ(A)`, then
`0 → Φ →^{m} Φ →^{q} G → 0` is exact, and a class of `Hⁿ(N, Φ)` that `q` sends to zero is a multiple of `m`.
(c) (The adic step.) Let `0 → Φ →^{a} Φ →^{q} G → 0` and `0 → Φ' →^{a} Φ' →^{q'} G' → 0` be exact and let `β` induce
`γ : G∘φ → G'`. Suppose every `Hⁿ(N', Φ')` is derived `a`-complete, and `Hⁿ(N, Φ)` is derived `a`-complete whenever the
kernel of the degree-`n` comparison map for `β` is `a`-divisible. If the comparison for `γ` is bijective along `α`, so
is the comparison for `β`.
(d) (Completed base change.) Let `W` be a discrete valuation ring with uniformiser `p`, `S` a flat `W`-algebra, `Θ` a
functor from `𝒞` to `W`-algebras and `X` a functor to `S`-algebras, with `W`, `S` and all `Θ(A)`, `X(A)`
`p`-complete torsion-free, and let `N` have flat base change. Let `j : S ⊗_W Θ → X` be bijective modulo `p` at every
object, and let `Hⁿ(N, Θ)` have finite rank over `W` whenever the kernel of `Hⁿ(j)` is `p`-divisible. Then
`Hⁿ(N, S ⊗_W Θ) → Hⁿ(N, X)` is bijective for every `n`.

*Needs:* 3.1; 1.3 (flat base change); CohomologyOfFunctorsOnTestRings §1.1 (comparison maps);
Mathlib `CategoryTheory.Abelian.Ext.covariant_sequence_exact₁'`,
Mathlib `CategoryTheory.Abelian.Ext.covariant_sequence_exact₂'`,
Mathlib `CategoryTheory.Abelian.Ext.covariant_sequence_exact₃'` (long exact sequences of `Ext`).

[ShortProof], `Lib/PadicComparison/Completion` (`New.Variety.IsDerivedComplete.cohomology`,
`New.Variety.modShortExact_of_isSMulRegular_of_isReductionMod`,
`New.Variety.ModShortExact.exists_smul_eq_of_push_eq_zero`, `New.Variety.Comparison.IsBijective.of_mod`,
`New.Variety.HasFlatBaseChange.isBijective_of_isReductionMod`), `Lib/PadicComparison/Descent/TestCategory`
(`New.Variety.IsReductionMod`)

## Layer 4: Compared theories, excision and duality on products of `ℙ¹`

Throughout this layer `A` is a local domain that is absolutely integrally closed (every monic polynomial of positive
degree over `A` has a root in `A`) and in which a prime `ℓ` is invertible, and *tests over `A`* are the `A`-algebras
that are test rings. The layer shows that two `ℓ`-torsion theories that both satisfy the projective line formula, and
are linked by maps from the locally constant functions, agree on standard étale charts once they agree at the point,
and, when `A` is a valuation ring, on every functor with a charting subfunctor (4.3 (e)). This is the comparison on
charted schemes used in 5.2 for `ℓ = p`.

### 4.1 Compared theories and good pairs

*Origin:* particular to this proof: an `ℓ`-torsion theory equipped with a family of maps from the locally constant
theory, the condition that the Leray–Hirsch map built from them is bijective and the cohomology with locally constant
coefficients finite, and the stability of that condition.

*Method of the formal proof:* (a) by the five lemma on long exact sequences of total `Ext`, and finiteness in exact
sequences; (b) restricts along every functor to tests; (c) the operations commute with the Leray–Hirsch map, so `N`
is a retract of `N'` on both sides; (d) is the projective line formula read on classes.

Let `g` be a functor from a category to tests over `A`. A *compared theory* `D` along `g` is a theory `F` along `g`
(CohomologyOfFunctorsOnTestRings §2.7) that satisfies the projective line formula, together with classes
`c_i ∈ H⁰(L∘g, F)`, `i ∈ I`, where `L` is the theory of locally constant `ℤ/ℓ`-valued functions on tests over `A`,
which also satisfies the projective line formula. For `N` from tests over `A` to `Ab`, the *Leray–Hirsch map*
`LH_D(N) : ⊕_{i ∈ I} H*(N, L) → H*(N∘g, F)` sends `(w_i)` to `Σ_i (w_i restricted along g)·c_i`, as in
CohomologyOfFunctorsOnTestRings §2.1 (b). `D` is *good at `N`* if `LH_D(N)` is bijective and `H*(N, L)` is finite; a
pair `(Y, U)` is *good* if `D` is good at `ℤ[Y]/ℤ[U]`. The part
`Y°` of `Y` off the closed fibre consists of the points over tests in which the maximal ideal of `A` generates the
unit ideal.
(a) The functors at which `D` is good form a closed class; if `D` is good at the middle and last terms of a short
exact sequence, it is good at the first.
(b) If `α : N → N'` induces bijections on total `Ext` after restriction along every functor to tests over `A`, for
every coefficient with Zariski descent, then `D` is good at `N` if and only if at `N'`.
(c) (Retracts.) Let `N` have flat values. If the reduction `N → N/ℓ` is, on total `Ext` with coefficients in any theory
satisfying the projective line formula, a finite sum `Σ_i ρ_i ∘ r_i` of operations through `N'` that are natural in
the theory, and `D` is good at `N'`, then `D` is good at `N`.
(d) (Integration over `ℙ¹`.) For a theory with the projective line formula (CohomologyOfFunctorsOnTestRings §5.1 (d)),
every class over the points of `ℙ¹` is
`a·1 + b·η` for unique classes `a, b` from the base, and `∫ : a·1 + b·η ↦ b` is natural for maps compatible with `1`
and `η`; `∫ y·(η + ζ) = y` for classes `y`, `ζ` pulled back from the base.

*Needs:* CohomologyOfFunctorsOnTestRings §2.7 (theories along a functor to tests); CohomologyOfFunctorsOnTestRings §5.1
(the class `η`, projective line formula); CohomologyOfFunctorsOnTestRings §§2.1, 2.2 (Leray–Hirsch map, total `Ext`,
Yoneda product); CohomologyOfFunctorsOnTestRings §1.1 (Zariski descent, closed classes).

[ShortProof], `Lib/PadicComparison/Duality/LineIntegration` (`New.Variety.ComparedTheory`,
`New.Variety.ComparedTheory.IsFiniteLerayHirsch`, `New.Variety.ComparedTheory.isClosedClass_isFiniteLerayHirsch`,
`New.Variety.ComparedTheory.isFiniteLerayHirsch_of_shortExact`,
`New.Variety.ComparedTheory.isFiniteLerayHirsch_iff_of_isCohomEquiv`,
`New.Variety.ComparedTheory.isFiniteLerayHirsch_of_retract`, `New.Variety.NaturalOp`,
`New.Variety.TorsionCoeff.HasLineFormula.integrate`, `New.Variety.TorsionCoeff.HasLineFormula.integrate_naturality`,
`New.Variety.TorsionCoeff.HasLineFormula.integrate_mul_cupClass`)

### 4.2 Self-duality of products of the projective line

*Origin:* particular to this proof: the passage of goodness to pairs in `(ℙ¹)^m` through a class supported on the
diagonal.

*Method of the formal proof:* the product `Π_j (η(q_j) + η(q'_j))` of classes `η` (CohomologyOfFunctorsOnTestRings
§5.1) serves as a kernel supported on the diagonal of `(ℙ¹)^m × (ℙ¹)^m`: coordinate by coordinate it transports
classes from the point `q` to the point `q'`, since sections that coincide on the locus `q_j = q'_j` have equal
classes there. With `q` tautological and `q'` a parameter, integration over the parameters (4.1 (d)) and the
hypothesis on the `θ_j` write `Q` as a retract of `N` by natural operations, so 4.1 (c) applies.

Let `D` be a compared theory over `A`, `m ≥ 0`, and `I` a compatible family of ideals on the points of `(ℙ¹)^m` over
tests (a family of ideals as in CohomologyOfFunctorsOnTestRings §2.7: for each test `c` and point `x ∈ (ℙ¹)^m(c)` an
ideal `I(x)` of `c`, with `I(f x)` generated by `f(I(x))`). Let `U` be the locus where `I` is the unit ideal and
`Q = ℤ[(ℙ¹)^m]/ℤ[U]`. Let `D` be good at `N`, and suppose there are
classes `θ_j` over the category of points of `(ℙ¹)^m`, from `N` to the locally constant `ℤ/ℓ`-valued functions on the
zero locus of `I` (the coefficient `LC_{I=0}` of CohomologyOfFunctorsOnTestRings §2.7 (b)), such that every class of
total `Ext` of `Q`, on the points of `(ℙ¹)^m`, with values in these
functions is `Σ_j θ_j ∘ w_j` for classes `w_j` of total `Ext` from `Q` to `N` on tests over `A`, restricted to the
points. Then `D` is good at `Q`.

*Needs:* 4.1; CohomologyOfFunctorsOnTestRings §5.1 (the class `η`); CohomologyOfFunctorsOnTestRings §1.1 (relative
functors `ℤ[Y]/ℤ[U]`); CohomologyOfFunctorsOnTestRings §2.7 (families of ideals, `LC_{I=0}`).

[ShortProof], `Lib/PadicComparison/Duality/LineIntegration` (`New.Variety.IdealFamily.exists_move_kernel`,
`New.Variety.IdealFamily.extendToZeros`, `New.Variety.NaturalOp.integrate`,
`New.Variety.ComparedTheory.isFiniteLerayHirsch_of_integrate_params`,
`New.Variety.ComparedTheory.isFiniteLerayHirsch_topPoints_of_surjective`)

### 4.3 Standard étale charts are good

*Origin:* particular to this proof: excision, a Thom retraction along `ℙ¹` and Alexander duality for principal open
sets of affine space, for a compared theory, and the passage from standard étale charts to charted functors.

*Method of the formal proof:* (a) applies 4.1 (b) to the map `ℤ[E]/ℤ[u^{−1}U] → ℤ[Y]/ℤ[U]`: the first hypothesis
makes its cokernel, and the second its kernel, vanish Zariski-locally.
(b) writes `(Y, V)` as a retract of its product with `(ℙ¹, 𝔸¹)` by means of `η` and applies 4.1 (c). (c) is 4.2 for
the multihomogeneous ideal that cuts the complement of `Spec T[1/a]` out of `(ℙ¹)^d`, the classes `θ_j` coming from
detection at points (CohomologyOfFunctorsOnTestRings §4.4) on the proper functor `(ℙ¹)^d`. (d) introduces the functor
of pairs `(y, x)`, `y` a root of `f` and `x` a point of `Spec R[X][1/g]` with `f(x)` a unit multiple of `x − y`; by
excision (a) it may replace both `Spec R[X][1/g]`, which (c) treats, and `Y × ℙ¹`, into which it maps by
`(y, x) ↦ (y, (x − y : 1))`, and (b) returns from `Y × ℙ¹` to `Y`. (e) uses (a) to pass to the charting subfunctor and
its definition to pass to charts étale over a torus; over `A` such a chart is a finite union of principal opens that
are standard étale over polynomial rings over `A` (Mathlib `Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial`),
each treated by (d), and Mayer–Vietoris for closed classes (CohomologyOfFunctorsOnTestRings §2.4 (c)) handles the
union.

Let `D` be a compared theory over `A` and suppose the pair (point, point off the closed fibre) is good.
(a) (Excision.) Let `u : E → Y` be a map of set-valued functors on tests over `A` and `U ⊆ Y` a subfunctor. Suppose that
Zariski-locally every point of `Y` lies in the image of `u` or in `U`, and Zariski-locally two points of `E` with the
same image have the same class modulo `u^{−1}U`. Then `(E, u^{−1}U)` is good if and only if `(Y, U)` is good.
(b) (Thom retraction.) For `V ⊆ Y`, if `(Y × ℙ¹, V × ℙ¹ ∪ Y × 𝔸¹)` is good, with `𝔸¹ = ℙ¹ ∖ {(0 : 1)}`, then `(Y, V)` is
good.
(c) (Alexander duality.) Let `T` be a polynomial ring over `A` in `d` variables, embedded in `(ℙ¹)^d`, and `a ∈ T`. Then
the pair `((ℙ¹)^d, Spec T[1/a] ∪ ((ℙ¹)^d)°)` is good.
(d) (Standard étale charts.) Let `R` be an `A`-algebra with an isomorphism of `A`-algebras `R[X] ≅ A[x_1, …, x_d]`,
and `(f, g)` a standard étale pair over `R` (`f` monic, `f'` invertible in `(R[X]/f)[1/g]`). Then for
`Y = Spec (R[X]/f)[1/g]` the pair `(Y, Y°)` is good.
(e) (Charted functors.) Suppose moreover that `A` is a valuation ring. Let `P` be a closed class of functors from tests
over `A` to `Ab` such that, for every set-valued functor `X` on tests over `A`, `P` contains `ℤ[X]` exactly when
`(X, X°)` is good (so `P` contains `ℤ` of the point). Let `k` be a ring with a map `k → A` and `X` a set-valued
functor on `k`-algebras with a charting subfunctor (Conventions). Then `P` contains the functor `C ↦ ℤ[X(C)]` on
tests `C` over `A`, each read as a `k`-algebra through `k → A`.

*Needs:* 4.1, 4.2; CohomologyOfFunctorsOnTestRings §1.1 (Zariski-local subfunctors, relative functors);
CohomologyOfFunctorsOnTestRings §5.1 (the class `η`); CohomologyOfFunctorsOnTestRings §4.4 (detection of classes at
points); CohomologyOfFunctorsOnTestRings §2.4 (Mayer–Vietoris for closed classes); CohomologyOfFunctorsOnTestRings §1.4
(proper functors, charts and atlases); Mathlib `Algebra.IsSmoothAt.exists_isStandardEtale_mvPolynomial` (smooth is
locally standard étale).

[ShortProof], `Lib/PadicComparison/Duality/GoodPairs` (`New.Variety.ComparedTheory.isFiniteLerayHirsch_iff_of_locally_bijective`,
`New.Variety.ComparedTheory.isFiniteLerayHirsch_of_prod_projLine`,
`New.Variety.ComparedTheory.isFiniteLerayHirsch_principal_open`,
`New.Variety.ComparedTheory.isFiniteLerayHirsch_offClosedFibre_sup_testUnitLocus_preimage`,
`New.Variety.ComparedTheory.isFiniteLerayHirsch_standard_etale`), `Lib/Cohomology/SmoothBaseChange`
(`New.Variety.ComparedTheory.mem_of_isClosedClass_of_isCharting`)

## Layer 5: The primitive comparison, finiteness and the period map

### 5.1 Period ring pairs, the primitive map and the tilted theory

*Origin:* particular to this proof: period ring pairs, the natural map from locally constant functions to the tilt,
and the tilted coefficients `S ↦ S♭ ⊗ M` as a theory along `S ↦ S[1/p]`.

*Method of the formal proof:* for (ii), a locally constant `𝔽_p`-valued function on `Spec T` extends to `Spec S` and
so defines an element of `S/p` fixed by Frobenius, whose constant system of `p`-th roots lies in `S♭`. (a) holds
because tilting, Witt vectors and completion commute with finite products. (b) describes the maps of tests killing
an ideal of `T` as the points, in tilts of tests, of a perfect quotient of `S♭`, and applies the acyclicity
hypothesis to that quotient; Zariski descent comes from (a) (CohomologyOfFunctorsOnTestRings §2.4 (e)).

(i) A *period ring pair* `(Λ, K)` is an `A_inf`-algebra `Λ` that is `p`-complete torsion-free, with `p` dividing the
image of `ξ`, and a `Λ`-algebra `K` in which the image of `τ` is a unit. `(O_C, ℂ_p)`, with `A_inf → O_C` given by `θ`,
is one.
(ii) For a test ring `A` let `LC(A)` be the ring of locally constant `𝔽_p`-valued functions on `Spec A`. For a
`p`-adic test `S` there is a natural map of `𝔽_p`-algebras `LC(T) → S♭` sending a function to the constant sequence of
the element of `S/p` that it defines, and its `O♭`-linear extension, the *primitive map* `O♭ ⊗_{𝔽_p} LC(T) → S♭`.

(a) If maps of tests `f : S → S₁`, `f' : S → S₂` exhibit `S` as a product (`x ↦ (f x, f' x)` bijective), then the
tilts exhibit `S♭` as the product of `S₁♭` and `S₂♭`; functors isomorphic to `S ↦ K ⊗_Λ P_Λ(S♭)` are additive along
such decompositions.
(b) Let `Ω` be a local domain that is absolutely integrally closed and in which `p` is invertible, with a map
`Ω → ℂ_p`, and `M` an
`O♭`-module such that `D ↦ D ⊗_{O♭} M` is acyclic at every perfect `O♭`-algebra along `S ↦ S♭` (as in 2.1 (c)). Then
`S ↦ S♭ ⊗_{O♭} M`, along the functor `S ↦ T` from `p`-adic tests to tests over `Ω`, is a theory in the sense of
CohomologyOfFunctorsOnTestRings §2.7 for `ℓ = p`.

*Needs:* 1.1, 1.2, 2.1; CohomologyOfFunctorsOnTestRings §2.7 (theories along a functor to tests);
CohomologyOfFunctorsOnTestRings §2.4 (Zariski descent from partitions); CrystallineRepresentationsAndKisinModules §1.1
(`τ`, `ξ`).

[ShortProof], `Lib/PadicComparison/Primitive/PeriodCoefficients` (`New.Variety.bijective_prod_tilt`,
`New.Variety.IsPeriodRingPair`, `New.Variety.isPeriodRingPair_OC`, `New.Variety.hasPartitions_periodAlg`,
`New.Variety.locConstToTilt`, `New.Variety.oFlatLocConst`, `New.Variety.primitiveMap`,
`New.Variety.PadicTest.tiltNearZeros`, `New.Variety.PadicTest.perfectRing_quotient_tiltNearZeros`,
`New.Variety.tiltTheory`)

### 5.2 The primitive comparison theorem

*Origin:* adapted from the published primitive comparison theorem (Scholze (2013), p-adic Hodge theory for
rigid-analytic varieties, Theorems 1.3 and 5.1; for the method, Zavyalov, arXiv 2301.03821, Theorem 3.3.3 and
Application 1.3.4, and Li, Reinecke and Zavyalov, arXiv 2410.08200, §6.4): here, for the cohomology on test rings of
proper charted schemes with constant coefficients, made an exact bijection by placing the maximal ideal of `O♭` in the
coefficients, and proved through the duality of Layer 4 instead of almost finiteness.

*Method of the formal proof:* the route is Layer 4 with `ℓ = p`. The tilted theory of 5.1 (b) and the locally
constant theory, linked by the classes of an `𝔽_p`-basis of `M`, form a compared theory along `S ↦ T`; both have the
projective line formula (CohomologyOfFunctorsOnTestRings §§5.4, 5.5). It is good at the point, where both sides are
computed directly (`O♭` and `Ω` being initial, with the acyclicity hypothesis), and 4.3 (e) carries goodness from the
point to `Y`, which gives (b) and (d); over a field the part off the closed fibre plays no role. The passage between all
test rings and tests over `Ω` is CohomologyOfFunctorsOnTestRings §5.6 (a). (a) is 1.3 (c), (d), and (c) is the
valuative criterion of properness in each cell.

Let `R` be a ring, `Ω` an algebraically closed field with maps `R → Ω` and `Ω → ℂ_p`, and `Y` a proper `R`-scheme
charted over `Ω`. Let `M` be an `O♭`-module such that for every perfect `O♭`-algebra `b`, `D ↦ D ⊗_{O♭} M` is acyclic at
`b` along `S ↦ S♭`. Let `X` be the functor of points of `Y_Ω` on test rings.
(a) `ℤ[X]` has flat base change.
(b) `Hⁿ(Y_Ω, 𝔽_p)` is finite for every `n`.
(c) For every `p`-adic test `S` and every map `R → O_C`, restriction `Y(S) → Y(T)` of `R`-points is bijective.
(d) Suppose `R → O_C` is given with `R → Ω → ℂ_p` equal to `R → O_C → ℂ_p`. Then for every `n` the map
`Hⁿ(X, A ↦ O♭ ⊗_{𝔽_p} LC(A) ⊗_{O♭} M) → Hⁿ(S ↦ Y(S), S ↦ S♭ ⊗_{O♭} M)`, from the cohomology of `Y_Ω` on test rings to
that of the points of `Y` on `p`-adic tests, is bijective. It is induced by `S ↦ T`, by the map of points
`Y(S) → Y(T) = Y_Ω(T)` and by the primitive map tensored with `M`.

By 2.1 (c) the hypothesis on `M` holds for `M = N ⊗_{O♭} 𝔪` with `p♭N = 0`, and (a), (b) do not depend on `M`. For
étale cohomology of proper smooth rigid spaces the published comparison is PadicHodgeTheory §2.7; it is not used.

*Needs:* 1.3 (c), (d), 2.1, 4.1, 4.3, 5.1; CohomologyOfFunctorsOnTestRings §§5.4, 5.5 (projective line formula,
tilted and `ℤ/ℓ`); CohomologyOfFunctorsOnTestRings §5.6 (cohomology on tests over `Ω`).

[ShortProof], `Lib/PadicComparison/Primitive/ComparisonTheorem` (`New.Variety.PadicTest.bijective_generic_points`,
`New.Variety.toGenericPoints`, `New.Variety.ComparedTheory.isFiniteLerayHirsch_freeAb_iff_relFreeAb`,
`New.Variety.hasFlatBaseChange_algPointsOf`, `New.Variety.hasFlatBaseChange_geomPoints`,
`New.Variety.tiltReprIsoGenericRepr`, `New.Variety.finite_and_primitive_comparison`)

### 5.3 Finiteness and continuity of `p`-adic cohomology

*Origin:* adapted from the published theory of the finiteness of the `p`-adic étale cohomology of proper varieties
and of the continuity of the Galois action on it (SGA 4, Exposé XIV (Artin), finiteness for proper morphisms;
Scholze (2013), Theorem 1.1; by duality, Zavyalov, arXiv 2301.03821, Application 1.3.4): here, for the cohomology of
functors on test rings of proper charted schemes, deduced from the primitive comparison.

*Method of the formal proof:* (a) takes finiteness modulo `p` from 5.2 (b), for some embedding `Ω → ℂ_p`, and lifts
it to `ℤ_p` by CohomologyOfFunctorsOnTestRings §3.4 (c). For (b) it suffices, by linearity, to treat `a ⊗ t` with `t`
integral. A lattice has compact image under `l`, so a high power `p^k` brings it into any neighbourhood of zero; and
modulo `p^k` the class `t` is defined over a subalgebra of `Ω` generated by finitely many elements
(CohomologyOfFunctorsOnTestRings §3.2 (b)), whose common stabiliser is open and fixes `t` modulo `p^k`.

Let `R` be a ring with a map to `Ω` and `Y` a proper `R`-scheme charted over `Ω`.
(a) `Hⁿ(Y_Ω, ℤ_p)` is a finitely generated `ℤ_p`-module, and `Vⁿ(Y)` is finite-dimensional over `ℚ_p`.
(b) Let `K` be a field with `R → K → Ω` and `Ω/K` Galois. For every `x ∈ Vⁿ(Y)`, every `N` and every `ℚ_p`-linear
`l : Vⁿ(Y) → ℚ̄_p^N`, the map `Gal(Ω/K) → ℚ̄_p^N`, `g ↦ l(g x)`, is continuous for the Krull topology on `Gal(Ω/K)`.

For étale cohomology the corresponding statements are EtaleCohomologyFoundations §F.4.4 and §F.4.6; they are not
used.

*Needs:* 5.2, 2.1; CohomologyOfFunctorsOnTestRings §3.4 (finiteness over `ℤ_ℓ`, reduction modulo `ℓ^k`);
CohomologyOfFunctorsOnTestRings §§1.5, 3.2, 3.3 (continuity along finitely generated subalgebras).

[ShortProof], `Lib/PadicComparison/Primitive/ComparisonTheorem` (`New.Variety.finite_padic_cohomology`,
`New.Variety.ellAdicCohom.continuous_galoisAction`)

### 5.4 From almost coefficients to period coefficients

*Origin:* particular to this proof: the passage of a comparison from the coefficients `b ⊗ (O♭ ⊗ Λ) ⊗ 𝔪` to the
period coefficients `K ⊗_Λ P_Λ(b)`, and the primitive comparison with period coefficients.

*Method of the formal proof:* (a) interpolates the coefficients `b ↦ (Λ ⊗ W(𝔪)) ⊗ W(b)` between the two sides. Since
`W(𝔪)` reduces to `𝔪` modulo `p`, they reduce to the almost coefficients, and 3.2 (c) gives bijectivity for their
completion; flatness of `K` keeps it after `K ⊗_Λ −`, where they agree with the period coefficients because
`τ ∈ W(𝔪)` is a unit in `K`. (b) factors the map through the completed coefficients `(Λ ⊗ W(O♭ ⊗ LC))^`: the first
step is bijective on cohomology by 3.2 (d) and the finiteness hypothesis, the second is the primitive map, treated by
(a), and the last is the given isomorphism with `Ψ`.

Let `(Λ, K)` be a period ring pair with `K` flat over `Λ`.
(a) Let `ψ`, `ψ'` be functors on `𝒞`, `𝒞'` to `O♭`-algebras whose values are perfect without `p♭`-torsion, compared by
`β : ψ∘φ → ψ'` along `φ : 𝒞' → 𝒞`, and let `α : N' → N∘φ`. Suppose that `N` has flat base change and that, for every
functor `G` from `O♭`-algebras to `Λ`-modules and every `n`, the map `K ⊗_Λ Hⁿ(N', G∘ψ') → Hⁿ(N', K ⊗_Λ G∘ψ')` is
bijective. If the comparison is bijective along `α` for the coefficients `b ↦ b ⊗_{O♭} (O♭ ⊗_{A_inf} Λ) ⊗_{O♭} 𝔪`,
it is bijective along `α` for `b ↦ K ⊗_Λ P_Λ(b)`.
(b) Let `Ψ` be a functor from `p`-adic tests to `K`-modules with a natural isomorphism `K ⊗_Λ P_Λ(S♭) ≅ Ψ(S)`. Let
`N` on test rings and `N'` on `p`-adic tests have flat base change, let every `Hⁿ(N, ℤ_p)` be finitely generated over
`ℤ_p`, and let `α : N' → N∘(S ↦ T)` be such that the primitive map is bijective along `α` for the coefficients of (a).
Then the natural map `K ⊗_{ℤ_p} W(LC(T)) → Ψ(S)`, `a ⊗ w ↦` the image of `a ⊗ 1 ⊗ W(LC(T) → S♭)(w)`, is bijective on
cohomology along `α`. Here `Λ` and `K` are `ℤ_p`-algebras through `ℤ_p → A_inf → Λ → K`.

*Needs:* 3.2, 5.1, 2.1, 1.2; CrystallineRepresentationsAndKisinModules §1.1 (the ideal `W(𝔪)` of `A_inf` and the
element `τ`, which lies in it).

[ShortProof], `Lib/PadicComparison/Primitive/PeriodCoefficients` (`New.Variety.exists_isReductionMod_wittOfMaxIdeal`,
`New.Variety.exists_comp_eq_tau_smul_id`, `New.Variety.CoeffCompBijective.periodAlg_of_almostCoeff`),
`Lib/PadicComparison/Primitive/Periods` (`New.Variety.primitivePeriodMap`, `New.Variety.primitivePeriodMap_isBijective`,
`New.Variety.exists_primitive_period_comparison`)

### 5.5 The period map

*Origin:* adapted from the published primitive comparison theorem and period isomorphism (Scholze (2013),
Theorems 1.3 and 5.1): here, for the cohomology of functors, with the period coefficients of any period ring pair, as
natural and Galois-equivariant maps that are bijective for proper charted schemes.

*Method of the formal proof:* `J_Y` extends scalars from `ℤ_p` to `K`, applies the map of the conventions
(*Flat base change*) from `K ⊗_{ℤ_p} Hⁿ(Y_Ω, ℤ_p)` to the cohomology of `Y_Ω` with coefficients `K ⊗_{ℤ_p} W(LC)`,
and pulls back along the comparison of 5.4 (b) and the map of points `Y(S) → Y_Ω(T)`. Equivariance reduces to
the Frobenius-invariance of the coordinates of Witt vectors of locally constant `𝔽_p`-valued functions. Bijectivity
combines 5.2 for `M = (O♭ ⊗_{A_inf} Λ) ⊗ 𝔪`, admissible by 2.1 (c) because `p ∣ ξ` in `Λ` makes `p♭` kill
`O♭ ⊗_{A_inf} Λ`, with the finiteness of 5.3 and the flat base change of 1.3 (c).

Let `R` be a ring with maps `R → O_C` and `R → Ω`, `e : Ω → ℚ̄_p` an embedding that agrees with `R → O_C` on `R`, `Γ` a
group acting on `Ω` by `R`-algebra automorphisms and `j : Γ → G_p` a homomorphism with `j(g)(e(x)) = e(g x)`. Let
`(Λ, K)` be a period ring pair with `K` flat over `Λ` and a `ℚ_p`-algebra, compatibly with `ℤ_p → A_inf → Λ → K`, and
`Ψ` a functor from `p`-adic tests to `K`-modules with a natural isomorphism `ϑ : K ⊗_Λ P_Λ(S♭) ≅ Ψ(S)`. Then for
every `n` there are `K`-linear maps `J_Y : K ⊗_{ℚ_p} Vⁿ(Y) → Hⁿ(S ↦ Y(S), Ψ)`, one for each `R`-scheme `Y`, such
that:
(a) (naturality) `J_W ∘ (1 ⊗ f^*) = f^* ∘ J_Y` for every map `f : W → Y` of `R`-schemes;
(b) (equivariance) for `g ∈ Γ`, a `ℤ_p`-linear `σ : K → K` and a natural additive map `β : Ψ∘(twist by j(g)) → Ψ`
with `β(ϑ(a ⊗ 1 ⊗ w)) = ϑ(σ(a) ⊗ 1 ⊗ w)` for all `a ∈ K` and all Witt vectors `w` over `S♭` whose coordinates satisfy
`w_i^p = w_i`, `J_Y ∘ (σ ⊗ g)` is `J_Y` followed by the map that restricts a class along the twist by `j(g)`, pushes
it along `β`, and pulls it back along the identification of the points of `Y` in `S` with those in `j(g)S`;
(c) (bijectivity) `J_Y` is bijective when `Y` is proper and charted over `Ω`.

*Needs:* 5.2, 5.3, 5.4, 1.3, 2.1; CohomologyOfFunctorsOnTestRings §3.4 (`Vⁿ(Y)` and its Galois action);
CohomologyOfFunctorsOnTestRings §5.6 (cohomology on tests over a ring).

[ShortProof], `Lib/PadicComparison/HodgeTate/PeriodMap` (`New.Variety.toTwistAlg`, `New.Variety.toTwistPoints`,
`New.Variety.ActsAsOnFrobeniusFixed`, `New.Variety.IsPadicPeriodMap`, `New.Variety.exists_period_map`)

## Layer 6: The Hodge–Tate map

In this layer `k` is a field of characteristic zero with a map `k → ℚ̄_p`; the rings `T` and `B_S` below are
`k`-algebras through `k → ℚ̄_p → ℂ_p` and through the lift of 6.1 (c).

### 6.1 The generic ring of a test and its square-zero thickening

*Origin:* adapted from the published theory of Fontaine's ring `B_dR⁺` modulo the square of `ker θ` and of the
extension of `ℂ_p` by `ℂ_p(1)` it carries: here, for the rings of `p`-adic tests.

*Method of the formal proof:* (a) rests on 1.2 (a) and on CohomologyOfFunctorsOnTestRings §§1.2, 2.4; (b) on 1.2 (c)
together with the fact that `ξ` remains a non-zero-divisor once `p` is inverted; (c) on the formal étaleness of `ℚ̄_p`
over `ℤ_p`; and (d) is 1.2 (c) with `p` inverted.

Let `S` be a `p`-adic test, `T = S[1/p]` and `B_S = W(S♭)[1/p]/(ker θ_T)²`, where `θ_T : W(S♭)[1/p] → T` is `θ_S` with
`p` inverted.
(a) `S → T` is injective, `T` is a test ring, and, for any functor `Θ` from a category `𝒞` to `p`-adic tests,
coefficients on `𝒞` that are additive along partitions of the rings of the tests `Θ(c)` by idempotents have Zariski
descent for the rings `T` of the `Θ(c)`.
(b) `ker(B_S → T)` has square zero, and `0 → T →^{ι_S} B_S → T → 0` is exact, where `ι_S(θ_T(x))` is the class of `μx`;
`ι_S` is `B_S`-linear and natural in `S`.
(c) The structure map `ℚ̄_p → ℂ_p → T` lifts to exactly one `ℤ_p`-algebra map `ℚ̄_p → B_S`; the lifts are natural in `S`.
(d) For `(Λ, K) = (O_C, ℂ_p)` there is a natural isomorphism `ℂ_p ⊗_{O_C} P_{O_C}(S♭) ≅ T` sending `a ⊗ 1 ⊗ w` to
`a·θ_S(w)`.

*Needs:* 1.1, 1.2, 3.1; CrystallineRepresentationsAndKisinModules §1.1 (`μ`, `ξ`, `θ`);
CohomologyOfFunctorsOnTestRings §1.2 (test rings are stable under localisation); CohomologyOfFunctorsOnTestRings §2.4
(Zariski descent from partitions).

[ShortProof], `Lib/PadicComparison/HodgeTate/GenericFibre` (`New.Variety.PadicTest.eq_zero_of_algebraMap_genericRing`,
`New.Variety.PadicTest.ker_thickeningProj_sq`, `New.Variety.PadicTest.existsUnique_lift_thickening`,
`New.Variety.PadicTest.uniqueLift`, `New.Variety.exists_periodAlg_iso_genericAlg`, `New.Variety.genericOver`,
`New.Variety.thickeningOver`, `New.Variety.hasZariskiDescent_genericOver`, `New.Variety.thickeningOver.mulMu`,
`New.Variety.thickeningOver.isLeftRegular_xi`, `New.Variety.thickeningOver.exact_mulMu_proj`)

### 6.2 Hodge–Tate pairs and the contraction class

*Origin:* particular to this proof: the category of pairs of a `p`-adic test and a free module over its generic ring,
and the class of contraction in `Ext¹`, whose powers carry Hodge forms to functions.

*Method of the formal proof:* (a) is verified on decomposable forms, by induction on their degree, from the
composition law of maps of pairs. (c) compares the cocycle with its pull-back under the scaling of the modules. (d)
expands the `l`-th Yoneda power of the class of a two-component cocycle on `Λ ⊗ Λ`, using (a) for the components and
(b) to move them past `x`. (b) and (e) are direct.

(i) A *1-cocycle* from `F` to `G` (functors on a category) is a family of maps `D(f) : F(c) → G(d)` for `f : c → d` with
`D(gf) = G(g)D(f) + D(g)F(f)`; its class in `Ext¹(F, G)` is the class of the extension `G → G × F → F` in which `f`
acts by `(y, x) ↦ (G(f)y + D(f)x, F(f)x)`.
(ii) A *Hodge–Tate pair* `(S, M)` is a `p`-adic test `S` with `M = T^n`. A map `(S, M) → (S', M')` is a pair `(f, φ)` of
a map of tests `f` and a map `φ = (φ₀, φ₁) : M → T' × M'` that is semilinear over `T → T'`; the identity is
`(1, m ↦ (0, m))` and `(g, ψ)∘(f, φ) = (gf, m ↦ (g(φ₀ m), 0) + ψ(φ₁ m))`.
(iii) `B_{S,M} = B_S ×_T (T ⊕ M)`, with `T ⊕ M` the trivial square-zero extension, is a functor of pairs in which
`(f, φ)` acts by `(b, (s, m)) ↦ (f(b) + ι_{S'}(φ₀ m), (f(s), φ₁ m))`; it maps to `T ⊕ M` and to `T`.
(iv) On `Λ(S, M) = ⋀_T M`, the *contraction* of `(f, φ)` is `c_φ : ⋀M → ⋀M'`, the map induced by `φ` into
`⋀(T' × M')`, followed by contraction with the first projection and by the projection to `⋀M'`. `κ ∈ Ext¹(Λ, Λ)` is the
class of the cocycle `(f, φ) ↦ c_φ`, and `κ_h ∈ Ext^h(Λ, T)` is the `h`-th Yoneda power of `κ` followed by the
projection of `⋀M` to its degree-zero part `T`.

(a) `(f, φ) ↦ c_φ` is a 1-cocycle; `c_φ(x ∧ y) = s(φ₁ x) ∧ c_φ(y) + c_φ(x) ∧ φ₁(y)`, with `s` the grade involution.
(b) Let `Φ`, `Ψ` be exact functors and `Ξ` an additive functor from the category of functors `𝒞 → Ab` to itself, with
natural maps `Ψ → Ξ → Φ` such that `0 → Ψ(K) → Ξ(K) → Φ(K) → 0` is exact for every `K`, and let `δ_K ∈ Ext¹(Φ(K), Ψ(K))`
be its class. Then for `x ∈ Ext^a(F, G)`, `Φ(x)` followed by `δ_G` equals `(−1)^a` times `δ_F` followed by `Ψ(x)`.
(c) `κ_h` is `k`-linear, and it has weight `h`: precomposed with the map of `Λ` induced by `m ↦ t m` (`t ∈ k`) it becomes
`t^h κ_h`.
(d) (Binomial rule.) Let `P`, `L` be functors on Hodge–Tate pairs, `P` with flat values, `x ∈ Ext^a(P, Λ)` and `y` a
class of total `Ext` from `L` to `Λ`. Write `κ_l(z)` for a class `z` with values in `Λ` followed by `κ_l`, `x ∧ y` for
the external product of `x` and `y` (a class from `P ⊗ L` to `Λ ⊗ Λ`) followed by the wedge product `Λ ⊗ Λ → Λ`, and
`×` for the external product followed by multiplication in `T`. Then
`κ_l(x ∧ y) = Σ_{h ≤ l} C(l, h)(−1)^{(a+h)(l−h)} κ_h(x) × κ_{l−h}(y)`.
(e) `B_{S,M} → T` is onto with kernel of square zero, and maps of pairs out of `(S, T^r)` are determined by the map of
tests and the images of the basis vectors, which can be prescribed.

*Needs:* 6.1; CohomologyOfFunctorsOnTestRings §2.2 (total `Ext`, Yoneda and external products);
CohomologyOfFunctorsOnTestRings §6.1 (Hodge pairs `(A, M)`, exterior algebras).

[ShortProof], `Lib/PadicComparison/HodgeTate/ExtCocycles` (`New.Variety.TotalH.extClass_sign_comm`,
`New.Variety.Cocycle`, `New.Variety.Cocycle.cohomClass`, `New.Variety.contraction`, `New.Variety.contraction_mul`),
`Lib/PadicComparison/HodgeTate/Map` (`New.Variety.HodgeTatePair`, `New.Variety.HodgeTatePair.pairAlg`,
`New.Variety.HodgeTatePair.contractionCocycle`, `New.Variety.HodgeTatePair.contractionPow`,
`New.Variety.HodgeTatePair.act_comp_contractionPow`, `New.Variety.HodgeTatePair.scaleModule_comp_contractionPow`,
`New.Variety.HodgeTatePair.contractionPow_cup`, `New.Variety.HodgeTatePair.isSquareZero_toGeneric`,
`New.Variety.HodgeTatePair.existsUnique_hom`)

### 6.3 The Hodge–Tate map

*Origin:* adapted from the published Hodge–Tate map from Hodge cohomology to `p`-adic étale cohomology (Scholze
(2013), Corollary 1.8; for the construction, Bhatt (2017), The Hodge–Tate decomposition via perfectoid spaces, §3.4),
which is built from lifts along a square-zero thickening of the kind of 6.1: here, on the Hodge cohomology of
functors, with values in the cohomology of Hodge–Tate pairs; only the map is constructed, and it is not shown to be
bijective.

*Method of the formal proof:* (a) comes from 6.2 (c) and (b) from 6.2 (d). For (c), let `V ⊆ X` be the union of the
loci of the étale charts. Every field-valued point lies in one, so `V` is Zariski-locally all of `X`, and Zariski
descent (6.1 (a)) reduces (c) to `V` on tests and its preimage on pairs. Given a point of `V(T)` in a chart with `n`
coordinates, lift the values of the coordinates to `B_S` and add the basis vectors of `T^n`: étaleness gives a point
over `B_{S,T^n}`, and, the chart being étale and open, every point over a `B_{S',M'}` lying over the given point comes
from it by exactly one map of pairs (6.2 (e)). As the pair `(S, T^n)` has the coefficient `T` of `S`, restriction is
bijective. (d) follows from (c) and 6.2 (c).

For a functor `N` from `k`-algebras to abelian groups let `PairH(N) = H*((S, M) ↦ N(B_{S,M}), (S, M) ↦ T)`, on
Hodge–Tate pairs. The *Hodge–Tate map* `λ_h : H^q_Hodge(N) → PairH(N)` pulls a Hodge class back along
`B_{S,M} → T ⊕ M` to the pairs `(T, M)` and takes its Yoneda product with `κ_h`. *Restriction to pairs*
`Hⁿ(S ↦ N(T), T) → PairH(N)` is pull-back along `B_{S,M} → T`.
(a) `λ_h` is `k`-linear, natural in `N`, lands in degree `q + h`, and turns the scaling `(a, m) ↦ (a, t m)` of Hodge
cohomology into multiplication by `t^h`.
(b) (Products.) For Hodge classes `x` of degree `a` on `N` with flat values and `y` of degree `b` on `N'`, let `x ∧ y`
be their product, a Hodge class of degree `a + b` on the objectwise tensor product `N ⊗ N'` (the product of Hodge
classes of CohomologyOfFunctorsOnTestRings §6.1, through the multiplication of exterior algebras). Then
`λ_l(x ∧ y) = Σ_{h ≤ l} C(l, h)(−1)^{(a+h)(l−h)} λ_h(x) × λ_{l−h}(y)`, with `×` as in 6.2 (d).
(c) Let `X` be a functor from `k`-algebras to sets every field-valued point of which lies in an étale chart with `n`
coordinates. Then restriction to pairs is bijective in every degree for `N = ℤ[X]`.
(d) For such `X` and every Hodge class `x` of degree `q`, `λ_h(x)` is the restriction to pairs of a class of degree
`q + h` in `H^{q+h}(S ↦ ℤ[X(T)], T)`, and restriction to pairs is injective in each degree.

*Needs:* 6.1, 6.2; CohomologyOfFunctorsOnTestRings §6.1 (Hodge cohomology and its operations);
CohomologyOfFunctorsOnTestRings §1.4 (étale charts); Mathlib `Algebra.FormallyEtale.comp_bijective` (unique lifts along
square-zero extensions).

[ShortProof], `Lib/PadicComparison/HodgeTate/Map` (`New.Variety.PairH`, `New.Variety.hodgeTateMap`,
`New.Variety.HodgeTatePair.exists_contractionPow_eq_directSum_of`,
`New.Variety.restrictToPairs`, `New.Variety.hodgeTateMap_map`, `New.Variety.hodgeTateMap_scale`,
`New.Variety.hodgeTateMap_cup`, `New.Variety.PairRestrictBijective`,
`New.Variety.PairRestrictBijective.injective_restrictToPairs`, `New.Variety.PairRestrictBijective.exists_hodgeTateMap_eq`,
`New.Variety.IsChartCovered.pairRestrictBijective`)

### 6.4 Galois twists and the weight of the Hodge–Tate map

*Origin:* particular to this proof: the action of `G_p` on classes of tests through twisting, and its effect on the
values of `λ_h`.

*Method of the formal proof:* (a) is CrystallineRepresentationsAndKisinModules §1.2 (b) read in `B_S`, where `μ²`
vanishes. (b) holds because the contraction cocycle of 6.2 (iv) is given by one formula for `S` and for `gS`. For (c),
for each pair the identity of `B_S` together with `(s, m) ↦ (s, t m)` on `T ⊕ M` is a map from `B_{S,M}` to the ring
of the pair with twisted test; it is `E`-linear because `g` fixes `E`, and natural in the pair because, by (a),
multiplication by `t` is exactly the change of `ι_S` under the twist. Pulling back along these maps, the class of `x_k`
on pairs, which comes from `E`, changes only by the scaling `m ↦ t m`; then (b) removes the twist from `κ_h`, and
6.2 (c) turns the scaling into the factor `t^h`.

Let `g ∈ G_p`.
(a) For every `p`-adic test `S` and `t ∈ T`, `ι_S(t) = ι_{gS}(χ(g^{−1})·t)`, where `χ(g^{−1})` acts through `ℂ_p → T`.
(b) Twisting the test of a pair, `(S, T^n) ↦ (gS, T^n)`, is an endofunctor of Hodge–Tate pairs, and `κ_h`, restricted
along it and composed with the identification of the coefficients `T`, is `κ_h` again.
(c) Let `E ⊆ k` be a subfield whose image in `ℚ̄_p` is fixed by `g`, `x` a Hodge class of degree `q` of a functor `N` on
`E`-algebras, `ζ ∈ Hⁿ(S ↦ N(T), T)` with `λ_h(x_k) = ` (restriction of `ζ` to pairs), `x_k` the base change of `x` to
`k`, and `t ∈ k` with image `χ(g^{−1})` in `ℚ̄_p`. Then the pull-back of `ζ` along the twist by `g` (the identity of each
`T`, read as a map of `E`-algebras from the ring of `S` to that of `gS`, with the identity on coefficients) has the
same restriction to pairs as `t^h ζ`.

*Needs:* 6.1, 6.2, 6.3; CrystallineRepresentationsAndKisinModules §1.2 (`g^{−1}μ − χ(g^{−1})μ ∈ μ²A_inf`).

[ShortProof], `Lib/PadicComparison/HodgeTate/GaloisWeight` (`New.Variety.PadicTest.genericStructureMap_twist`,
`New.Variety.PadicTest.uniqueLift_comp_eq_uniqueLift_twist`, `New.Variety.thickeningOver.mulMu_twist`,
`New.Variety.HodgeTatePair.galTwist`, `New.Variety.HodgeTatePair.contractionPow_galTwist`,
`New.Variety.hodgeTateMap_galois_twist`)

### 6.5 Hodge–Tate weights of the values of the Hodge–Tate map

*Origin:* adapted from the published theory of the Hodge–Tate map and decomposition for the `p`-adic cohomology of
proper smooth varieties (Scholze (2013), Corollary 1.8): here, only that each value of `λ_h` comes from a vector of
weight `h`, for the cohomology of functors.

*Method of the formal proof:* 6.3 (d), with the étale charts of the smooth `Y` (CohomologyOfFunctorsOnTestRings
§1.5), presents `λ_h(x)` as the restriction to pairs of a class on tests with coefficients `T`. By 5.2 (c) and 6.1 (d)
that class belongs to the cohomology of the points of `Y` with the period coefficients of `(O_C, ℂ_p)`, and `v` is its
preimage under the bijective period map of 5.5. Comparing 5.5 (b) with 6.4 (c) gives the weight; the naturality of the
period map, of `λ_h` and of restriction to pairs gives (b), `Θ` being the period map of `W` followed by restriction
to pairs.

Let `R` be a ring, `E` a field with `R → E → Ω`, `A` the valuation ring of a `p`-adic place of `Ω` containing the image
of `R`, induced by an embedding `e : Ω → ℚ̄_p` (`A` is the preimage under `e` of the valuation ring of `ℚ̄_p`), with a
homomorphism `j : D_A → G_p` on the decomposition group `D_A ⊆ Gal(Ω/E)` of `A` such that `j(g)(e(x)) = e(g x)` and
`j` is an open embedding whose image is the subgroup of `G_p` fixing `e(E)` pointwise (such a `j` exists when `E` is
a number field: IdelicReciprocityCountsAndCyclotomicClassGroups §1.3 (b)). Let `k` be a field with a map `E → k` and an isomorphism `k ≅ ℚ̄_p` compatible with `e` on
`E`. Let `Y` be a proper `R`-scheme, smooth of relative dimension `d` and charted over `Ω`, `W` a proper `R`-scheme,
`h ≥ 0`, and `x` a Hodge class of degree `q` of `Y ×_R E` (of `N = ℤ[Y]` on `E`-algebras). Then there are a vector
`v ∈ ℂ_p ⊗_{ℤ_p} V^{q+h}(Y)` and a map `Θ : ℂ_p ⊗_{ℤ_p} V^{q+h}(W) → PairH(ℤ[W_k])`, `ℚ̄_p`-semilinear along the
inverse of `k ≅ ℚ̄_p`, such that
(a) `v` has Hodge–Tate weight `h` for `D_A` (as in CrystallineRepresentationsAndKisinModules §3.1):
`(j(g) ⊗ g)v = χ(j(g))^{−h} v` for all `g ∈ D_A`;
(b) `λ_h(u^* x) = Θ(u^* v)` for every map `u : W → Y` of `R`-schemes.

The decomposition `ℂ_p ⊗ Vⁱ = ⊕_a ℂ_p(−a) ⊗ H^{i−a}(Ω^a)` of PadicHodgeTheory §8.1 is about étale cohomology of rigid
spaces and is not used.

*Needs:* 5.2, 5.5, 6.1, 6.3, 6.4; CohomologyOfFunctorsOnTestRings §6.1 (Hodge cohomology, base change to `k`);
CrystallineRepresentationsAndKisinModules §3.1 (Hodge–Tate weight of a vector);
IdelicReciprocityCountsAndCyclotomicClassGroups §§1.1, 1.3 (places, decomposition groups, `e` with `j`);
CohomologyOfFunctorsOnTestRings §1.5 (atlas of a smooth proper scheme).

[ShortProof], `Lib/PadicComparison/HodgeTate/PeriodMap` (`New.Variety.exists_hasHodgeTateWeight`)

## Layer 7: Crystallinity and the Frobenius congruence relation

### 7.1 The Wang sequence and lines

*Origin:* adapted from the published theory of Faltings' toric towers and their Koszul complexes (Faltings (1988),
p-adic Hodge theory; Scholze (2013), Lemmas 4.5 and 5.5; Bhatt, Morrow and Scholze (2018), Lemma 7.3; Stacks Project,
Tag 0EBS): here, one coordinate and one endomorphism at a time, the cohomology of the monoid `ℕ` acting through that
endomorphism being computed by a two-term Wang sequence, which takes the place of the Koszul complex for the
continuous cohomology of `ℤ_p^d`.

*Method of the formal proof:* (a) is checked objectwise, where the sequence splits by an explicit formula. For (b),
the line `Y₀ × ℕ → Y₀` of (a), with `Y₀ = Hom(E, ψ(−))`, and the acyclicity at `E` give `Y₀ × ℕ` the cohomology
`F'(E)` in degree `0` and nothing above, on which the left-hand map of the Wang sequence induces `F'(g) − 1`. The long
exact sequence then leaves for `Y` the kernel of `F'(g) − 1` in degree `0`, its cokernel in degree `1` and zero above;
Koszul-exactness identifies the kernel with `F'(ψA)` through `F'(i)` and makes the cokernel zero, which is the
cohomology of `Hom(A, −)`.

Let `𝒞 × Bℕ` be the product of `𝒞` with the one-object category of the monoid `ℕ`; a functor `Y` on it is a functor on
`𝒞` with an endomorphism `γ`, and functors on `𝒞` are read on `𝒞 × Bℕ` with `ℕ` acting trivially. For `U` on `𝒞`, a map
`a : Y → U` is a *line* for coefficients `F` on `𝒞` if the map from `Hⁿ(U, F)`, computed on `𝒞`, to `Hⁿ(Y, F)`, computed
on `𝒞 × Bℕ` with `F` pulled back along the projection, is bijective for every `n`. A map `i : X₁ → X₂` and
an endomorphism `g` of `X₂` are *Koszul-exact* if `i` is injective, every fixed point of `g` lies in the image of `i`,
and `z ↦ g(z) − z` is onto.
(a) (Wang sequence.) For `Y` on `𝒞 × Bℕ` let `Y₀ × ℕ` be the product of the underlying functor `Y₀` of `Y` on `𝒞`,
with `ℕ` acting trivially, and of `ℕ`, on which `ℕ` acts by translation. The sequence
`0 → ℤ[Y₀ × ℕ] → ℤ[Y₀ × ℕ] → ℤ[Y] → 0`, with maps `(x, k) ↦ (γx, k) − (x, k + 1)` and `(x, k) ↦ γ^k x`, is exact; and for
`X` on `𝒞`, the projection `X × ℕ → X` is a line.
(b) (A criterion.) Let `ψ : 𝒞 → 𝒞'`, `A ∈ 𝒞`, `E ∈ 𝒞'`, `F'` on `𝒞'`, and `Y` on `𝒞 × Bℕ` whose restriction to `𝒞` is
`Hom(E, ψ(−))`, with `γ` given by precomposition with `g : E → E` and with the map `q : Y → Hom(A, −)` induced by
`i : ψA → E`. If `F'` is acyclic at `E` along `ψ` and `F'(i)`, `F'(g)` are Koszul-exact, then `q` is a line for `F'∘ψ`.

*Needs:* CohomologyOfFunctorsOnTestRings §2.2 (long exact sequences of `Ext`). Acyclicity at an object along a
functor is defined in the conventions.

[ShortProof], `Lib/PadicComparison/ToricTower` (`New.Variety.TimesBNat`, `New.Variety.IsLine`,
`New.Variety.TimesBNat.isLine_fst`, `New.Variety.TimesBNat.shortExact_induced`,
`New.Variety.TimesBNat.shortExact_wangComplex`, `New.Variety.KoszulExact`, `New.Variety.IsLine.of_acyclic`)

### 7.2 Root systems of units of a test form lines

*Origin:* adapted from the published theory of the perfectoid toric tower and of the Kummer torsor of compatible
roots of a unit (the sources named in 7.1): here, for one unit of the ring of a `p`-adic test, through tilting, with
coefficients `S♭ ⊗ M`.

*Method of the formal proof:* (a) holds because every unit of `D` has roots of all orders, so `D^×` is a divisible,
hence injective, abelian group, and `n ↦ x^n` extends from `ℤ` to `ℚ`.
(b) is a direct computation with periodic sequences in characteristic `p`. For (c), tilting (1.2) turns the root
systems of `v` into the points, in tilts of tests, of the perfect algebra of periodic sequences in `S♭`, on which the
monoid `ℕ` acts by the shift (the twist by `a ↦ (ε^a)^♯` becomes the shift by a computation with the Kummer torsor);
7.1 (b) then applies, with (b) for Koszul-exactness and the acyclicity hypothesis at that algebra.

On `O_C`-algebras `× Bℕ`, let `R_A` be the set of monoid maps `w : (ℚ_{≥0}, +) → (A, ·)` (compatible systems of roots of
`w(1)`), a map `(f, k)` sending `w` to `ω^k·(f ∘ w)` with `ω(a) = (ε^a)^♯`. For a functor `ψ` from `𝒞` to `O_C`-algebras
and `y ∈ ψ(A)`, the *root systems of `y`* are the pairs `(w, f)` of `f : A → B` and `w ∈ R_{ψ(B)}` with `w(1) = ψ(f)(y)`.
(a) Every unit `x` of an absolutely integrally closed ring `D` is `r(1)` for a homomorphism `r : (ℚ, +) → D^×`.
(b) Let `R` be an `O♭`-algebra and `R^per` the algebra of periodic sequences `ℕ → R` (with a positive period). The
inclusion of constants and the shift `(w_k) ↦ (w_{k+1})` are Koszul-exact after `− ⊗_{O♭} M`, for every `O♭`-module `M`.
(c) Let `M` be an `O♭`-module such that `D ↦ D ⊗ M` is acyclic at every perfect `O♭`-algebra along `S ↦ S♭`. For every
`p`-adic test `S` and unit `v` of `S`, the root systems of `v`, on `p`-adic tests, have flat base change and form a
line over `Hom(S, −)` for the coefficients `S' ↦ S'♭ ⊗_{O♭} M`.

*Needs:* 7.1, 1.2, 1.3, 2.1; ArcTopologyAndDescent §0.1 (absolutely integrally closed rings).

[ShortProof], `Lib/PadicComparison/ToricTower` (`New.Variety.compatibleRoots`, `New.Variety.compatibleRootsAt`,
`New.Variety.CompatibleRootsAreLines`, `New.Variety.periodicSeq`, `New.Variety.periodicSeq.koszulExact_shift`,
`New.Variety.PadicTest.isLine_compatibleRoots`), `Lib/PadicComparison/Descent/TestCategory`
(`New.Variety.exists_compatible_roots`)

### 7.3 Divided powers and the divided power envelope

*Origin:* adapted from the published theory of divided power envelopes: here, with the ideal `𝔡(D)` of elements that
have divided powers, chosen without a divided power structure, and envelopes completed in `p`-complete torsion-free
algebras.

*Method of the formal proof:* (a) uses that `p` lies in the Jacobson radical of `S` and that `n!` is a power of `p`
times an integer prime to `p`. (b) is the Teichmüller construction carried out modulo `𝔡(S)` rather than modulo `p`
(possible because `p ∈ 𝔡(S)` and `x ↦ x^p` induces `S/𝔡(S) → S/p`, by (a)), followed by the universal property of
Witt vectors of a perfect ring. (e) follows from the change of variable `v ↦ t − v`, which turns the basis `u_a vⁿ`
into `u_a zⁿ`. (f) computes `γ` on the `y_n` by Taylor's formula for divided powers and composes `γ − 1` with a shift
of the topological basis; the composite is `q` times a unit times an operator that `p`-adic completeness makes
invertible, which gives Koszul-exactness once `q` is inverted.

In this section `S`, `T`, `B`, `E` and `K` are the rings introduced in each clause, not a `p`-adic test, its generic
ring or a period ring pair. For a ring `D`, `𝔡(D) = {x ∈ D : n! ∣ xⁿ for all n}` is an ideal, and ring maps send `𝔡`
into `𝔡`. Let `S` be `p`-complete torsion-free.
(a) `p ∈ 𝔡(S)`, `S → S/𝔡(S)` is a local homomorphism, and `x ↦ x^p` induces `S/𝔡(S) → S/p`.
(b) For a commutative monoid `M` on which `x ↦ x^p` is bijective, composition with `S → S/𝔡(S)` is a bijection from
monoid maps `M → S` to monoid maps `M → S/𝔡(S)`. For a perfect ring `b` of characteristic `p`, every ring map
`b → S/𝔡(S)` has exactly one lift `g : W(b) → S` with `g(x) ≡ ` (image of `x_0`) modulo `𝔡(S)`.
(c) Along a map of `S`-algebras that is bijective on `p`-adic completions, maps into a `p`-complete algebra extend
uniquely.
(d) (Envelopes.) For an `S`-algebra `T` and a subset `J ⊆ T` let `Env(T, J)` be the `p`-adic completion of the
`T`-subalgebra of `T ⊗ ℚ` generated by the `xⁿ/n!`, `x ∈ J`. It is `p`-complete torsion-free, the image of `J` lies in
`𝔡(Env(T, J))`, and every `S`-algebra map `T → B` to a `p`-complete torsion-free `B` that sends `J` into `𝔡(B)` factors
uniquely through `T → Env(T, J)`.
(e) (One variable.) Let `B` be a `p`-complete torsion-free ring, `T` a `B`-algebra with a `B`-basis `u_a vⁿ`
(`a ∈ I`, `n ∈ ℕ`), and `z = t − v` with `t ∈ B`. Then the subalgebra of `T ⊗ ℚ` generated over `T` by the `zⁿ/n!` has
the `B`-basis `u_a zⁿ/n!`.
(f) (Koszul-exactness on the divided power line.) Let `B → E` be `p`-complete torsion-free algebras over a ring `A₀`,
`t ∈ B`, `v` a unit of `E` and `y_n ∈ E` with `(t − v)ⁿ = n!·y_n`. Suppose that `E` has the topological `B`-basis
`u_a y_n` (`a ∈ I`, `n ∈ ℕ`), with `u_0 = 1`: some `B`-linear map from a free `B`-module with basis `b_{a,n}` to `E`,
bijective on `p`-adic completions, sends `b_{a,n}` to `u_a y_n`. Let `q ∈ A₀` with `p³ ∣ q`, `K` an `A₀`-algebra in
which `q` is a unit, and `γ` a `B`-algebra endomorphism of `E` with `γ(v) = (1 + q)v` and, for `a ≠ 0`,
`γ(u_a) = (1 + η_a)u_a` with `η_a ∈ A₀` and `pη_a ∣ q`. Then `K ⊗_{A₀} B → K ⊗_{A₀} E` and `K ⊗_{A₀} γ` are
Koszul-exact.

The divided power envelope `D_(B,γ)(J)` of an ideal relative to a divided power ring, universal for divided power
morphisms, is DerivedDeRhamCohomology §PD.6. The envelope `Env(T, J)` of (d) is another object: it is `p`-adically
complete, carries no chosen divided power structure, and is universal only for maps to `p`-complete torsion-free
algebras that send `J` into `𝔡`. No comparison of the two is stated or used.

*Needs:* 3.1, 7.1; Mathlib `WittVector`, Mathlib `PerfectRing`.

[ShortProof], `Lib/PadicComparison/Descent/TestCategory` (`New.Variety.pdIdeal`, `New.Variety.pdIdeal_le_comap`,
`New.Variety.CrysTest`, `New.Variety.pdReduction`), `Lib/PadicComparison/Crystalline/DividedPowerEnvelope`
(`New.Variety.IsCompleteTorsionFree.p_mem_pdIdeal`, `New.Variety.IsCompleteTorsionFree.isLocalHom_pdQuotientMk`,
`New.Variety.frobModPd`, `New.Variety.IsCompleteTorsionFree.monoidHom_lift_bijective`,
`New.Variety.IsCompleteTorsionFree.existsUnique_witt_lift`, `New.Variety.IsCompletionBijective.comp_bijective`,
`New.Variety.preEnvelope`, `New.Variety.Envelope`, `New.Variety.Envelope.existsUnique_lift`,
`New.Variety.Envelope.algebraMap_mem_pdIdeal`, `New.Variety.exists_preEnvelope_basis`,
`New.Variety.koszulExact_pd_line`)

### 7.4 The crystalline comparison on charts

*Origin:* adapted from the published crystalline comparison theorem for schemes with good reduction (Bhatt, Morrow and
Scholze (2018), Theorem 1.1(i), first proved by Faltings (1989); for the site, Bhatt (2022), Prismatic F-gauges,
Remark 2.5.12; for the lines used in (d), Andreatta and Brinon (2013)): here, only the bijectivity, on étale charts
over tori, of a comparison between the cohomology of points modulo divided powers and the cohomology of points on
`p`-adic tests, with `B_max` coefficients; no filtration and no crystalline cohomology.

*Method of the formal proof:* (a) twists the standard structure map `A_inf → A_max` by a suitable power of Frobenius.
For (b), 7.3 (b) and 1.2 (d) show that both sides are the cohomology of the same representable functor. (c) reduces to
(b): as `θ` is onto, `B ≅ O_C ⊗_{A_inf} T₀` for an étale `A_inf[G]`-algebra `T₀`; `b = T₀/p` is étale over the perfect
ring `O♭[G]`, hence perfect, and flat over `O♭`; formal smoothness of `T₀` lifts `T₀ → b` to `T₀ → W(b)`, bijective
on `p`-adic completions by 3.1 (e).
(d) adjoins compatible roots of all the `t_i`. The points with chosen roots are represented by an algebra étale over
`O_C[ℚ_{≥0}^d]`, to which (c) applies, and on both sides they form a line over the chart: on tests by 7.2 (c) with 5.4
(a), modulo divided powers by 7.3 (f) for a divided power envelope in one variable. So 7.1 carries bijectivity down to
the chart. (e) factors `[ε^a] − 1` and `μ` through the common factor `[ε^{1/l}] − 1`, `l` the denominator of `a`; the
cofactor of `μ` is killed by `θ`, so its image is divisible by `p`, and the cofactor of `[ε^a] − 1` is a unit by 7.3
(a).

A *crystalline period structure* is an `A_inf`-algebra structure on `A_max` such that `A_max` is `p`-complete
torsion-free, `p` divides the image of `ξ`, the image of `τ` is a unit of `B_max`, `p³` divides the image of `μ`, and
the image of `μ` is a unit of `B_max`; it induces `O_C → A_max/𝔡(A_max)` through `θ`. For a `p`-adic test `S` put
`D_S = (A_max ⊗_{A_inf} W(S♭))^`, with the map `S → D_S/𝔡(D_S)`, `θ_S(x) ↦` (class of `1 ⊗ x`). For a functor `P` on
`O_C`-algebras, the *crystalline comparison holds for `P`* if restriction along `S ↦ D_S` and `S → D_S/𝔡(D_S)` is
bijective in every degree, from `Hⁿ(D ↦ ℤ[P(D/𝔡(D))], D ↦ B_max ⊗_{A_max} D)` on `p`-complete torsion-free
`A_max`-algebras `D` to `Hⁿ(S ↦ ℤ[P(S)], S ↦ B_max ⊗_{A_max} D_S)` on `p`-adic tests.
(a) For `y ∈ O_C` with `p ∣ y^N` there is a crystalline period structure that is compatible with `ℤ_p`, commutes with the
monoid generated by Frobenius and `G_p`, and sends `y` to zero in `A_max/𝔡(A_max)`.
Fix a crystalline period structure.
(b) If `b` is a perfect `O♭`-algebra without `p♭`-torsion and `T₀ → W(b)` a map of `A_inf`-algebras that is bijective on
`p`-adic completions, the crystalline comparison holds for `Hom_{A_inf}(T₀, −)`.
(c) If `G` is a commutative monoid that is a `ℚ_{≥0}`-module and `B` is an `O_C`-algebra étale over `O_C[G]`, the
crystalline comparison holds for `Hom_{O_C}(B, −)`.
(d) (Charts.) If `O_C` is an `R`-algebra and `t_1, …, t_d` are units of an `R`-algebra `B` with
`R[X_1, …, X_d] → B`, `X_i ↦ t_i`, étale, the crystalline comparison holds for `Hom_R(B, −)`.
(e) For `a ∈ ℚ_{≥0}` whose denominator is greater than `1`, `p·([ε^a] − 1)` divides the image of `μ` in `A_max`
(`ε^a` as in CrystallineRepresentationsAndKisinModules §1.1).

*Needs:* 1.2, 1.3, 2.1, 3.1, 5.1, 5.4, 7.1, 7.2, 7.3; CrystallineRepresentationsAndKisinModules §§1.1, 1.3 (`A_max`,
`B_max`, Frobenius, `G_p`, `ε^a`).

[ShortProof], `Lib/PadicComparison/Crystalline/ComparisonMap` (`New.Variety.CrysPeriodAlgebra`,
`New.Variety.integersToPdQuotient`, `New.Variety.exists_crysPeriodAlgebra`, `New.Variety.crysThickening`,
`New.Variety.testToPdReduction`, `New.Variety.HasCrysComparison`, `New.Variety.bijective_comp_toPdReduction_app`,
`New.Variety.hasCrysComparison_of_witt`, `New.Variety.hasCrysComparison_of_etale`,
`New.Variety.CrysPeriodAlgebra.p_mul_teichmuller_sub_one_dvd`, `New.Variety.compatibleRootsAreLines_crysTest`,
`New.Variety.Comparison.IsBijective.isBijectiveOn_of_compatibleRoots`, `New.Variety.compatibleRootsAreLines_padicTest`,
`New.Variety.hasCrysComparison_chart`)

### 7.5 Spanning of the period cohomology

*Origin:* adapted from the published crystalline comparison theorem (Bhatt, Morrow and Scholze (2018), Theorem 1.1(i)):
here, as the statement that classes pulled back from points modulo divided powers over a complete discrete valuation
ring span the period cohomology of a charted functor.

*Method of the formal proof:* (a) and the crystalline comparison for `V` are both properties that define closed
classes, so by the definition of a charting subfunctor (CohomologyOfFunctorsOnTestRings §1.4 (d)) they need only be
checked on the charts étale over tori; for the comparison this is 7.4 (d). For (b), with `N = ℤ[V(D/𝔡(D))]` on
`p`-complete torsion-free `S₀`-algebras, the `B_max`-linear map from `B_max ⊗_{A_max} A_max ⊗_{S₀} Hⁿ(N, D)` that sends
`1 ⊗ 1 ⊗ z` to the pull-back of `z` is a composite of bijections: flat base change (a) along `S₀ → A_max` (flat, as
`A_max` is torsion-free over the discrete valuation ring `S₀`); the completion of the coefficients
`A_max ⊗_{S₀} D → (A_max ⊗_{S₀} D)^`, bijective on cohomology by 3.2 (d), whose finite-rank condition the proof
derives from the finiteness hypothesis; flat base change (a) along `A_max → B_max`; and CohomologyOfFunctorsOnTestRings
§2.3 (e) for the adjunction between `D ↦ (A_max ⊗_{S₀} D)^` and restriction of scalars from `A_max` to `S₀`, together
with the crystalline comparison for `V`, which reaches the cohomology on `p`-adic tests with coefficients
`B_max ⊗ D_S`.

Fix a crystalline period structure (7.4). Let `S₀` be a `p`-complete torsion-free discrete valuation ring with
uniformiser `p`, `R` a ring with `O_C` an `R`-algebra and a map `r : R → S₀/𝔡(S₀)`, and let `A_max` be an
`S₀`-algebra. Suppose that for every `p`-complete torsion-free `A_max`-algebra `D` the two `R`-algebra structures on
`D/𝔡(D)`, through `R → O_C → A_max/𝔡(A_max)` and through `r`, coincide. Let `X` be a functor on `R`-algebras with a
charting subfunctor `V`.
(a) `D ↦ ℤ[V(D/𝔡(D))]`, on `p`-complete torsion-free `S₀`-algebras, has flat base change.
(b) If for every `n` the `B_max`-module `Hⁿ(S ↦ ℤ[V(S)], S ↦ B_max ⊗ D_S)` on `p`-adic tests is finitely generated, it
is spanned over `B_max` by the pull-backs, along `S ↦ D_S` and `S → D_S/𝔡(D_S)`, of the classes of
`Hⁿ(D ↦ ℤ[V(D/𝔡(D))], D ↦ D)` on `p`-complete torsion-free `S₀`-algebras.

*Needs:* 7.4, 3.2, 1.3; CohomologyOfFunctorsOnTestRings §1.4 (charting subfunctors);
CohomologyOfFunctorsOnTestRings §2.3 (restriction along an adjunction).

[ShortProof], `Lib/PadicComparison/Crystalline/ComparisonMap` (`New.Variety.HasFlatBaseChange.pdReduction_reprBy`,
`New.Variety.hasFlatBaseChange_freeAb_pdReduction_of_isCharting`, `New.Variety.crysComparison`,
`New.Variety.toCrysPoints`, `New.Variety.span_range_crysComparison_pull_eq_top`)

### 7.6 Crystallinity and the Frobenius congruence relation

*Origin:* adapted from the published congruence relation for the crystalline Frobenius (Scholl (1990), Motives for
modular forms, §4.2.3, through Katz and Messing (1974), Theorem 2(2); for a ramified base, Berthelot and Ogus (1983)),
which goes through the comparison of crystalline and `ℓ`-adic Frobenius on cohomology: here, for the cohomology of
functors, with crystallinity in the sense of `B_max`; the hypothesis is an identity between Frobenius twists of maps
checked at the points of the special fibre, and the conclusion is the same identity for the linear Frobenius
operators, with no crystalline cohomology and no good reduction of `W`.

*Method of the formal proof:* (a) and (b) both come from one description of how Weil pairs act on periods. A
Frobenius element of `D_A` (CrystallineRepresentationsAndKisinModules §2.4 (b)) forces `k = R/𝔭` to be a finite field.
By 7.4 (a) there is a crystalline period structure killing an element of `O_C` chosen so that the hypothesis of (b)
holds, Zariski-locally on every test, for points modulo `p` and that element. By 5.5 for `(A_max, B_max)`,
`B_max ⊗ Vⁿ(Y)` is the period cohomology of a charting subfunctor of `Y`, spanned by classes coming from points modulo
divided powers over `W(k)` (7.5); a Weil pair `(γ, a)` acts on such a class through `Frob^a` on the reduced points.
Taking `a = 0` gives (a), and the hypothesis on points gives (b) (CohomologyOfFunctorsOnTestRings §2.4 (d)).

Let `R` be a Noetherian ring, `K` a field with `R → K → Ω`, and `A` the valuation ring of a `p`-adic place of `Ω`
containing the image of `R`, induced by an embedding `e : Ω → ℚ̄_p` (`A` is the preimage of the valuation ring of
`ℚ̄_p`), with a homomorphism `j : D_A → G_p` on the decomposition group `D_A ⊆ Gal(Ω/K)`, `j(g)(e(x)) = e(g x)`, that
is an open embedding onto the subgroup of `G_p` fixing `e(K)` pointwise (such a `j` exists when `K` is a number
field: IdelicReciprocityCountsAndCyclotomicClassGroups §1.3 (b)). Let `𝔭 = {r ∈ R : |e(r)| < 1}`. Let `Y` be a proper
`R`-scheme charted over `R` and over `Ω`, `W` a proper `R`-scheme charted over `Ω`, and `ρ` the representation of `D_A`
on `Vⁿ(Y)`.
(a) `ρ` is crystalline (as in CrystallineRepresentationsAndKisinModules §3.1): the elements of `B_max ⊗_{ℤ_p} Vⁿ(Y)`
fixed by `j(g) ⊗ ρ(g)` for all `g ∈ D_A` span it over `B_max`.
(b) Let `u_i : W → Y` (`i ∈ I`, finite) be maps of `R`-schemes, `m_i ∈ ℤ`, `a_i ≥ 0` and `γ_i ∈ D_A` such that `j(γ_i)`
acts on the residue field of `ℚ̄_p` as `x ↦ x^{p^{−a_i}}` (so that `(j(γ_i), a_i)` is a Weil pair, as in
CrystallineRepresentationsAndKisinModules §3.1). Suppose that for every field `κ` of characteristic `p` and every
`κ`-point `x` of `W` over `R/𝔭`, `Σ_i m_i [u_i(x) ∘ Spec(Frob_κ^{a_i})] = 0` in the free abelian group on the
`κ`-points of `Y`. Then `Σ_i m_i (1 ⊗ u_i^*) ∘ β_i = 0` on `B_max ⊗ Vⁿ(Y)`, where `β_i` is the linear Frobenius of `ρ`
at `(γ_i, a_i)` (CrystallineRepresentationsAndKisinModules §§3.1, 3.7): the `B_max`-linear endomorphism of
`B_max ⊗ Vⁿ(Y)` that agrees with `φ^{a_i} j(γ_i) ⊗ ρ(γ_i)` on the elements fixed by an open subgroup.

For étale cohomology of proper smooth models, crystallinity with the identification of `D_cris` with crystalline
cohomology is PadicHodgeTheory §8.1; it is not used, and PadicHodgeTheory states no form of the congruence relation
(b).

*Needs:* 5.5, 7.4, 7.5, 1.2; CrystallineRepresentationsAndKisinModules §§3.1, 3.7 (crystalline, Weil pairs, linear
Frobenius); CrystallineRepresentationsAndKisinModules §2.4 (a Frobenius in the decomposition group);
CohomologyOfFunctorsOnTestRings §3.4 (`Vⁿ(Y)` with its Galois action); CohomologyOfFunctorsOnTestRings §§1.1, 2.4
(Zariski descent; formal sums of points); IdelicReciprocityCountsAndCyclotomicClassGroups §§1.1, 1.3 (places,
decomposition groups, `e` with `j`).

[ShortProof], `Lib/PadicComparison/CrystallineFrobenius` (`New.Variety.exists_factor_forall_dvd`,
`New.Variety.exists_primes_over_prod_le`, `New.Variety.cancels_quotient_of_congruenceRelation`,
`New.Variety.exists_cancels_frobPow_locally`, `New.Variety.exists_period_twist`,
`New.Variety.ellAdicCohom.isCrystalline_and_linearFrob_rel`)

## What the library already provides

- The tilt and Fontaine's map of a `p`-adically complete ring, with its surjectivity when Frobenius is onto modulo `p`:
  Mathlib `PreTilt`, `WittVector.fontaineTheta`, `surjective_fontaineTheta` (for 1.2 (c)).
- Integral perfectoid rings, with the kernel of `θ` principal: `TauCeti.Perfectoid.IsIntegralPerfectoid`,
  `TauCeti.Perfectoid.IsIntegralPerfectoid.isPrincipal_ker_fontaineTheta` (for 1.2 (c), once tests are shown integral
  perfectoid).
- Tensor products of perfect algebras over a perfect ring of characteristic `p` are perfect, higher `Tor` between
  perfect algebras over such a ring vanishes, and the almost set-up of a valuation domain with non-finitely generated
  maximal ideal: `Algebra.TensorProduct.perfectRing`, `TauCeti.isZero_Tor_succ_of_perfectRing`,
  `TauCeti.Almost.BasicSetup.ofValuationRing` (ingredients of 2.1).

On Tau Ceti's main branch, later than the revision pinned here:

- The tilt of a product is the product of the tilts: `PreTilt.piEquiv` (for 1.2 (b)).
- In an integral perfectoid ring an element of `ker θ` generates it if and only if it is distinguished, and `θ` is onto:
  `TauCeti.Perfectoid.IsIntegralPerfectoid.ker_fontaineTheta_eq_span_iff_isDistinguished`,
  `TauCeti.Perfectoid.IsIntegralPerfectoid.surjective_fontaineTheta` (for 1.2 (c)).
- Maps `k → A/I` from a perfect ring of characteristic `p` correspond to maps `W(k) → A` for `A` `I`-adically complete
  with `p ∈ I`: `TauCeti.WittVector.adicLiftEquiv` (for 1.2 (d) and 7.3 (b)).
- Derived completeness of modules by the telescope map, with closure under products, linear equivalences and
  extensions, kernels and cokernels of maps between derived complete modules, and adically complete modules being
  derived complete: `TauCeti.IsDerivedComplete`, `TauCeti.IsDerivedComplete.of_isAdicComplete`,
  `TauCeti.IsDerivedComplete.pi` (for 3.1).
- Absolutely integrally closed rings (every monic polynomial of positive degree has a root), with quotients,
  localisations and products: `TauCeti.IsAbsolutelyIntegrallyClosed` (for 1.1, 1.3 and 7.2; the definition of
  ArcTopologyAndDescent §0.1, which also states the quotients and localisations).

## Results taken from other roadmaps

- Descent of the cohomology of functors on test rings along covers, with excision, transfer and continuity along
  filtered limits of functors affine over a base: CohomologyOfFunctorsOnTestRings §§2.3, 2.5, 3.1, 3.2 (descent,
  excision, transfer, continuity). Its covers by `p`-adic tests are 1.3 here.
- The projective line formula for locally constant `ℤ/ℓ` coefficients and for the tilted theory:
  CohomologyOfFunctorsOnTestRings §§5.4, 5.5 (the projective line formula). The passage of a compared theory from the
  point to charted functors is 4.3 (e) here.
- Étale charts, atlases, charting subfunctors and charted schemes, separated functors, and the atlas of a proper
  scheme that is smooth after base change: CohomologyOfFunctorsOnTestRings §§1.4, 1.5 (proper functors, charts and
  atlases).
- Detection of classes at points, used for the duality on `(ℙ¹)^d` in 4.3: CohomologyOfFunctorsOnTestRings §4.4.
- Absolutely integrally closed rings: ArcTopologyAndDescent §0.1.
- `A_inf`, `A_max`, `B_max`, crystalline representations through `B_max`, Weil pairs, the linear Frobenius and
  Hodge–Tate weights of vectors: CrystallineRepresentationsAndKisinModules §§1.1, 1.3, 3.1, 3.7 (period rings,
  crystalline representations).

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/Lib/PadicComparison`, with the points of proper
  schemes of `src/Lib/General/Geometry/PointsOfProperSchemes` and the passage to charted functors of
  `src/Lib/Cohomology/SmoothBaseChange`.
- Andreatta, Brinon, *Acyclicité géométrique de B_cris relatif*, Comment. Math. Helv. 88 (2013).
- Berthelot, Ogus, *F-isocrystals and de Rham cohomology I*, Invent. Math. 72 (1983).
- B. Bhatt, *The Hodge–Tate decomposition via perfectoid spaces*, Arizona Winter School (2017).
- B. Bhatt, *Torsion completions are bounded*, J. Pure Appl. Algebra (2019).
- B. Bhatt, *Prismatic F-gauges* (2022).
- Bhatt, Mathew, *The arc-topology*, Duke Math. J. 170 (2021).
- B. Bhatt, M. Morrow, P. Scholze, *Integral p-adic Hodge theory*, Publ. Math. IHÉS 128 (2018).
- B. Bhatt, P. Scholze, *Projectivity of the Witt vector affine Grassmannian*, Invent. Math. 209 (2017).
- G. Faltings, *p-adic Hodge theory*, J. Amer. Math. Soc. 1 (1988).
- G. Faltings, *Crystalline cohomology and p-adic Galois representations* (1989).
- O. Gabber, S. Kelly, *Points in algebraic geometry*, J. Pure Appl. Algebra 219 (2015).
- Katz, Messing, *Some consequences of the Riemann hypothesis for varieties over finite fields*, Invent. Math. 23
  (1974).
- Li, Reinecke, Zavyalov, arXiv 2410.08200.
- L. Positselski, *Contraadjusted modules, contramodules, and reduced cotorsion modules*, arXiv 1605.03934.
- Scholl, *Motives for modular forms*, Invent. Math. 100 (1990).
- P. Scholze, *Perfectoid spaces*, Publ. Math. IHÉS 116 (2012).
- P. Scholze, *p-adic Hodge theory for rigid-analytic varieties*, Forum Math. Pi 1 (2013).
- P. Scholze, *Étale cohomology of diamonds*, arXiv 1709.07343 (2017).
- SGA 4, Exposé XIV (Artin), finiteness for proper morphisms.
- The Stacks Project, Tags 091N, 091P, 0G1U, 09BA, 0CQY and 0EBS.
- B. Zavyalov, *Poincaré duality in abstract 6-functor formalisms*, arXiv 2301.03821.
