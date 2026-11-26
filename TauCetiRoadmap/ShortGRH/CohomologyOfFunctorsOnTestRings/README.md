# Cohomology of functors on test rings

**Summary.** This roadmap builds the cohomology theory that the route uses where the classical argument would use
`ℓ`-adic étale cohomology and coherent Hodge cohomology, and proves the properties of it that the construction of
Galois representations needs: descent and continuity, proper base change over valuation rings of algebraically closed
fields, the projective line formula with the first Chern class of `O(1)`, smooth base change from a valuation ring of
`Ω = ℚ̄` to `Ω`, a transfer for Galois coverings, and, for Hodge cohomology, the Künneth formula, the class of the
diagonal, a fixed point formula with local terms given by Grothendieck symbols, and the vanishing half of a holomorphic
Lefschetz formula of Woods Hole type.

The argument of the family runs as follows: a one-sided bound for a sum over primes gives a half-plane free of zeros of
Dirichlet L-functions, and the one-sided bound comes from comparing an upper and a lower bound for the covolume of a
lattice of theta lifts (OneSidedPrimeSumBoundsAndAdmissibleData). The lower bound rests on congruences between theta
lifts and on Galois representations attached to eigenforms on definite unitary groups (CongruencesOfTwistedThetaLifts,
GaloisRepresentationsOfUnitaryEigenforms). The route constructs these representations itself, in the cohomology of the
families of abelian varieties of AbelianSchemesWithThetaStructuresAndTheirCohomology, and there it needs a cohomology
with the formal properties of `ℓ`-adic cohomology: proper and smooth base change (inertia acts trivially, the
congruence relation passes to cohomology), a transfer along Galois coverings, and a fixed point formula that lets Hecke
correspondences act through their local terms. This roadmap supplies that cohomology. PadicComparisonForFunctorCohomology
compares it with `p`-adic periods; the Hodge–Tate maps `λ_h` that Layer 7 uses are built there.

The theory is defined here, not borrowed. A *test ring* is a reduced ring in which every monic polynomial of positive
degree has a root and in which any two elements become comparable for divisibility after splitting the ring along an
idempotent; its local rings are valuation rings of algebraically closed fields. For a functor `Y` from rings to sets
and an abelian group `Λ`, the cohomology `Hⁿ_Λ(Y)` is `Extⁿ(ℤ[Y], LC_Λ)` in the category of functors from test rings to
abelian groups, where `LC_Λ(A)` is the group of locally constant functions `Spec A → Λ`; `ℓ`-adic cohomology takes the
Witt vectors of `LC_{𝔽_ℓ}` as coefficients. The Hodge cohomology of a functor `X` on `k`-algebras is `Ext^q` from
`(A, M) ↦ ℤ[X(A ⊕ M)]` to `(A, M) ↦ ⋀_A M` in functors on pairs of a `k`-algebra and a finite free module. These stand in
for étale cohomology with coefficients `ℤ/ℓ` and `ℤ_ℓ` and for the groups `H^q(X, Ω^p)`; no comparison with them is
stated or used, and every property is proved for these theories directly. Where another roadmap states the classical
theorem for étale or Dolbeault cohomology, the section names it in a closing sentence; that theorem does not apply to
the theories of this roadmap.

The headline theorems are these.

(1) *Proper base change* (4.3). Let `A` be a valuation ring of an algebraically closed field, `ℓ` a prime invertible in
`A`, and `Y` a functor on rings that is proper over `A` (a closed diagonal and a valuative criterion, 1.4). Restriction
from `Y` to its closed fibre is bijective on `Hⁿ_{ℤ/ℓ}` for every `n`. Consequences: a class over a valuation ring is
determined on the residue fibre, cohomology does not change under an extension of algebraically closed fields, and the
primes of a test ring at which a class vanishes form an open set.

(2) *The projective line formula* (5.5). Let `A` be a valuation ring of an algebraically closed field with `ℓ ∈ A^×` and
an injective ring map `A → ℂ_ℓ`. For locally constant `ℤ/ℓ` coefficients on tests over `A`, the classes `1` and `η`,
with `η` the first Chern class of `O(1)` given by the Kummer sequence, form a basis of the cohomology of `ℙ¹ × S` over
that of `S`, for every functor `S`; here `ℙ¹` is the functor of rows `(1 + uv, v)` up to proportionality of 5.1.

(3) *Smooth base change* (5.6). Let `A` be a valuation ring of `Ω` whose maximal ideal contains a prime `p`, with
`ℓ ∈ A^×`, and `Y` a scheme over a ring `R` with a map `R → A`, charted over `R` (covered, in the sense of 1.4, by
charts étale over tori). Then `Hⁿ_{ℤ/ℓ}(Y_A) → Hⁿ_{ℤ/ℓ}(Y_Ω)` is bijective for every `n`. `Y` need not be proper.

(4) *The fixed point formula* (6.6). Over a field of characteristic `0`, for `X` with an atlas of dimension `d`, there
is a Hodge class `δ` of degree `d` on `X × X` such that for maps `u, c : W → X` with reduced coincidences, the pull-back
of `δ` along the graph of `(u, c)` twisted by a scaling `t` of tangent directions is `Σ_w n_w(t)·cl(w)` over the
coincidences `w`, with `n_w(t) = det((t·du − dc)(du − dc)⁻¹)` and `cl(w)` the class of the point `w`.

(5) *Woods Hole, vanishing half* (7.5). Let `R ⊆ E → k ⊆ ℚ̄_p` with `E` a field of characteristic `0` and `k`
algebraically closed, `Y` proper and `W` projective over `R`, both with atlases of dimension `d`, `u_i : W → Y` maps and
`b_i ∈ k` almost all zero. If `h > d`, or if `Σ_i b_i·λ_h(u_i* x) = 0` for every Hodge class `x` of `Y` of degree at
most `d`, then for every `c : W → Y` whose coincidences with the `u_i` are simple, the weight-`h` local terms
`b_i·[t^h]det(1 − tA)/det(1 − A)` add up to zero.

There are seven layers. Layer 1 defines the cohomology of functors, test rings, the cohomology on test rings, proper
functors and charts, and shows that proper schemes, and smooth proper ones, give such functors. Layer 2 holds the
formal tools for Ext groups of functors: dévissage and the Leray–Hirsch map, products, Čech descent, dense subfunctors and Mayer–Vietoris, excision and transfer, tensoring a degree-two class, and
`ℓ`-torsion coefficients with closed loci. Layer 3 holds the results particular to test rings: acyclicity, continuity
along limits, the local-to-global principle and density criteria, `ℓ`-adic cohomology with its Galois action, and the
transfer for Galois coverings. Layer 4 proves proper base change through spaces of places of a field. Layer 5 builds
the first Chern class of `O(1)`, proves the projective line formula and deduces smooth base change. Layer 6 is Hodge
cohomology up to the fixed point formula. Layer 7 shows that the Hodge–Tate map keeps classes of points independent
and deduces the Woods Hole formula.

## Conventions and notation

- *Labels.* Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal
  proof:*` how [ShortProof] proves it. [ShortProof] is the shorter formal proof of the family `ShortGRH`; the line
  "[ShortProof], `path` (`declarations`)" at the end of a section names the file (under `src/`) and the declarations
  where it proves the statement. The names of [ShortProof] occur only on that line.
- *Rings and functors.* Rings are commutative with `1`. A *functor on rings* is a functor from rings to sets. For a ring
  `A`, `h_A := Hom(A, −)` is the functor represented by `A` (the functor of points of `Spec A`); by the Yoneda lemma a
  point `y ∈ Y(A)` is the same as a map `h_A → Y`. A scheme `X` over a ring `R` is read through its functor of points:
  on rings, `B ↦` the pairs of a ring map `R → B` and a morphism `Spec B → X` over `Spec R`, with its map to `h_R`; on
  `k`-algebras, for an `R`-algebra `k`, `B ↦ X(B)`, the morphisms `Spec B → X` over `Spec R`. Questions of size are
  ignored: the categories of test objects below are small enough for the Ext groups to exist.
- *Projective schemes and homogeneous coordinates.* A scheme `Y` over a ring `R` is *projective* over `R` if it has a
  closed immersion over `Spec R` into the projective space `ℙ^ι_R = ℙ^ι_ℤ × Spec R` for some finite set `ι`; where
  homogeneous coordinates are used, one such immersion `j` is fixed. For a point `y` of `Y` with values in a ring `A`, a
  vector `v ∈ A^ι` with a unit entry is a vector of *homogeneous coordinates* of `y` if `j(y)` is the point `[v]` of
  `ℙ^ι_R(A)`: `y` lies in the chart `X_i ≠ 0` exactly when `v_i` is a unit, and there `X_m/X_i` takes the value
  `v_m/v_i` at `y`.
- *Absolutely integrally closed (aic).* A ring is aic if every monic polynomial of positive degree over it has a root in
  it. An aic local domain in which of any two elements one divides the other is the same as a valuation ring of an
  algebraically closed field, and its residue field is algebraically closed.
- `Ω` is a fixed algebraic closure of `ℚ`, `ℓ` and `p` are primes, `ℚ̄_p` is an algebraic closure of `ℚ_p` and `ℂ_ℓ` the
  completion of `ℚ̄_ℓ`. A field *embedded in `ℚ̄_p`* is a field `k` with a ring map `k → ℚ̄_p` (so of characteristic `0`).
- *Yoneda products* are written in diagram order: for `x ∈ Ext(M, N)` and `y ∈ Ext(N, F)`, `x·y ∈ Ext(M, F)` is `x`
  followed by `y`.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `Fun(C, Ab)`, `ℤ[Y]`, `h_A` | functors to abelian groups, the free abelian group functor on `Y`, the functor `Hom(A, −)` | 1.1 |
| `Hⁿ(N, F)`, `Hⁿ(Y, F)`, `Hⁿ(V, U; F)` | `Extⁿ(N, F)`, `Extⁿ(ℤ[Y], F)`, `Extⁿ(ℤ[V]/ℤ[U], F)` | 1.1 |
| equivalence, dense, cover | bijective on all `Hⁿ(−, F)`; an equivalence over every point; inclusion of the image an equivalence | 1.1 |
| `H*(N, F)`, `x·y`, `x ∪_μ y` | total Ext, Yoneda product, external product | 2.2 |
| `Test`, `Test_A` | test rings; tests over `A` | 1.2, 1.3 |
| `LC_Λ`, `Hⁿ_Λ(Y)` | locally constant `Λ`-valued functions on `Spec`; cohomology on test rings | 1.3 |
| `Y_B`, `Y_{𝔪=0}` | base change; closed fibre | 1.3 |
| proper over `D`, atlas, charted | properness of functors, finite étale atlases, charts étale over tori | 1.4 |
| projective over `R`, homogeneous coordinates | closed subscheme of `ℙ^ι_R`, coordinate vectors with a unit entry | Conventions |
| `M` along `g`, theory | `ℓ`-torsion coefficient with Zariski descent; coefficient behaving well on closed loci | 2.7 |
| `ℤ_ℓ`, `Vⁿ(X)` | the coefficient `W(LC_{𝔽_ℓ})`; `ℚ_ℓ ⊗ Hⁿ(X_Ω, ℤ_ℓ)` with its Galois action | 3.4 |
| `𝕋`, `ε`, `η`, `ℙ¹_g` | Tate module of `G_m`, compatible roots of unity, first Chern class of `O(1)`, points of `ℙ¹` | 5.1 |
| `(A, A^ι)`, `H^q_Hdg(X)`, `s_t` | Hodge pairs, Hodge cohomology, scaling of the module by `t` | 6.1 |
| `[dg/g]`, `cl(z)` | Grothendieck's symbol, class of a point | 6.3 |
| `λ_h` | Hodge–Tate map of weight `h` | PadicComparisonForFunctorCohomology §6.3 |
| `p`-adic tests, `S^♭`, `S[1/p]`, `O_C`, `O^♭` | products of `p`-complete aic valuation rings over `O_C`, their tilts and generic fibres | PadicComparisonForFunctorCohomology §1.1 |

## Layer 1: Cohomology of functors

This layer fixes the objects: Ext groups of functors and the vocabulary of equivalences, density and comparisons
(1.1), test rings (1.2), the cohomology on test rings with locally constant coefficients (1.3), and proper functors,
charts and atlases (1.4); 1.5 shows that the functors of points of proper schemes, and of smooth proper schemes, are
examples.

### 1.1 Cohomology of a functor, comparisons and density

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions. The Ext groups are those of an abelian category with enough projectives; the
additive Yoneda lemma makes `ℤ[h_A]` projective; `ℤ[⊔ Y_i] = ⊕ ℤ[Y_i]` turns a disjoint union into a product.

Let `C` be a category. For a functor `Y : C → Sets`, `ℤ[Y]` is the functor `c ↦` free abelian group on `Y(c)`. For
functors `N, F : C → Ab` put `Hⁿ(N, F) := Extⁿ(N, F)`, computed in `Fun(C, Ab)`, and `Hⁿ(Y, F) := Hⁿ(ℤ[Y], F)`, the
*cohomology of `Y` with coefficients `F`*. A map `α : N′ → N` gives the *pull-back* `α* : Hⁿ(N, F) → Hⁿ(N′, F)`, a map
`β : F → F′` the *push-forward* `β_*`, and a map `u : Y′ → Y` the pull-back `u* := ℤ[u]*`. For a subfunctor `U ⊆ V`,
`ℤ[V]/ℤ[U]` is the objectwise quotient and `Hⁿ(V, U; F) := Hⁿ(ℤ[V]/ℤ[U], F)` the *relative cohomology*.
(a) *Equivalences.* `α : N′ → N` is an *equivalence for `F`* if `α*` is bijective on `Hⁿ(−, F)` for every `n ≥ 0`.
(b) *Density and covers.* A subfunctor `U ⊆ Y` is *dense for `F`* if for every object `A` and every point
`y : h_A → Y` the inclusion of the preimage `y⁻¹(U)` into `h_A` induces an equivalence `ℤ[y⁻¹(U)] → ℤ[h_A]` for `F`. A
map `p : E → Y` is a *cover for `F`* if the inclusion of its image into `Y` induces an equivalence for `F`.
(c) *Comparisons.* A *comparison* from `F` on `C` to `F′` on `C′` is a functor `φ : C′ → C` with a map
`β : F∘φ → F′`. For `α : N′ → N∘φ` it gives maps `Hⁿ(N, F) → Hⁿ(N∘φ, F∘φ) → Hⁿ(N∘φ, F′) → Hⁿ(N′, F′)` (restrict along
`φ`, push by `β`, pull by `α`); the comparison is *bijective along `α`* if the composite `Hⁿ(N, F) → Hⁿ(N′, F′)` is
bijective for every `n`.
(d) *Closed classes.* A class `P` of functors `C → Ab` is *closed* if it contains every zero functor and, for every
short exact sequence `0 → X₁ → X₂ → X₃ → 0` with `X₁ ∈ P`, `X₂ ∈ P` holds exactly when `X₃ ∈ P` does.
(e) *Zariski descent and partitions.* Let `ι : C → Rings`. A subfunctor `U ⊆ Y` is *Zariski-locally everything* for
`ι` if for every `y ∈ Y(A)` and every maximal ideal `m` of `ι(A)` there is `a ∉ m` such that `Y(f)(y) ∈ U(B)` for every
`f : A → B` for which `ι(f)(a)` is a unit. `F` has *Zariski descent* for `ι` if every such `U` is dense for `F`. `F` has
*partitions* for `ι` if (i) for every idempotent `e ≠ 1` of `ι(A)` there is `π : A → B` such that `ι(π)` is onto with
kernel inside `(e)`, `ι(π)(e) = 0`, and every `f : A → B′` with `ι(f)(e) = 0` factors uniquely through `π`; and (ii)
whenever two maps `A → B₁`, `A → B₂` identify `ι(A)` with `ι(B₁) × ι(B₂)`, they identify `F(A)` with `F(B₁) × F(B₂)`.
Facts. (f) `Hom(ℤ[h_A], F) = F(A)`, naturally in `A` and `F`; so `ℤ[h_A]` is projective and `Hⁿ(h_A, F) = 0` for
`n > 0`. (g) For a family of functors `Y_i`, restriction to the summands gives `Hⁿ(⊔_i Y_i, F) = ∏_i Hⁿ(Y_i, F)`. (h) A
sequence of functors is exact if it is exact at every object.

*Needs:* Mathlib `CategoryTheory.Abelian.Ext`.

[ShortProof], `Lib/Cohomology/Etale/Basic` (`New.Variety.H`, `New.Variety.freeAb`, `New.Variety.H.map`,
`New.Variety.H.push`, `New.Variety.relFreeAb`, `New.Variety.IsCohomEquiv`, `New.Variety.IsCohomDense`,
`New.Variety.Comparison`, `New.Variety.IsZariskiLocallyTop`, `New.Variety.HasZariskiDescent`,
`New.Variety.HasPartitions`, `New.Variety.homReprEquiv`, `New.Variety.exact_of_app`); `Lib/Cohomology/Etale/BijectiveComparisons`
(`New.Variety.IsCover`, `New.Variety.IsClosedClass`); `Lib/General/Algebra/LongExactSequences` (`New.Variety.H.sigma_bijective`)

### 1.2 Test rings

*Origin:* adapted from the published theory of absolutely integrally closed rings and of the valuation rings of
algebraically closed fields: here, the class of rings on which the cohomology of this roadmap is computed, with its
stability properties.

*Method of the formal proof:* roots of monic polynomials and comparability of two elements are checked componentwise
for products, on numerators for localisations and quotients, and at one stage of a filtered colimit, where a nilpotent
also dies. At a prime of a test ring every idempotent becomes `0` or `1` in the local ring, so of any two elements one
divides the other; the local ring is reduced, hence a domain, hence a valuation ring of its fraction field, which is
algebraically closed because the ring is aic.

A ring `A` is a *test ring* if (i) `A` is aic, (ii) `A` is reduced, and (iii) for all `a, b ∈ A` there is an
idempotent `e ∈ A` with `a | e·b` and `b | (1 − e)·a`. `Test` is the full subcategory of rings formed by the test rings.
(a) An aic domain in which of any two elements one divides the other is a test ring.
(b) Products of test rings, localisations of a test ring, quotients of a test ring by a radical ideal and filtered
colimits of test rings (taken in rings) are test rings. In a test ring the ideal generated by an idempotent is radical.
(c) For a prime `𝔭` of a test ring `A`, the local ring `A_𝔭` is an aic local domain in which of any two elements one
divides the other; it is a valuation ring of an algebraically closed field, and the residue field `κ(𝔭)` is
algebraically closed.

*Needs:* ArcTopologyAndDescent §0.1 (absolutely integrally closed rings).

[ShortProof], `Lib/Cohomology/Etale/Basic` (`New.Variety.IsTest`, `New.Variety.TestRing`,
`New.Variety.isTest_of_preValuationRing`, `New.Variety.IsTest.pi`, `New.Variety.IsTest.localization`,
`New.Variety.IsTest.quotient`, `New.Variety.IsTest.exists_valuationSubring_atPrime`); `Lib/Cohomology/Etale/FilteredLimits`
(`New.Variety.IsTest.filtered_colimit`); `Lib/Cohomology/Etale/DenseSubfunctors` (`New.Variety.IsTest.isRadical_span_idempotent`)

### 1.3 Cohomology on test rings

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

For an abelian group `Λ`, `LC_Λ : Test → Ab` sends `A` to the group of locally constant functions `Spec A → Λ`. The
*cohomology* of a functor on rings `Y` is `Hⁿ_Λ(Y) := Hⁿ(Y|_Test, LC_Λ)`, `Y|_Test` being the restriction of `Y` to test
rings. A map `u : X → Y` gives `u* : Hⁿ_Λ(Y) → Hⁿ_Λ(X)`; `u` is a *`Λ`-equivalence* if all these maps are bijective, and
`u` has *dense image* (for `Λ`) if the image of `u|_Test` is dense in `Y|_Test` for `LC_Λ` (1.1 (b)).
- *Base change and fibres.* For `s : Y → h_R` and a ring map `φ : R → B`, the *base change* is `Y_B := Y ×_{h_R} h_B`; a
  map `f : S → T` of rings under `R` gives `Y_T → Y_S`. For a subset `I ⊆ R`, `Y_{I=0} ⊆ Y` is the subfunctor of points
  whose structure map `R → B` kills `I`, and `Y_{I unit}` that of points whose structure map sends every element of `I`
  to a unit; for a local ring `R` with maximal ideal `𝔪`, `Y_{𝔪=0}` is the *closed fibre*. For a scheme `X` over `R` and
  an `R`-algebra `Ω′`, `X_{Ω′}` is the functor on rings of the base change `X ×_R Ω′`, and the action of `R`-algebra
  automorphisms of `Ω′` on it gives an action on `Hⁿ_Λ(X_{Ω′})`.
- *Affine maps.* A map `X → Y` of functors on rings is *affine* if its pull-back along every point `h_A → Y` is
  isomorphic over `h_A` to some `h_B → h_A`.
- *Tests over a ring.* For a ring `A`, a *test over `A`* is an `A`-algebra whose ring is a test ring; `Test_A` is their
  category. A functor `Y` on `A`-algebras has cohomology `Hⁿ(Y|_{Test_A}, LC_Λ)` on tests over `A`, with `LC_Λ` read
  through the forgetful functor `Test_A → Test`.

The groups `Hⁿ_{ℤ/ℓ}(X_{Ω′})` stand in for the étale cohomology groups `Hⁿ(X_{Ω′}, ℤ/ℓ)` of the scheme `X_{Ω′}`; this
roadmap neither states nor uses a comparison between the two.

*Needs:* 1.1, 1.2.

[ShortProof], `Lib/Cohomology/Etale/Basic` (`New.Variety.locConstCoeff`, `New.Variety.TestCohomology.map`,
`New.Variety.IsTestCohomEquiv`, `New.Variety.HasCohomDenseImage`, `New.Variety.pointsToBase`,
`New.Variety.baseChangeOf`, `New.Variety.zeroPoints`, `New.Variety.unitPoints`); `Lib/Cohomology/Etale/FilteredLimits`
(`New.Variety.IsRelAffine`, `New.Variety.baseChangeTransition`); `Lib/Cohomology/Etale/EllAdicCohomology`
(`New.Variety.geomPoints`); `Lib/Cohomology/TorsionTheories` (`New.Variety.TestOver`)

### 1.4 Proper functors, charts and atlases

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

(a) *Proper functors.* A functor on rings `Z` with a map `s : Z → h_D` is *proper over `D`* if (i) its diagonal is
closed: for all `x, y ∈ Z(C)` there is an ideal `I` of `C` such that a ring map `f : C → C′` makes `Z(f)(x) = Z(f)(y)`
exactly when `I ⊆ ker f`; and (ii) it satisfies a valuative criterion with one universal point: there are a ring `T` and
`a ∈ Z(T)` such that for every algebraically closed field `K`, every valuation ring `O` of `K` and every `z ∈ Z(K)` whose
structure map sends `D` into `O`, some ring map `T → O` carries `a` to `z` (read in `Z(K)` through `O ⊆ K`).
(b) *Separated functors and open subfunctors.* Let `X` be a functor on `k`-algebras. `X` is *separated* if for all
`x, y ∈ X(A)` there is an ideal `J` of `A` such that `φ : A → B` makes `X(φ)(x) = X(φ)(y)` exactly when `φ(J) = 0`. A
subfunctor `V ⊆ X` is *open* if every `x ∈ X(A)` has an ideal `I` of `A` such that `X(φ)(x) ∈ V(B)` exactly when
`φ(I)B = B`.
(c) *Étale charts and atlases.* An *étale chart of dimension `d`* of `X` is a `k`-algebra `R` with elements
`x_1, …, x_d ∈ R` such that `k[X_1, …, X_d] → R`, `X_i ↦ x_i`, is étale, and a point `y ∈ X(R)` such that
`φ ↦ X(φ)(y)` is injective on `Hom(R, A)` for every `A` and has an open subfunctor as image (the *locus* of the chart).
`X` has an *atlas of dimension `d`* if it is separated and finitely many étale charts of dimension `d` have loci that
contain every point of `X` with values in a field.
(d) *Charted schemes.* A subfunctor `V ⊆ X` is *charting* if it is Zariski-locally everything (for the `k`-algebras
themselves, 1.1 (e)) and `ℤ[V]` lies in every closed class of functors `{k-algebras} → Ab` that contains `ℤ[h_R]` for the
ring `R` of every étale chart (of any dimension) whose coordinates are all units, that is, of every chart étale over a
torus. A scheme `Y` over `R` is *charted over the `R`-algebra `k`* if the functor of points of `Y` on `k`-algebras has
a charting subfunctor. Charted schemes stand in for smooth ones; no further property of smoothness is used.
The functors of points of proper schemes, and of proper schemes that are smooth after base change, give examples of
these notions (1.5).

*Needs:* 1.1.

[ShortProof], `Lib/Cohomology/ProperBaseChange/PlaceSpace` (`New.Variety.IsProperOver`);
`Lib/General/Geometry/EtaleCharts` (`New.Variety.IsSeparatedFunctor`, `New.Variety.IsOpenSubfunctor`,
`New.Variety.EtaleChart`, `New.Variety.HasAtlas`, `New.Variety.IsCharting`, `New.Variety.IsCharted`);
`Lib/Cohomology/Etale/Basic` (`New.Variety.algPointsOf`)

### 1.5 Functors of points of proper and of smooth proper schemes

*Origin:* adapted from the published theory of the valuative criterion of properness and of étale coordinates on
smooth schemes: here, the properties of 1.4 for the functors of points of schemes.

*Method of the formal proof:* for (a), the locus where two points agree is the preimage of the diagonal, a closed
immersion because `X` is separated, so it is cut out by an ideal. For the valuative criterion, the disjoint union of a
finite affine open cover of `X` is one affine scheme `Spec T → X` through which every point with values in a ring of
the kind of 1.2 (iii) factors (cut `Spec` of the ring by idempotents into pieces that land in single members of the
cover), valuation rings in particular; a point over `K` whose structure map sends `R` into `O` extends to an `O`-point
by the valuative criterion of the proper morphism. (b) is the ideal of (a) read on `k`-algebras. For (c), every point of
the base change has an affine open neighbourhood étale over affine `d`-space, which is a chart, and the base change is
quasi-compact. For (d), at a field point of a chart shift by `1` the coordinates that vanish there (over a Noetherian
ring they remain étale coordinates) and invert the product of the new coordinates: finitely many charts with unit
coordinates then contain every field point, and their union is the charting subfunctor. It is Zariski-locally
everything, and it lies in the closed classes by 2.4 (c), the intersection of two charts being a chart because `X` is
separated.

Let `R` be a ring and `X` a scheme with a proper morphism `X → Spec R`.
(a) The functor of points of `X` on rings, with its map to `h_R`, is proper over `R` (1.4 (a)).
(b) For every `R`-algebra `k`, the functor of points of `X` on `k`-algebras is separated (1.4 (b)).
(c) If moreover the base change `X ×_{Spec R} Spec k → Spec k` is smooth of relative dimension `d`, the functor of points
of `X` on `k`-algebras has an atlas of dimension `d` (1.4 (c)).
(d) Let `k` be a Noetherian ring. Every functor on `k`-algebras with an atlas of dimension `d` has a charting
subfunctor (1.4 (d)). Hence, with (c), `X` is charted over every Noetherian `R`-algebra `k` over which it becomes smooth
of some relative dimension `d`.

*Needs:* 1.1, 1.2, 1.4, 2.4.

[ShortProof], `Lib/General/Geometry/PointsOfProperSchemes` (`New.Variety.isProperOver_pointsToBase`,
`New.Variety.isSeparatedFunctor_algPointsOf`, `New.Variety.hasAtlas_algPointsOf`);
`Lib/General/Geometry/EtaleCharts` (`New.Variety.HasAtlas.exists_isCharting`)

## Layer 2: Formal tools for Ext groups of functors

These results hold for functors on any category; Layers 3 to 7 apply them to test rings and to Hodge pairs. 2.1 is the
dévissage that reduces statements on all functors to representable ones; 2.2 the products; 2.3 descent along covers
and criteria for comparison maps; 2.4 dense subfunctors and Mayer–Vietoris; 2.5 excision, transfer and gluing; 2.6
tensoring a class of degree two and cohomology over a space; 2.7 the `ℓ`-torsion coefficients of the projective line
formula and their behaviour on closed loci.

### 2.1 Dévissage from representable functors, and the Leray–Hirsch map

*Origin:* adapted from the published theory of the Leray–Hirsch theorem and of dévissage for δ-functors: here, an
abstract form for Ext groups of functors and finitely many classes, with no bundle and no local triviality.

*Method of the formal proof:* every functor `S` is a quotient of a sum of representables `ℤ[⊔_i h_{c_i}]`; along
`0 → K → ℤ[⊔_i h_{c_i}] → S → 0`, the four and five lemmas give the conditions "injective in degree 0, surjective in
degree 0, injective in degree 1, …" one at a time, for all functors at once. The Leray–Hirsch map is a map of
δ-functors in `S` that commutes with truncation by total degree; on a disjoint union of representables both sides are
products (1.1 (g)), and a representable functor has cohomology in degree `0` only.

(a) *Dévissage.* Let `D` be a category and `f : A → B` a morphism of contravariant cohomological δ-functors on
`Fun(D, Ab)` (natural in the functor and compatible with the connecting maps of short exact sequences). If `f` is
bijective in all degrees at `ℤ[⊔_i h_{c_i}]` for every family `(c_i)` of objects of `D`, then it is bijective in all
degrees at every functor. [ShortProof] states the hypothesis on `f` without δ-functors, for a family of maps
`f_{N,n} : A(N, n) → B(N, n)` indexed by the functors `N : D → Ab` and by `n ≥ 0`, through the two properties that the
proof uses: (i) for every short exact sequence `0 → X₁ → X₂ → X₃ → 0`, the first `r` of the conditions "injective for
`n = 0`, surjective for `n = 0`, injective for `n = 1`, …" at `X₂` and the first `r − 1` at `X₁` give the first `r` at
`X₃`; (ii) the functors at which `f` is bijective for all `n` form a closed class (1.1 (d)). A morphism of δ-functors
as above has both, by the four and five lemmas; in (b) the family is the Leray–Hirsch map restricted to total degree
below `n`.
(b) *Leray–Hirsch.* Let `φ : C → A` be a functor, `G : A → Ab`, `F : C → Ab`, and `θ_i ∈ Ext^{d_i}(G∘φ, F)` for `i` in a
finite set `I`. For `S : A → Ab` the *Leray–Hirsch map* `⊕_{i∈I} H*(S, G) → H*(S∘φ, F)`, `(w_i) ↦ Σ_i φ*(w_i)·θ_i`
(total Ext and Yoneda product, 2.2), is natural in `S`; `θ` is a *Leray–Hirsch basis at `S`* if it is bijective. If `θ`
is a Leray–Hirsch basis at `ℤ[h_c]` for every object `c` of `A`, it is a Leray–Hirsch basis at every `S`. For an
arbitrary index set `I` the map and the notion of a Leray–Hirsch basis are defined in the same way, on the direct sum
`⊕_{i∈I} H*(S, G)`; finiteness of `I` is used only in the last sentence.

*Needs:* 1.1, 2.2.

[ShortProof], `Lib/Cohomology/LerayHirsch` (`New.Variety.lerayHirsch`, `New.Variety.IsLerayHirschBasis`,
`New.Variety.isLerayHirschBasis_iff_allBijective_truncMap`,
`New.Variety.Devissage.allBijective_of_allBijective_sigma_reprBy`, `New.Variety.isLerayHirschBasis_of_reprBy`)

### 2.2 Total Ext, Yoneda products and external products

*Origin:* adapted from the published theory of Yoneda and cup products of Ext groups: here, for functors to abelian
groups, with external products on functors with flat values.

*Method of the formal proof:* the Yoneda composition extends biadditively to the direct sums; the long exact sequence
of a short exact sequence in the first variable is exactness at the three vertices of the triangle formed with its
extension class; the external product of `x` and `y` is `M ⊗ y` followed by `x ⊗ G`, the functors `M ⊗ −` and `− ⊗ G`
being exact because the values of `M` and `G` are flat.

For `N, F : C → Ab` put `H*(N, F) := ⊕_{n ≥ 0} Extⁿ(N, F)`. Yoneda composition gives `H*(M, N) × H*(N, F) → H*(M, F)`,
`(x, y) ↦ x·y`, and an exact functor `Φ` between categories of functors gives `H*(N, F) → H*(ΦN, ΦF)` compatibly with
products; pull-back and push-forward are products with classes of degree `0`. `⊗` is the objectwise tensor product
over `ℤ`; a functor *has flat values* if all its values are flat `ℤ`-modules.
(a) For a short exact sequence `0 → N₁ → N₂ → N₃ → 0` with extension class `e ∈ Ext¹(N₃, N₁)`, the sequence
`H*(N₃, F) → H*(N₂, F) → H*(N₁, F) → H*(N₃, F)` of the two pull-backs and of `x ↦ e·x` is exact at each of its three
places.
(b) For `M`, `G` with flat values, `x ∈ Ext^a(M, F)`, `y ∈ Ext^b(N, G)` and `μ : F ⊗ G → K`, the *product*
`x ∪_μ y ∈ Ext^{a+b}(M ⊗ N, K)` is `μ_*` of the Yoneda product of `M ⊗ y` and `x ⊗ G`. It is natural in both arguments:
for `α : M′ → M` (`M′` with flat values), `β : N′ → N`, and `γ : L → M ⊗ N` equal to `(α ⊗ β)∘γ′`,
`γ*(x ∪_μ y) = γ′*(α*x ∪_μ β*y)`.
(c) Let `(φ, β)` be a comparison (1.1 (c)) from `F` on `C` to `F′` on `C′`, both with flat values, and let
`μ : F ⊗ F → F` and `μ′ : F′ ⊗ F′ → F′` satisfy `μ′∘(β ⊗ β) = β∘(μ∘φ)` as maps `(F∘φ) ⊗ (F∘φ) → F′`. Let `Θ : C → A`
and `Θ′ : C′ → A` be functors to a category `A`, `η : Θ′ → Θ∘φ` a natural map, and `N, N′ : A → Ab` with `N` of flat
values. For `x ∈ Ext^a(N∘Θ, F)` and `y ∈ Ext^b(N′∘Θ, F)`, the pull-back of `x ∪_μ y ∈ Ext^{a+b}((N ⊗ N′)∘Θ, F)` along
the comparison and the map `(N ⊗ N′)∘Θ′ → (N ⊗ N′)∘Θ∘φ` induced by `η` is the `μ′`-product of the pull-backs of `x`
along `N∘Θ′ → N∘Θ∘φ` and of `y` along `N′∘Θ′ → N′∘Θ∘φ`.

*Needs:* 1.1.

[ShortProof], `Lib/Cohomology/Hodge/CupProduct` (`New.Variety.abTensor`, `New.Variety.HasFlatValues`,
`New.Variety.TotalH`, `New.Variety.TotalH.comp`, `New.Variety.TotalH.exact_triangle`, `New.Variety.cup`,
`New.Variety.cup_map`, `New.Variety.Comparison.pull_cup`)

### 2.3 Čech descent and criteria for comparison maps to be bijective

*Origin:* adapted from the published theory of Čech descent for cohomology: here, for Ext groups of functors to sets
and for comparison maps between such groups.

*Method of the formal proof:* the free abelian groups on the fibre powers of `p : E → Y` resolve `ℤ[im p]`; the four
lemma along the short exact pieces of this resolution gives (a), one condition of bijectivity at a time. Testing on
fibres is Čech descent along the map from the disjoint union of all points `h_A → E`; a universal point makes the fibre
representable with the same coefficients, where the additive Yoneda lemma applies.

Let `(φ, β)` be a comparison from `F` on `C` to `F′` on `C′`.
(a) *Čech descent.* Let `f` be a morphism of contravariant cohomological δ-functors on `Fun(C, Ab)` as in 2.1 (a), and
`p : E → Y` a map of functors to sets. If `f` is bijective in all degrees at `ℤ[E ×_Y ⋯ ×_Y E]` (`m + 1` factors) for
every `m ≥ 0`, it is bijective in all degrees at `ℤ[im p]`.
(b) A map that is onto at every object is a cover for every `F`.
(c) *Fibres.* Let `u : Y′ → Y∘φ` and `t : E → Y`, and let `v : E′ → E∘φ` be the pull-back of `u` along `t`. If for every
point `x ∈ E(A)` the comparison is bijective along the projection to `h_A∘φ` of the fibre product of `u` with the point
`t(x) : h_A → Y`, then it is bijective along `v`.
(d) *Universal points.* Say that `u : Y′ → Y∘φ` has *universal points* if for every `y ∈ Y(A)` there are an object `B`
of `C′`, `x ∈ Y′(B)` and `s : A → φ(B)` with `u(x) = Y(s)(y)` such that every pair `(z, f)` with `z ∈ Y′(D)`,
`f : A → φ(D)` and `u(z) = Y(f)(y)` comes from `(x, s)` by exactly one map `B → D`, and such that `F(A) → F(φB) → F′(B)`
is bijective. Then the comparison is bijective along `u`, along every pull-back of `u`, and along the restriction of `u`
over every subfunctor of `Y`.
(e) *Adjunctions.* For an adjunction `φ ⊣ U` with `U : C → C′` and a functor `Y′ : C′ → Sets`, restriction along `U`
followed by the counit gives bijections `Hⁿ(Y′, F∘φ) → Hⁿ(Y′∘U, F)` for all `n`.
(f) *Cocycles from witnesses.* Let `R ⊆ V × L` be a subfunctor and, for `m ≥ 0`, `V_m` the functor of points of `V`
with `m` witnesses (`(x, l_1, …, l_m)` with all `(x, l_j) ∈ R`), so `V_0 = V`. With the alternating sums of the maps that
drop a witness, the chains `ℤ[V_m]` form a complex that is exact in positive degrees. If every point of `U ⊆ V` has a
witness, splicing its short exact pieces gives a universal class in `Extⁿ(ℤ[V]/ℤ[U], ℤ[V_n]/(boundaries))`; for an
`n`-cocycle, a map `y : ℤ[V_n]/(boundaries) → F`, its *class* in `Hⁿ(V, U; F)` is `y_*` of the universal class. Classes
of cocycles are carried along exact functors.

*Needs:* 1.1, 2.1, 2.2.

[ShortProof], `Lib/Cohomology/Etale/BijectiveComparisons` (`New.Variety.cech_descent_step`,
`New.Variety.Devissage.allBijective_freeAb_range_of_cech`, `New.Variety.IsPointwiseSurjective.isCover`,
`New.Variety.Comparison.isBijective_of_fibres`, `New.Variety.Comparison.IsUnivPoint`,
`New.Variety.Comparison.HasUniversalPoints.isBijective`, `New.Variety.Comparison.HasUniversalPoints.isBijective_of_isPullback`,
`New.Variety.Comparison.HasUniversalPoints.isBijective_subfunctor`, `New.Variety.Comparison.isBijective_of_adj`,
`New.Variety.witnessed.shortExact_boundaryFromCoker`, `New.Variety.witnessed.cocycleClass`,
`New.Variety.witnessed.map_cocycleClass`)

### 2.4 Dense subfunctors, Mayer–Vietoris and Zariski descent

*Origin:* adapted from the published theory of Mayer–Vietoris sequences and Zariski descent: here, for dense
subfunctors of functors to sets, with coefficients that split along idempotents.

*Method of the formal proof:* (a) is exactness at each object; density is tested over points and moves along
preimages, and (c) is an induction on the number of members by (a). Over a point `h_A`, the maps that kill `e` and those
that kill `1 − e` are represented by the two factors of a partition, on which `F` is a product; comparability of any two
elements after a cut along an idempotent then reduces a cover by basic open sets to partitions.

(a) *Mayer–Vietoris.* For subfunctors `U, V ⊆ Y`, the sequence `0 → ℤ[U ∩ V] → ℤ[U] ⊕ ℤ[V] → ℤ[U ∪ V] → 0`, with maps
`x ↦ (x, −x)` and `(x, y) ↦ x + y`, is exact.
(b) The inclusion of a dense subfunctor is an equivalence. Density for `F` is preserved by preimages along any map, by
enlarging the subfunctor and by finite intersections; if `V` is dense in `Y` and `U ∩ V` is dense in `V`, then `U` is
dense in `Y`. If `W ⊆ Y` is dense and `u : X → Y` restricts to an equivalence `u⁻¹(W) → W`, then `u` is an equivalence.
(c) If a closed class contains `ℤ[V]` for every `V` in a set of subfunctors of `Y` closed under finite intersections,
it contains `ℤ[V_1 ∪ ⋯ ∪ V_r]` for every finite family of members.
(d) *Relations.* For finitely many maps `f_i : W → Y` and integers `c_i`, let `W_c ⊆ W` consist of the points `x` with
`Σ_i c_i·[f_i(x)] = 0` in the free abelian group on `Y(A)`. If the inclusion `W_c ⊆ W` is an equivalence for `F`, then
`Σ_i c_i·f_i*(x) = 0` for every `x ∈ Hⁿ(Y, F)`.
(e) *Partitions.* If `F` has partitions for `ι : C → Rings`, then for every idempotent `e` of `ι(A)` the maps out of `A`
that kill `e` or kill `1 − e` form a subfunctor of `h_A` dense for `F`. If moreover `η : ι → κ` is a map of ring-valued
functors that is injective at every object and such that for all `a, b ∈ κ(A)` some idempotent `e ∈ ι(A)` has
`a | η(e)·b` and `b | (1 − η(e))·a`, then `F` has Zariski descent for `κ`.
(f) A map of coefficients `F → G` that is bijective at every object at which `Y` has a point induces bijections
`Hⁿ(Y, F) → Hⁿ(Y, G)`.
(g) `LC_Λ` has partitions for the inclusion `Test → Rings`; by (e) and 1.2 (iii) it has Zariski descent for it.

*Needs:* 1.1, 1.2, 1.3, 2.3.

[ShortProof], `Lib/Cohomology/Etale/DenseSubfunctors` (`New.Variety.mayer_vietoris_shortExact`,
`New.Variety.IsCohomDense.isCohomEquiv`, `New.Variety.IsCohomDense.preimage`, `New.Variety.IsCohomDense.trans`,
`New.Variety.IsCohomDense.inf`, `New.Variety.IsClosedClass.freeAb_iSup`, `New.Variety.H.sum_map_eq_zero_of_relationLocus`,
`New.Variety.HasPartitions.isCohomDense_partition`, `New.Variety.HasPartitions.hasZariskiDescent`,
`New.Variety.IsCohomDense.isCohomEquiv_of_fromPreimage`, `New.Variety.H.push_bijective_of_points`,
`New.Variety.hasPartitions_locConstCoeff`)

### 2.5 Relative chains: vanishing, excision, transfer and gluing

*Origin:* adapted from the published theory of relative cohomology, excision and transfer: here, for the relative
groups `Hⁿ(V, U; F)` of subfunctors, with density in place of covering conditions.

*Method of the formal proof:* for (a), write `N` as a quotient of `ℤ[N]/ℤ[0]`, which is acyclic because the zero section
is dense, with a kernel that is again locally zero, and induct on the degree along the long exact sequence. The transfer
is built on the quotient `Q` of `ℤ[V′]` by the differences of the two points of a permuted pair, through which both
`ℤ[p]` and `Σ_i ℤ[f_i]` factor. Excision and enlargement come from the exact sequence of a triple and 2.4 (b); gluing is
an induction on the number of pieces by Mayer–Vietoris, using the vanishing below `d`.

(a) *Locally zero functors.* Call `s ∈ N(A)` *locally zero* for `F` if the maps out of `A` that kill `s` form a
subfunctor of `h_A` dense for `F`. If every section of `N` is locally zero, `Hⁿ(N, F) = 0` for all `n`. A map `α` of
functors whose kernel and objectwise cokernel have only locally zero sections is an equivalence for `F`.
(b) *Transfer.* Let `f_i : V′ → V″` (`i` in a finite set `I`), `p : V′ → V` and `p′ : V″ → V` with `p′∘f_i = p` for all
`i`. There are a functor `Q` and maps `m : ℤ[V′] → Q`, `l : Q → ℤ[V]`, `ν : Q → ℤ[V″]` with `l∘m = ℤ[p]`,
`ν∘m = Σ_i ℤ[f_i]` and `ℤ[p′]∘ν = |I|·l`; and `l` is an equivalence for every `F` for which the image of `p` is dense in
`V` and the *permuted pairs* (the pairs `(w, w′)` in `V′ ×_V V′` whose tuples `(f_i(w))_i` and `(f_i(w′))_i` agree up
to a permutation of `I`) are dense in `V′ ×_V V′`.
(c) For a monomorphism `u : V′ → V` and `U ⊆ V`, the sequence
`0 → ℤ[V′]/ℤ[u⁻¹U] → ℤ[V]/ℤ[U] → ℤ[V]/ℤ[u(V′) ∪ U] → 0` is exact. If `U′ ⊆ U ⊆ V` and `U′` is dense in `U`, then
`ℤ[V]/ℤ[U′] → ℤ[V]/ℤ[U]` is an equivalence.
(d) *Excision.* For a monomorphism `u : V′ → V` and `U ⊆ V` with `u(V′) ∪ U` dense in `V`,
`ℤ[V′]/ℤ[u⁻¹U] → ℤ[V]/ℤ[U]` is an equivalence for `F`.
(e) *Gluing.* Let `S` be a set of subfunctors of `V`, closed under finite intersections, with `Hⁿ(B, U ∩ B; F) = 0` for
every `B ∈ S` and `n < d`. Let `W_1, …, W_r ∈ S` with `W_1 ∪ ⋯ ∪ W_r ∪ U` dense in `V`. Classes
`x_i ∈ H^d(W_i, U ∩ W_i; F)` whose restrictions to the `W_i ∩ W_j` agree are the restrictions of one class in
`H^d(V, U; F)`.
(f) For `U ⊆ V` and `W ⊆ X` there is a map `ℤ[V × X]/ℤ[U × X ∪ V × W] → (ℤ[V]/ℤ[U]) ⊗ (ℤ[X]/ℤ[W])`,
`[(v, x)] ↦ [v] ⊗ [x]`; with 2.2 it gives external products of relative classes.

*Needs:* 1.1, 2.2, 2.4.

[ShortProof], `Lib/Cohomology/Etale/RelativeChains` (`New.Variety.locallyZero`,
`New.Variety.cohomology_eq_zero_of_locallyZero`, `New.Variety.isCohomEquiv_of_locallyZero`,
`New.Variety.exists_transfer_map`, `New.Variety.permutedPairs`, `New.Variety.relFreeAb.shortExact_triple`,
`New.Variety.relFreeAb.isCohomEquiv_of_le`, `New.Variety.relFreeAb.excision`, `New.Variety.relFreeAb.exists_glued_class`,
`New.Variety.relFreeAb.prod`)

### 2.6 Tensoring a class of degree two, and cohomology over a space

*Origin:* particular to this proof: a degree-two class between functors with flat values, tensored compatibly with
every functor (used for the products with the first Chern class of 5.1, whose coefficients need not have flat values),
and the computation of the cohomology of a space over `X` on the category of points of `X`.

*Method of the formal proof:* cover `N` twice by sums of representables, so that `ξ` is the product of two extension
classes with a map; the two short exact sequences have flat terms and stay exact after restricting and tensoring with
any `S`, which defines the new classes. For (b) and (c), the tautological point of `X` on its category of points has
universal points in the sense of 2.3 (d).

(a) Let `N, K : C → Ab` have flat values and `ξ ∈ Ext²(N, K)`. There is a family of classes
`ξ_{φ,S} ∈ Ext²(S ⊗ N∘φ, S ⊗ K∘φ)`, one for every functor `φ : D → C` and every `S : D → Ab`, such that (i) for every
class `y ∈ H*(S, S′)`, `(y ⊗ N∘φ)·ξ_{φ,S′} = ξ_{φ,S}·(y ⊗ K∘φ)`; (ii) for `S` with flat values, `ξ_{φ,S}` is `ξ`
restricted along `φ` and tensored with `S`; (iii) restricting `ξ_{φ,S}` along `ψ : D′ → D` gives `ξ_{φ∘ψ, S∘ψ}`.
(b) Let `X : C → Sets`, `∫X` its category of points (pairs `(c, x)` with `x ∈ X(c)`) and `π : ∫X → C` the projection.
For a subfunctor `U ⊆ X` and a coefficient `G` on `C`, restriction along `π` and pull-back along the tautological point
give bijections `Hⁿ(X, U; G) → Hⁿ(pt, U′; G∘π)` for all `n`, where `pt` is the one-point functor on `∫X` and `U′` the
preimage of `U`.
(c) For `N, F : C → Ab`, restriction along `π` followed by pull-back along `n ↦ n ⊗ [tautological point]` is an
isomorphism `H*(N ⊗ ℤ[X], F) → H*(N∘π, F∘π)`.

*Needs:* 1.1, 2.2, 2.3.

[ShortProof], `Lib/Cohomology/TorsionTheories` (`New.Variety.IsTensorClass`, `New.Variety.exists_isTensorClass`,
`New.Variety.hasUniversalPoints_elements`, `New.Variety.isBijective_relFreeAb_tautologicalSection`,
`New.Variety.sliceEquiv`)

### 2.7 `ℓ`-torsion coefficients, theories and closed loci

*Origin:* adapted from the published theory of cohomology with supports and of `ℤ/ℓ`-coefficients on closed
subschemes: here, a formal set-up on tests over an aic local ring in which `ℓ` is invertible, with closed loci cut out
by families of ideals.

*Method of the formal proof:* the maps out of a test that kill an ideal are the maps through its quotient by the radical,
a test ring (1.2 (b)), along which locally constant functions lift; a locally constant function is constant near each
prime. For (b) the kernel and the cokernel of the map have locally zero sections (2.5 (a)): a multiple `n` of the
generator dies where the ideals are the unit ideal and, elsewhere, where `n ≡ 0 (mod ℓ)`, and a locally constant function
is a constant near each maximal ideal. For (c), apply (b) to the zero family of ideals, whose unit locus is empty.

Let `A` be an aic local domain in which the prime `ℓ` is invertible, `C` a category and `g : C → Test_A` a functor; write
`LC(c)` for the locally constant functions `Spec g(c) → ℤ/ℓ`.
- An *`ℓ`-torsion coefficient along `g`* is a functor `M : C → Ab` whose values are killed by `ℓ` and that has Zariski
  descent for the rings `g(c)` (1.1 (e)).
- A *family of ideals* is a choice of ideals `I_c ⊆ g(c)` such that `I_b` is generated by the image of `I_a` for every
  map `a → b`. For an ideal `I` of `g(c)`, `Z_I ⊆ h_c` is the subfunctor of maps `c → d` along which `I` maps to `0`.
- A *theory along `g`* is an `ℓ`-torsion coefficient `M` such that for every `c` and every ideal `I` of `g(c)`:
  restriction `Hⁿ(h_c, M) → Hⁿ(Z_I, M)` is onto for every `n`; and if a section `x ∈ M(c)` dies along every map in
  `Z_I`, then for each maximal ideal `m ⊇ I` there is `a ∉ m` such that `x` dies along every map that makes `a` a unit.

(a) `LC` on `Test_A` (with `g` the identity) is a theory.
(b) *Closed loci.* Let `M` be a theory along `g` equal to `LC`, `I` a family of ideals, `O` the subfunctor of the
one-point functor that is non-empty exactly where `I_c = (1)`, and `LC_{I=0}` the quotient of `LC` by the sections that
die along every map `c → d` with `I_d = 0`. The map `(ℤ[pt]/ℤ[O])/ℓ → LC_{I=0}` sending the generator to the constant
function `1` is, after restriction along any functor `φ : C′ → C`, an equivalence for every coefficient on `C′` that
has Zariski descent for the rings `g(φ(c′))`. Moreover the quotient of a theory by the sections dying on the locus
`I = 0` is again an `ℓ`-torsion coefficient.
(c) For an `ℓ`-torsion coefficient `M` along `g`, pull-back along the map `ℤ → LC` sending `1` to the constant function
`1` is onto from `H*(LC, M)` to `H*(ℤ, M)` (`ℤ` the constant functor).

*Needs:* 1.1, 1.2, 1.3, 2.4, 2.5.

[ShortProof], `Lib/Cohomology/TorsionTheories` (`New.Variety.InvertsPrime`, `New.Variety.TestOver`,
`New.Variety.TorsionCoeff`, `New.Variety.IdealFamily`, `New.Variety.killingMaps`, `New.Variety.Theory`,
`New.Variety.Theory.locallyConstant`, `New.Variety.Theory.onZeros`, `New.Variety.IdealFamily.constToZeros`,
`New.Variety.IdealFamily.isCohomEquiv_constToZeros`, `New.Variety.TorsionCoeff.pullbackAlong_oneLocConst_surjective`)

## Layer 3: Test rings: acyclicity, continuity, density and `ℓ`-adic coefficients

This layer proves what is particular to test rings: representable functors of test rings have no higher cohomology and
continuity holds along filtered colimits (3.1); continuity along cofiltered limits of affine maps, and its descent
along covers (3.2); the local-to-global principle and the density criteria that proper base change uses (3.3);
`ℓ`-adic cohomology with its Galois action (3.4); and the transfer for Galois coverings (3.5). Together they replace
descent of torsion étale cohomology along v-covers, with excision, transfer and limits.

### 3.1 Test rings are acyclic, continuity along their colimits, and envelopes

*Origin:* adapted from the published theory of descent for torsion étale cohomology along v-covers: here, the
acyclicity of test rings for locally constant coefficients and the continuity of their cohomology, proved from the
definition of 1.3.

*Method of the formal proof:* for a test ring `B`, the functor `h_B` on test rings is represented inside the category,
so the additive Yoneda lemma gives (a). Locally constant functions on the spectrum of a filtered colimit come from one
stage, through idempotents. The envelope `E(S)` is the product, over all maps from `S` to the rings of a fixed small
family of test rings, of these rings; the family consists of the quotients of polynomial rings over the `R_o` that are
test rings, and every map from `R_o` to a test ring factors through one of them.

(a) Let `B` be a test ring and `q : T → h_B` a map of functors on test rings that is bijective at every test ring. Then
pull-back along `q` identifies `LC_Λ(B)` with `H⁰(T, LC_Λ)`, and `Hⁿ(T, LC_Λ) = 0` for `n > 0`. On the spectrum of a
domain the locally constant functions are the constants; so if `q : T → h_B` and `q′ : T′ → h_{B′}` are as above with
`B`, `B′` domains, every map `T′ → T` is an equivalence for `LC_Λ`.
(b) For a filtered diagram of test rings `A_j` with colimit `A` (a test ring by 1.2 (b)), the maps
`colim_j Hⁿ_Λ(h_{A_j}) → Hⁿ_Λ(h_A)` are bijective for all `n`.
(c) *Envelopes.* For every family `(R_o)` of rings there are a functor `E` from rings to rings and a natural map
`θ : A → E(A)` such that every `E(A)` is a test ring and every ring map from some `R_o` to a test ring factors through
`θ` at `R_o`.

*Needs:* 1.1, 1.2, 1.3, 2.3.

[ShortProof], `Lib/Cohomology/Etale/FilteredLimits` (`New.Variety.locConstClass`, `New.Variety.IsAcyclicOver`,
`New.Variety.IsAcyclicOver.of_bijective`, `New.Variety.bijective_const_of_isDomain`,
`New.Variety.IsAcyclicOver.isCohomEquiv`, `New.Variety.continuousUpTo_locConstCoeff`,
`New.Variety.Envelope.exists_natTrans_isTest_and_factors`)

### 3.2 Continuity along cofiltered limits of affine maps

*Origin:* adapted from the published theory of continuity of étale cohomology along limits of qcqs schemes with affine
transition maps: here, for the cohomology of 1.3, proved by Čech descent along covers by representable functors of test
rings.

*Method of the formal proof:* continuity is a sequence of conditions (injective in degree `0`, surjective in degree `0`,
injective in degree `1`, …); (a) is Čech descent (2.3 (a)) for the map between the two δ-functors "colimit over the
system" and "value at the limit". For (c), cover each member of the system by an affine map from the functor of a test
ring with dense image and induct on the level with (a), using 3.1 (b) for the sources and the fibre powers, which are
again affine.

Say that cohomology with coefficients `F` is *continuous along* a cone `c` over a cofiltered system `(D_j)` of functors
to sets if the maps `colim_j Hⁿ(D_j, F) → Hⁿ(c, F)` are bijective; at *level `r`* if the first `r` of the conditions
"injective for `n = 0`, surjective for `n = 0`, injective for `n = 1`, surjective for `n = 1`, …" hold. `Λ`-cohomology
is *continuous over* a functor on rings `X` if, for every cofiltered system of functors affine over `X` with limit `L`,
`Hⁿ_Λ(L) = colim Hⁿ_Λ` of the members, for all `n`.
(a) *Descent of continuity.* Let `(E_j → Y_j)` be a cofiltered system of maps, each a cover for `F`, whose limit is a
cover for `F`. If continuity at level `r` holds along the `E_j` and continuity at level `r − 1` holds along every system
of fibre powers `E_j ×_{Y_j} ⋯ ×_{Y_j} E_j`, then continuity at level `r` holds along the `Y_j`.
(b) Let `Λ`-cohomology be continuous over `Y`. (i) If `q : X → Y` is affine, it is continuous over `X`. (ii) For
`s : Y → h_R`, `a : R → S` and an `S`-algebra `T`, `Hⁿ_Λ(Y_T)` is the colimit of the `Hⁿ_Λ(Y_{T′})` over the
`S`-subalgebras `T′ ⊆ T` generated by finite sets. (iii) For a decreasing family of subfunctors `V_a ⊆ Y` with affine
inclusions and a filtered system of indices `a_j` with an upper bound `a` such that `V_a` contains `⋂_j V_{a_j}`,
`Hⁿ_Λ(V_a)` is the colimit of the `Hⁿ_Λ(V_{a_j})`.
(c) If there is an affine map `q : h_T → Y` with dense image (1.3), `Λ`-cohomology is continuous over `Y`.

*Needs:* 1.1, 1.3, 2.3, 3.1.

[ShortProof], `Lib/Cohomology/Etale/FilteredLimits` (`New.Variety.ContinuousUpTo`, `New.Variety.ContinuousUpTo.of_cech`,
`New.Variety.IsCohomContinuous`, `New.Variety.IsCohomContinuous.of_isRelAffine`,
`New.Variety.IsCohomContinuous.isFilteredColimit_adjoin`, `New.Variety.IsCohomContinuous.isFilteredColimit_antitoneFamily`,
`New.Variety.IsCohomContinuous.of_hasCohomDenseImage`)

For étale cohomology of schemes, v-descent and arc-descent of torsion cohomology are stated in PrismaticCohomology
§2.0; ArcTopologyAndDescent Layers 3–4 state the general criteria behind them, for finitary functors on qcqs schemes
(continuity along cofiltered limits with affine transition maps in §3.2, detection of v-descent on aic valuation rings
in §3.10, the arc-descent criterion in §4.6). Those sections do not apply to the cohomology of 1.3.

### 3.3 The local-to-global principle and density criteria

*Origin:* adapted from the published theory of detection of v-covers on valuation rings of algebraically closed fields:
here, density criteria for the cohomology of 1.3 tested on points with values in such valuation rings, and a
local-to-global principle over the connected pieces of `Spec R`.

*Method of the formal proof:* for (a), by Zorn's lemma and continuity along chains of ideals (3.2) it suffices to pass
from bijectivity over all `U(b)`, `b ⊋ a`, to bijectivity over `U(a)`; if `a` is not connected, an idempotent splits
`U(a)` into `U(a + (e))` and `U(a + (1 − e))`. For (b), by (a) one compares over the zero locus of a connected ideal,
where every point factors through a local ring of the test ring, a valuation ring over which `p` is onto. For (d), the
universal point of the source is again a universal point of the target, which is separated, and it factors through
`c`; (e) applies (c) to the closed loci where prescribed pairs of the maps agree.

Let `Λ` be an abelian group. A *zero-locus family* on a functor on rings `Y`, for a ring `R`, is a family of
subfunctors `U(a) ⊆ Y`, `a` an ideal of `R`, with affine inclusions, such that `U(Σ_i a_i) = ⋂_i U(a_i)` and `U(R)` has
points only over the zero ring.
(a) *Local-to-global.* Let `X`, `Y` have continuous `Λ`-cohomology (3.2), `U` a zero-locus family on `Y` such that
`U((e)) ∪ U((1 − e))` is dense for every idempotent `e ∈ R`, and `u : X → Y`. If `u` restricts to a `Λ`-equivalence
`u⁻¹(U(a)) → U(a)` for every proper ideal `a` that contains, for every idempotent `e`, either `e` or `1 − e`, then `u`
is a `Λ`-equivalence.
(b) An affine map `p : X → Y` that is onto on `O`-points for every valuation ring `O` of every algebraically closed field
has dense image.
(c) Let `V_1, …, V_r ⊆ Y` have affine inclusions and `U ⊆ Y|_Test`. If every point of `Y` with values in a valuation ring
of an algebraically closed field lies in some `V_i` with `V_i|_Test ⊆ U`, then `U` is dense for `LC_Λ`.
(d) A map `c : Y → Z` of functors proper over `D` (1.4 (a)) that is onto on points with values in every algebraically
closed field has dense image.
(e) *Coincidences.* Let `Z` be proper over `D`, `P_1, …, P_r : Y → Z` maps and `U ⊆ Y|_Test`. Suppose that for every
algebraically closed field `k` and every `z ∈ Y(k)`, `U` contains every point `x` of `Y` over a test ring such that
`P_i(z) = P_j(z)` implies `P_i(x) = P_j(x)`. Then `U` is dense for `LC_Λ`.

*Needs:* 1.2, 1.3, 1.4, 2.3, 2.4, 3.1, 3.2.

[ShortProof], `Lib/Cohomology/Etale/ProperFunctors` (`New.Variety.IsZeroLocusFamily`,
`New.Variety.IsTestCohomEquiv.of_connected`, `New.Variety.IsRelAffine.hasCohomDenseImage_of_lifts`,
`New.Variety.IsCohomDense.of_affine_cover`, `New.Variety.IsProperOver.hasCohomDenseImage_of_surjective`,
`New.Variety.IsProperOver.isCohomDense_of_coincidences`)

### 3.4 `ℓ`-adic cohomology with its Galois action

*Origin:* adapted from the published theory of `ℓ`-adic cohomology as the limit of torsion cohomology: here, defined
with the coefficients `W(LC_{𝔽_ℓ})` on test rings, with finiteness and bijectivity read off from coefficients `𝔽_ℓ`.

*Method of the formal proof:* at a test ring the Witt vectors of the `𝔽_ℓ`-algebra `LC_{𝔽_ℓ}(A)` are `ℓ`-torsion-free and
`ℓ`-adically complete, with truncations the locally constant functions to `W_k(𝔽_ℓ)`; so the coefficient sequences of
(b) are exact and the Ext groups are derived `ℓ`-complete. Finite generation is then solved by successive approximation
from a finite set of lifts of a basis modulo `ℓ`, and bijectivity follows from bijectivity modulo `ℓ` for derived
complete groups.

The coefficient *`ℤ_ℓ`* on test rings sends `A` to the ring of `ℓ`-typical Witt vectors `W(LC_{𝔽_ℓ}(A))`, a
`ℤ_ℓ`-module. For a ring `R`, an `R`-algebra `Ω′` and a scheme `X` over `R`, put `Vⁿ(X) := ℚ_ℓ ⊗_{ℤ_ℓ} Hⁿ(X_{Ω′}|_Test, ℤ_ℓ)`;
`X ↦ Vⁿ(X)` is a contravariant functor to `ℚ_ℓ`-vector spaces, and a group `Γ` acting on `Ω′` by `R`-algebra
automorphisms acts on each `Vⁿ(X)` through the maps `X_{Ω′} → X_{Ω′}` (1.3), commuting with pull-back along maps of
`R`-schemes. A module over a ring with an element `π` is *derived `π`-complete* as in
PadicComparisonForFunctorCohomology §3.1.
(a) For every `k ≥ 1` there is a short exact sequence of coefficients `0 → ℤ_ℓ → ℤ_ℓ → LC_{W_k(𝔽_ℓ)} → 0` whose first map
is multiplication by `ℓ^k`; for `k = 1` the last term is `LC_{𝔽_ℓ}`.
(b) For every functor `N` on test rings and every `n`, `Hⁿ(N, ℤ_ℓ)` is derived `ℓ`-complete.
(c) If `Hⁿ(N, LC_{𝔽_ℓ})` is finite, `Hⁿ(N, ℤ_ℓ)` is a finitely generated `ℤ_ℓ`-module.
(d) A map that is an equivalence for `LC_{𝔽_ℓ}` induces bijections `ℚ_ℓ ⊗ Hⁿ(−, ℤ_ℓ)` for all `n`.

*Needs:* 1.1, 1.3; PadicComparisonForFunctorCohomology §§3.1, 3.2 (derived completeness, bijectivity modulo `π`).

[ShortProof], `Lib/Cohomology/Etale/EllAdicCohomology` (`New.Variety.ellAdicCoeff`, `New.Variety.ellAdicPull`,
`New.Variety.ellAdicCohom`, `New.Variety.ellAdicCohom.galoisAction`, `New.Variety.ellAdicCohom.map_galoisAction`,
`New.Variety.exists_ellAdicCoeff_modShortExact_pow`, `New.Variety.exists_ellAdicCoeff_modShortExact`,
`New.Variety.finite_H_ellAdicCoeff`, `New.Variety.IsCohomEquiv.bijective_ellAdicPull`)

The library has the telescope predicate of derived completeness for modules with its first closure properties (see the
closing section); the statements (b)–(d) on Ext groups are not there.

### 3.5 Transfer for Galois coverings

*Origin:* adapted from the published theory of the transfer for finite Galois coverings in étale cohomology: here, for
the `ℓ`-adic cohomology of 3.4 and coverings that are simply transitive on points over fields of characteristic `0`.

*Method of the formal proof:* (a) is the coincidence criterion 3.3 (e) for the proper functor `W ×_Y W`: at a geometric
point the two components differ by some `d ∈ Δ`, and `δ ↦ δd` permutes `Δ`. The transfer of 2.5 (b) for the maps `a(δ)`
factors `c = l∘m` and `Σ_δ a(δ) = ν∘m` with `c∘ν = |Δ|·l` on free abelian functors; by (a) and the density of the image
of `c`, `l*` is bijective modulo `ℓ`, hence on `V` (3.4 (d)). Then `N := |Δ|⁻¹ν*` has `N∘c* = l*`, and `m*∘N` is the
average over `Δ`.

Let `R` be a ring with a map to `Ω`, and `c : W → Y` a morphism of proper `R`-schemes with a finite group `Δ` acting on
`W` by automorphisms `a(δ)` over `Y`, such that `c` is surjective and, for every field `K` of characteristic `0`, `Δ`
acts simply transitively on the fibres of `W(K) → Y(K)` (a *Galois covering* with group `Δ`). Let `ℓ` be a prime and
`Vⁿ` the `ℓ`-adic cohomology of 3.4 for `Ω′ = Ω`.
(a) The pairs of points of `W` over test rings, lying over one point of `Y`, whose tuples `(a(δ)(w))_δ` and
`(a(δ)(w′))_δ` agree up to a permutation of `Δ` form a dense subfunctor of `W_Ω ×_{Y_Ω} W_Ω` for `LC_Λ`, for every `Λ`.
(b) Pull-back `c* : Vⁿ(Y) → Vⁿ(W)` is injective for every `n`, and every class of `Vⁿ(W)` fixed by all `a(δ)*` lies in
its image.

*Needs:* 1.4, 1.5, 2.5, 3.3, 3.4.

[ShortProof], `Lib/Cohomology/Etale/ProperFunctors` (`New.Variety.IsGaloisCovering.isCohomDense_permutedPairs`,
`New.Variety.ellAdicCohom.transfer`); `Lib/Cohomology/Etale/Basic` (`New.Variety.IsGaloisCovering`)

## Layer 4: Proper base change

Proper base change is proved by covering a proper functor by points with values in valuation rings (4.1), and by an
induction over the aic subrings of an algebraically closed field, split along the two charts of a line (4.2). 4.3 is
the theorem and its consequences, and 4.4 the detection of classes at points that the projective line formula uses.

### 4.1 The space of places of a point and its properness

*Origin:* adapted from the published theory of Riemann–Zariski spaces of places and of the reduction of proper base
change to spaces of places: here, a functor on rings attached to a point of a proper functor, with its properness.

*Method of the formal proof:* two classes are equal exactly when the points of `Z` and all the ratios agree, which gives
the closed diagonal. A point of the space of places in a local ring determines the subring of `κ(q)` on which its ratios
are finite, a valuation ring; for the valuative criterion, a point over a field comes from a local map out of the
valuation ring of a place, and the preimage of the given valuation ring is a smaller valuation ring over `D` that gives
the lift.

Let `Z` be proper over `D` (1.4 (a)), `P` a `D`-algebra that is absolutely flat (every `t ∈ P` has `y` with `y·t² = t`)
and whose residue fields are algebraically closed, and `ξ ∈ Z(P)`. A *place* of `P` is a prime `q` of `P` with a
valuation ring `O` of `κ(q)` containing the image of `D`; `T` is the product of the rings `O` over all places, and every
`t ∈ P` is a ratio `a_t/b_t` of elements of `T`: at a place `(q, O)`, `b_t = 1` if the image of `t` in `κ(q)` lies in
`O` and `b_t = t⁻¹` otherwise, and `a_t = t·b_t`. A *valuative lift* of `ξ` is a point `z ∈ Z(T)` that agrees with `ξ`
over `∏ κ(q)`. Its *space of places* `W_z` is the functor on rings whose points over `C` are the ring maps `f : T → C`,
two maps being identified when they give the same point `Z(f)(z)` and the same ratios `(f(a_t) : f(b_t))` for all
`t ∈ P`; it maps to `Z` by `f ↦ Z(f)(z)`.
(a) `W_z` is proper over `D`.
(b) A point of `W_z` with values in a local ring `L` comes from one place `(q, O′)`: there is a local homomorphism
`φ : O′ → L` such that, for every valuation ring `O ⊆ O′` of `κ(q)` containing the image of `D`, the point is the class
of `T → O ⊆ O′ → L`.

*Needs:* 1.4.

[ShortProof], `Lib/Cohomology/ProperBaseChange/PlaceSpace` (`New.Variety.ResiduePlace`,
`New.Variety.ResiduePlace.prodValuationRing`, `New.Variety.ResiduePlace.ValuativeLift`,
`New.Variety.ResiduePlace.placeSpace`, `New.Variety.ResiduePlace.isProperOver_placeSpace`,
`New.Variety.ResiduePlace.exists_isLocalHom_eq_projHom_comp`)

### 4.2 Splitting aic subrings of an algebraically closed field

*Origin:* adapted from the published theory of the cohomology of the projective line over a valuation ring through its
two affine charts: here, a Mayer–Vietoris splitting step for an induction over the aic subrings of an algebraically
closed field, with locally constant `ℤ/ℓ`-valued functions modulo an ideal.

*Method of the formal proof:* choose `t ∈ K` with `t, t⁻¹ ∉ B`, of a suitable kind; `B_1`, `B_2` are the integral
closures of `B[t]` and `B[t⁻¹]` and `B_3` the ring they generate, the two charts of a line and their overlap. The spectra
of `B_1/J`, `B_2/J` cover that of `B/J`, which gives exactness on the left; compatible clopen sets of the charts come
from the base, which gives it in the middle; and a locally constant function on the overlap is a difference of functions
from the charts, by Kummer theory with `ℓ` invertible and a case distinction on the line modulo the ideal, which gives
it on the right.

Let `K` be an algebraically closed field, `D` a ring in which of any two elements one divides the other, `γ : D → K` a
ring map, `J` an ideal of `D` and `ℓ` a prime invertible in `D`. For an aic subring `B ⊆ K` containing `γ(D)` write
`LC_J(B)` for the group of locally constant functions `Spec(B/JB) → ℤ/ℓ`. If `B` is not a valuation ring of `K`, there
are aic subrings `B_1, B_2, B_3` of `K` containing `γ(D)`, with `B ⊊ B_1`, `B ⊊ B_2` and `B_3` generated by `B_1` and
`B_2`, such that every valuation ring of `K` containing `B` contains `B_1` or `B_2`, and such that
`0 → LC_J(B) → LC_J(B_1) × LC_J(B_2) → LC_J(B_3) → 0` (the pair of pull-backs, then their difference) is exact.

*Needs:* 1.3; ArcTopologyAndDescent §0.1 (absolutely integrally closed rings).

[ShortProof], `Lib/Cohomology/ProperBaseChange/SubringSplitting` (`New.Variety.absIntegrallyClosedSubrings`,
`New.Variety.absIntegrallyClosedSubrings.exists_isSplitting_isMayerVietorisExact`);
`Lib/Cohomology/ProperBaseChange/LineCharts` (`New.Variety.exists_eq_basicOpen_of_isClopen_of_preimage_eq`,
`New.Variety.exists_eq_locConstSpec_map_sub_map`)

### 4.3 Proper base change over aic valuation rings

*Origin:* adapted from the published theory of proper base change in étale cohomology: here, for the cohomology of 1.3
with coefficients `ℤ/ℓ`, `ℓ` invertible, over a valuation ring of an algebraically closed field, for functors that are
proper in the sense of 1.4 (a); with the comparison with the closed fibre and three consequences.

*Method of the formal proof:* induction on the degree for all proper `Y` at once, by Čech descent (2.3 (a)) along the
cover of `Y` by spaces of places (4.1), which has dense image (3.3) and proper fibre powers; the closed fibre of a fibre
power is the fibre power of the cover of the closed fibre. On spaces of places the question concerns the valuation rings
of a single algebraically closed field, where Zorn's lemma over the aic subrings and the splitting 4.2 with
Mayer–Vietoris conclude. For (b), restriction to the closed fibre factors through `W_{κ_A}`. For (c), classes on `W_T`
come from finitely generated `S`-subalgebras of `T` (continuity, 3.2), which have `S`-points by the Nullstellensatz.
For (d), the elements `b` such that `x` vanishes where `b` is invertible form an ideal, whose zero locus is the
complement of the zero set.

Let `ℓ` be a prime.
(a) *Proper base change.* Let `A` be an aic local domain in which of any two elements one divides the other, with
`ℓ ∈ A^×`, and let `Y` be a functor on rings proper over `A`. The inclusion of the closed fibre `Y_{𝔪_A=0} ⊆ Y` is a
`ℤ/ℓ`-equivalence.
(b) Let `W` be proper over a ring `R` with `ℓ ∈ R^×`, and `R → A` with `A` as in (a). Pull-back along `W_{κ_A} → W_A`,
`κ_A` the residue field of `A`, is injective on `Hⁿ_{ℤ/ℓ}` for every `n`.
(c) *Extension of algebraically closed fields.* Let `W` be proper over `R` with `ℓ ∈ R^×`, and `S → T` a map of
algebraically closed fields under `R`. Then `W_T → W_S` is a `ℤ/ℓ`-equivalence.
(d) *Open zero sets.* Let `W` be proper over `R` with `ℓ ∈ R^×`, `T` a test ring under `R` and `x ∈ Hⁿ_{ℤ/ℓ}(W_T)`. The
set of primes `𝔭` of `T` at which `x` restricts to `0` in `Hⁿ_{ℤ/ℓ}(W_{κ(𝔭)})` is open in `Spec T`, and if it is all of
`Spec T`, then `x = 0`.

*Needs:* 1.2, 1.3, 1.4, 2.3, 2.4, 3.1, 3.2, 3.3, 4.1, 4.2.

[ShortProof], `Lib/Cohomology/ProperBaseChange/Theorem` (`New.Variety.IsProperOver.proper_base_change`,
`New.Variety.IsProperOver.injective_map_residue`, `New.Variety.IsProperOver.isTestCohomEquiv_field_extension`,
`New.Variety.IsProperOver.isOpen_zero_set_and_eq_zero`)

For étale cohomology of schemes, (a) is a case of EtaleCohomologyFoundations §F.2.1 and (c) of §F.2.2; those sections
do not apply to the cohomology of 1.3, and the proof here avoids the general theorem.

### 4.4 Detection of classes at points

*Origin:* particular to this proof: the property, for a coefficient on pairs of a test and a point, that classes are
detected at the residue fields of a test and do not change under extensions of fields, with a criterion for
coefficients that are `ℤ/ℓ` on a closed locus of a proper space.

*Method of the formal proof:* the locus `I = 0` is proper over `A`; over a test `c` the cohomology with coefficients `F`
is that of the corresponding base change of this locus with coefficients `ℤ/ℓ`, to which 4.3 (c) and (d) apply.

Let `A` be an aic local domain with `ℓ ∈ A^×`, `D` a category and `g : D → Test_A`. For a test `c` over `A` and a prime
`𝔭` of `c`, `κ(𝔭)` is again a test over `A` (1.2 (c)). A coefficient `F` on `D` is *detected at points* if (i) for every
test `c` over `A`, every `n` and every `x ∈ Hⁿ(Hom(c, g(−)), F)`, the set of primes `𝔭` of `c` at which `x` restricts to
`0` over `κ(𝔭)` is open, and `x = 0` if it is all of `Spec c`; and (ii) every map `V → k` of tests over `A` that are
fields induces an equivalence `Hom(k, g(−)) → Hom(V, g(−))` for `F`.

Let `X` be a functor on rings proper over `ℤ`, `I` a family of ideals on the points of `X × h_A` (an ideal of `B` for
every point of `(X × h_A)(B)`, the ideal at an image point being generated by the image of the ideal), `D` the category
of pairs `(B, x)` of a test `B` over `A` and `x ∈ X(B)`, with the ideals `I` read at `(x, A → B)`, and `F` a coefficient
on `D` with a map `β : LC → F` from the locally constant `ℤ/ℓ`-valued functions that is bijective at the pairs where
`I = 0`. If the locus `I = 0` is dense for `F`, then `F` is detected at points.

*Needs:* 1.4, 2.7, 4.3.

[ShortProof], `Lib/Cohomology/ProperBaseChange/Theorem` (`New.Variety.IsDetectedAtPoints`,
`New.Variety.IdealFamily.pullToTests`, `New.Variety.IdealFamily.isDetectedAtPoints_of_proper`)

## Layer 5: The projective line and smooth base change

5.1 builds the first Chern class `η` of `O(1)` from the Kummer sequence and states the projective line formula as a
property of a coefficient. 5.2 shows that Leray–Hirsch bases pass from residue fields to tests. 5.3 and 5.4 prove the
formula for a tilted theory on `ℓ`-adic tests, where `η` visibly acts; 5.5 deduces it for `ℤ/ℓ`, and 5.6 deduces
smooth base change, with the duality on products of projective lines from PadicComparisonForFunctorCohomology §4.2.

### 5.1 The Kummer sequence and the first Chern class of `O(1)`

*Origin:* adapted from the published theory of the Kummer sequence and of the first Chern class of a line bundle: here,
for the projective line as a functor on the tests of a functor `g : C → Test_A`, with the Tate module of `G_m` and an
action of it on `ℓ`-torsion coefficients.

*Method of the formal proof:* evaluation at `1` is onto because every unit of an aic ring has a compatible system of
roots. The section `ε` comes from a compatible system of roots of unity in `A` with a primitive `ℓ`-th root at `1/ℓ`;
`x ↦ x ⊗ ε` is an isomorphism Zariski-locally on `S` killed by `ℓ`, hence an equivalence for coefficients with Zariski
descent. The class `η` of an `ℓ`-torsion coefficient `M` is `M ⊗ η` (by 2.6 (a), `M` need not have flat values)
followed by the action of `𝕋`.

Let `A` be a ring and `g : C → Test_A` a functor; `G_m(c) := g(c)^×`. `ℙ¹` is the functor on rings that sends `B` to the
pairs `(u, v) ∈ B²` modulo `(u, v) ~ (u′, v′)` when `(1 + uv)·v′ = v·(1 + u′v′)`, that is, the rows `(1 + uv, v)` up to
proportionality (the points of the projective line given by such a row; over a local ring these are all its points). In
this layer `ℙ¹` always means this functor. Put `ℙ¹_g := ℙ¹∘g`; `∫ℙ¹_g` is the category of pairs `(c, x)`,
`x ∈ ℙ¹(g(c))`, with projection `π : ∫ℙ¹_g → C`.
- The *Tate module* `𝕋(c)` is the group of homomorphisms `χ : ℚ → g(c)^×` with `χ(1) = 1`.
- The transition units of the standard rows of the points of `ℙ¹` form a `1`-cocycle from `ℤ[ℙ¹_g]` to `G_m` (the
  cocycle of `O(1)`), with an extension class `o ∈ Ext¹(ℤ[ℙ¹_g], G_m)`. With `k ∈ Ext¹(G_m, 𝕋)` the class of the
  Kummer sequence of (a), `η := o·k ∈ Ext²(ℤ[ℙ¹_g], 𝕋)`.
(a) *Kummer sequence.* `0 → 𝕋 → Hom(ℚ, G_m) → G_m → 0`, the last map evaluation at `1`, is exact.
(b) Let `A` be an aic local domain with `ℓ ∈ A^×`. There is `ε ∈ 𝕋` (a compatible system of roots of unity of `A`, with `ε(1/ℓ)` a
root of the `ℓ`-th cyclotomic polynomial, pushed to every `g(c)`) such that for every `S : C → Ab` killed by `ℓ` and
every coefficient `F` with Zariski descent for the rings `g(c)`, `S → S ⊗ 𝕋`, `x ↦ x ⊗ ε`, is an equivalence for `F`.
Hence every `ℓ`-torsion coefficient `M` along `g` (2.7) has a unique class `μ_M ∈ Ext⁰(M ⊗ 𝕋, M)` whose pull-back along
`x ↦ x ⊗ ε` is the identity, and every class between such coefficients commutes with these actions.
(c) `η` restricts to `0` on the affine chart of `ℙ¹` where the first coordinate of the standard row is a unit.
(d) For an `ℓ`-torsion coefficient `M` along `g`, the class `η_M ∈ Ext²(M∘π, M∘π)` on `∫ℙ¹_g` is `M ⊗ η` at the
tautological point of `ℙ¹`, followed by `μ_M`. `M` satisfies the *projective line formula* if the classes `1` (degree
`0`) and `η_M` (degree `2`) form a Leray–Hirsch basis (2.1 (b), for `φ = π`) at every `S : C → Ab`: every class of
`H*(S∘π, M∘π)` is `π*(a) + π*(b)·η_M` for unique `a, b ∈ H*(S, M)`. By 2.6 (c), for `S = ℤ[Y]` this reads
`H*(Y × ℙ¹, M) = H*(Y, M) ⊕ η·H*(Y, M)`.

*Needs:* 1.1, 1.2, 2.1, 2.2, 2.6, 2.7.

[ShortProof], `Lib/Cohomology/ProjectiveLine/ChernClass` (`New.Variety.kummerSeq`, `New.Variety.tateModule`,
`New.Variety.shortExact_kummerSeq`, `New.Variety.compatibleRootsOfUnity`, `New.Variety.tateGen`,
`New.Variety.isCohomEquiv_tensorPoint_tateGen`, `New.Variety.TorsionCoeff.tateAction`,
`New.Variety.TorsionCoeff.tateAction_comm`, `New.Variety.projLine`, `New.Variety.projLine.cocycle`, `New.Variety.etaClass`,
`New.Variety.pullbackAlong_etaClass_eq_zero_of_isUnit`, `New.Variety.TorsionCoeff.etaAt`,
`New.Variety.TorsionCoeff.cupClass`, `New.Variety.TorsionCoeff.lineBasis`, `New.Variety.TorsionCoeff.HasLineFormula`)

### 5.2 Leray–Hirsch bases from residue fields

*Origin:* adapted from the published theory of the Künneth formula for torsion cohomology over a field: here, in
Leray–Hirsch form over the special fibre of an aic local domain, passing from residue fields to tests.

*Method of the formal proof:* for (b), at each prime of `c` a class has unique coefficients in `ℤ/ℓ` by the
Leray–Hirsch property at the residue field; detection at points makes these coefficients locally constant, so they form
the unique preimage. For (c), the values at `1` of the homogeneous classes span the cohomology of the point, a vector
space over `ℤ/ℓ` (2.7 (c)), and `b` indexes a basis among them; a test kills `𝔪_A` exactly when it receives a map, then
unique, from the residue field `k₀` of `A`, so `h_{k₀}` is the dense locus and (b) applies. (a) is 4.4 for `ℙ¹`, which is
proper over `ℤ`.

Let `A` be an aic local domain with `ℓ ∈ A^×`, `g : D → Test_A` and `LC` the locally constant `ℤ/ℓ`-valued functions.
(a) The coefficient `LC` on the category of pairs `(B, x)`, `B` a test over `A` and `x ∈ ℙ¹(B)`, is detected at points
(4.4).
(b) Let `F` be a coefficient on `D` detected at points and `θ_i ∈ Ext^{d_i}(LC∘g, F)`. If `θ` is a Leray–Hirsch basis at
`ℤ[h_k]` for every test `k` over `A` that is a field and receives a map from `c`, it is a Leray–Hirsch basis at `ℤ[h_c]`.
(c) Let `M` be an `ℓ`-torsion coefficient along `g` that is detected at points and for which the locus of the objects
where `𝔪_A` generates the zero ideal is dense. For every homogeneous class `j ∈ Ext^n(LC∘g, M)` there is a set `b` of
homogeneous classes that contains `j` if the pull-back of `j` along `1 : ℤ → LC` is not `0`, and that is a Leray–Hirsch
basis at `ℤ[h_c]` for every test `c` over `A` in which `𝔪_A` generates the zero ideal.

*Needs:* 1.2, 2.1, 2.7, 4.3, 4.4.

[ShortProof], `Lib/Cohomology/ProjectiveLine/TiltedLineFormula` (`New.Variety.isDetectedAtPoints_projLine`,
`New.Variety.isLerayHirschBasis_of_forall_isField`, `New.Variety.exists_isLerayHirschBasis_of_isCohomDense`)

For étale cohomology of schemes over a separably closed field, the Künneth formula is EtaleCohomologyFoundations
§F.2.6; it does not apply to the cohomology of 1.3.

### 5.3 The perfect projective line

*Origin:* adapted from the published theory of the perfectoid projective line and of its cover by two perfectoid discs:
here, on `p`-adic tests through their tilts, as a gluing map of free abelian functors whose cokernel has no cohomology.

*Method of the formal proof:* all cohomology is in degree `0`, where the gluing map is the splitting of a Laurent
polynomial with exponents in `ℚ` into the parts of non-negative and of negative exponent; acyclicity of perfect
algebras for the coefficients and flat base change give the higher degrees.

Let `p` be a prime; `p`-adic tests, the rings `O_C`, `O^♭`, tilts `S^♭` and generic fibres `S[1/p]` are those of
PadicComparisonForFunctorCohomology §1.1. The *two discs* are the functors `S ↦ Hom(ψ(O^♭[ℚ≥0]), S^♭)` (two copies), the
*torus* `S ↦ Hom(ψ(O^♭[ℚ]), S^♭)` and the *point* `S ↦ Hom(ψ(O^♭), S^♭)`, for an endofunctor `ψ` of `O^♭`-algebras. The
*gluing map* `ℤ[torus ⊔ point] → ℤ[two discs]` sends `t` in the torus to `t⁻¹` in the second disc minus `t` in the first,
and the point to the origin of the second disc; for `ψ = id` its cokernel is the perfect projective line with one point
collapsed.
(a) For `ψ = id` the gluing map is a monomorphism, and for a character `χ : ℚ → O^♭` it commutes with the operators
`1 − Δ`, `Δ` the twist `T^s ↦ χ(s)T^s` on the torus and on the first disc, `T^s ↦ χ(−s)T^s` on the second, and the
identity on the point.
(b) Let `N` be an `O^♭`-module such that every perfect `O^♭`-algebra is acyclic for the coefficients `b ↦ b ⊗ N`. For
every `p`-adic test `c`, the gluing map formed with `ψ = c^♭ ⊗ −` induces bijections on cohomology with coefficients
`S ↦ S^♭ ⊗ N`, and its source and target have flat base change; it also induces bijections with coefficients
`S ↦ S[1/p]`.
(c) If the gluing map with `ψ = c^♭ ⊗ −` is an equivalence for `F` for every test `c`, then `S ⊗ coker(gluing)`, the
gluing map taken with `ψ = id`, has no cohomology with coefficients `F`, for every `S` with flat values.

*Needs:* 1.1, 2.2, 2.4; PadicComparisonForFunctorCohomology §§1.1, 1.2, 1.3, 2.1, 6.1 (tests, tilts, flat base change,
acyclicity).

[ShortProof], `Lib/Cohomology/ProjectiveLine/PerfectLine` (`New.Variety.PerfectLine.gluing`,
`New.Variety.PerfectLine.oneSub_comp_gluing`, `New.Variety.PerfectLine.isCohomEquiv_gluing_tilt`,
`New.Variety.PerfectLine.isCohomEquiv_gluing_generic`, `New.Variety.PerfectLine.subsingleton_H_cokernel_gluing`)

### 5.4 The projective line formula for the tilted theory

*Origin:* particular to this proof: a cancellation lemma for the product of two extension classes along a monomorphism
with acyclic cokernel, and the projective line formula for the tilted theory of PadicComparisonForFunctorCohomology,
proved on the cover of the perfect projective line by two discs.

*Method of the formal proof:* the line formula at `S` follows from two properties of the product with `η`, injectivity
and a description of its image (b). On the perfect line, the Kummer sequence and the cocycle of `O(1)` restricted to the
two discs and the torus give a square to which (a) applies, with `ε` at the origin; 5.3 makes the cokernel of the
gluing acyclic, which gives both properties.

(a) *Cancellation.* Let `0 → S₁ → S₂ → S₃ → 0` and `0 → T₁ → T₂ → T₃ → 0` be short exact, `i : W′ → W` a monomorphism
with `δ′ : W′ → W′`, `δ : W → W`, `δ∘i = i∘δ′`, `z : Z₀ → W` with `δ∘z = 0`, and maps `f : W → S₂`, `α : W′ → T₂`,
`κ : W → T₁`, `n : S₁ → T₃`, `α₁ : W′ → S₁` with `S₁ → S₂` composed with `α₁` equal to `f∘i`, `f∘δ = 0`,
`α∘δ′ = (T₁ → T₂)∘κ∘i` and `n∘α₁ = (T₂ → T₃)∘α`. (In (a) the letters `η` and `ε` are local to the clause; they are
not those of 5.1.) Let `η ∈ Ext²(S₃, T₁)` be the extension class of the first sequence times that of the second pulled
back along `n`, `q := (S₂ → S₃)∘f` and `ε := κ∘z`. Then there are `j : B → S₃`,
`y : Z₀ → K` and `ω ∈ H*(B, K)` such that: whenever `g : W → Q` has `g∘i = 0`, `g∘δ = 0` and `r∘g = s∘q` for
`r : Q → R`, `s : S₃ → R`, the map `s∘j` lifts along `r` (some `t : B → Q` has `r∘t = s∘j`); and after any exact functor `Φ` that makes `coker i` acyclic for a coefficient
`F`, the product with `Φ(ω)` is onto, and `Φ(j)*(Φ(η)·m) = Φ(ω)·s′` implies `Φ(ε)*(m) = Φ(y)*(s′)`.
(b) For a theory `M` along `g` (2.7) and `S` with flat values, the projective line formula holds at `S` if the product
with `η` (5.1), from `H*(S, M)` to `H*(S ⊗ ℤ[ℙ¹_g], M)`, is injective, and its image contains every class `x` whose
image under 2.6 (c), times `η` on the category of points of `ℙ¹`, equals the restriction of `x` followed by `η_M`.
(c) Let `A` be an aic local domain with `ℓ ∈ A^×` and a ring map `A → ℂ_ℓ`, and `N` an `O^♭`-module (for the prime `ℓ`) such that
every perfect `O^♭`-algebra is acyclic for `b ↦ b ⊗ N`. The tilted theory on `ℓ`-adic tests, as in
PadicComparisonForFunctorCohomology §5.1 (b) (along `S ↦ S[1/ℓ]`, with coefficients `S ↦ S^♭ ⊗_{O^♭} N`), satisfies the
projective line formula.

*Needs:* 2.1, 2.2, 2.6, 2.7, 5.1, 5.3; PadicComparisonForFunctorCohomology §§2.1, 5.1 (acyclicity, the tilted theory).

[ShortProof], `Lib/Cohomology/ProjectiveLine/TiltedLineFormula` (`New.Variety.IsTodaCancellation`,
`New.Variety.exists_isTodaCancellation`, `New.Variety.isLerayHirschBasis_lineBasis_of_injective`,
`New.Variety.exists_isTodaCancellation_etaClass`, `New.Variety.hasLineFormula_tiltTheory`)

### 5.5 The projective line formula for `ℤ/ℓ` coefficients

*Origin:* adapted from the published theory of the projective bundle formula in torsion étale cohomology with the Kummer
first Chern class: here, for the trivial bundle of rank two, over tests over a valuation ring of an algebraically closed
field that embeds in `ℂ_ℓ`, for locally constant `ℤ/ℓ` coefficients.

*Method of the formal proof:* by restriction of scalars (universal points, 2.3 (d)) the formula reduces to tests over
algebraically closed fields `k` over `A`; there a basis from 5.2 is a basis on the point and, by dévissage from the
affine cover, on `ℙ¹`, and it contains `η` unless `η·1 = 0` over `k`. That vanishing would spread to the generic point of
`A` and kill `y·η` for every class `y` of `M`. For (c), apply (b) to the tilted theory of 5.4 on `ℓ`-adic tests with
coefficients `S ↦ S^♭ ⊗ N ⊗ 𝔪`, `N = O^♭/π` for a non-zero non-unit `π` of `O^♭` and `𝔪` the maximal ideal of `O^♭`: the
non-zero elements of `A` are units in `ℂ_ℓ`, hence in the rings `S[1/ℓ]`; if `η` killed every class of the point, the
line formula for this theory would make the cohomology of the point trivial, but by acyclicity it is `𝔪/π𝔪 ≠ 0`.

Let `A` be an aic local domain in which of any two elements one divides the other, with `ℓ ∈ A^×`.
(a) Let `Θ` be a theory along `g` and `θ` a family of classes on `∫ℙ¹_g` containing `η_Θ`. If `θ` is a Leray–Hirsch
basis at `S` and at `S ⊗ ℤ[ℙ¹_g]`, `S` with flat values, the projective line formula holds at `S`.
(b) Let `g : C → Test_A` be such that every non-zero element of `A` is a unit in every `g(d)`, and `M` an `ℓ`-torsion
coefficient along `g`. If `π*(y)·η_M ≠ 0` for some `y ∈ H*(ℤ, M)`, the theory `LC` of locally constant `ℤ/ℓ`-valued
functions on `Test_A` satisfies the projective line formula.
(c) If there is an injective ring map `A → ℂ_ℓ`, `LC` on `Test_A` satisfies the projective line formula: for every
functor `S` on `Test_A`, every class of `H*(S∘π, LC∘π)` is `π*(a) + π*(b)·η` for unique `a, b ∈ H*(S, LC)`.

*Needs:* 2.1, 2.3, 2.7, 5.1, 5.2, 5.4.

[ShortProof], `Lib/Cohomology/ProjectiveLine/ConstantLineFormula` (`New.Variety.isLerayHirschBasis_lineBasis_of_basis`,
`New.Variety.hasUniversalPoints_structurePt`, `New.Variety.hasLineFormula_of_lerayHirsch_ne_zero`,
`New.Variety.hasLineFormula_locallyConstant`)

For étale cohomology of schemes, (c) is the case of the trivial bundle of rank two of EtaleCohomologyFoundations §0.9;
that section does not apply to the cohomology of 1.3, and the proof here needs only `ℙ¹`.

### 5.6 Smooth base change from a valuation ring of `Ω` to `Ω`

*Origin:* adapted from the published theory of smooth base change in étale cohomology: here, the restriction from a
valuation ring of `Ω` to `Ω`, for coefficients `ℤ/ℓ` with `ℓ` invertible and for schemes charted by pieces étale over
tori, not assumed proper.

*Method of the formal proof:* compare the cohomology on tests over `A` with that on tests over `Ω`. The functors on which
this comparison is bijective form a closed class (2.3), which contains the point, both rings being domains (3.1 (a)).
This bijectivity is equivalent to the vanishing of the cohomology relative to the part off the closed fibre, and the
duality on products of projective lines of PadicComparisonForFunctorCohomology, with the projective line formula 5.5
over `A ⊆ Ω ⊆ ℂ_ℓ`, carries that vanishing from the point to charts étale over tori, hence to `Y` by the definition of
charted (1.4 (d)). The cohomology of `Y_A` is that of the points of `Y` on tests over `A`.

(a) For a scheme `Y` over `R` and an `R`-algebra `A`, the cohomology of `Y_A` on test rings agrees, for every coefficient
on test rings, with the cohomology of the functor of points of `Y` on tests over `A`.
(b) Let `A` be a valuation ring of `Ω` whose maximal ideal contains a prime `p`, `ℓ` a prime with `ℓ ∈ A^×`, `R` a ring
with a map `R → A`, and `Y` a scheme over `R` that is charted over `R` (1.4 (d)). Then pull-back along `Y_Ω → Y_A` is
bijective on `Hⁿ_{ℤ/ℓ}` for every `n`.

*Needs:* 1.3, 1.4, 2.3, 3.1, 5.5; PadicComparisonForFunctorCohomology §§4.1, 4.2, 4.3 (compared theories, standard étale
charts).

[ShortProof], `Lib/Cohomology/SmoothBaseChange` (`New.Variety.algToBaseChange`, `New.Variety.isBijective_algToBaseChange`,
`New.Variety.ComparedTheory.mem_of_isClosedClass_of_isCharting`, `New.Variety.isTestCohomEquiv_baseChangeTransition`)

For étale cohomology of schemes, (b) is a case of EtaleCohomologyFoundations §F.2.2; that section does not apply to the
cohomology of 1.3, and the proof here avoids the general theorem.

## Layer 6: Hodge cohomology and the fixed point formula

Hodge cohomology is Ext of functors on pairs (algebra, free module), evaluated on square-zero extensions (6.1). It has
Zariski descent and vanishes below the depth (6.2). Grothendieck's symbol gives classes of points (6.3); the Künneth
formula (6.4) and the class of the diagonal (6.5) give the fixed point formula (6.6).

### 6.1 Hodge cohomology on pairs

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the localisation property is the universal property of `A[1/g]`, and the
universal point of a chart is the unique lift of `R → R` along `R ⊕ R^d → R` that sends `x_i` to `(x_i, e_i)`, which
exists because `R` is étale over `k[X_1, …, X_d]`.

Let `k` be a ring. A *Hodge pair* over `k` is a `k`-algebra `A` with a finite ordered set `ι`, standing for the pair
`(A, A^ι)`; a morphism `(A, A^ι) → (B, B^κ)` is a `k`-algebra map `a : A → B` with an `a`-semilinear map `A^ι → B^κ`.
The functors `(A, M) ↦ A ⊕ M` (the square-zero extension, a `k`-algebra) and `(A, M) ↦ ⋀_A M` (with values in
`k`-modules) are defined on Hodge pairs. For a functor `N` from `k`-algebras to abelian groups, its *Hodge cohomology* in
degree `q` is `H^q_Hdg(N) := Ext^q((A, M) ↦ N(A ⊕ M), (A, M) ↦ ⋀_A M)` in functors on Hodge pairs, a `k`-module. For a
functor `X` on `k`-algebras, `H^q_Hdg(X) := H^q_Hdg(ℤ[X])`, and for `U ⊆ X`, `H^q_Hdg(X, U) := H^q_Hdg(ℤ[X]/ℤ[U])`. It
has pull-backs along maps of functors; for `t ∈ k`, the *scaling* `s_t` is induced by `(a, m) ↦ (a, t·m)` on `A ⊕ M`; for
a `k`-algebra `k′`, *base change* `H^q_Hdg(X) → H^q_Hdg(X|_{k′})` restricts scalars on pairs. Products of Hodge classes
are formed only when `k` is a field of characteristic `0`: then every `k`-module is flat over `ℤ`, so the coefficient
`(A, M) ↦ ⋀_A M` has flat values as 2.2 (b) requires, and the products are those of 2.2 with `μ` the multiplication of
exterior algebras (*cross products*, pulled back along `ℤ[X × X′] → ℤ[X] ⊗ ℤ[X′]`). Hodge cohomology stands in for the
groups `H^q(X, Ω^p)` (the scaling `s_t` plays the part of the grading by `p`); no comparison with coherent cohomology is
stated or used.
(a) For `g ∈ A` and a localisation `A → A[1/g]`, the morphisms out of `(A[1/g], A[1/g]^ι)` are the morphisms out of
`(A, A^ι)` whose algebra map inverts `g`.
(b) Let `k` be a field. For an étale chart `R` of dimension `d` (1.4 (c)) with coordinates `x_i`, there is a unique
`k`-algebra map `u : R → R ⊕ R^d` lifting the identity with `u(x_i) = (x_i, e_i)`, and `(R, R^d)` with `u` represents
the functor `(A, M) ↦ Hom_k(R, A ⊕ M)` on Hodge pairs.

*Needs:* 1.1, 1.4, 2.2.

[ShortProof], `Lib/Cohomology/Hodge/Site` (`New.Variety.HodgeTest.sqZeroExt`, `New.Variety.exteriorAlg`,
`New.Variety.hodgeCoeff`, `New.Variety.HodgeH`, `New.Variety.HodgeH.map`, `New.Variety.HodgeH.scale`,
`New.Variety.HodgeH.baseChange`, `New.Variety.HodgeTest.existsUnique_lift_away`, `New.Variety.EtaleChart.univPoint`,
`New.Variety.EtaleChart.exists_univPoint`); `Lib/General/Geometry/EtaleCharts` (`New.Variety.HodgeTest`)

### 6.2 Vanishing below the depth, and Zariski descent for Hodge cohomology

*Origin:* adapted from the published theory of local cohomology and depth: here, for Hodge cohomology of a
representable pair relative to the locus where one of finitely many functions is a unit.

*Method of the formal proof:* an abstract induction on a regular sequence: the groups are torsion for the ideal and
an element regular on the module stays regular on the groups once the lower groups of the quotient vanish. For the unit
ideal the relative groups vanish in every degree, which is Zariski descent.

(a) *Depth vanishing.* Let `A` be a ring, `I` an ideal, and `M ↦ Hⁿ(M)` a family of maps from `A`-modules to `A`-modules
such that every element of every `Hⁿ(M)` is killed by a power of each element of `I`, and such that an element `r`
regular on `M` is regular on `Hⁿ(M)` whenever `H^m(M/rM) = 0` for all `m < n`. If `I` contains a weakly `M`-regular
sequence of length greater than `n`, then `Hⁿ(M) = 0`.
(b) Let `(A, A^ι)` be a Hodge pair, `f_1, …, f_r ∈ A`, and `O_f ⊆ h_{(A, A^ι)}` the maps whose algebra map sends some `f_i`
to a unit. If `(f_1, …, f_r)` contains a weakly `A`-regular sequence of length greater than `n`, then
`Hⁿ(h_{(A,A^ι)}, O_f; ⋀)` is zero. If the `f_i` generate the unit ideal, `O_f ⊆ h_{(A,A^ι)}` is an equivalence for `⋀`.
(c) If `x_1, …, x_{2d} ∈ A` are étale coordinates (`k[X_1, …, X_{2d}] → A` étale), the relative group of (b) for the
functions `x_i − x_{d+i}` vanishes in degrees below `d`.
(d) The coefficient `(A, M) ↦ ⋀_A M` has Zariski descent for the rings `A ⊕ M`.

*Needs:* 1.1, 2.4, 2.5, 6.1.

[ShortProof], `Lib/Cohomology/Hodge/DepthVanishing` (`New.Variety.depth_vanishing`, `New.Variety.someUnitLocus`,
`New.Variety.DepthVanishing.subsingleton_of_isWeaklyRegular`, `New.Variety.isCohomEquiv_someUnitLocus_of_span_eq_top`,
`New.Variety.hodge_vanishing_along_diagonal`, `New.Variety.hasZariskiDescent_hodgeCoeff`)

### 6.3 Grothendieck's symbol and classes of points

*Origin:* adapted from the published theory of Grothendieck's residue symbol and of cycle classes of points in Hodge
cohomology: here, the symbol as a class of a cocycle on tuples of linear forms, its transformation law and
multiplicativity, and the class of a rational point of a separated functor with charts.

*Method of the formal proof:* the symbol is the class (2.3 (f)) of the cocycle `(v, l_1, …, l_d) ↦ det(l)·dT_1 ∧ ⋯ ∧ dT_d`
for the relation "`l_j(v) = 1`", whose witnesses exist on unimodular vectors. The transformation law is a computation
with this cocycle modulo the ideal of the functions; multiplicativity compares the cocycles on `𝔸^d × 𝔸¹`. For point
classes, excision (2.5 (d)) to a chart and Mayer–Vietoris over finitely many points.

Let `k` be a field. `𝔸^d` is the functor `A ↦ A^d` on `k`-algebras and `𝔸^d ∖ 0` its subfunctor of unimodular vectors
(entries generating the unit ideal). Elements `g_1, …, g_d` of a `k`-algebra `R` *cut out* a locus `P` at a point
`y ∈ X(R)` if a map `α : R → C` kills all `g_i` exactly when `X(α)(y) ∈ P`.
- *The symbol.* `[dT/T] ∈ H^d_Hdg(𝔸^d, 𝔸^d ∖ 0)` is the class of the cocycle `(v, l_1, …, l_d) ↦ det(l_1, …, l_d)·dT_1 ∧ ⋯ ∧ dT_d`
  on tuples of linear forms with `l_j(v) = 1`. For `g ∈ R^d`, `[dg/g]` is its pull-back.
- *Multiplicity.* Let `X` be separated with étale charts of dimension `d`, `z ∈ X(k)`, and `X ∖ z` the subfunctor of
  points none of whose values in fields comes from `z`. A class `ξ ∈ H^d_Hdg(X, X ∖ s)` (`s` a set of `k`-points) has
  *multiplicity `n(z)`* at `z ∈ s` if some chart contains `z` and has functions `g` cutting out `z` on it such that `ξ`
  restricts there to `n(z)·[dg/g]`.
(a) *Transformation law.* Let `(A, A^ι)` be a pair, `v ∈ A^d`, and `f, g ∈ (A ⊕ A^ι)^d` with first components `v` and
`ḡ`, each inducing a map of relative chains from the locus where some `v_i` is a unit to `𝔸^d ∖ 0`. If `v = M·ḡ` for a matrix `M` over `A`, the second components satisfy `f_i ≡ Σ_l N_{il}·g_l`
modulo `(v)`, and `det N ≡ a·det M` modulo `(v)` with `a ∈ k`, then the pull-back of `[dT/T]` along `f` is `a` times its
pull-back along `g`.
(b) *Multiplicativity.* Let `k` have characteristic `0`. On `𝔸^d × 𝔸¹`, relative to the pairs `(v, x)` with `v` or `x` unimodular, the cross product of
`[dT/T]` in degrees `d` and `1` is the restriction of `[dT/T]` in degree `d + 1`.
(c) *Classes of points.* For a chart containing `z` and functions `g` cutting out `z` on it, there is a class with
support `z` that restricts to `[dg/g]` on the chart. Every class with support `z` and multiplicity `1` at `z` has the
same image `cl(z) ∈ H^d_Hdg(X)`, the *class of `z`*; a class with support in a finite set `s` and multiplicities `n`
maps to `Σ_{z∈s} n(z)·cl(z)`.

*Needs:* 1.4, 2.3, 2.4, 2.5, 6.1, 6.2.

[ShortProof], `Lib/Cohomology/Hodge/GrothendieckSymbol` (`New.Variety.CutsOutLocus`, `New.Variety.symbolClass`,
`New.Variety.symbolClass_transformation`, `New.Variety.symbolClass_succ`, `New.Variety.hodge_excision`,
`New.Variety.IsLocalSymbol`, `New.Variety.IsPointSum`, `New.Variety.pointClass`,
`New.Variety.EtaleChart.exists_isLocalSymbol`, `New.Variety.IsPointSum.map_eq_smul_pointClass`,
`New.Variety.IsPointSum.map_eq_pointClass`, `New.Variety.IsPointSum.map_eq_sum_pointClass`)

### 6.4 The Künneth formula

*Origin:* adapted from the published theory of the Künneth formula for coherent cohomology: here, in the weak form that
cross products span the Hodge cohomology of `X × X`, for `X` with an atlas over a field of characteristic `0`.

*Method of the formal proof:* replace `X` by the dense subfunctor `U` read on pairs from a subfunctor built from the
charts (dense by Zariski descent, 6.2 (d)). The charts are represented on Hodge pairs (6.1 (b)), so by dévissage (2.1)
the Leray–Hirsch map of a basis of the classes of each degree on `U`, applied in one factor and then in the other, writes
every class on `U × U` as a sum of products.

Let `k` be a field of characteristic `0` and `X` a functor on `k`-algebras with an atlas of dimension `d`. Every class of
`Hⁿ_Hdg(X × X)` is a finite sum of cross products `x × y` with `x ∈ H^a_Hdg(X)`, `y ∈ H^b_Hdg(X)`, `a + b = n`.

*Needs:* 1.4, 1.5, 2.1, 2.2, 2.4, 6.1, 6.2.

[ShortProof], `Lib/Cohomology/Hodge/Kunneth` (`New.Variety.kunneth`)

### 6.5 The class of the diagonal

*Origin:* adapted from the published theory of the cycle class of the diagonal in Hodge cohomology: here, for a functor
with an atlas, as a relative class glued from Grothendieck symbols of differences of chart coordinates.

*Method of the formal proof:* each chart gives a chart of `X × X` near the diagonal on which the differences of the
coordinates cut out the diagonal; their symbols agree on overlaps by the transformation law (6.3 (a)), and they glue by
2.5 (e), the relative groups vanishing below `d` by 6.2 (c).

Let `k` be a field of characteristic `0` and `X` with an atlas of dimension `d`, and let `X × X ∖ Δ` be the subfunctor
of pairs whose values in every field are distinct. There is `δ ∈ H^d_Hdg(X × X, X × X ∖ Δ)` such that every point `z` of
`X` with values in a field has a chart `(R, x_1, …, x_d)` and an open subfunctor `O ∋ (z, z)` of `X × X` on which `δ` is
the symbol of the differences of the coordinates: every point of `O` is a pair `(φ, ψ)` of points of the chart, the
`φ(x_i) − ψ(x_i)` cut out the diagonal there, and `δ` pulls back to `[d(φ(x) − ψ(x))/(φ(x) − ψ(x))]`.

*Needs:* 1.4, 2.5, 6.1, 6.2, 6.3.

[ShortProof], `Lib/Cohomology/Hodge/DiagonalClass` (`New.Variety.IsDiagonalSymbolOn`,
`New.Variety.exists_isLocalSymbol_of_charts_near_diagonal`, `New.Variety.exists_diagonal_class`);
`Lib/General/Geometry/EtaleCharts` (`New.Variety.offDiagonal`)

### 6.6 The fixed point formula in Hodge cohomology

*Origin:* adapted from the published theory of the holomorphic Lefschetz fixed point formula and of Gysin maps in Hodge
cohomology: here, an identity of Hodge classes over a field of characteristic `0` for the coincidences of two maps, with
local terms the Jacobian ratios given by Grothendieck symbols; no trace occurs.

*Method of the formal proof:* near a coincidence `w` the pull-back of `δ` along the scaled graph is the symbol of the
differences `t·du − dc` read in the chart; the transformation law (6.3 (a)) turns it into `det N` times the symbol of
`du − dc`, which cuts out `w` because the coincidence is reduced; 6.3 (c) adds the points. A tangent polynomial gives the
matrix `N` from the endomorphism `A` with `du = dc∘A`.

Let `k` be a field and `W`, `X` functors on `k`-algebras, `u, c : W → X`. A *coincidence* is a point `x` with
`c(x) = u(x)`. The coincidences are *reduced* if every coincidence with values in `k[ε]` is constant (comes from its base
point). A finite set `s ⊆ W(k)` *lists* the coincidences if they are reduced, every point of `s` is one, and every
coincidence with values in a field comes from a point of `s`. For `t ∈ k`, the *scaled graph* is the map
`w ↦ (u(s_t w), c(w))` on points with values in `A ⊕ M`, `s_t(a, m) = (a, t·m)`. At a coincidence `w` the *Jacobian
ratio* `n(w)` is the determinant of a matrix `N` with `t·du(v) − dc(v) = N(du(v) − dc(v))` for all tangent vectors `v` at
`w`, read in the coordinates of any chart of `X` that contains `c(w)`. A *tangent polynomial* of rank `d` of `(c, u)` at
`y ∈ W(k)` is a polynomial `P` such that there are a `d`-dimensional `k`-vector space `T`, a point of `W(k ⊕ T*)` over
`y` (so tangent vectors `f(x)`, `x ∈ T`) and `A ∈ End(T)` with `x ↦ c(f(x))` injective, `u(f(x)) = c(f(Ax))`, and
`P(t) = P(0)·det(1 − tA)` for all `t ∈ k`.
(a) Let `W` have its field points in charts of dimension `d`. If `P` is a tangent polynomial of `(c, u)` at `w` with
`P(1) ≠ 0`, then the coincidences with values in `k[ε]` over `w` are constant, and for every `t` the Jacobian ratio at
`w` is `P(t)/P(1)`.
(b) If `k` is algebraically closed, `X` separated, the coincidences reduced and finitely many charts of `W` contain all
field-valued coincidences, a finite set lists them.
(c) *Fixed point formula.* Let `k` be a field of characteristic `0` and `X` with an atlas of dimension `d`. There is
`δ ∈ H^d_Hdg(X × X)` such that for every field `E ⊇ k` of characteristic `0`, every separated `W` on `E`-algebras with
field points in charts of dimension `d`, all `u, c : W → X|_E`, every `t ∈ E`, every finite set `s` listing the
coincidences and Jacobian ratios `n(w)`, `w ∈ s`: some class relative to `W ∖ s` has multiplicity `n(w)` at each `w ∈ s`,
and the pull-back of `δ` (base changed to `E`) along the scaled graph is `Σ_{w∈s} n(w)·cl(w)`.
(d) If `X`, `Y` have atlases of dimensions `d` and `1` over a field of characteristic `0` and `z ∈ (X × Y)(k)`, the cross
product of `cl(z_1)` and `cl(z_2)` is `cl(z)`.

*Needs:* 1.4, 2.2, 6.1, 6.3, 6.4, 6.5.

[ShortProof], `Lib/Cohomology/Hodge/FixedPointFormula` (`New.Variety.ConstIfCoincident`, `New.Variety.IsCoincidenceSet`,
`New.Variety.exists_isCoincidenceSet`, `New.Variety.HasJacobianRatio`, `New.Variety.IsTangentPoly.hasJacobianRatio_eval_div`,
`New.Variety.IsTangentPoly.constIfCoincident`, `New.Variety.scaledGraph`, `New.Variety.exists_diagonal_local_terms`,
`New.Variety.IsPointSum.cup_pointClass`); `Lib/Cohomology/Etale/Basic` (`New.Variety.IsTangentPoly`)

For Dolbeault cohomology of compact complex manifolds, the holomorphic Lefschetz formula is IndexTheory §8.3; it does not
apply to the Hodge cohomology of 6.1.

## Layer 7: Point classes under the Hodge–Tate map, and the Woods Hole formula

The Hodge–Tate maps `λ_h` of PadicComparisonForFunctorCohomology §6.3 send Hodge classes of a functor on `k`-algebras, `k`
embedded in `ℚ̄_p`, to a cohomology on Hodge–Tate pairs over `p`-adic tests; they are `k`-linear, natural, turn the
scaling `s_t` into multiplication by `t^h`, and satisfy a binomial rule for cross products. This layer proves that `λ_d`
keeps the classes of distinct points independent (7.4), through Noether normalisation (7.1), projective space (7.2) and
the non-vanishing on projective space (7.3), and deduces the vanishing half of the Woods Hole formula (7.5).

### 7.1 Projective Noether normalisation by linear forms

*Origin:* adapted from the published theory of Noether normalisation: here, by linear forms for a point of a cone over a
field of characteristic `0`, with a Galois closure and spreading out of points with given homogeneous coordinates.

*Method of the formal proof:* start from the coordinate forms, which have no non-trivial common zero on the cone of `g`;
while their values at `g` satisfy a homogeneous relation, a linear change over the infinite field `k` lets one form be
dropped. For the Galois closure take `t` transcendental over `L`: the values `Λ_j(t·g)` are algebraically independent,
so they embed `k[X_0, …, X_d]` in an algebraically closed field over which `t·g` is integral, and `B` is a Galois hull
of `t·g`, the `b_σ` being its conjugates. Spreading out uses the homogeneous relations of the coordinates.

Let `k` be a field, `L` a field over `k` and `g ∈ L^ι` (`ι` finite). A tuple `v` (in any `k`-algebra) *lies on the cone of
`g`* if every homogeneous polynomial over `k` vanishing at `g` vanishes at `v`. Linear forms `Λ_0, …, Λ_d` over `k` are a
*Noether normalisation* of `g` if the values `Λ_j(g)` satisfy no non-zero homogeneous relation over `k`, and every
field-valued `v` on the cone of `g` is integral over any `k`-algebra whose image contains the `Λ_j(v)`.
(a) If `k` has characteristic `0` and `g ≠ 0`, there are linear forms `Λ_0, …, Λ_d` with `Λ_0(g) ≠ 0` that are a Noether
normalisation of `u·g` for every `u ∈ L^×`.
(b) If `k` has characteristic `0`, a Noether normalisation has a *Galois closure*: a finite group `G`, a finite injective map
`f : k[X_0, …, X_d] → B` of `k`-algebras and tuples `b_σ ∈ B^ι` (`σ ∈ G`) on the cone of `g` with `Λ_j(b_σ) = f(X_j)`, such
that for any two maps `φ, ψ : B → K` to an algebraically closed field and `u ∈ K` with `ψ∘f(X_j) = u·φ∘f(X_j)` for all
`j`, there is `τ ∈ G` with `ψ(b_σ) = u·φ(b_{τσ})` for all `σ`.
(c) Let `Y` be a projective scheme over `R`, `k` an algebraically closed `R`-algebra, and `ξ` a point of `Y` over a field
`F ⊇ k` with homogeneous coordinates `g`, one of them a unit. Every map from the functor of points of `Y` on
`k`-algebras to the affine line takes one constant value `c ∈ k` at every point over a non-zero `k`-algebra whose
homogeneous coordinates have a unit entry and lie on the cone of `g`. Moreover `ξ` spreads out: there are a `k`-algebra
`D`, a point over `D` and an injective map `D → F` carrying it to `ξ`, such that every coordinate vector `w` on the cone of
`g` with a given entry a unit is the image of that point along some `D → C`; and for an open subfunctor containing `ξ`
there is a polynomial `b` with `b(g) ≠ 0` such that every `w` on the cone of `g` with `b(w)` a unit is the coordinate
vector of a point of the open subfunctor.

*Needs:* 1.4.

[ShortProof], `Lib/Cohomology/PointClass/NoetherNormalization` (`New.Variety.CutsOutLocus.IsHomogeneousSolution`,
`New.Variety.CutsOutLocus.IsNoetherNormalization`, `New.Variety.CutsOutLocus.exists_isNoetherNormalization`,
`New.Variety.CutsOutLocus.IsNoetherNormalization.GaloisClosure`,
`New.Variety.CutsOutLocus.IsNoetherNormalization.nonempty_galoisClosure`, `New.Variety.IsCoordsWithUnit.exists_universal_chart`,
`New.Variety.IsCoordsWithUnit.exists_mem_open_of_isUnit`,
`New.Variety.IsCoordsWithUnit.exists_app_eq_algebraMap_of_isHomogeneousSolution`)

The library has a linear Noether normalisation over infinite fields (closing section); the homogeneous form with
`Λ_0(g) ≠ 0` for all `u·g`, the Galois closure and the spreading out are not there.

### 7.2 Projective space, and injective pull-back along a Noether normalisation

*Origin:* adapted from the published theory of transfer for finite surjective maps: here, injectivity of pull-back along
the projection to `ℙ^d` of a subfunctor of `Y × ℙ^d` that contains the graph of a Noether normalisation, for the
cohomology of `p`-adic tests with coefficients `S ↦ S[1/p]`.

*Method of the formal proof:* points of the Galois cover of the cone of `g` (7.1 (b)) map to `O` once for each `σ ∈ G`,
over one point of `ℙ^d`. The transfer of 2.5 (b) gives `ℤ[π]∘ν = |G|·l`, and `l` is an equivalence once the image of
the cover is dense in `ℙ^d` and the pairs with permuted tuples are dense, which is checked near each maximal ideal of a
test by Zariski descent; `|G|` is invertible in `S[1/p]`.

`ℙ^d` over a field `k` is the functor on `k`-algebras `A ↦` unimodular vectors in `A^{d+1}` modulo `A^×` (the points of
the scheme `ℙ^d` with trivial line bundle; no sheafification is made). In this layer `ℙ¹` is `ℙ^1` in this sense, not the
functor of 5.1.
(a) The `d + 1` standard charts form an atlas of dimension `d`. If `k` has characteristic `0`,
`([v], [w_0 : w_1]) ↦ [w_0·Σ_i v_i : (w_1 − 0·w_0)·v_0 : … : (w_1 − d·w_0)·v_d]` is a map `ℙ^d × ℙ¹ → ℙ^{d+1}`; over a
local `k`-algebra, a point of `ℙ^d × ℙ¹` whose image has all coordinates but the first equal to `0` is `([e_j], [1 : j])`
for some `j ∈ {0, …, d}`.
(b) Let `k` be embedded in `ℚ̄_p`, `Y` a projective scheme over `R` with homogeneous coordinates indexed by `ι`, `ξ` a
point of `Y` over a field `F ⊇ k` with coordinates `g`, and `Λ` a Noether normalisation of `g` with `d + 1` forms. Let
`O ⊆ Γ ⊆ Y × ℙ^d` be subfunctors such that `O` contains `(x, [Λ(v)])` for every point `x` with coordinate vector `v`
(having a unit entry) on the cone of `g` with `Λ(v)` unimodular. Then pull-back along `O → ℙ^d` is injective on the
cohomology, on `p`-adic tests, of the functors `S ↦ ℤ[O(S[1/p])]` and `S ↦ ℤ[ℙ^d(S[1/p])]` with coefficients `S ↦ S[1/p]`.

*Needs:* 1.4, 2.4, 2.5, 7.1; PadicComparisonForFunctorCohomology §§1.1, 5.1, 6.1 (`p`-adic tests, generic fibres).

[ShortProof], `Lib/Cohomology/PointClass/ProjectiveSpace` (`New.Variety.projSpace`, `New.Variety.projSpace.stdChart`,
`New.Variety.projSpace.hasAtlas`, `New.Variety.projSpace.lineProductMap`,
`New.Variety.projSpace.exists_eq_map_affinePoint_of_mul_eq_zero`,
`New.Variety.CutsOutLocus.IsNoetherNormalization.pullback_injective`)

### 7.3 Point classes of projective space survive the Hodge–Tate map

*Origin:* adapted from the published theory of the compatibility of the Hodge–Tate comparison with cycle classes: here,
only the non-vanishing of `λ_d` on the class of a point of `ℙ^d`, computed through Grothendieck's symbol.

*Method of the formal proof:* `λ_1[dT/T]` is the product of the boundary class of `(𝔸¹, 𝔸¹ ∖ 0)` with the class of the
extension `0 → T → B^× → T^× → 0`, `T = S[1/p]` and `B = W(S^♭)[1/p]/(ker θ)²`, whose first map is `t ↦ 1 − μt` with
`μ = [ε] − 1`. On `ℙ¹` this gives a degree-two class `η` lifting `λ_1` of the class of `[1 : 0]`, whose product is
injective on flat functors. Induction on `d`: pull the class of a point back along `ℙ^d × ℙ¹ → ℙ^{d+1}` (6.6 (d)); in the
product rule for `λ_{d+1}` only the term of weight `d` survives, and `x ∪ η = 0` forces `x = 0`.

Let `k` be a field embedded in `ℚ̄_p`.
(a) On `p`-adic tests, `0 → T → B^× → T^× → 0` is exact. `λ_1[dT/T]` is the image, in the target of the Hodge–Tate maps,
of the product of the boundary class of the pair `(𝔸¹, 𝔸¹ ∖ 0)` with the class of this extension pulled back along the
coordinate.
(b) With `ℙ¹ = ℙ^1` of 7.2, there is a class `η ∈ H²` of the functor `S ↦ ℤ[ℙ¹(S[1/p])]` on `p`-adic tests, with coefficients `S ↦ S[1/p]`, whose
image is `λ_1(cl([1 : 0]))`, and such that for every functor `N` on `p`-adic tests with flat values the product `x ↦ x ∪ η`
is injective on `Hⁿ(N, S ↦ S[1/p])`.
(c) For every `z ∈ ℙ^d(k)`, `λ_d(cl(z)) ≠ 0`.

*Needs:* 2.2, 6.3, 6.6, 7.2; PadicComparisonForFunctorCohomology §§1.1, 6.1, 6.2, 6.3 (Hodge–Tate maps, square-zero
thickening).

[ShortProof], `Lib/Cohomology/PointClass/ProjectiveNonvanishing` (`New.Variety.thickeningOver.oneSubMu`,
`New.Variety.thickeningOver.shortExact_oneSubMu`, `New.Variety.hodgeTateMap_symbolClass`,
`New.Variety.projSpace.exists_hodgeTateMap_pointClass_line`, `New.Variety.projSpace.hodgeTateMap_pointClass_ne_zero`)

### 7.4 Linear independence of point classes under the Hodge–Tate map

*Origin:* adapted from the published theory of the compatibility of the Hodge–Tate comparison with cycle classes and
traces: here, only the linear independence of the images of the distinct classes of rational points, without duality or
a trace map.

*Method of the formal proof:* for a point `z₀` and finitely many others, take a generic chart of the component of `z₀`
and a Noether normalisation (7.1); the linear projection to `ℙ^d` is étale over a suitable point `Q`, and its fibre there
consists of points with the class of `z₀`. Pull-back along the projection is injective (7.2) and `λ_d(cl(Q)) ≠ 0` (7.3),
so an open part `j` of the graph of the projection kills the classes different from that of `z₀` and keeps
`λ_d(cl(z₀))` non-zero.

Let `k` be an algebraically closed field embedded in `ℚ̄_p`, `R` a ring with a map `R → k`, and `Y` a projective scheme
over `R` whose functor of points on `k`-algebras has an atlas of dimension `d`.
(a) For `z₀ ∈ Y(k)` and a finite set `T ⊆ Y(k)` there are a functor `W` on `k`-algebras and a map `j : W → Y` such that
`λ_d(j*cl(z₀)) ≠ 0` and `j*cl(z) = 0` for every `z ∈ T` with `cl(z) ≠ cl(z₀)`.
(b) The images under `λ_d` of the distinct classes `cl(z)`, `z ∈ Y(k)`, are linearly independent over `k`. In particular
there is a `k`-linear form `φ` on the target of `λ_d` with `φ(λ_d(cl(z))) = 1` for every `z ∈ Y(k)`.

*Needs:* 1.4, 6.3, 7.1, 7.2, 7.3; PadicComparisonForFunctorCohomology §6.3 (the Hodge–Tate maps).

[ShortProof], `Lib/Cohomology/PointClass/LinearIndependence` (`New.Variety.exists_generic_chart`,
`New.Variety.exists_etale_projection`, `New.Variety.exists_map_separating_class`,
`New.Variety.linearIndepOn_hodgeTateMap_pointClass`)

### 7.5 The Woods Hole formula, vanishing half

*Origin:* adapted from the published theory of the holomorphic Lefschetz fixed point formula for correspondences:
here, an implication from the vanishing of a combination of maps on Hodge classes under the Hodge–Tate
map `λ_h` to the vanishing of the sum of the local terms of weight `h` at simple coincidences; no trace is computed.

*Method of the formal proof:* pull the diagonal class `δ` of 6.6 back along `(u_i∘s_t, c)`, apply `φ∘λ_d` with `φ` the
form of 7.4 (b), take the coefficient of `t^h` with a linear form on the functions `k → k` that reads off coefficients of
polynomial functions (`k` is infinite), and sum with the weights `b_i`. By 6.6 this is the sum of the local terms; by the
Künneth formula (6.4) `δ` is a sum of cross products, on which the product and scaling rules of `λ` isolate the terms
`λ_h(u_i* x)`, `deg x ≤ d`, whose weighted sum vanishes by hypothesis (and which do not occur if `h > d`).

Let `E` be a field of characteristic `0`, `R ⊆ E` a subring, `k` an algebraically closed field embedded in `ℚ̄_p`
with a map `E → k`, and `W`, `Y` schemes over `R`, `Y` proper and `W`
projective, such that the functors of points of `Y` on `E`-algebras and of `W` on `k`-algebras have atlases of dimension
`d`. Let `u_i : W → Y` (`i ∈ I`) be maps over `R` and `b ∈ k^{(I)}` finitely supported, and let `h ≥ 0`. Assume that
`h > d`, or that for every `q ≤ d` and every `x ∈ H^q_Hdg(Y|_E)`, `Σ_i b_i·λ_h((u_i* x)|_k) = 0`. Then for every map
`c : W → Y` over `R`, with `S` the set of pairs `(i, y)`, `b_i ≠ 0`, `y ∈ W(k)` and `c(y) = u_i(y)`: if every
`(i, y) ∈ S` has a tangent polynomial `P_{(i,y)}` of rank `d` of `(c, u_i)` at `y` (6.6) with `P_{(i,y)}(1) ≠ 0`, then `S`
is finite and `Σ_{(i,y)∈S} b_i·[t^h]P_{(i,y)}(t) / P_{(i,y)}(1) = 0`. (With `P(t) = P(0)·det(1 − tA)` the term is
`b_i·[t^h]det(1 − tA)/det(1 − A)`.)

*Needs:* 1.4, 1.5, 6.1, 6.4, 6.6, 7.4; PadicComparisonForFunctorCohomology §6.3 (the Hodge–Tate maps).

[ShortProof], `Lib/Cohomology/WoodsHole` (`Polynomial.exists_dual_eval_mul_eq_coeff_mul`,
`New.Variety.map_scaledGraph_baseChange_cross`, `New.Variety.sum_mul_hodgeTateMap_scaledGraph_eq_zero`,
`New.Variety.ellAdicCohom.woods_hole`); `Lib/Cohomology/Etale/Basic` (`New.Variety.IsNullFamily`)

For compact complex manifolds, the holomorphic Lefschetz formula is IndexTheory §8.3; it does not apply to the Hodge
cohomology of 6.1.

## Results taken from other roadmaps

- Derived completeness for a principal ideal: Ext groups of functors with complete torsion-free coefficients are derived
  complete, and a comparison that is bijective modulo `π` is bijective (used in 3.4):
  PadicComparisonForFunctorCohomology §§3.1, 3.2.
- `p`-adic tests, their tilts and generic fibres, `O_C`, `O^♭`, acyclicity of perfect algebras, flat base change, and
  the tilted theory on `ℓ`-adic tests (used in 5.3, 5.4, 7.2, 7.3): PadicComparisonForFunctorCohomology §§1.1, 1.2, 1.3,
  2.1, 5.1, 6.1.
- Compared cohomology theories and duality on products of projective lines (used in 5.6): PadicComparisonForFunctorCohomology
  §§4.1, 4.2, 4.3.
- The Hodge–Tate maps `λ_h` with their naturality, scaling rule and product rule (used in 7.3–7.5):
  PadicComparisonForFunctorCohomology §6.3.
- Absolutely integrally closed rings: the definition, fields, quotients and localisations (used in 1.2, 4.2):
  ArcTopologyAndDescent §0.1.

## What the library already provides

- Ext groups in an abelian category, used for all the groups `Hⁿ(N, F)` of 1.1: Mathlib `CategoryTheory.Abelian.Ext`.
- The Yoneda product of Ext classes and, degree by degree, the long exact sequence of a short exact sequence in the
  first variable with its extension class (2.2 (a) is their sum over all degrees): Mathlib
  `CategoryTheory.Abelian.Ext.comp`, `CategoryTheory.ShortComplex.ShortExact.extClass`,
  `CategoryTheory.Abelian.Ext.contravariant_sequence_exact₁'`,
  `CategoryTheory.Abelian.Ext.contravariant_sequence_exact₂'`,
  `CategoryTheory.Abelian.Ext.contravariant_sequence_exact₃'`.
- Absolutely integrally closed rings as in ArcTopologyAndDescent §0.1 (condition (i) of 1.2), with quotients,
  localisations, products and the case of fields: `TauCeti.IsAbsolutelyIntegrallyClosed`,
  `TauCeti.IsAbsolutelyIntegrallyClosed.quotient`, `TauCeti.IsAbsolutelyIntegrallyClosed.localization`,
  `TauCeti.IsAbsolutelyIntegrallyClosed.pi`, `TauCeti.isAbsolutelyIntegrallyClosed_iff_isAlgClosed`. The
  condition "of any two elements one divides the other" is Mathlib `PreValuationRing`. Test rings (1.2) are not there.
- Derived completeness of modules by the telescope map `x ↦ (x_n − f·x_{n+1})`, with products and "adically complete
  implies derived complete" (the predicate of 3.4, for every element of an ideal): `TauCeti.IsDerivedComplete`,
  `TauCeti.IsDerivedComplete.of_isAdicComplete`, `TauCeti.IsDerivedComplete.pi`.
- Linear Noether normalisation over an infinite field, by linear combinations of given generators (to build 7.1 (a)
  on): `TauCeti.exists_linear_normalization`.
